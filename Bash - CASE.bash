# CASE kullanımı
https://youtu.be/Fq6gqi9Ubog?t=1599

echo "Welcome, please select your thing:
1 - kaan1
2 - kaan2
3 - kaan3"

read class

case $class in
	1)
		type="Yakisikli"
		hp=80
		attack=5
		;;
	2)
		type="Mild"
		hp=60
		attack=3
		;;
	3)
		type="Nerd"
		hp=30
		attack=1
		;;
esac

# $type, $hp, $attack birimleri artık birer değişken (variable) oldular.
# read class kısmında gireceğin numaraya göre bu değişkenleri oluşturup içine değerlerini atayacaktır.


######################################################################################################
https://youtu.be/nW9M0MQinfg?t=225
# WHILE kullanımı

#!/bin/bash

x=1

# -le = "less or equal to" anlamına geliyor veya <=  
while [[ $x -le 100]]
do
	echo "henlo"
	(( x ++ ))
done



# read -p ile her bir girdi yaptığında (sadece enter da olabilir) x+1 yapıp x=10 olana kadar çalıştırır
while [[ $x -le 10]]
do
	read -p "Henlo $x"
	(( x ++ ))
done


# while komutu şart/lar true olduğu sürece çalışır
# until komutu şart/lar true olana kadar çalışır

#!/bin/bash

# read kısmına coffee yazana kadar sürekli döngü sorusunu sormaya devam eder
# doğru girdi sağlandıktan sonra döngü dışına çıkar.
until [[ $order == "coffee"]]
do
	echo "What would you like to?"
	read order
done
echo "Right choice sir"

######################################################################################################
https://youtu.be/nW9M0MQinfg?t=596
# FOR kullanımı

# in {1..5}; yaptığında "chmod +x dosya.sh" ile executeable yapmazsan x = {1..5} olarak algılıyor
# yani x artık bir string'e eşit oluyor 1'den 5'e kadar olan sayılar değil
for cups in 1 2 3 4 5;
do
	echo "You drank, $cups of coffee"
done



for cups in {1..5};
do
	echo "You drank, $cups of coffee"
done



# websitelerinin ping değerlerini kontrol ediyor
# ping alamıyorsa (/dev/null)'a eşit olduğu için if komutundan çıkıyor
for x in google.com bing.com facebook.com tsabelge.com;
do
	if ping -q -c 2 -W 1 $x > /dev/null; then
		echo "$x is up"
	else
		echo "$x is down"
	fi
done

V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V 

# aynı sorgulama while ile sürekli hale getirilebilir

#!/bin/bash
# Is my internet down?

echo "What do you want to check?"

read target_address

while true
do
	if ping -q -c 2 -W 1 $target > /dev/null; then
		echo "$target_address is up"
		break
		# break sayesinde adres çalışıyor ise if sorgulamasını bozar ve sorgulama sonlanır.
	else
		echo "$target_address is down"
	fi
sleep 2
done

V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V 

#!/bin/bash

echo "Welcome to the Holloywood Tower Hotel"
sleep 1
echo "Going up"
sleep 1

for x in {1..17};
do
	if [[ $x == 13]]; then
		continue
	fi
	echo "Floor $x"
	sleep 1
done



# sehirler.txt dosyasının içini cat ile tek tek okuyup
# weather değişkenine bir link oluşturuyor ve curl ile bu siteye erişiyor
# curl (Client URL) link bağlanabilirliğini kontrol etmek için kullanılıyor
# curl -s ile yükleme miktarı veya hata mesajlarını göstermez, sadece erişim sonucu çıktısını verir
for x in $(cat sehirler.txt);
do
	weather=$(curl -s http://wttr.in/$x?format=3)
	echo "The weather for $weather"
done
