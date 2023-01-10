#!/bin/bash
DATE=$(date +%m%d%Y)

# Download oval file
wget https://security-metadata.canonical.com/oval/com.ubuntu.$(lsb_release -cs).usn.oval.xml.bz2
# Extract the xml file
bunzip2 com.ubuntu.$(lsb_release -cs).usn.oval.xml.bz2
# Scan for vulnerability
oscap oval eval --report report.html com.ubuntu.$(lsb_release -cs).usn.oval.xml