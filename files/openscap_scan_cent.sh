#!/bin/bash
DATE=$(date +%m%d%Y)
# Copy the file
cp /usr/share/xml/scap/ssg/content/ssg-centos7-ds.xml .
# Scan for vulnerability
oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_standard --report report.html ssg-centos7-ds.xml