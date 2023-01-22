#!/bin/bash

dosyayolu=$(find ./kaan -name '*Sinav_Listeleri')
syapiciperf="${dosyayolu}/Aday_Kontrol_Listeleri"
adayperfsoru="${dosyayolu}/P.Sinav_Aday_Soru_Dosyalari"
perfliste="${dosyayolu}/Performans_Sinavi_Aday_Listesi"
teoliste="${dosyayolu}/Teorik_Sinav_Aday_Listesi"
sdosyalari="${dosyayolu}/Sinav_Dosyasi_Evraklari"

# yukarisi sadece yardimci olmasi icin var

tbw="${dosyayolu}/to_be_worked"

nofF3=$(ls $tbw | wc -l) # tbw'deki islenecek dosya adedi

for y0a in $(seq 1 $nofF3); 
do
        # 3- Forklift Periyodik Kontrol Formu >> 3-P.Forklift_PK
        newname01xa=$(find $tbw -name '3- Forklift Periyodik Kontrol Formu*' | head -1)  # kaan/1220734_Sinav_Listeleri/to_be_worked/3- Forklift Periyodik Kontrol Formu 12694187110-1.docx
        newname11xa=${newname01xa##* } # son bosluga kadar olan herseyi sil               # 12694187110-1.docx
        newname21xa=${newname11xa%-*} # son tire isaretinden sonra herseyi sil            # 12694187110
        mv "$newname01xa" "$dosyayolu/2-1-Performans-Ic-Zarf/z-$newname21xa-3-P.Forklift_PK.docx"
        #mv "$tbw/z-$newname21xa-3-P.Forklift_PK.docx" "$dosyayolu/2-1-Performans-Ic-Zarf/z-$newname21xa-3-P.Forklift_PK.docx"

        # 4- Yuk Tasima Krokisi >> 2-P.Kroki
        newname01xb=$(find $tbw -name '4- Yuk Tasima Krokisi*' | head -1)  
        newname11xb=${newname01xb##* } # son bosluga kadar olan herseyi sil               
        newname21xb=${newname11xb%-*} # son tire isaretinden sonra herseyi sil            
        mv "$newname01xb" "$tbw/z-$newname21xb-2-P.Kroki.docx"

        # 7- Endustriyel Tasima Forklift Tasima Islem Formu >> 4-P.Tas.Islem
        newname01xc=$(find $tbw -name '7- Endustriyel Tasima Forklift Tasima Islem Formu*' | head -1)  
        newname11xc=${newname01xc##* } # son bosluga kadar olan herseyi sil              
        newname21xc=${newname11xc%-*} # son tire isaretinden sonra herseyi sil            
        mv "$newname01xc" "$tbw/z-$newname21xc-4-P.Tas.Islem.docx"
done

find $tbw -name 'z-*' | rename 's/z-//'
#tbm=$(find $tbw -type f -name '*.pdf')
#mv "$tbw/2-1-Performans-Ic-Zarf*.docx""$dosyayolu/2-1-Performans-Ic-Zarf*.docx"


# find kaan/1220734_Sinav_Listeleri/to_be_worked/ -name '3- Forklift Periyodik Kontrol Formu*' | head -1

# kaan/1220734_Sinav_Listeleri/to_be_worked/3- Forklift Periyodik Kontrol Formu 12694187110-1.docx