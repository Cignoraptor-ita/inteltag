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
echo -e "\e[01;33mCodename: \e[01;34mSwan in silence\e[00m"
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
        cat pert.txt | sed 's/#//' > perth.txt
        for word in `cat perth.txt`; do

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
     rm corhash.txt && rm cor.txt
     rm pert.txt && rm pert2.txt  
rm perth.txt     

     echo " "
     
     echo -e "\e[01;33mTop user: \e[00m"
     echo " "
     cat cornomi.txt | awk '{h[$1]++}END{for (i in h){print h[i]" "i}}'|sort -nr | cat -n | head -n 1 > td.txt

     grep -Eio "@[a-zA-Z0-9./:-]+" td.txt > tuser0.txt
     #sed 's/1//'
     rm td.txt

     tus=$(cat tuser0.txt)
     echo "$tus" > tuser.txt
     rm tuser0.txt
     ftus=$(cat tuser.txt)
     cat tuser.txt
     
     echo " "
     echo -e "\e[00;31mTop hashtag of $ftus: \e[00m"
     
     echo " "
     links2 -dump https://twitter.com/search?q=$ftus > userchastg.txt
     grep -Eio "#[a-zA-Z0-9./:-]+" userchastg.txt > uhash.txt
     rm userchastg.txt
     cat uhash.txt | awk '{h[$1]++}END{for (i in h){print h[i]" "i}}'|sort -nr | cat -n | head -n 1 > tha.txt
     grep -Eio "#[a-zA-Z0-9./:-]+" tha.txt > thash.txt
     rm tha.txt
     utha=$(cat thash.txt)
     cat thash.txt
     
     echo " "
     echo -e "\e[00;33mUsers who has commented this hashtag ($utha) in the last \e[01;31m24H\e[00m "
     
     sleep 1
     
     echo " "
     
     date -d '1 day ago' '+%Y-%m-%d' > ptdate.txt
     giorno=$(cat ptdate.txt)
     
     links2 -dump https://twitter.com/search?q=%23$utha%20since%3A$giorno > 24tw.txt
     grep -Eio "@[a-zA-Z0-9./:-]+" 24tw.txt > 24user.txt
     rm 24tw.txt
     cat 24user.txt
     
     rm cornomi.txt && rm 24user.txt && rm ptdate.txt
     rm thash.txt && rm uhash.txt && rm tuser.txt
     echo " "
          echo -e "\e[01;33mRapid hostility analysis against the target: \e[00m"
echo -e "(\e[00;33mJust Italian and English phrases\e[00m)"
sleep 2

echo $hastg > pert.txt
cat pert.txt | sed 's/#//' > perth.txt
ost=$(cat perth.txt)



links2 -dump mobile.twitter.com/search?l=it"&"q=$ost+odio+OR+schifo+OR+vaffanculo+OR+vergogna > hos1.txt
sleep 0.7
links2 -http.fake-user-agent "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/603.1.23 (KHTML, like Gecko) Version/10.0 Mobile/14E5239e Safari/602.1" -dump mobile.twitter.com/search?l=en"&"q=$ost+hate+OR+shit+OR+shame+OR+fuck >> hos1.txt
sleep 0.3
links2 -dump mobile.twitter.com/search?l=it"&"q=$ost+odio+OR+schifo+OR+OR+vaffanculo+OR+vergogna >> hos1.txt
sleep 0.4
links2 -http.fake-user-agent "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/603.1.23 (KHTML, like Gecko) Version/10.0 Mobile/14E5239e Safari/602.1" -dump mobile.twitter.com/search?l=en"&"q=$ost+hate+OR+shit+OR+shame+OR+fuck >> hos1.txt

cat hos1.txt | grep -e "schifo" -e "vergogna" -e "vaffanculo" -e "odio" > triste1
cat hos1.txt | grep -e "hate" -e "shame" -e "fuck" -e "shit" > triste2

cat triste1 triste2 > triste
rm pert.txt && rm perth.txt

echo " "
echo -e "\e[00;31m============\e[00m"
echo -e "\e[01;33mNegative phrases against the word:$ost (\e[00;31mVery rapid analysis)\e[00m"
echo -e "\e[00;33m"
cat triste | wc -l 
echo -e "\e[00m"
sleep 1
echo "$userc"
echo " "

rm hos1.txt && rm triste1 && rm triste2
rm triste
echo " "

echo -e "\e[01;34mFor advanced OSINT search/software please send email to \e[01;32m> \e[00;36mcignointel@gmail.com\e[00m"
echo " "
