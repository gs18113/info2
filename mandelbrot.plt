mandelbrot(re, im, cRe, cIm, iter) = (iter>=50 ? iter:(re*re+im*im>=4 ? iter:mandelbrot(re*re-im*im+cRe, 2*re*im+cIm, cRe, cIm, iter+1)))

set pm3d map
set palette color
set cbrange [0:50]
set xrange[-2:2]
set yrange[-2:2]
unset xtics
unset ytics

set palette model RGB

set samples 1000
set isosamples 1000

splot mandelbrot(0, 0, x, y, 1)
