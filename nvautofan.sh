#!/bin/bash

# Name: NVIDIA AutoFan
# Contributor: Murcio Filho
# Year: 2015
# Description: This bash script controls your NVIDIA GPU Fan on Linux, just change values to personalize your fan curve

# This script has NO LICENSE


interval=5

while true; do
	current_temp=`nvidia-settings -query GPUCoreTemp| grep gpu | perl -ne 'print $1 if /GPUCoreTemp.*?: (\d+)./;'`
	if (("$current_temp" < 45)); then
		nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=40
	elif (("$current_temp" > 45)) && (("$current_temp" < 60)); then
		nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=50
	elif (("$current_temp" > 60)) && (("$current_temp" < 65)); then
		nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=60
	elif (("$current_temp" > 65)) && (("$current_temp" < 70)); then
		nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=70
	elif (("$current_temp" > 70)) && (("$current_temp" < 75)); then
		nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=80
	elif (("$current_temp" > 75)); then
		nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=100
	fi
	sleep "$interval"
done