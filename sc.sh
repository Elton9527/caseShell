#!bin/sh
for dir in $(ls -d */)
do
    cd $dir
    pwd
    filename=cps_sa.log.20201115
    for (( i = 0; i <= 23; i++ )); do
        #statements
        if (( $i<10 ))
        then
                #statements
                realname=${filename}0${i}
        else
                realname=$filename$i
        fi

        #echo $dir$realname
        pwd
        cat $realname | grep 'rechargeSuccess' | awk -F ',' '{print $22}' | awk -F ':' '{print $2}' | awk '{sum+=$1} END {print sum}' >> /storage/log/wanggb/01.txt

    done
    cd ../
done
