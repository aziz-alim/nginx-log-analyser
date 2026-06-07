# Nginx Log Analyser CLI Tool 

Bu araç, binlerce satırlık Nginx access.log dosyalarını saniyeler içinde tarayarak en yoğun trafiğe neden olan IP adreslerini, en çok istenen yolları, HTTP durum kodlarını ve tarayıcı (User Agent) dağılımlarını analiz eden bir kabuk betiğidir.

##  Örnek Rapor Çıktısı

    === NGINX ACCESS LOG ANALİZ RAPORU ===
    Top 5 IP adresses with the most requests:
    178.128.94.113 - 1087 requests
    142.93.136.176 - 1087 requests

    Top 5 most requested paths:
    /v1-health - 4560 requests
    / - 270 requests

    Top 5 response status codes:
    200 - 5740 requests
    404 - 937 requests

##  Kullanım

Betiğe çalıştırma yetkisi verdikten sonra log dosyasının yolunu parametre olarak geçmeniz yeterlidir:

    chmod +x nginx-analiz.sh
    ./nginx-analiz.sh access.log

##  Kazanımlar

Bu proje ile Linux boru hattı (pipeline) mimarisi, gelişmiş metin filtreleme araçları (awk, sort, uniq, head) ve log analitiği pratikleri pekiştirilmiştir.

[https://github.com/aziz-mevlana/nginx-log-analyser](https://roadmap.sh/projects/nginx-log-analyser)
