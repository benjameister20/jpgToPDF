#!/bin/bash

# find current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

# if homebrew is not installed, install homebrew
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew\n"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	brew upgrade
fi

# if imagemagick is not installed, install imagemagick
if [! type "$convert" > /dev/null]; then
    echo "Installing imagemagick"
    brew install imagemagick
fi

# combining JPG files into one PDF
echo "Starting combination of JPGs into one file"
convert *.jpg CombinedJPGFiles.pdf
echo "Finished combining JPGs into one PDF"
echo "Starting deletion of JPGs"
rm *.jpg
echo "Finished deleting JPGs"

# combining any desired PDF files into one PDF
echo "Would you like to combine any PDF files? (Type yes or no and press enter)"
read response

if [ "$response" == "yes" ]; then
	# if poppler is not installed, then install it
	if [! type "$pdfunite" > /dev/null]; then
	    echo "Installing poppler"
	    brew install poppler
	fi

	echo "Please make sure that your PDF files are named 1.pdf, 2.pdf, 3.pdf, ... according to the order in which you would like them to be combined."
	read -p "Press enter when you are ready. (Press Ctrl+C if you accidentally typed yes and want to quit)"

	echo "Starting combination of PDF files."
	pdfunite $(ls -v *.pdf) CombinedPDFFiles.pdf
	echo "Finished combining PDF files."
	
	echo "Would you like to delete old pdf files? (Type yes or no and then press Enter)"
	read response
	
	if [[ "$response" == "yes" ]]; then
		echo "Starting deletion of PDF files"
		#rm *.pdf !(CombinedPDFFiles.pdf)
		echo "Finished deleting PDF files"
	fi
fi

echo ""
echo "Thank you for using our program and please click the terminate button come back soon :)"

# quit terminal window
osascript -e 'quit app "terminal.app"'