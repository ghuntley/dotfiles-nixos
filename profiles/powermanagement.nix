{ config, pkgs, ... }:

{

  services.acpid =
  {
    enable = true;

    # Suspend on power button press
    powerEventCommands = ''
      pid_file=/var/run/button-suspend.pid

      if [ -e "$pid_file" ]; then
        wait_pid=$(cat "$pid_file")
        kill -s 0 "$wait_pid"
        if [ $? -eq 0 ]; then
          # An instance of the "button_wait" process is already running.
          # Don't do anything, effectively "de-bouncing" the power button.
          exit 0
        else
          # An instance of the "button_wait" process ran, but it did not clean up.
          rm "$pid_file"
        fi
      fi
      # Make new "button_wait" process to de-bounce the button WITHOUT blocking.
      # If we were to sleep and block the thread of this script, then acpid
      # would just wait until we were done sleeping to process the queue of
      # bounced power button events.
      (sleep 10; rm "$pid_file") &
      echo "$!" > "$pid_file"

      systemctl hibernate
      #${pkgs.pmutils}/bin/pm-suspend
    '';
  };
}

