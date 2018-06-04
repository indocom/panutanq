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
Freshman.create(name: 'Admission', pagename: 'admission', description: 'Secara singkat, cara masuk ke
  NUS:

Melalui jalur tes:
Memasuki NUS melalui jalur tes mempunyai 4 tahapan penting yaitu mendaftarkan
diri melalui website NUS, mengikuti tes tertulis (UEE atau University
  Entrance Exam), menerima tawaran masuk NUS, registrasi akhir sebelum masuk
  NUS.

Mendaftarkan diri lewat website NUS:
Pertama, kamu harus daftar untuk proses seleksi dan proses tes tertulis.
Pendaftaran tersebut biasanya buka dari bulan Oktober dan tutup di bulan
Desember. Untuk daftar, ada beberapa dokumen penting yang harus di kumpulkan.
Checklist dari dokumen yang perlu kamu kumpulkan bisa dilihat di sini.

Note:
“Copy of National Level High School Examination result slip” di check list
tersebut hanya berlaku untuk yang sudah lulus saja.
“Copy of School Examination transcript/result slip” di check list berarti rapor
sekolah dari kelas 10 sampai kelas 11 semester 2 (atau kelas 11 semester 1
  untuk yang akselerasi).
“Copy of additional score report” di check list termasuk nilai TOEFL, IELTS,
SAT, dan lain lain yang bisa menjadi nilai tambahan, tapi tidak harus jika
tidak ada.

Mengikuti UEE (tes tertulis):
Setelah pendaftaran tutup, biasanya hasil seleksi tahap pertama akan diumumkan
sekitar dua minggu sebelum tes tertulis. Tes tertulis tersebut biasanya
diadakan di sekitar bulan Januari - Februari. Jika kamu lolos seleksi tahap
pertama, selamat! Tes tertulis tersebut biasanya akan diadakan di beberapa
kota (Jakarta dan Medan untuk penerimaan tahun 2018). Sebelum mengikuti tes
tertulis pastikan sudah bayar biaya tes tersebut yang biasanya dicantumkan di
email yang diterima dari NUS. Semua informasi mengenai tes tertulis termasuk
bentuk soal, lama pengerjaan dan bahan pelajaran bisa dilihat di sini.

Note:
Hanya pelajaran matematika dan inggris yang diwajibkan untuk ikut.
Pelajaran sisanya adalah pelajaran pilihan yang bergantung pada pilihan
jurusan tersebut. Secara lebih lengkapnya untuk semua jurusan bisa dilihat
di sini.
Pelajaran yang diuji akan berdasarkan kurikulum Singapur, jadi sebaiknya
persiapkan diri dan cari bahan pelajaran tambahan dari internet.
Extra note, dari pengalaman sebelumnya tempat ujian biasanya dingin, jadi
disarankan bawa jaket supaya tidak terganggu konsentrasinya.

Melalui jalur non-tes:
Jalur non-tes diperuntukkan untuk anak SMA yang sudah mengambil IB / A-Level
atau sudah memenangkan medali di olimpiade internasional.

Menerima tawaran masuk NUS:

Setelah mengikuti tes tertulis atau mengupload dokumen bagi yang mengikuti
jalur non tes, kalian yang diterima masuk NUS akan dikirimkan email berisi
surat penerimaan. Email tersebut biasanya dikirimkan beberapa minggu sampai
beberapa bulan setelah tes tertulis (tidak tentu). Setelah menerima email
tersebut, kamu bisa menerima tawaran tersebut di link yang akan dikirim di
email tersebut. Selamat! Dari yang diterima, beberapa akan mendapat email lagi
yang menyatakan bahwa akan di interview untuk beasiswa. Kamu tinggal ikuti
perintah di email mengenai tempat dan waktu interview tersebut diselenggarakan.
(biasanya akan diadakan di Indonesia)

Hal hal yang perlu diperhatikan sebelum masuk NUS:

Setelah menerima tawaran masuk NUS, cek secara berkala di website NUS dan
emailmu mengenai prosedur yang harus diikuti. Biasanya NUS akan mengirim link
untuk kamu mengupload pasfoto untuk kartu pelajarmu. Selain itu, cari juga
macam macam tempat tinggal di NUS dan pastikan kamu sudah mendaftar sebelum
pendaftaran tutup. Cek juga bermacam-macam orientasi dari fakultas, jurusan,
tempat tinggal, serta dari PINUS supaya tidak tertinggal acara-acara seru dan
kesempatan untuk bertemu teman-teman baru.')

Freshman.create(name: 'Items to bring', pagename: 'itemstobring',description: 'Barang-barang yang perlu
  dibawa ke Singapura:

Barang-barang terkait administrasi masuk ke NUS (Acceptance Letter, Rapor,
  Sertifikat dan dokumen asli yang disertakan pada saat pendaftaran ke NUS,
  pas foto berbagai ukuran)
Uang tunai secukupnya (sekitar $1500-$2000 untuk pengeluaran tak terduga
  ketika baru sampai di Singapura dan sebelum membuka rekening bank)
Pakaian secukupnya. Cuaca di Singapura sama dengan cuaca di Indonesia, jadi
tidak perlu membeli pakaian khusus sebelum berangkat ke Singapura.
Sprei tempat tidur. Tempat tinggal di NUS tidak menyediakan sprei, bantal,
dan guling.
Obat-obatan pribadi
Makanan khas Indonesia (jika diperlukan, namun juga banyak tersedia di
  Singapura dengan harga yang sedikit lebih mahal)
Laptop. Jika ingin membeli laptop di Singapura, pada minggu awal semester
biasanya terdapat Laptop & Notebook fair di Central Library, NUS yang
menawarkan laptop dengan harga diskon.
Kalkulator (jenis yang bisa dipakai untuk ujian bisa dicek di website NUS,
  tergantung jurusan masing-masing)
Adaptor. Stop kontak di Singapura berbeda dengan di Indonesia. Singapura
memakai stop kontak dengan 3 pin sehingga membutuhkan adaptor.

Barang-barang yang tidak perlu dibawa ke Singapura:

Perlengkapan makan dan memasak, dan perlengkapan kamar lainnya. Untuk
membeli perlengkapan sehari-hari, di Mall VivoCity (sekitar 20 menit naik MRT
  Circle Line dari Kent Ridge) ada toko serba ada bernama Daiso. Daiso
  menyediakan berbagai perlengkapan seperti sapu, alat pel, piring, gelas,
  peralatan memasak, dll. Dengan harga $2 per barang.
Perabotan kamar (bantal, guling, container, lemari, rak). Perabotan kamar
bisa dibeli di supermarket Giant yang cukup besar di Mall VivoCity. Selain itu,
 perabotan kamar juga bisa dibeli di IKEA (daerah Alexandra), sekitar 20 menit
 naik bus no. 33 dari Kent Ridge Terminal.
Perlengkapan mandi (sabun, shampoo, pasta gigi, sikat gigi, dll). Di dalam
kawasan NUS terdapat beberapa minimarket yakni Nanyang Market (PGP), 7-Eleven
(Yusof Ishak House), Cheers dan FairPrice Express (UTown), dan supermarket
FairPrice (di gedung NUH lantai 2).
Makanan dalam jumlah banyak. Di setiap fakultas di NUS terdapat kantin yang
menjual berbagai makanan dengan harga yang relatif lebih murah (sekitar $2 -
  $4 untuk satu porsi makanan) apabila dibandingkan dengan membeli makanan
  di mall atau di luar kampus. Untuk teman-teman yang beragama Muslim,
  tersedia banyak outlet makanan Halal di setiap kantin di NUS.
Untuk makanan khas Indonesia, terdapat supermarket barang-barang Indonesia
yakni Waroeng Indo dan Indostop yang berada di mall Lucky Plaza. Kedua toko
tersebut menjual berbagai produk Indonesia seperti Indomie, Boncabe, dan
berbagai makanan lainnya dengan harga yang sedikit lebih mahal dibandingkan
di Indonesia.')
