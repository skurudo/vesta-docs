#!/bin/bash

#delete file if exist
rm docs.txt
#find all files in VestaCP directory, get all description from command files and add in text file
for file in $(find /usr/local/vesta/bin/$1 -type f | sort); do echo '';
        echo $file >> docs.txt;
        sed -e '/./{H;$!d;}' -e 'x;/info/!d;/option/!d;/The\|This/!d' $file >> docs.txt;
        echo -e "\n" >> docs.txt;
done

#delete /bin/bash lines
sed -i '/bash/d' docs.txt;
