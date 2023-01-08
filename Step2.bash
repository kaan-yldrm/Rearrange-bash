#!/bin/bash

dosyayolu=$(find ./kaan -name '*Sinav_Listeleri')
syapiciperf="${dosyayolu}/Aday_Kontrol_Listeleri"
adayperfsoru="${dosyayolu}/P.Sinav_Aday_Soru_Dosyalari"
perfliste="${dosyayolu}/Performans_Sinavi_Aday_Listesi"
teoliste="${dosyayolu}/Teorik_Sinav_Aday_Listesi"
sdosyalari="${dosyayolu}/Sinav_Dosyasi_Evraklari"

#######################################
#Aday Kontrol Listeleri
nofF1=$(ls $syapiciperf | wc -l)

for x in $(seq 1 $nofF1); 
do
        newname0x=$(ls $syapiciperf | head -1)
        newname1x=${newname0x##*(}
        newname2x=${newname1x%)*}
        mv "$syapiciperf/$newname0x" "$syapiciperf/z-$newname2x-0-P.Degerlendirme.pdf"
done

find $syapiciperf -name 'z-*' | rename 's/z-//'

mv "$syapiciperf" "$dosyayolu/2-1-Performans-Ic-Zarf"


####################################### 
#P.Sinav Aday Soru Dosyalari

nofF2=$(ls $adayperfsoru | wc -l)

for y0 in $(seq 1 $nofF2);
do
        newname01x=$(ls $adayperfsoru | head -1)
        newname11x=${newname01x##* (}
        newname21x=${newname11x%) *}
        mv "$adayperfsoru/$newname01x" "$adayperfsoru/z-$newname21x-1-P.Senaryo.pdf"
done

find $adayperfsoru -name 'z-*' | rename 's/z-//'

12694187110-0-P.Degerlendirme.pdf 
12694187110-1-P.Senaryo.pdf  
12694187110-2-P.Kroki.pdf       
12694187110-3-P.Forklift PK.pdf 
12694187110-4-P.Tas.Islem.pdf  


sudo apt-get install default-jre libreoffice-java-common # libreoffice pdf çevirmesi için java güncellemesi

soffice --convert-to pdf $adayperfsoru/*docx --outdir $adayperfsoru

hepsini yeniden 1,2,3..16 şeklinde önüne 1- gibi isim verip sonra ekleme çıkartma işlemlerini yapmalıyım

# 16 kere yaptıktan sonra 17.de artık .pdf.pdf olmaya başlıyor for döngüsü ve break koşulu gerek

# bash's parameter expansion - https://unix.stackexchange.com/questions/283578/renaming-multiple-files-using-sed
# 	//./_ means replace all dots by underscores
#	%_* means remove everything after the last underscore
#	##*_ means remove everything up to the last underscore

# for file in * ; do
#     replace_all=${file//./_}
#     newname=${replace_all%_*}.${replace_all##*_}
#     mv "$file" "$newname"
# done

sudo apt-get install unoconv #pdf çevirici



