#!/bin/bash

bar ()
{
BAR='*0*1*0*1*0*1*0*1*0*1*0*1 \e[00;34m !'    
                         
for i in {0..49}; do
    echo -ne "\r${BAR:0:$i}" 
    sleep 0.03
done
}

bar
        
echo " "

echo " "
echo -e "\e[00;34m+\e[00;31m-\e[00;34m+\e[00;31m-\e[00;34m+\e[00;31m-\e[00;34m+\e[00;31m-\e[00;34m+\e[00;31m-\e[00;34m+\e[00;31m-"
echo -e "========\e[01;32mINTEL\e[01;34mTAG============"
echo -e "\e[00;34m+\e[00;31m-\e[00;34m+\e[00;31m-\e[00;34m+\e[00;31m-\e[00;34m+\e[00;31m-\e[00;34m+\e[00;31m-\e[00;34m+\e[00;31m-"
echo  " "
echo -e "\e[01;33mCodename: \e[01;34mTweet of the blue swan\e[00m"
echo " "
        echo -e "\e[01;34mSearch an hashtag of interest and discover associated users and hashtags\e[00m"
        echo -e "Very simple \e[01;34mOSINT\e[00m tool for test purpose"
        
        echo -e "Coded by \e[01;32mCignoraptor \e[00;33m---\e[00;34m root4sec6per3@openmailbox.org\e[00m"
        echo " "
        bar
        
        echo " "
        
        echo " "
        echo -e "\e[00;34mInsert Hashtag of interest: (Exemple: \e[00;31m#AlfaRomeo\e[00m)"
        read hastg
        
        echo -e "\e[01;31m OSINT SESSION FOR \e[01;01;44m$hastg\e[00m"
        echo " "
        echo $hastg > pert.txt
        sed 's/#//' pert.txt
        for word in `cat pert.txt`; do

echo %23${word} >> pert2.txt
done
        
hoi=$(cat pert2.txt)
      
links2 -dump https://twitter.com/search?q=$hoi > cor.txt

echo " "
echo -e "\e[01;32mHashtags: \e[00m"
echo " "
grep -Eio "#[a-zA-Z0-9./:-]+" cor.txt > corhash.txt
cat corhash.txt
echo -e "\e[01;34mUSERS: \e[00m"
echo " "
grep -Eio "@[a-zA-Z0-9./:-]+" cor.txt > cornomi.txt
cat cornomi.txt
     rm cornomi.txt && rm corhash.txt && rm cor.txt
     rm pert.txt && rm pert2.txt  
     
     echo " "
     echo "Insert position/City: (Exemple Venezia)"
     read pos
     
     links2 -dump https://twitter.com/search?q=%23m5stelle%20near%3A%22$pos%22 > posiz.txt
    
    echo " "
echo -e "\e[01;32mAssociated $hastg Hashtags near $pos: \e[00m"
echo " " 
     grep -Eio "#[a-zA-Z0-9./:-]+" posiz.txt > phash.txt
cat phash.txt
     
    echo " "
    echo -e "Associated $hastg \e[01;34mUSERS near $pos: \e[00m"
echo " "
grep -Eio "@[a-zA-Z0-9./:-]+" posiz.txt > pnomi.txt
cat pnomi.txt 
     
     rm posiz.txt && rm phash.txt
     rm pnomi.txt
     echo " "
     echo -e "\e[01;34mFor advanced OSINT search/software please send email to \e[01;32m> \e[00;36mcignointel@gmail.com\e[00m"
     echo " "
