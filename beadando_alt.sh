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


while getopts :asdfg opt;do
	case $opt in
		a)
			nano ...;;
		s)
			nano ...;;
		d)
			fajlLetoltes;;
		f)
			randomPwdGen;;
		g)
			valami;;
		*)
			echo "Ilyen nem létezik"
		exit ;;
	esac
done
