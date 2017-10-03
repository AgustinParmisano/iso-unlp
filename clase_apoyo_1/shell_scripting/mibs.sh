#!/bin/bash

a=$(wc -c ./commands | cut -d' ' -f1)
expr $a / 1024 / 1024
