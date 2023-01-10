   ## This Ansible Role will:
   
-    Print the OS release information
-    Update and upgrade packages for Ubuntu systems
-    Check if nano is the latest version and installed
-    Install nginx, enable it to start on boot and start the service
-    Copy an apt update script to the server and add a cron job to run the script every day at midnight
-    Ensure that the fail2ban package is installed and copy a jail configuration, start and enable the service and reload it to pick up new jail configuration
-    Perform SSH hardening, Disabling Root login, disabling X11 forwarding and disabling Password based authentication.
-    Install and enable ufw firewall, set default policy to deny incoming and Allow incoming connections on port 22 and 80,443
-    Restart ufw firewall service
-    Install bzip2 package
-    Installs OpenSCAP scanner package, which is a security auditing tool.