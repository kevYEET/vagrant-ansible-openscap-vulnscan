## This Ansible Role will:

-    Update all packages on the target systems, only if the target system is running CentOS.
-    Upgrade all packages on the target systems, only if the target system is running CentOS.
-    Implement a security policy by modifying the PAM configuration file to enforce password complexity requirements
-    Perform a rolling SSH hardening by disabling the Root login, disabling X11 forwarding, disabling Password based authentication and enabling verbose logging
-    Install and enable firewalld firewall, and set it to public zone
-    Configure firewalld to allow incoming traffic over SSH, HTTP, HTTPS and enable masquerading
-    Allow incoming ssh traffic on port 22 and restart firewalld
-    Enable system logs and restart rsyslog
-    Ensure the EPEL repository is present
-    Install wget and OpenSCAP scanner package, which is a security auditing tool
-    Validate OpenSCAP Installation and print the version
-    Print the CentOS release information.