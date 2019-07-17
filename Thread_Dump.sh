#!/bin/sh
#
# Make sure you set JAVA_HOME
#
# Create thread dumps a specified number of times (i.e. LOOP) and INTERVAL.
#
# Thread dumps will be collected in the file "jstack_threaddump.out", in the same directory from where this script is been executed.
#

# Number of times to collect data.
LOOP=3
# Interval in seconds between data points.
INTERVAL=15
# Setting the Java Home, by giving the path where your JDK is kept
#JAVA_HOME=/usr/java/jdk1.7.0_80

TIME=$(date +"%Y-%m-%d_%H:%M:%S")

for ((i=1; i <= $LOOP; i++))
do
   jps | grep -v grep | grep jboss-modules.jar | awk '{print $1}' | xargs jstack -l >> /dump/$HOSTNAME"_threaddump"$i"_"$TIME".out"
   echo "thread dump #" $i
   if [ $i -lt $LOOP ]; then
    echo "sleeping..."
    sleep $INTERVAL
  fi
done
