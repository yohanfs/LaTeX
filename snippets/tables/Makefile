#Makefile for compiling tex by Yohan Sidik
#Change-log
#23-10-2020: organize the script
#24-10-2020: only aux files stored in the build folder; main.pdf is in the root folder

.PHONY: update all

auxFolder := build
mode      := nonstopmode
filename  := main

#mode options
# 1. batchmode 
# 2. nonstopmode


update:
	@echo "simple update"
	@echo "-------------"
	pdflatex -aux-directory=$(auxFolder) -interaction=$(mode) $(filename)

all: 
	@echo "run pdflatex (1)"
	@echo "----------------"
	pdflatex -aux-directory=$(auxFolder) -interaction=$(mode) $(filename)
	@echo "run biber"
	@echo "---------"
	biber --input-directory=$(auxFolder) --output-directory=$(auxFolder) $(filename)
	@echo "run glossaries"
	@echo "--------------"
	makeglossaries -d $(auxFolder) $(filename)
	@echo "run pdflatex (2)"
	@echo "----------------"
	pdflatex -aux-directory=$(auxFolder) -interaction=$(mode) $(filename)
	@echo "run pdflatex (3)"
	@echo "----------------"
	pdflatex -aux-directory=$(auxFolder) -interaction=$(mode) $(filename)


	
	

