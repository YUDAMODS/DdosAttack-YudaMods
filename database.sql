-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 30 Agu 2021 pada 08.45
-- Versi server: 10.2.40-MariaDB-log-cll-lve
-- Versi PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pacifich_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `balance_logs`
--

CREATE TABLE `balance_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(5) COLLATE utf8_swedish_ci NOT NULL,
  `amount` double NOT NULL,
  `note` text COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment` enum('pulsa','bank','redeem') COLLATE utf8_swedish_ci NOT NULL,
  `type` enum('manual','auto') COLLATE utf8_swedish_ci NOT NULL,
  `method_name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `post_amount` double NOT NULL,
  `amount` double NOT NULL,
  `note` text COLLATE utf8_swedish_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `status` enum('Pending','Canceled','Success') COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `deposit_methods`
--

CREATE TABLE `deposit_methods` (
  `id` int(11) NOT NULL,
  `payment` enum('pulsa','bank') COLLATE utf8_swedish_ci NOT NULL,
  `type` enum('manual','auto') COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `note` text COLLATE utf8_swedish_ci NOT NULL,
  `rate` double NOT NULL,
  `min_amount` double NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `deposit_methods`
--

INSERT INTO `deposit_methods` (`id`, `payment`, `type`, `name`, `note`, `rate`, `min_amount`, `status`) VALUES
(4, 'bank', 'manual', 'DANA', 'TEST', 1, 10000, 1),
(5, 'bank', 'manual', 'GOPAY', 'TEST', 1, 10000, 1),
(6, 'bank', 'manual', 'OVO', 'TEST', 1, 10000, 1),
(7, 'pulsa', 'manual', 'TELKOMSEL', 'TEST', 1, 10000, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `content` text COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `news`
--

INSERT INTO `news` (`id`, `created_at`, `content`) VALUES
(5, '2021-08-28 22:16:40', 'SCRIPT WEBSITE GRATIS AUTO OPER PACIFICPEDIA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `data` text COLLATE utf8_swedish_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `profit` double NOT NULL,
  `start_count` int(11) NOT NULL DEFAULT 0,
  `remains` int(11) NOT NULL DEFAULT 0,
  `status` enum('Pending','Processing','Error','Partial','Success') COLLATE utf8_swedish_ci NOT NULL,
  `provider_id` int(11) NOT NULL,
  `provider_order_id` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `is_api` int(1) NOT NULL DEFAULT 0,
  `is_refund` int(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `api_order_log` text COLLATE utf8_swedish_ci DEFAULT NULL,
  `api_status_log` text COLLATE utf8_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `content` text COLLATE utf8_swedish_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`id`, `content`, `updated_at`) VALUES
(1, 'Kontak admin :\r\nWhatsapp : -\r\nFb : -\r\nInstagram: -\r\nFast Respon :-', '2019-03-20 10:18:14'),
(2, 'Syarat & Ketentuan telah ditetapkan kesepakatan-kesepakatan berikut.\r\n\r\n1. UMUM\r\n\r\nDengan mendaftar dan menggunakan layanan Kami secara otomatis anda menyetujui semua ketentuan yang kami buat. Ketentuan bisa saja berubah sewaktu-waktu tanpa pemberitahuan terlebih dahulu.\r\n\r\n2. LAYANAN\r\n\r\nWeb Kami hanya untuk sarana promosi. Hanya untuk membatu meningkatkan \"penampilan\" Akun sosial media anda.\r\nWeb Kami tidak dapat memastikan pengikut baru anda akan berinteraksi dengan anda.\r\nWeb Kami hanya menjamin anda akan mendapatkan pengikut sesuai yang anda bayar.\r\nWeb Kami tidak menjamin 100% dari akun kami memiliki gambar profil atau bio yang lengkap.\r\nWeb Kami tidak akan mengembalikan saldo jika anda salah memesan. Pastikan anda memasukan data yang benar sebelum memesan layanan.\r\nWeb Kami Anda Tidak Dapat Melakukan Pemesanan Untuk Hal Yang Bersifat Melanggar Hukum.\r\nWeb Kami Tidak Menjamin Semua Layanan Dapat Bertahan Selamanya.\r\n\r\n3. TANGGUNG JAWAB\r\n\r\nWeb Kami sama sekali tidak bertanggung jawab atas kerugian yang mungkin terjadi pada bisnis anda.\r\nWeb Kami tidak bertanggung jawab jika terjadi penanguhan akun,penghapusan foto atau video atau bahkan pembokiran akun sosial media anda.\r\nWeb Kami tidak bertanggung jawab atas penyalahgunaan layanan yang kami sediakan.\r\nWeb Kami di bebaskan dari segala tuntutan hukum.\r\n\r\n4. HARGA\r\n\r\nHarga yang kami tawarkan dapat berubah sewaktu-waktu. Dengan pemberitahuan atau tanpa pemberitahuan.\r\n\r\n5. PEMESANAN\r\n\r\nPesanan yang sudah di input tidak dapat di batalkan.\r\nWaktu pengerjaan yang kami lampirkan di diskripsi hanyalah perkiraan.\r\n\r\n6. SALDO\r\n\r\nTidak ada pengembalian uang yang akan dilakukan ke metode pembayaran Anda. Setelah deposit selesai, tidak ada cara untuk mengembalikannya. Anda harus menggunakan saldo Anda atas perintah dari Web Kami.\r\nAnda setuju bahwa setelah Anda menyelesaikan pembayaran, Anda tidak akan mengajukan sengketa atau tagihan balik kepada kami karena alasan apa pun.\r\n\r\n7. AKUN\r\n\r\nKami tidak akan membantu apapun yang terjadi pada akun anda jika data yang anda inputkan saat pendaftaran tidak sesuai dengan kriteria yang telah kami sarankan.\r\nJika Anda melakukan pendaftaran dan tidak melakukan deposit atau pengisian saldo dalam waktu lebih dari 1 hari maka akun Anda otomatis akan dinonaktifkan oleh sistem. Jika Anda terbukti melakukan kecurangan dalam bertransaksi di Web Kami maka kami akan menonaktifkan atau bisa saja menghapus akun Anda dari website kami.', '2019-03-20 00:00:00'),
(3, '1. Apa itu Web Kami?\r\nWeb Kami adalah sebuah platform bisnis yang menyediakan berbagai layanan sosial media marketing yang bergerak terutama di Indonesia. Dengan bergabung bersama kami, Anda dapat menjadi penyedia jasa sosial media atau reseller social media seperti jasa penambah Followers, Likes, dll.\r\n\r\n2. Bagaimana cara mendaftar di Web Kami?\r\nAnda dapat langsung mendaftar di website Web Kami pada halaman Daftar\r\n\r\n3. Bagaimana cara membuat pesanan?\r\nUntuk membuat pesanan sangatlah mudah, Anda hanya perlu masuk terlebih dahulu ke akun Anda dan menuju halaman pemesanan dengan mengklik menu yang sudah tersedia. Selain itu Anda juga dapat melakukan pemesanan melalui request API.\r\n\r\n4. Bagaimana cara melakukan deposit/isi saldo?\r\nUntuk melakukan deposit/isi saldo, Anda hanya perlu masuk terlebih dahulu ke akun Anda dan menuju halaman deposit dengan mengklik menu yang sudah tersedia. Kami menyediakan deposit melalui bank dan pulsa.', '2019-03-20 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `provider`
--

CREATE TABLE `provider` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `api_url_order` text COLLATE utf8_swedish_ci NOT NULL,
  `api_url_status` text COLLATE utf8_swedish_ci NOT NULL,
  `api_key` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `api_id` varchar(128) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `provider`
--

INSERT INTO `provider` (`id`, `name`, `api_url_order`, `api_url_status`, `api_key`, `api_id`) VALUES
(1, 'PACIFIC', 'https://pacific-pedia.id/api/sosmed', 'https://pacific-pedia.id/api/sosmed', 'APIKEY ANDA DI WEB PACIFIC-PEDIA.ID', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `register_logs`
--

CREATE TABLE `register_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `note` text COLLATE utf8_swedish_ci NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `price` double NOT NULL,
  `profit` double NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `provider_id` int(11) NOT NULL,
  `provider_service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_cat`
--

CREATE TABLE `service_cat` (
  `id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `msg` text COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('Waiting','Responded','Closed') COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `is_admin` int(1) NOT NULL DEFAULT 0,
  `msg` text COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `balance` double NOT NULL,
  `level` enum('Member','Reseller','Admin') COLLATE utf8_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `api_key` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `remember_me` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `voucher_code` text COLLATE utf8_swedish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `balance_logs`
--
ALTER TABLE `balance_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `deposit_methods`
--
ALTER TABLE `deposit_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `register_logs`
--
ALTER TABLE `register_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `service_cat`
--
ALTER TABLE `service_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `balance_logs`
--
ALTER TABLE `balance_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `deposit_methods`
--
ALTER TABLE `deposit_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `register_logs`
--
ALTER TABLE `register_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `service_cat`
--
ALTER TABLE `service_cat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
