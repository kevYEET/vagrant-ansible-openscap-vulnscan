#!/bin/bash
DATE=$(date +%m%d%Y)
yum install perl-XML-Twig perl-XML-LibXML perl-Config-General openscap-scanner scap-security-guide bzip2 wget unzip
# Download oval file
wget https://oval.cisecurity.org/repository/download/5.11.2/vulnerability/centos_linux_7.xml
# Scan for vulnerability
oscap oval eval --report report.html centos_linux_7.xml

