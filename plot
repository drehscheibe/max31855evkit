#!/bin/bash

file=${1:?<file-to-plot>}
name=${2:-Temperature $file}

gnuplot -p <<EOF
	set title "$name"
	#set key off
	set xdata time
	set timefmt "%s"
	# set xtics 3600
	set format x "%d%b\n%H:%M"
	set grid xtics ytics mxtics

	plot \
		'$file' using 1:2 with lines title "ambient" linecolor rgb "#c0ffc0" linewidth 2, \
		'$file' using 1:3 with lines title "raw" linecolor rgb "#c0c0ff" linewidth 1, \
		'$file' using 1:4 with lines title "filtered" linecolor rgb "blue" linewidth 2, \
		'$file' using 1:5 with lines title "min" linecolor rgb "grey" linewidth 1, \
		'$file' using 1:6 with lines title "max" linecolor rgb "grey linewidth 1"

	while (1) {
		replot
		pause 1
	}
EOF
