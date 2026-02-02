USE kutuphane_db;
SELECT k.kitap_adi, kk.kopya_id, kk.durum
FROM kitaplar k
JOIN kitap_kopyalari kk ON k.kitap_id = kk.kitap_id;

SELECT ku.ad, ku.soyad, kt.tur_adi
FROM kullanicilar ku
JOIN kullanici_turleri kt ON ku.kullanici_tur_id = kt.kullanici_tur_id;

