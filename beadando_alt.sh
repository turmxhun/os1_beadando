#!/bin/bash
fajlLetoltes()
#Az internetről letölt egy filet amit a google drive-ba töltöttem fel
{
curl -i https://drive.google.com/file/d/1wz-zZP6LRUWdGFqN3-40PXpHGhDm-7sL/view?usp=sharing -o valami.txt
echo "Letöltés sikeres, valami.txt néven találja meg a file-t"
}

randomPwdGen()
#Ellenőrzi, hogy létezik-e randomPwd fájl, ha igen generál bele egy random jelszót, ha nem létrehozza azt
{
if [ -e randomPwd.txt ]
then
    date +%s | sha256sum | base64 >> randomPwd.txt
    echo "A fájl már létezik, új jelszó generálva"
else
    touch randomPwd.txt
    echo "A fájl nem létezett, de most létre lett hozva. A fájlba nem generáltunk jelszót"
fi
}

szures()
#Leszűri a randomPwd nevű fájlban, hogy mely jelszavak nem tartalmaznak 3-as számot
{
if [ -e randomPwd.txt ]
then
    cat randomPwd.txt | grep -v 3
else
    echo "A fájl nem létezik, kérlek elsőnek használd a sudo ./beadando_alt.sh -f parancsot"
    echo "Ezzel létrehozza a fájlt"
fi
}
while getopts :adf opt;do
	case $opt in
		a)
			szures;;
		d)
			fajlLetoltes;;
		f)
			randomPwdGen;;
		*)
			echo "Ilyen nem létezik"
		exit ;;
	esac
done
