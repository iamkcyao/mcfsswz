#!/bin/bash
#this script is used to get tcp and udp connetion status
#tcp status
unixtime=$(date +"%s")
metric=$1
tmp_file=/tmp/spectrum_stats-${unixtime}.txt
curl -s -X GET "https://api.cloudflare.com/client/v4/zones/[CloudflareZoneID]/spectrum/analytics/aggregate/current?appID=$2" -H "X-Auth-Email: [CloudflareAccountMail]" -H "X-Auth-Key: [CloudflareAPIkey]" -H "Content-Type: application/json"|jq ".result[]" > $tmp_file
 
case $metric in
   bytesIngress)
          output=$(awk '/bytesIngress/{print $2}' $tmp_file |tr -d ',')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   bytesEgress)
          output=$(awk '/bytesEgress/{print $2}' $tmp_file |tr -d ',')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   connections)
          output=$(awk '/connections/{print $2}' $tmp_file |tr -d ',' )
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   durationAvg)
          output=$(awk '/durationAvg/{print $2}' $tmp_file |tr -d ',' )
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   appID)
          output=$(awk '/appID/{print $2}' $tmp_file |tr -d '"')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
         *)
          echo -e "\e[033mUsage: sh  $0 [bytesIngress|bytesEgress|connections|durationAvg|appID]\e[0m"
   
esac