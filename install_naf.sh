#!/bin/sh

############################################################
# Author:   Ruben Izquierdo Bevia ruben.izquierdobevia@vu.nl
# Version:  1.0
# Date:     16 Sep 2013
#############################################################


echo 'Downloading and installing LIBSVM from https://github.com/cjlin1/libsvm'
mkdir lib
cd lib
wget --no-check-certificate  https://github.com/cjlin1/libsvm/archive/master.zip 2>/dev/null
zip_name=`ls -1 | head -1`
unzip $zip_name > /dev/null
rm $zip_name
folder_name=`ls -1 | head -1`
mv $folder_name libsvm
cd libsvm/python
make > /dev/null 2> /dev/null
echo LIBSVM installed correctly lib/libsvm


cd ../../ ##On the lib folder
wget https://github.com/cltl/NafParserPy/archive/master.zip --no-check-certificate
unzip master.zip
rm master.zip
mv NafParserPy-master/NafParserPy .
rm -rf NafParserPy-master
echo 'pass' > __init__.py

echo 'Downloading models...(could take a while)'
wget --user=cltl --password='.cltl.' kyoto.let.vu.nl/~izquierdo/models_wsd_svm_dsc.tgz 2> /dev/null
echo 'Unzipping models...'
tar xzf models_wsd_svm_dsc.tgz
rm models_wsd_svm_dsc.tgz
echo 'Models installed in folder models'
