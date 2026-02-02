CREATE TABLE kullanici_turleri (
    kullanici_tur_id INT PRIMARY KEY AUTO_INCREMENT,
    tur_adi VARCHAR(50) NOT NULL
);

CREATE TABLE kullanicilar (
    kullanici_id INT PRIMARY KEY AUTO_INCREMENT,
    kullanici_tur_id INT,
    ad VARCHAR(100),
    soyad VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    aktif BOOLEAN DEFAULT TRUE,
    kayit_tarihi DATE,
    FOREIGN KEY (kullanici_tur_id) REFERENCES kullanici_turleri(kullanici_tur_id)
);

CREATE TABLE kategoriler (
    kategori_id INT PRIMARY KEY AUTO_INCREMENT,
    kategori_adi VARCHAR(100)
);

CREATE TABLE kitaplar (
    kitap_id INT PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(20) UNIQUE,
    kitap_adi VARCHAR(200),
    basim_yili INT,
    kategori_id INT,
    FOREIGN KEY (kategori_id) REFERENCES kategoriler(kategori_id)
);

CREATE TABLE yazarlar (
    yazar_id INT PRIMARY KEY AUTO_INCREMENT,
    yazar_adi VARCHAR(150)
);

CREATE TABLE kitap_yazar (
    kitap_id INT,
    yazar_id INT,
    PRIMARY KEY (kitap_id, yazar_id),
    FOREIGN KEY (kitap_id) REFERENCES kitaplar(kitap_id),
    FOREIGN KEY (yazar_id) REFERENCES yazarlar(yazar_id)
);

CREATE TABLE kitap_kopyalari (
    kopya_id INT PRIMARY KEY AUTO_INCREMENT,
    kitap_id INT,
    raf_kodu VARCHAR(50),
    durum VARCHAR(20) DEFAULT 'musait',
    FOREIGN KEY (kitap_id) REFERENCES kitaplar(kitap_id)
);

CREATE TABLE oduncler (
    odunc_id INT PRIMARY KEY AUTO_INCREMENT,
    kullanici_id INT,
    kopya_id INT,
    odunc_tarihi DATE,
    teslim_tarihi DATE,
    iade_tarihi DATE,
    FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(kullanici_id),
    FOREIGN KEY (kopya_id) REFERENCES kitap_kopyalari(kopya_id)
);

CREATE TABLE cezalar (
    ceza_id INT PRIMARY KEY AUTO_INCREMENT,
    odunc_id INT,
    ceza_tutari DECIMAL(6,2),
    odendi BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (odunc_id) REFERENCES oduncler(odunc_id)
);

CREATE TABLE rezervasyonlar (
    rezervasyon_id INT PRIMARY KEY AUTO_INCREMENT,
    kullanici_id INT,
    kitap_id INT,
    rezervasyon_tarihi DATE,
    durum VARCHAR(20),
    FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(kullanici_id),
    FOREIGN KEY (kitap_id) REFERENCES kitaplar(kitap_id)
);

