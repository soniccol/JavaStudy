#!/bin/bash
TIME=$(date +"%Y-%m-%d_%H:%M:%S")
jps | grep jboss-modules.jar | awk '{print $1}' | xargs jmap -dump:format=b,file=/dump/"$HOSTNAME".HeapDump."$TIME"
