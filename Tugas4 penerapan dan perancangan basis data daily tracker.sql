CREATE DATABASE tracker_daily;
USE tracker_daily;
CREATE TABLE pengguna (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    kata_sandi VARCHAR(100) NOT NULL,
    usia INT,
    lokasi VARCHAR(100),
    pekerjaan VARCHAR(100),
    hobby VARCHAR(200)
);

CREATE TABLE anak (
    child_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    nama_anak VARCHAR(100) NOT NULL,
    usia INT,
    FOREIGN KEY (user_id) REFERENCES pengguna(user_id) ON DELETE CASCADE
);

CREATE TABLE aktivitas (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    child_id INT DEFAULT NULL,
    jenis_aktivitas VARCHAR(100) NOT NULL,
    durasi INT,
    tanggal DATE NOT NULL,
    user_or_child ENUM('user', 'child') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES pengguna(user_id) ON DELETE CASCADE,
    FOREIGN KEY (child_id) REFERENCES anak(child_id) ON DELETE SET NULL
);

CREATE TABLE jadwal_anak (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    child_id INT NOT NULL,
    kegiatan_anak VARCHAR(100) NOT NULL,
    waktu_mulai TIME NOT NULL,
    waktu_selesai TIME NOT NULL,
    tanggal DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES pengguna(user_id) ON DELETE CASCADE,
    FOREIGN KEY (child_id) REFERENCES anak(child_id) ON DELETE CASCADE
);
INSERT INTO pengguna (nama, email, kata_sandi, usia, lokasi, pekerjaan, hobby)
VALUES ('Maya', 'maya@email.com', 'maya123', 37, 'Jakarta Pusat, Indonesia', 'Direktur Pemasaran di sebuah startup teknologi', 'Lari maraton, menghadiri pameran seni, dan bermain piano');
select * from pengguna ;
INSERT INTO anak (user_id, nama_anak, usia) 
VALUES 
(1, 'Lily', 6), 
(1, 'Leo', 4);

INSERT INTO aktivitas (user_id, child_id, jenis_aktivitas, durasi, tanggal, user_or_child)
VALUES 
(1, NULL, 'Bekerja dari rumah', 480, '2024-09-26', 'user'),
(1, 1, 'Les Piano', 60, '2024-09-26', 'child'),               
(1, NULL, 'Bersepeda di taman', 120, '2024-09-27', 'user'),   
(1, 2, 'Bermain sepak bola', 90, '2024-09-27', 'child'),            
(1, NULL, 'Meeting dengan klien', 150, '2024-09-28', 'user'),   
(1, 1, 'Menggambar', 30, '2024-09-28', 'child'),                
(1, NULL, 'Baca buku', 45, '2024-09-29', 'user');               
select * from aktivitas;

INSERT INTO jadwal_anak (user_id, child_id, kegiatan_anak, waktu_mulai, waktu_selesai, tanggal)
VALUES 
(1, 1, 'Les Piano', '15:00:00', '16:00:00', '2024-09-26'),  
(1, 2, 'Kelas Senam', '10:00:00', '11:00:00', '2024-09-27'), 
(1, 1, 'Menggambar', '09:00:00', '10:00:00', '2024-09-28'),   
(1, 2, 'Bermain di Taman', '14:00:00', '15:30:00', '2024-09-29'),  
(1, 1, 'Kunjungan ke Kebun Binatang', '08:30:00', '12:00:00', '2024-09-30'), 
(1, 2, 'Les Musik', '16:00:00', '17:00:00', '2024-09-30'), 
(1, 1, 'Bersepeda', '08:00:00', '09:00:00', '2024-10-01');  
select * from jadwal_anak;

-- METODE CRUD

-- CREATE
INSERT INTO pengguna (nama, email, kata_sandi, usia, lokasi, pekerjaan, hobby)
VALUES ('Maya', 'maya@email.com', 'maya123', 37, 'Jakarta Pusat, Indonesia', 'Direktur Pemasaran di sebuah startup teknologi', 'Lari maraton, menghadiri pameran seni, dan bermain piano');

-- READ
SELECT * FROM jadwal_anak;

-- UPDATE
UPDATE aktivitas
SET kegiatan_anak ='membaca buku'
WHERE schedule_id;

-- DELETE
DELETE FROM aktivitas
WHERE schedule_id = 1;

drop database tracker_daily;