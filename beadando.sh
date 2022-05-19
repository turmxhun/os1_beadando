#!bin/bash
fajlLetoltes()
#Az internetről letölt egy filet amit a google drive-ba töltöttem fel
{
curl -i https://drive.google.com/file/d/1wz-zZP6LRUWdGFqN3-40PXpHGhDm-7sL/view?usp=sharing -o valami.txt
echo "Letöltés sikeres, valami.txt néven találja meg a file-t"
}

hanyszorFutott()
#Kiírja egy file-ba hogy ez a funkció hányszor lett lefuttatva
{
	sum=$((tail -1 hanyszor.txt))
	echo $sum

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
			hanyszorFutott;;
		g)
			valami;;
		*)
			echo "Ilyen nem létezik"
		exit ;;
	esac
done

