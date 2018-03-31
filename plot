#!/bin/bash

file=${1:?<file-to-plot>}
name=${2:-Temperature $file}

gnuplot -p <<EOF
	set title "$name"
	set key off
	set xdata time
	set timefmt "%s"
	# set xtics 3600
	set format x "%d%b\n%H:%M"
	set grid xtics ytics mxtics

	plot '$file' using 1:2 with lines
	while (1) {
		replot
		pause 10
	}
EOF
