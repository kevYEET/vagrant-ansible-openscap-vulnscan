#!/bin/bash
DATE=$(date +%m%d%Y)
# Download oval file
wget https://oval.cisecurity.org/repository/download/5.11.2/vulnerability/centos_linux_7.xml
# Scan for vulnerability
oscap oval eval --report report.html centos_linux_7.xml