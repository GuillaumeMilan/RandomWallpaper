#!/bin/bash 

echo "Nous allons changer aléatoirement votre fond d'écran"
cd ~
rm -rf .RandomWallPaperByGuignomes
mkdir .RandomWallPaperByGuignomes
cd .RandomWallPaperByGuignomes
wget -q http://www.palabrasaleatorias.com/mots-aleatoires.php?fs=1&fs2=1&Submit=Nouveau+mot 
sleep 3
var=$(awk '/<div style="font-size:3em; color:#6200C5;">/{getline; print}' *)
mot=$(echo $var | sed -n "s/<\/div>//p")
rm *
adressegoogle="https://www.google.fr/search?q=wallpaper+$mot&safe=off&biw=1920&bih=880&tbs=isz:ex,iszw:1920,iszh:1080&tbm=isch&source=lnt"
firefox $adressegoogle -save-to-folder ./somewhere
wget -q -p -k --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0" --referer="www.google.fr" -e robots=off  $adressegoogle 
cd 
mv .RandomWallPaperByGuignomes/www.google.fr/search* .RandomWallPaperByGuignomes/www.google.fr/index.html
cd .RandomWallPaperByGuignomes/www.google.fr/
firefox index.html

#echo $adressegoogle
#imagelink=$(wget --user-agent 'Mozilla/5.0' -qO - |  "$adressegoogle")
#echo "APRES CA C'EST L'ADRESSE V2"
#wget -qO google_image $imagelink
#ligne=$(grep "<a class=\"rg_l\" href=\"" *)
#ligne=$(sed -n "s/href=\"*\"/*/g")
#echo $ligne
#http://askubuntu.com/questions/66914/how-to-change-desktop-background-from-command-line-in-unity
#cat * | sed href=\"[^"]\"/[^"]/g'
#sed 's/<a class=\"rg_l\" href=\"[^"]\"/[^"]/g'
#http://stackoverflow.com/questions/27909521/download-images-from-google-with-command-line
exit 0
