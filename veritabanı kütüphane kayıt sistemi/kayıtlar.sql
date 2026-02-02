USE kutuphane_db;
INSERT INTO kullanici_turleri (tur_adi)
VALUES ('Öğrenci'), ('Personel');

INSERT INTO kullanicilar (kullanici_tur_id, ad, soyad, email, kayit_tarihi)
VALUES
(1, 'Ali', 'Yılmaz', 'ali@uni.edu', CURDATE()),
(2, 'Ayşe', 'Demir', 'ayse@uni.edu', CURDATE());

INSERT INTO kategoriler (kategori_adi)
VALUES ('Bilgisayar Mühendisliği');

INSERT INTO yazarlar (yazar_adi)
VALUES ('Robert C. Martin');

INSERT INTO kitaplar (isbn, kitap_adi, basim_yili, kategori_id)
VALUES ('9780132350884', 'Clean Code', 2008, 1);

INSERT INTO kitap_yazar (kitap_id, yazar_id)
VALUES (1, 1);

INSERT INTO kitap_kopyalari (kitap_id, raf_kodu)
VALUES (1, 'A-12'), (1, 'A-13');

