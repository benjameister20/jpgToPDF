#!/bin/bash

# find current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

# if homebrew is not installed, install homebrew
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew\n"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# if imagemagick is not installed, install imagemagick
if [[ $(command -h convert) == "" ]]; then
    echo "Installing imagemagick\n"
    brew install imagemagick
fi

# combining JPG files into one PDF
echo "\n\nStarting combination of JPGs into one file\n"
convert *.jpg FinishedPDFDocument.pdf
echo "Finished combining JPGs into one PDF\n"
echo "Starting deleting of JPGs\n"
rm *.jpg
echo "Finished deleting JPGs\n"

# combining any desired PDF files into one PDF
echo "\nWould you like to combine any PDF files? (Type yes or no and press enter)\n"
read response

if [ "$response" == "yes" ]; then
	# if pdfunite is not installed, then install it
	if [[ $(command -h pdfunite) == "" ]]; then
	    echo "Installing pdfunite\n"
	    brew install pdfunite
	fi

	echo "Please make sure that your PDF files are named 1.pdf, 2.pdf, 3.pdf, ... according to the order in which you would like them to be combined.\n"
	read -p "Press enter when you are ready. (Press Ctrl+C if you accidentally typed yes and want to quit)\n"

	echo "Starting combination of PDF files.\n"
	pdfunite $(ls -v *.pdf) output.pdf
	echo "Finished combining PDF files.\n"
fi

echo "\nThank you for using our program and please come back soon :)\n"

# quit terminal window
osascript -e 'quit app "terminal.app"'