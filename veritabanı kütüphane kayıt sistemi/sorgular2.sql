USE kutuphane_db;
DELETE FROM oduncler;
INSERT INTO oduncler (kullanici_id, kopya_id, odunc_tarihi, teslim_tarihi)
VALUES (1, 1, '2026-01-06', '2026-01-20');
UPDATE kitap_kopyalari
SET durum = 'odunc_verildi'
WHERE kopya_id = 1;
SELECT 
    ku.ad,
    ku.soyad,
    k.kitap_adi,
    o.odunc_tarihi,
    o.teslim_tarihi,
    kk.durum
FROM oduncler o
JOIN kullanicilar ku ON o.kullanici_id = ku.kullanici_id
JOIN kitap_kopyalari kk ON o.kopya_id = kk.kopya_id
JOIN kitaplar k ON kk.kitap_id = k.kitap_id;
ALTER TABLE oduncler
ADD CONSTRAINT tek_aktif_odunc
UNIQUE (kopya_id, iade_tarihi);




