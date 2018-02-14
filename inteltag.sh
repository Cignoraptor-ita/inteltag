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
echo -e "\e[01;33mCodename: \e[01;34mTheswantweet\e[00m"
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
      
links2 -http.fake-user-agent "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/534.16+ (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4" -dump https://twitter.com/search?q=$hoi > cor.txt

echo " "
echo -e "\e[01;32mHashtags: \e[00m"
echo " "
grep -Eio "#[a-z]+" cor.txt > corhash.txt
cat corhash.txt
echo -e "\e[01;34mUSERS: \e[00m"
echo " "
grep -Eio "@[a-z]+" cor.txt > cornomi.txt
cat cornomi.txt
     rm cornomi.txt && rm corhash.txt && rm cor.txt
     rm pert.txt && rm pert2.txt  
