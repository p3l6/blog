# make SIZE=100:  // absolute pixels
# make SIZE=.5x   // relative size

# initial svg created using Vectr, then manually edited it

# non-web-based converters do an awful job with the fonts. so use a nodejs based one.
# npm install svgexport -g
#  Scale 1.5x proportionally:
#   svgexport input.svg output.png 1.5x
#  Scale proportionally to set output width to 32px:
#   svgexport input.svg output.png 32:

SIZE?=1x
DIR := $(SIZE::=px) # replaces : with px

default : white clear sort sweep 
white : logo.png logo-notext.png logo-bw.png logo-bw-notext.png
clear : logo-clear.png logo-clear-notext.png logo-clear-bw.png logo-clear-bw-notext.png

logo%png : %tmp.svg
	svgexport $< $@ $(SIZE)

.tmp.svg : logo.svg
	cp $< $@
-notext%tmp.svg : %tmp.svg
	sed 's/\(id="textGroup"\)/\1 visibility="hidden"/g' $< > $@
-bw%tmp.svg : %tmp.svg
	sed -E 's/#0000cc|#00cc00/#000000/g' $< > $@
-clear%tmp.svg : %tmp.svg
	sed 's/\(id="background"\)/\1 visibility="hidden"/g' $< > $@

sort :
	mkdir -p $(DIR)
	cp -f *.png $(DIR)

sweep :
	rm -f .tmp.svg
	rm -f *.tmp.svg
	
clean : sweep
	rm -f *.png
	rm -rf *x/ 	# size directories
