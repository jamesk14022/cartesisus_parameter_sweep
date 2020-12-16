#!/bin/bash
module load pre2019
module load stopos
rm -f parmpool.$$
seq 1.6 0.1 10.0 > parmpool.$$
stopos -p bondlengths purge
stopos -p bondlengths create
stopos -p bondlengths add parmpool.$$
rm parmpool.$$
