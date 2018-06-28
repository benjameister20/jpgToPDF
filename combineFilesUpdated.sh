#!/bin/bash

# find current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

# if homebrew is not installed, install homebrew
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# if imagemagick is not installed, install imagemagick
if [[ $(command -v convert) == "" ]]; then
    echo "Installing imagemagick"
    brew install imagemagick
fi

# combining JPG files into one PDF
echo "\n\nStarting combination of JPGs into one file\n"
convert *.jpg FinishedPDFDocument.pdf
echo "Finished combining JPGs into one PDF\n"
echo "Starting deleting of JPGs\n"
rm *.jpg
echo "Finished deleting JPGs\n"
echo "What would you like to call the new PDF file? (Press enter when you have typed the name)"
read PDFName
mv FinishedPDFDocument.pdf ${PDFName}.pdf

# combining any desired PDF files into one PDF
echo "\nWould you like to combine any PDF files? (Type yes or no and press enter)\n"
read response

while [ "$response" != "no" ]; do
	echo "Please type the name of the first PDF document you would like to add. Type no if you are done"
	read response
	
done
	

echo "\nBeginning combination of PDF files into one file\n"
echo "Finished combining PDFs into one file\n"
echo "\nThank you for using our program and please come back soon :)\n"
# quit terminal window
osascript -e 'quit app "terminal.app"'