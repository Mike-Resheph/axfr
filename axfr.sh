#!/bin/bash

if [ -z "$1" ]; then
	echo "[!] Zone Transfer Script."
	echo "[*] Enter domain to to attempt NS transfer from."
	echo "[*] Usage: axfr.sh <domain>"
	exit 0
fi

for nameserver in $(host -t ns $1 | cut -d" " -f4);do
	host -l $1 $nameserver | grep "has address" |cut -d" " -f1,4
done
