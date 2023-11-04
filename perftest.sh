#!/usr/bin/env bash

#########################################################
#                                                       #
#  This program is designed to test the performance of  #
#  the hacking tools included in this repository.       #
#                                                       #
#  Run as ./perftest.sh largefile.txt                   #
#  Your large file should be at least a few dozen MB    #
#                                                       #
#########################################################

TEMPFILE=$(mktemp)
mkdir -p ./build
cd ./build

# first, we will preload the test file into RAM
vmtouch -t "$1" >/dev/null 2>&1
# Then, we will test each optimization level

gcc --std=c11 -O0 -o h4x-O0  ../h4x.c >/dev/null 2>&1
echo "Optimizer set to zero:"
pv "$1" | ./h4x-O0 > /dev/null

gcc --std=c11 -O1 -o  h4x-O1 ../h4x.c >/dev/null 2>&1
echo "Optimizer set to one:"
if [[ $(md5 -q ./h4x-O0) != $(md5 -q ./h4x-O1) ]]
then
	pv "$1" | ./h4x-O1 > /dev/null
else
	echo "O0 and O1 are identical"
fi


gcc --std=c11 -O2 -o  h4x-O2 ../h4x.c >/dev/null 2>&1
echo "Optimizer set to two:"
if [[ $(md5 -q ./h4x-O1) != $(md5 -q ./h4x-O2) ]]
then
	pv "$1" | ./h4x-O2 > /dev/null
else
	echo "O1 and O2 are identical"
fi

gcc --std=c11 -O3 -o  h4x-O3 ../h4x.c >/dev/null 2>&1
echo "Optimizer set to three:"
if [[ $(md5 -q ./h4x-O2) != $(md5 -q ./h4x-O3) ]]
then
	pv "$1" | ./h4x-O3 > /dev/null
else
	echo "O2 and O3 are identical"
fi


# we need to create a suitable hacked file for the unhacker
./h4x-O0 <"$1" > $TEMPFILE
vmtouch -t $TEMPFILE >/dev/null 2>&1

gcc --std=c11 -O0 -o unh4x-O0 ../unh4x.c >/dev/null 2>&1
echo "Optimizer set to zero:"
pv $TEMPFILE | ./unh4x-O0 > /dev/null

gcc --std=c11 -O1 -o  unh4x-O1 ../unh4x.c >/dev/null 2>&1
echo "Optimizer set to one:"
if [[ $(md5 -q ./unh4x-O0) != $(md5 -q ./unh4x-O1) ]]
then
	pv $TEMPFILE | ./unh4x-O1 > /dev/null
else
	echo "O0 and O1 are identical"
fi

gcc --std=c11 -O2 -o  unh4x-O2 ../unh4x.c >/dev/null 2>&1
echo "Optimizer set to two:"
if [[ $(md5 -q ./unh4x-O1) != $(md5 -q ./unh4x-O2) ]]
then
	pv $TEMPFILE | ./unh4x-O2 > /dev/null
else
	echo "O1 and O2 are identical"
fi

gcc --std=c11 -O3 -o  unh4x-O3 ../unh4x.c >/dev/null 2>&1
echo "Optimizer set to three:"
if [[ $(md5 -q ./unh4x-O2) != $(md5 -q ./unh4x-O3) ]]
then
	pv $TEMPFILE | ./unh4x-O3 > /dev/null
else
	echo "O2 and O3 are identical"
fi
