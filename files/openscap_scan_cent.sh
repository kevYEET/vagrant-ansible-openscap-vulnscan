#!/bin/bash
DATE=$(date +%m%d%Y)
# Install
# yum -y install openscap-scanner scap-security-guide
# Scan for vulnerability
oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_pci-dss --report report.html /usr/share/xml/scap/ssg/content/ssg-centos7-ds.xml