# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
#                          { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(fullname: 'admin',
                    email: 'website.pinus@gmail.com', password: 'admin123')

admin.add_role :admin

User.create(fullname: 'abcd', email: 'abcd@gmail.com', password: 'user123')
Freshman.create(name: 'Admission', pagename: 'admission',
                description: '<p><b>Secara singkat, cara masuk ke NUS:</b></p>

<p style="margin-left: 40px;"><b>1. Melalui jalur tes:</b></p>

<p style="margin-left: 40px;">Memasuki NUS melalui jalur tes mempunyai 4 tahapan
 penting yaitu mendaftarkan diri melalui website NUS, mengikuti tes tertulis
 (UEE atau University Entrance Exam), menerima tawaran masuk NUS, registrasi
 akhir sebelum masuk NUS.</p>

<p style="margin-left: 80px;"><u>Mendaftarkan diri lewat website NUS:</u></p>

<p style="margin-left: 80px;">Pertama, kamu harus daftar untuk proses seleksi
dan proses tes tertulis. Pendaftaran tersebut biasanya buka dari bulan Oktober
dan tutup di bulan Desember. Untuk daftar, ada beberapa dokumen penting yang
harus di kumpulkan. Checklist dari dokumen yang perlu kamu kumpulkan bisa
dilihat di
<a href="http://www.nus.edu.sg/oam/docs/CAT%20D%20Application%20Checklist.pdf"
target="_blank">sini</a>.</p>

<p style="margin-left: 80px;">Note:</p>

<ul>
	<li style="margin-left: 80px;">&quot;Copy of National Level High School
  Examination result slip&rdquo; di check list tersebut hanya berlaku untuk
  yang sudah lulus saja.</li>
	<li style="margin-left: 80px;">&quot;Copy of School Examination
  transcript/result slip&quot;&nbsp;di check list berarti rapor sekolah
  <strong><u>dari kelas 10 sampai kelas 11</u></strong> semester 2
  (atau kelas 11 semester 1 untuk yang akselerasi).</li>
	<li style="margin-left: 80px;">&quot;Copy of additional score
  report&quot;&nbsp;di check list termasuk nilai TOEFL, IELTS, SAT, dan lain
  lain yang bisa menjadi nilai tambahan, <u><strong>tapi tidak
  harus</strong></u> jika tidak ada.</li>
</ul>

<p style="margin-left: 80px;"><u>Mengikuti UEE (tes tertulis):</u></p>

<p style="margin-left: 80px;">Setelah pendaftaran tutup, biasanya hasil seleksi
 tahap pertama akan diumumkan sekitar dua minggu sebelum tes tertulis. Tes
 tertulis tersebut biasanya diadakan di sekitar bulan Januari - Februari.
 Jika kamu lolos seleksi tahap pertama, selamat! Tes tertulis tersebut
 biasanya akan diadakan di beberapa kota (Jakarta dan Medan untuk penerimaan
    tahun 2018). Sebelum mengikuti tes tertulis pastikan sudah bayar biaya
    tes tersebut yang biasanya dicantumkan di email yang diterima dari NUS.
    Semua informasi mengenai tes tertulis termasuk bentuk soal, lama
    pengerjaan dan bahan pelajaran bisa dilihat di
    <a href="http://www.nus.edu.sg/admissions/undergrad/uee/index.html"
    target="_blank">sini</a>.</p>

<p style="margin-left: 80px;">Note:</p>

<ul>
	<li style="margin-left: 80px;">Hanya pelajaran matematika dan inggris yang
  diwajibkan untuk ikut. Pelajaran sisanya adalah pelajaran pilihan yang
  bergantung pada pilihan jurusan tersebut. Secara lebih lengkapnya untuk
  semua jurusan bisa dilihat di
<a href="http://www.nus.edu.sg/admissions/undergrad/uee/index.html#Requirements"
 target="_blank">sini.</a></li>
	<li style="margin-left: 80px;">Pelajaran yang diuji akan berdasarkan
  kurikulum Singapur, jadi sebaiknya persiapkan diri dan cari bahan pelajaran
  tambahan dari internet.</li>
	<li style="margin-left: 80px;">Extra note, dari pengalaman sebelumnya tempat
  ujian biasanya dingin, jadi disarankan bawa jaket supaya tidak terganggu
  konsentrasinya.</li>
</ul>

<p style="margin-left: 40px;"><b>2. Melalui jalur non-tes:</b></p>

<p style="margin-left: 40px;">Jalur non-tes diperuntukkan untuk anak SMA yang
sudah mengambil IB / A-Level atau sudah memenangkan medali di olimpiade
internasional.<b> </b></p>

<p><b>Menerima tawaran masuk NUS:</b></p>

<p>Setelah mengikuti tes tertulis atau mengupload dokumen bagi yang mengikuti
jalur non tes, kalian yang diterima masuk NUS akan dikirimkan email berisi
surat penerimaan. Email tersebut biasanya dikirimkan beberapa minggu sampai
beberapa bulan setelah tes tertulis (tidak tentu). Setelah<b> </b>menerima
email tersebut, kamu bisa menerima tawaran tersebut di link yang akan dikirim
di email tersebut. Selamat! Dari yang diterima, beberapa akan mendapat email
lagi yang menyatakan bahwa akan di interview untuk beasiswa. Kamu tinggal
ikuti perintah di email mengenai tempat dan waktu interview tersebut
diselenggarakan. (biasanya akan diadakan di Indonesia)</p>

<p><b>Hal hal yang perlu diperhatikan sebelum masuk NUS:</b></p>

<p>Setelah menerima<b> </b>tawaran masuk NUS, cek secara berkala di website
NUS dan emailmu mengenai prosedur yang harus diikuti. Biasanya NUS akan
mengirim link untuk kamu mengupload pasfoto untuk kartu pelajarmu. Selain itu,
 cari juga macam macam tempat tinggal di NUS dan pastikan kamu sudah mendaftar
 sebelum pendaftaran tutup. Cek juga bermacam-macam orientasi dari fakultas,
 jurusan, tempat tinggal, serta dari PINUS supaya tidak tertinggal acara-acara
  seru dan kesempatan untuk bertemu teman-teman baru.</p>

<p style="text-align: right;"><em>*Accurate as of 21 Jan 2018</em></p>
')
