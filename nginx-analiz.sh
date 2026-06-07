#!/bin/bash

LOG_FILE=$1

if [ -z "$LOG_FILE" ]; then
	echo "Hata: Lütfen analiz edilicek log dosyasını belirtin!"
	echo "Kullanım: ./nginx-analiz.sh <log-file-path>"
	exit 1
fi


if [ ! -f "$LOG_FILE" ]; then
	echo "Hata: '$LOG_FILE' adında bir dosya bulunamadı!"
	exit 1
fi


echo "=== NGINX ACCESS LOG ANALİZ RAPORU ==="
echo "Dosya: $LOG_FILE"
echo "--------------------------------------"
echo ""

echo "Top 5 IP adresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort |uniq -c | sort -rn | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo ""

echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo ""

echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo ""

echo "Top 5 user agents:"
awk -F'\"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -n 5 | awk -F' ' '{print substr($0, index($0,$2)) " - " $1 " requests"}'
echo ""
