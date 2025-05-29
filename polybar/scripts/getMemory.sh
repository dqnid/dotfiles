#!/bin/bash

memory=$(free -m -L | awk '{print $6'})
echo $memory MiB
