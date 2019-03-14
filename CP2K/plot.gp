# Setting the terminal
set encoding utf8 
set terminal postscript enhanced 
set terminal postscript eps size 3.5,3 enhanced color \
    font 'Arial,14'  linewidth 1.5
set key box lw 1
set key width 0.5 height 1
set key font 'Arial,15'
set key spacing 2

# Add a vertical dotted line at x=0 to show centre (mean) of distribution.
set yzeroaxis

# Each bar is half the (visual) width of its x-range.
set boxwidth 0.05 absolute
set style fill solid 1.0 noborder

bin_width = 20;

bin_number(x) = floor(x/bin_width)

rounded(x) = bin_width * ( bin_number(x) + 0.5 )

plot 'freq.dat' using (rounded($1)):(1) smooth frequency with boxes notitle 

#set title "Surface"
#set xrange [2900:4000]
#set yrange [-15:20]
set xlabel "Frequency {/Symbol w} (cm^{-1})"
set ylabel "Fraction F({/Symbol w}) (arb. unit.)"

# Output files
set terminal postscript eps enhanced size 4.5in,2.2in
set output 'Fraction.eps'
replot
