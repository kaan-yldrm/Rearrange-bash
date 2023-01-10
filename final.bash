#!/bin/bash
start=$SECONDS # start timer

VAR=$(find . -name '*.zip')
DIR="$(dirname "${VAR}")" ; FILE="$(basename "${VAR}")" 
echo "[${DIR}] [${FILE}]"

NewDIR=$(basename -s .zip ${FILE})

rm -r ${DIR}/${NewDIR} # eski işlenmiş dosyayı silip yenisini yapıyor

unzip ${DIR}/${FILE} -d ${DIR}/${NewDIR} # Dosyayı kendi ismiyle unzip yapıyor

for x in 1 2 3;
do
        find ${DIR}/${NewDIR} -type d | rename -v 's/ /_/' # alt klasörlerinin isimlerini düzenliyor
done



dosyayolu=$(find . -name '*Sinav_Listeleri')
syapiciperf="${dosyayolu}/Aday_Kontrol_Listeleri"
adayperfsoru="${dosyayolu}/P.Sinav_Aday_Soru_Dosyalari"
perfliste="${dosyayolu}/Performans_Sinavi_Aday_Listesi"
teoliste="${dosyayolu}/Teorik_Sinav_Aday_Listesi"
sdosyalari="${dosyayolu}/Sinav_Dosyasi_Evraklari"



mkdir "$dosyayolu/1-0-Teorik-Dis-Zarf"
mkdir "$dosyayolu/2-0-Performans-Dis-Zarf"
mkdir "$dosyayolu/2-1-Performans-Ic-Zarf"

mv "${dosyayolu}/Aday_Basvuru_Dokumanlari" "$dosyayolu/0-0-Aday-Basvuru-Formu"

find . -type f -name '*Performans*Aday_Listesi.pdf' -exec mv {} $dosyayolu/2-0-Performans-Dis-Zarf/2-Performans-Aday-Listesi.pdf \;
find . -type f -name '*Teorik*Aday_Listesi.pdf' -exec mv {} $dosyayolu/1-0-Teorik-Dis-Zarf/2-Teorik-Aday-Listesi.pdf \;



nofF=$(ls $syapiciperf | wc -l)

for y in $(seq 1 $nofF); 
do
#######################################
#Aday Kontrol Listeleri

        newname0x=$(ls $syapiciperf | head -1)
        newname1x=${newname0x##*(}
        newname2x=${newname1x%)*}
        mv "$syapiciperf/$newname0x" "$dosyayolu/2-1-Performans-Ic-Zarf/z-$newname2x-0-P.Degerlendirme.pdf"

####################################### 
#P.Sinav Aday Soru Dosyalari

        newname01x=$(ls $adayperfsoru | head -1)
        newname11x=${newname01x##* (}
        newname21x=${newname11x%) *}
        mv "$adayperfsoru/$newname01x" "$dosyayolu/2-1-Performans-Ic-Zarf/z-$newname21x-1-P.Senaryo.docx"        # isimlerin onune z koyuyor siralamayi saglamak icin
        #tbmwd=$(find $adayperfsoru -type f -name '*-1-P.Senaryo.docx')                                          # yapılandırılmış dosyaları bulup bir adresini değişkene kaydediyor
        #mv "$tbmwd" "$dosyayolu/2-1-Performans-Ic-Zarf"                                                         # yapılandırılmış dosyaları tek tek 2-1-Performans-Ic-Zarf klasörüne atıyor

#######################################
#Sinav_Dosyasi_Evraklari
        # 3- Forklift Periyodik Kontrol Formu >> 3-P.Forklift_PK
        newname01xa=$(find $sdosyalari -name '3- Forklift Periyodik Kontrol Formu*' | head -1)                  # kaan/1220734_Sinav_Listeleri/to_be_worked/3- Forklift Periyodik Kontrol Formu 12694187110-1.docx
        newname11xa=${newname01xa##* } # son bosluga kadar olan herseyi sil                                     # 12694187110-1.docx
        newname21xa=${newname11xa%-*} # son tire isaretinden sonra herseyi sil                                  # 12694187110
        mv "$newname01xa" "$dosyayolu/2-1-Performans-Ic-Zarf/z-$newname21xa-3-P.Forklift_PK.docx"               # yeniden isimlendirme
        
        # 4- Yuk Tasima Krokisi >> 2-P.Kroki
        newname01xb=$(find $sdosyalari -name '4- Yuk Tasima Krokisi*' | head -1)  
        newname11xb=${newname01xb##* } # son bosluga kadar olan herseyi sil               
        newname21xb=${newname11xb%-*} # son tire isaretinden sonra herseyi sil            
        mv "$newname01xb" "$dosyayolu/2-1-Performans-Ic-Zarf/z-$newname21xb-2-P.Kroki.docx"

        # 7- Endustriyel Tasima Forklift Tasima Islem Formu >> 4-P.Tas.Islem
        newname01xc=$(find $sdosyalari -name '7- Endustriyel Tasima Forklift Tasima Islem Formu*' | head -1)  
        newname11xc=${newname01xc##* } # son bosluga kadar olan herseyi sil              
        newname21xc=${newname11xc%-*} # son tire isaretinden sonra herseyi sil            
        mv "$newname01xc" "$dosyayolu/2-1-Performans-Ic-Zarf/z-$newname21xc-4-P.Tas.Islem.docx"
done


find $dosyayolu/2-1-Performans-Ic-Zarf -name 'z-*' | rename 's/z-//' # ondeki z leri kaldiriyor

soffice --convert-to pdf $dosyayolu/2-1-Performans-Ic-Zarf/*docx --outdir $dosyayolu/2-1-Performans-Ic-Zarf     # 2-1-Performans-Ic-Zarf dosyasındaki .docx dosyalarını .pdf e dönüşütürür

rm $dosyayolu/2-1-Performans-Ic-Zarf/*docx                                                                      # 2-1-Performans-Ic-Zarf dosyasındaki .docx dosyaların siler



# *ATAMA YAZISI-1.docx 3 adet
find $sdosyalari -type f -name 'DEGER*ATAMA YAZISI-1.docx' -exec mv {} $dosyayolu/5-Atama-S.Yapici.docx \;
find $sdosyalari -type f -name 'GOZ*ATAMA YAZISI-1.docx' -exec mv {} $dosyayolu/6-Atama-Gozetmen.docx \;
find $sdosyalari -type f -name 'KARAR*ATAMA YAZISI-1.docx' -exec mv {} $dosyayolu/7-Atama-K.Verici.docx \;
soffice --convert-to pdf $dosyayolu/*docx --outdir $dosyayolu 
rm $dosyayolu/*docx 

# performans
find $sdosyalari -type f -name '*KAMERA*Performans*.docx' -exec mv {} $dosyayolu/2-0-Performans-Dis-Zarf/1-Performans-Kamera-Metni.docx \;              # *KAMERA METNI FORMU Performans Sinavi-1       >> 1-Performans-Kamera-Metni
find $sdosyalari -type f -name '*DEGER*Performans*.docx' -exec mv {} $dosyayolu/2-0-Performans-Dis-Zarf/3-Performans-Sinav-Alani-Uygunluk.docx \;       # *DEGERLENDIRME FORMU Performans Sinavi-1      >> 3-Performans-Sınav-Alanı Uygunluk
find $sdosyalari -type f -name '*EVRAK*Performans*.docx' -exec mv {} $dosyayolu/2-0-Performans-Dis-Zarf/8-Performans-Evrak-Teslim.docx \;               # *EVRAK TESLIM FORMU Performans Sinavi-1       >> 8-Performans-Evrak-Teslim
find $sdosyalari -type f -name '*TUTANA*Performans*.docx' -exec mv {} $dosyayolu/2-0-Performans-Dis-Zarf/4-Performans-Sinav-Tutanagi.docx \;            # *TUTANAGI Performans Sinavi-1                 >> 4-Performans-Sınav-Tutanağı
soffice --convert-to pdf $dosyayolu/2-0-Performans-Dis-Zarf/*docx --outdir $dosyayolu/2-0-Performans-Dis-Zarf  
rm $dosyayolu/2-0-Performans-Dis-Zarf/*docx 
# teorik
find $sdosyalari -type f -name '*KAMERA*Teorik*.docx' -exec mv {} $dosyayolu/1-0-Teorik-Dis-Zarf/1-Teorik-Kamera-Metni.docx \;                          # *KAMERA METNI FORMU Teorik Sinav-1    >> 1-Teorik-Kamera-Metni
find $sdosyalari -type f -name '*DEGER*Teorik*.docx' -exec mv {} $dosyayolu/1-0-Teorik-Dis-Zarf/3-Teorik-Sinav-Alani-Uygunluk.docx \;                   # *DEGERLENDIRME FORMU Teorik Sinav-1   >> 3-Teorik-Sınav-Alanı Uygunluk
find $sdosyalari -type f -name '*EVRAK*Teorik*.docx' -exec mv {} $dosyayolu/1-0-Teorik-Dis-Zarf/8-Teorik-Evrak-Teslim.docx \;                           # *EVRAK TESLIM FORMU Teorik Sinav-1    >> 8-Teorik-Evrak-Teslim
find $sdosyalari -type f -name '*TUTANA*Teorik*.docx' -exec mv {} $dosyayolu/1-0-Teorik-Dis-Zarf/4-Teorik-Sinav-Tutanagi.docx \;                        # *TUTANAGI Teorik Sinav-1              >> 4-Teorik-Sınav-Tutanağı
soffice --convert-to pdf $dosyayolu/1-0-Teorik-Dis-Zarf/*docx --outdir $dosyayolu/1-0-Teorik-Dis-Zarf 
rm $dosyayolu/1-0-Teorik-Dis-Zarf/*docx 

rm -r $adayperfsoru $syapiciperf $perfliste $teoliste $sdosyalari # Bu klasör boş olacağı için siliyoruz

# Performance timing
end=$SECONDS
runtimeRearrangeBash=$((end-start))
echo -e "\nThis script took $runtimeRearrangeBash seconds, wasn't easy TBH."                                                       # or echo [enter] echo "This script too xxx seconds"
