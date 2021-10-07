#!/bin/sh
# 
#              DO WHAT YOU WANT TO PUBLIC LICENSE
#                 Version 3.2.1-beta, May 2021
#
#  Copyright (C) 2021 @jthop <jh@mode14.com>
#
#  Everyone is permitted to copy and distribute verbatim or modified
#  copies of this license document, and changing it is allowed as long
#  as the name is changed.
#
#               DO WHAT YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#   1. If you make some serious $ with this, YOU OWE ME.
#   2. Do not bother the auther unless it's to comply with #1.
#   3. Otherwise, just DO WHAT THE FUCK YOU WANT TO.
#
#
#  * This license is a fork of *
#  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#  Version 2, Dec 2004 - Sam Hocevar <sam@hocevar.net>
#
#

THEDBUSER="myDatabaseUsername"
THEDBPW="myDatabasePassword"
THEDATE=`date +%d%m%y%H%M`
THEDATE=`date +%d%m%y%H%M`
DOW=`date +%A`
HOST=$(hostname -f) 

# backup our config files
cp -R /etc/bind9 /home/jhopper/conf
cp /etc/dhcp/dhcpd.conf /home/jhopper/conf
cp /etc/unbound/unbound.conf /home/jhopper/conf
cp /etc/rsyslog.conf /home/jhopper/conf
cp /etc/rsyslog.d/50-default.conf /home/jhopper/conf


# make sure we have aws credentials if running via CRON, etc
AWS_SHARED_CREDENTIALS_FILE='/home/jhopper/.aws/credentials'
AWS_CONFIG_FILE='/home/jhopper/.aws/config'

# sync with aws
aws s3 sync /home/jhopper s3://mode14-backup/$HOST --delete


