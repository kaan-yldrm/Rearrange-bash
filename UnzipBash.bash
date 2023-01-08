sh: unix shell interpeter	
sh -c: shell script ile çalıştırma komutu

pwd : Mevcut bulunduğun konumu gösterir

touch metin.txt :Dosya oluşturma

touch -d tomorrow metin.txt :Gelecek tarihli dosya oluşturma

history :Kullandığın komutları listeler

#metin artık bir değişken ama Child proseslerde çalışmaz, export edilmeli
metin="kaanın değişkeni"

#metin değişkeni artık Bash Script'ler ile kullanılabilir halde.
export metin

#metin değişkeni kalıcı değil, oturum kapatma veya yeniden başlatmada yok olur.
# .bashrc dosyası kullanıcı login yaptığında çalışır.
# .bashrc'nin (.)noktası görünmez, gizli olduğunu ifade eder.
# ls -al yapılırsa gizli dosyalar da listelenebilir.
# .bashrc dosyasının içine değişken kaydedilirse, özel değişkenimiz her zaman sistemde bulunacaktır.

#!/bin/bash
nano .bashrc

export metin="kaanın değişkeni"
# Şeklinde .bashrc dosyasına koymamız yeterli olacaktır.
 
 
# Matematik yapmak için
echo $(( 2 + 3 )) >>> 5 
 
# || >> OR, && >> AND
# elif ile de aynı if sorgulamasında ikincil bir sorgu devam ettirilebilir.
# İlk sorgu başarısız (false) olduğunda elif sorgulamasını yapacaktır.
# elif'in sonuna "; then" eklemesi yapılmalı
# if statement

if [[ $var1 == $var2 ]]; then
	echo "henlo"
else
	echo "much wow"
	exit 1
fi
# fi burada if'in tersi yani if sorulamasının sonu olduğunu belirtiyor

# Bu if sorgulamasında ikinci if sorgulamasında kaan1 değişkeni "kaan"'a eşit olmazsa
# "You died" çıktısını vermeden buluduğu if sorulamalarının hepsinden çıkar.
if [[ $var1 == $var2 ]]; then
	if [[ $kaan1 == "kaan" ]]; then
		echo "something"
	fi
else
	echo "You died"
fi


####################################################################################################
1220734_Performans_Sinavi_Abdullah_Aslan_(13828117270)_13UY0145-3-B1_P1_Kontrol_Listesi.pdf

NAME=$(ls | head -1)
echo ${frst%%)*} >>>> 1220734_Performans_Sinavi_Abdullah_Aslan_(13828117270
echo ${frst%(*}  >>>> 1220734_Performans_Sinavi_Abdullah_Aslan_

ls | head -1 | sed 's/).*//' >>>> 1220734_Performans_Sinavi_Abdullah_Aslan_(13828117270
ls | head -1 | sed 's/.*(//' >>>> 13828117270)_13UY0145-3-B1_P1_Kontrol_Listesi.pdf

ls | head -1 | sed 's/.*(//' | sed 's/).*//' >>>> 13828117270


####################################################################################################
-exec: Kendisinden sonra yazılı her şeyi komut olarak anlıyor.
-exec ... ; :Şeklinde bir komut yazıldığında (;) yazılı olan yere kadar olan kısmı bir komut seti olarak algılıyor.

// "$0" ile "_" aynı işi yapıyor
$() – the command substitution
${} – the parameter substitution/variable expansion

$(command)
or
`command`

$ echo $(date)
$ echo ‘date’

$ TODAY=$(date)
$ echo "$TODAY"

// for f in /home/sana/*.txt
// do
//   echo "$f"
// done


// #!/bin/sh
//  
// echo ***Status Report***
//  
// TODAY=$(date)
// echo "Today is $TODAY"
//  
// USERS=$(who | wc -l)
// echo "$USERS users are currently logged in"
//  
// UPTIME=$(date ; uptime)
// echo "The uptime is $UPTIME"
--------------------------------------------------------------------
/bir dosyanın içindekileri listeler
cat testdosyasi.txt

/Klasör oluşturma
mkdir "dosyaadı" 

/Dosya silme
rm -rf "Dosya adi"

/Klasör silme
rm -r dosyaadi/

/Klasör taşıma
mv "taşınacak dosya veya klasör" "taşınacağı adres veya klasör adı"
--------------------------------------------------------------------
/zip dosyasını kendi adında bir dosya oluşturup içine çıkartıyor
sh: unix shell interpeter	
sh -c: shell script ile çalıştırma komutu
//$0 ile _ aynı işi yapıyor

/find da nokta (.)verirsen mevcut bulunduğu konumda arar, (./konum) verirsen konumun alt klasörlerine de bakar.
find . -name '*.zip' -exec sh -c 'unzip -d "${1%.*}" "$1"' _ {} \;  // dosya ismi ile unzip yapıyor
find . -name '*.zip' -execdir unzip '{}' ';' 						// içindeki dışarıya çıkartıyor

	/dosya bulucu ".zip", öne eki ne olursa olsun son kısmı .zip ile biten dosyaları bulur
	find . -name '*.zip'
	
	/shell ile "-c" den sonraki komutu çalıştır
	-exec sh -c
	
	
	
/unzip için paket	
sudo apt install unzip


/manuel unzip etme
unzip 1220734_Sinav_Listeleri.zip -d /home/ubuntu/Sinav_Dosyasi
--------------------------------------------------------------------
/klasör silme
rm -rf Sinav_Dosyasi
--------------------------------------------------------------------
/who: kullanıcı bilgileri ve zamanı gösteriyor
kaan tty3 saat

/awk: Dosya yada bir fonksiyonun bilgilerini tek tek inceler

	who | awk '{print $1}'  /// böyle bir komutta who'nun verdiği bilgilerden 1. olanı veriyor. "kaan"
	who | awk '{print $2}'  /// böyle bir komutta who'nun verdiği bilgilerden 2. olanı veriyor. "tty3"
	
--------------------------------------------------------------------

\t ile tab boşluğu bırakabilirsin

df | awk '/\/dev\/loop/ {print $1"\t"$2"\t"$3}'
--------------------------------------------------------------------
/uzunluğu 7 karakterden olan klasörlerin listesi

awk 'length($0) > 7' /etc/shell

--------------------------------------------------------------------
/$NF son sütun veya field /bin/fish içeriyorsa, son sütunu /bin/fish olanları bütün sütunları ile listele

ps -ef | awk '{ if($NF == "/bin/fish") print $0}'

--------------------------------------------------------------------
# .bashrc dosyasındaki (login olduğund çalışan bir script) "b" ve "c" ile başlayanları listeler
# .bashrc'nin (.)noktası görünmez, gizli olduğunu ifade eder.
# ls-al yapılırsa gizli dosyalar da listelenebilir.

awk '$1 ~ /^[b,c]/ {print $0}' .bashrc
--------------------------------------------------------------------
/Numara olanların 2. sütununu listeler

ls | awk -F'[^0-9]*' '$0=$2'
--------------------------------------------------------------------
/son kelimesi 17 harfli olanları listeliyor

ls | awk 'length($NF) > 17'
--------------------------------------------------------------------
/Bulunduğu klasörde girilen metini içeren herşeyi listeler

grep metin ./*

#metin içeren dosyaları listeler
ls | grep metin
--------------------------------------------------------------------

/bu ikisi de aynı işi yapıyor ama
/2. kısım daha iyi çünkü sadece grep kullanıyor
	cat ~/.bashrc | grep metin
	grep metin ~/.bashrc
	
--------------------------------------------------------------------

VAR=$(find . -name '*.zip')
DIR="$(dirname "${VAR}")" ; FILE="$(basename "${VAR}")" 
echo "[${DIR}] [${FILE}]"


basename -s .zip 1220734_Sinav_Listeleri.zip 

--------------------------------------------------------------------
#!/bin/bash

####################################################
#STEP 1: SECURE THE KEYS

#VAR'da yapılan find işleminde elde edilen dosya adı VAR değişkenine kaydediliyor
VAR=$(find . -name '*.zip') 
#DIR ve FILE'da yapılan işlemlde VAR değişkeni kullanarak dosyanın konumu ve adı alınıyor
#Konum ve Adı'nı string olarak DIR ve FILE değişkenlerinin içine kaydediyor
DIR="$(dirname "${VAR}")" ; FILE="$(basename "${VAR}")" 
#Bu kısımda dosya yolu ve dosya adı gösteriliyor sadece
echo "[${DIR}] [${FILE}]"
#FILE dosya adını "-s"=="SUFFIX" ile ön ekini alıyor ama bunu .zip  uzantılı dosyalara yapıyor sadece
NewDIR=$(basename -s .zip ${FILE})
#
unzip ${DIR}/${FILE} -d ${DIR}/${NewDIR}

## find ile dosya buldugunda 1% ile  .* dan onceki ismini $1
## sayesinde yeni bir klasore atiyor
## $0 ile _ ayni islevi goruyor
#find ./Downloads -name '*.zip' -exec sh -c 'unzip -d "${1%.*}" "$1"' $0 {} \; 

echo "[${DIR}] [${FILE}] [${DIR}/${NewDIR}]"
#Cikartilan klasor/dosyalari gosterir
ls ${DIR}/${NewDIR} 


for x in 1 2 3;
do
		find ${DIR}/${NewDIR} -r | rename -v 's/ /_/'
done	





####################################################
#STEP 2: ASCEND FROM DARKNESS

#Sınav Yapıcı Kontrol Listesi
SYKL=`ls ${DIR}/${NewDIR}/'Aday Kontrol Listeleri'`
for filelist in $SYKL
do
    mv 
    echo "${substring}/${qty}";
done



ls ${DIR}/${NewDIR}/'Performans Sinavi Aday Listesi'
ls ${DIR}/${NewDIR}/'P.Sinav Aday Soru Dosyalari'
ls ${DIR}/${NewDIR}/'Sinav Dosyasi Evraklari'
ls ${DIR}/${NewDIR}/'Teorik Sinav Aday Listesi'




####################################################
#STEP 3: RAIN FIRE

####################################################
#STEP 4: UNLEASH THE HORDE

####################################################
#STEP 5: SKEWER THE WINGED BEAST
