# combineFiles



This script takes all the JPGs in one folder and combines them into one pdf, then it deletes
the old JPG files. Once this is done it asks you if you want to combine all the PDFs in the
 same folder into one PDF. If you say yes then it will combine the PDFs via lexicographic order
 into a PDF called CombinedPDFFile.pdf. It will then ask if you want to delete the old PDF
 files. If you say yes, then it will delete all the PDFs in the directory except CombinedPDFFiles.pdf.
 
 The images folder provides a sample JPG if you wish to test the system. Copy the testImage.jpg 
 from the image folder into the directory with combineFiles.command. Then double click on the 
 combineFiles.command executable file. This will create a PDF doc called CombinedJPGFiles.pdf. 
 Rename this file to 1.pdf and then type "yes" to combine PDF files, then hit "Enter", then type "yes"
 to delete the old PDF files.