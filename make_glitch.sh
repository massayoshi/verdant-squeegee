#!/bin/bash

for file in $1/*.jpg ;
	do
		echo `Processing file $file`
    `jpglitch --jpg $file`
done
