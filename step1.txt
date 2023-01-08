#!/bin/bash

VAR=$(find . -name '*.zip')
DIR="$(dirname "${VAR}")" ; FILE="$(basename "${VAR}")" 
echo "[${DIR}] [${FILE}]"

NewDIR=$(basename -s .zip ${FILE})

rm -r ${DIR}/${NewDIR} # eski işlenmiş dosyayı silip yenisini yapıyor

unzip ${DIR}/${FILE} -d ${DIR}/${NewDIR}

## find ile dosya buldugunda 1% ile  .* dan onceki ismini $1
## sayesinde yeni bir klasore atiyor
## $0 ile _ ayni islevi goruyor
#find ./Downloads -name '*.zip' -exec sh -c 'unzip -d "${1%.*}" "$1"' $0 {} \; 

for x in 1 2 3;
do
        find ${DIR}/${NewDIR} -type d | rename -v 's/ /_/'
done



# Dosyaları unzip yapıp, alt klasörlerinin isimlerini düzenliyor

./Step2.sh #ikinci asama scriptini calistirir
