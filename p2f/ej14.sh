#!/bin/bash

cant=0
while [ true ]; do
  if [ `ps -e | grep apache | wc -l` -gt 1 ]; then
    cant+=$((cant+1))
  fi
  if [ $cant -eq 10 ]; then
    `killall apache`
    echo "El proceso apache estuvo corriendo 10 veces"
    exit 50
  fi
  sleep 10
done
