-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 27 Bulan Mei 2018 pada 22.34
-- Versi server: 10.1.31-MariaDB-cll-lve
-- Versi PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `masizhan_petakrim`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jumlah_kriminalitas`
--

CREATE TABLE `jumlah_kriminalitas` (
  `id` int(11) NOT NULL,
  `id_tahun` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL,
  `curat_363` int(11) NOT NULL DEFAULT '0',
  `curi_ternak_363` int(11) NOT NULL,
  `curanmor_363` int(11) NOT NULL,
  `curi_biasa_362` int(11) NOT NULL,
  `jambret` int(11) NOT NULL,
  `curas_365` int(11) NOT NULL,
  `curi_dlm_keluarga` int(11) NOT NULL,
  `pembakaran` int(11) NOT NULL,
  `kebakaran` int(11) NOT NULL,
  `aborsi` int(11) NOT NULL,
  `pembunuhan` int(11) NOT NULL,
  `pengeroyokan` int(11) NOT NULL,
  `perjudian` int(11) NOT NULL,
  `ket_palsu` int(11) NOT NULL,
  `surat_palsu` int(11) NOT NULL,
  `aniaya_ringan` int(11) NOT NULL,
  `aniaya_berat` int(11) NOT NULL,
  `penggelapan` int(11) NOT NULL,
  `pemerasan` int(11) NOT NULL,
  `penipuan` int(11) NOT NULL,
  `hipnotis` int(11) NOT NULL,
  `penghinaan` int(11) NOT NULL,
  `pengancaman` int(11) NOT NULL,
  `pengrusakan` int(11) NOT NULL,
  `perbuatan_tdk_menyenangkan` int(11) NOT NULL,
  `kdrt` int(11) NOT NULL,
  `pemerkosaan` int(11) NOT NULL,
  `pencabulan` int(11) NOT NULL,
  `bawa_lari_perempuan` int(11) NOT NULL,
  `setubuh_anak_bawah_umur` int(11) NOT NULL,
  `perlindungan_anak` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jumlah_kriminalitas`
--

INSERT INTO `jumlah_kriminalitas` (`id`, `id_tahun`, `id_kecamatan`, `curat_363`, `curi_ternak_363`, `curanmor_363`, `curi_biasa_362`, `jambret`, `curas_365`, `curi_dlm_keluarga`, `pembakaran`, `kebakaran`, `aborsi`, `pembunuhan`, `pengeroyokan`, `perjudian`, `ket_palsu`, `surat_palsu`, `aniaya_ringan`, `aniaya_berat`, `penggelapan`, `pemerasan`, `penipuan`, `hipnotis`, `penghinaan`, `pengancaman`, `pengrusakan`, `perbuatan_tdk_menyenangkan`, `kdrt`, `pemerkosaan`, `pencabulan`, `bawa_lari_perempuan`, `setubuh_anak_bawah_umur`, `perlindungan_anak`) VALUES
(1, 2016, 3, 0, 0, 10, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 5, 0, 0, 0, 0, 0, 1, 0, 2, 0, 1, 0, 2, 2),
(2, 2016, 5, 0, 0, 8, 5, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 5, 1, 9, 0, 0, 0, 0, 0, 2, 0, 0, 1, 0, 0, 0, 0),
(3, 2016, 1, 1, 12, 11, 0, 4, 0, 0, 0, 0, 1, 0, 0, 1, 0, 16, 1, 1, 1, 4, 0, 0, 1, 3, 0, 0, 0, 0, 1, 1, 3, 4),
(4, 2016, 4, 0, 0, 9, 2, 0, 1, 0, 0, 0, 0, 0, 0, 3, 0, 1, 7, 1, 1, 0, 8, 0, 0, 0, 1, 0, 2, 0, 1, 0, 0, 1),
(5, 2016, 2, 4, 7, 18, 2, 0, 1, 0, 0, 1, 0, 0, 0, 2, 0, 0, 3, 4, 12, 0, 3, 0, 0, 0, 2, 2, 1, 0, 2, 1, 2, 2),
(6, 2016, 6, 5, 2, 24, 26, 0, 6, 0, 1, 0, 0, 0, 1, 4, 0, 1, 18, 4, 16, 1, 12, 0, 0, 0, 2, 1, 1, 0, 1, 0, 4, 3),
(7, 2017, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 2016, 7, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id` int(11) NOT NULL,
  `nama_kecamatan` varchar(30) NOT NULL,
  `nama_kota` varchar(30) NOT NULL,
  `geometry` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kecamatan`
--

INSERT INTO `kecamatan` (`id`, `nama_kecamatan`, `nama_kota`, `geometry`) VALUES
(1, 'X Koto Singkarak', 'Kabupaten Solok', '[[[100.52067312,-0.79792803,0],[100.50954012,-0.79232904,0],[100.50234012,-0.79233201,0],[100.502334,-0.774207,0],[100.49880492,-0.75648204,0],[100.49872788,-0.75609297,0],[100.49512716,-0.75246804,0],[100.480725,-0.74522799,0],[100.46046816,-0.72498501,0],[100.46701512,-0.72138699,0],[100.48779684,-0.70662096,0],[100.50610896,-0.699957,0],[100.51142796,-0.69802101,0],[100.53495108,-0.69200802,0],[100.559754,-0.68263596,0],[100.55975508,-0.68374701,0],[100.566954,-0.68374503,0],[100.571553,-0.68606001,0],[100.574154,-0.68736897,0],[100.57775508,-0.69098499,0],[100.57975992,-0.69098499,0],[100.58135508,-0.690984,0],[100.58135292,-0.68736699,0],[100.58495112,-0.683739,0],[100.58683896,-0.67422303,0],[100.588545,-0.66562299,0],[100.585854,-0.65220696,0],[100.58493996,-0.64764504,0],[100.58102892,-0.63584703,0],[100.57773384,-0.62590599,0],[100.57053096,-0.61142004,0],[100.56692988,-0.60779403,0],[100.56692916,-0.60416802,0],[100.57412808,-0.60416604,0],[100.574127,-0.59878197,0],[100.58562216,-0.59896296,0],[100.59364296,-0.60200397,0],[100.60036596,-0.605313,0],[100.60369596,-0.60772203,0],[100.60835292,-0.61169904,0],[100.61313408,-0.61784001,0],[100.614744,-0.62208,0],[100.61525808,-0.62343504,0],[100.61681904,-0.62965503,0],[100.62024192,-0.63537003,0],[100.62192816,-0.63818397,0],[100.62745596,-0.64187397,0],[100.62975096,-0.64387404,0],[100.63448892,-0.64800297,0],[100.64434896,-0.66095901,0],[100.64596896,-0.66276198,0],[100.65028608,-0.66756699,0],[100.65075012,-0.66879504,0],[100.65414492,-0.67777002,0],[100.65519,-0.688608,0],[100.65557088,-0.689697,0],[100.65782304,-0.69614703,0],[100.66269096,-0.71008398,0],[100.66713696,-0.72281601,0],[100.66348008,-0.72350298,0],[100.64667708,-0.72785997,0],[100.63339488,-0.73040499,0],[100.62916488,-0.73121499,0],[100.60990884,-0.73525203,0],[100.59599484,-0.73973196,0],[100.59264108,-0.74149497,0],[100.58535792,-0.74532402,0],[100.57211892,-0.75415104,0],[100.56112308,-0.76318101,0],[100.55416392,-0.76737897,0],[100.55243196,-0.76842396,0],[100.54418904,-0.775737,0],[100.53967896,-0.78353298,0],[100.52067312,-0.79792803,0]]]'),
(2, 'Bukit Sundi', 'Kabupaten Solok', '[[[100.76104512,-0.89111097,0],[100.76121288,-0.89334504,0],[100.76588316,-0.90984096,0],[100.76855508,-0.91876203,0],[100.76955084,-0.922086,0],[100.77005808,-0.93300804,0],[100.76975496,-0.93549402,0],[100.76940396,-0.93837699,0],[100.76699412,-0.94215996,0],[100.76309496,-0.943074,0],[100.75982184,-0.94185603,0],[100.75917204,-0.94167504,0],[100.75682808,-0.93654801,0],[100.75038192,-0.93174102,0],[100.74080988,-0.92475,0],[100.74080592,-0.92474703,0],[100.73085984,-0.91655604,0],[100.72458792,-0.91573803,0],[100.72104912,-0.91527597,0],[100.71473292,-0.91704204,0],[100.71334512,-0.91743102,0],[100.70929296,-0.91308897,0],[100.70862516,-0.91237302,0],[100.70258184,-0.90304902,0],[100.69963308,-0.89898597,0],[100.69619616,-0.89425098,0],[100.69378488,-0.886842,0],[100.69277688,-0.88374402,0],[100.69413516,-0.87182001,0],[100.69490196,-0.86910201,0],[100.69816608,-0.85752801,0],[100.69865496,-0.85656303,0],[100.70281404,-0.84836196,0],[100.70331012,-0.84738501,0],[100.70459784,-0.84288501,0],[100.70657712,-0.83597499,0],[100.70802216,-0.828063,0],[100.70901,-0.82265499,0],[100.71019692,-0.81615996,0],[100.71074808,-0.80691804,0],[100.712196,-0.80685504,0],[100.72317996,-0.80829396,0],[100.72937592,-0.81395397,0],[100.735965,-0.82556802,0],[100.74339684,-0.83754099,0],[100.74727188,-0.84081303,0],[100.75147416,-0.84436101,0],[100.75700196,-0.84804903,0],[100.75726692,-0.84808701,0],[100.75647888,-0.85029399,0],[100.75602204,-0.86118102,0],[100.75600908,-0.86149899,0],[100.758879,-0.87230601,0],[100.76024808,-0.88056801,0],[100.76046084,-0.88338303,0],[100.76104512,-0.89111097,0]]]'),
(3, 'Junjung Sirih', 'Kabupaten Solok', '[[[100.54436112,-0.660024,0],[100.54534896,-0.66201003,0],[100.54535004,-0.66320802,0],[100.54535112,-0.66925404,0],[100.55975004,-0.66924999,0],[100.55975112,-0.67222197,0],[100.559754,-0.68263596,0],[100.53495108,-0.69200802,0],[100.51142796,-0.69802101,0],[100.50610896,-0.699957,0],[100.48779684,-0.70662096,0],[100.46701512,-0.72138699,0],[100.46046816,-0.72498501,0],[100.45911996,-0.72363699,0],[100.44066708,-0.71429499,0],[100.43766108,-0.712773,0],[100.43046216,-0.71277498,0],[100.43045784,-0.70190397,0],[100.43156412,-0.69856002,0],[100.43845308,-0.67773501,0],[100.44124812,-0.66928599,0],[100.44484488,-0.66204099,0],[100.44484488,-0.66119796,0],[100.44529704,-0.66129696,0],[100.45541196,-0.66153996,0],[100.46466288,-0.66161898,0],[100.46776104,-0.66118302,0],[100.47171816,-0.66050604,0],[100.47652992,-0.65906901,0],[100.48070808,-0.657522,0],[100.48591512,-0.65532897,0],[100.48929012,-0.65390697,0],[100.49803884,-0.64982601,0],[100.51668792,-0.63317799,0],[100.52028684,-0.63317601,0],[100.53566604,-0.64864899,0],[100.54174716,-0.65476701,0],[100.54253916,-0.65636001,0],[100.54436112,-0.660024,0]]]'),
(4, 'X Koto Diatas', 'Kabupaten Solok', '[[[100.72599984,-0.63837603,0],[100.753821,-0.64397196,0],[100.75742208,-0.64758798,0],[100.76102388,-0.65831202,0],[100.75742892,-0.66918303,0],[100.75518,-0.67145004,0],[100.75023288,-0.67643802,0],[100.74304008,-0.69092703,0],[100.73584404,-0.69818301,0],[100.73228616,-0.70894098,0],[100.73224908,-0.70905402,0],[100.73225196,-0.71670996,0],[100.73069208,-0.71881101,0],[100.72599588,-0.72594999,0],[100.71876312,-0.73222596,0],[100.70894916,-0.73612602,0],[100.69893684,-0.742176,0],[100.69290792,-0.747855,0],[100.690947,-0.75099402,0],[100.68173892,-0.74316996,0],[100.67615892,-0.73597104,0],[100.671399,-0.72982998,0],[100.67014512,-0.72821196,0],[100.66713696,-0.72281601,0],[100.66269096,-0.71008398,0],[100.65782304,-0.69614703,0],[100.65557088,-0.689697,0],[100.65519,-0.688608,0],[100.65414492,-0.67777002,0],[100.65075012,-0.66879504,0],[100.65028608,-0.66756699,0],[100.64596896,-0.66276198,0],[100.64434896,-0.66095901,0],[100.63448892,-0.64800297,0],[100.62975096,-0.64387404,0],[100.62745596,-0.64187397,0],[100.62311688,-0.63897804,0],[100.62192816,-0.63818397,0],[100.62024192,-0.63537003,0],[100.61681904,-0.62965503,0],[100.61525808,-0.62343504,0],[100.614744,-0.62208,0],[100.61313408,-0.61784001,0],[100.60835292,-0.61169904,0],[100.60369596,-0.60772203,0],[100.60036596,-0.605313,0],[100.59364296,-0.60200397,0],[100.58562216,-0.59896296,0],[100.574127,-0.59878197,0],[100.57411404,-0.55358298,0],[100.58851188,-0.55358001,0],[100.60291116,-0.55720197,0],[100.60651116,-0.56081898,0],[100.62435996,-0.54269901,0],[100.63940616,-0.54016902,0],[100.64595492,-0.53906697,0],[100.66755204,-0.54268704,0],[100.68915384,-0.56427696,0],[100.68915492,-0.56790297,0],[100.68332616,-0.56790504,0],[100.67475816,-0.56790801,0],[100.67476284,-0.58602096,0],[100.67697,-0.59710896,0],[100.67836788,-0.604134,0],[100.69532784,-0.62119899,0],[100.70357112,-0.62949303,0],[100.71782604,-0.636732,0],[100.72599984,-0.63837603,0]]]'),
(5, 'IX Koto Sei Lasi', 'Kabupaten Solok', '[[[100.74727188,-0.84081303,0],[100.74339684,-0.83754099,0],[100.735965,-0.82556802,0],[100.72937592,-0.81395397,0],[100.72317996,-0.80829396,0],[100.712196,-0.80685504,0],[100.71074808,-0.80691804,0],[100.71117792,-0.79972497,0],[100.71128304,-0.79796502,0],[100.711116,-0.79668999,0],[100.70949816,-0.78428898,0],[100.70685504,-0.77457798,0],[100.706526,-0.77336901,0],[100.70043984,-0.76305897,0],[100.69932888,-0.761175,0],[100.69861788,-0.75997197,0],[100.69136712,-0.75135204,0],[100.690947,-0.75099402,0],[100.69290792,-0.747855,0],[100.69893684,-0.742176,0],[100.70894916,-0.73612602,0],[100.71876312,-0.73222596,0],[100.72599588,-0.72594999,0],[100.73069208,-0.71881101,0],[100.73225196,-0.71670996,0],[100.73225304,-0.71992404,0],[100.73709396,-0.71992197,0],[100.74665016,-0.71991801,0],[100.74665304,-0.72716202,0],[100.747305,-0.72845802,0],[100.753857,-0.741501,0],[100.75385988,-0.74875302,0],[100.75508604,-0.74875302,0],[100.76465808,-0.74874897,0],[100.76886684,-0.75015702,0],[100.775457,-0.75236202,0],[100.77905808,-0.75598704,0],[100.78213104,-0.762165,0],[100.78265988,-0.76322799,0],[100.78266312,-0.770481,0],[100.79331696,-0.77047596,0],[100.80220284,-0.77344902,0],[100.80411588,-0.77408901,0],[100.81131516,-0.77771196,0],[100.81851408,-0.77770899,0],[100.81852092,-0.79220403,0],[100.82931804,-0.79219899,0],[100.83130416,-0.792864,0],[100.82991384,-0.79945101,0],[100.82502288,-0.80614998,0],[100.81833192,-0.81182898,0],[100.81824084,-0.81190602,0],[100.81473912,-0.81624501,0],[100.81032408,-0.82171503,0],[100.79832492,-0.834264,0],[100.78473996,-0.83860902,0],[100.78224012,-0.83940903,0],[100.77644412,-0.83895696,0],[100.770057,-0.83845899,0],[100.76111712,-0.84196404,0],[100.75890888,-0.843489,0],[100.75726692,-0.84808701,0],[100.75700196,-0.84804903,0],[100.75147416,-0.84436101,0],[100.74727188,-0.84081303,0]]]'),
(6, 'Tanjung Harapan', 'Kota Solok', '[[[100.63387512,-0.79241202,0],[100.63239588,-0.79228998,0],[100.62996588,-0.79040097,0],[100.62924408,-0.789102,0],[100.62805104,-0.78695604,0],[100.62461412,-0.78443496,0],[100.62329004,-0.78346404,0],[100.62044208,-0.78024996,0],[100.61713692,-0.77717601,0],[100.61532288,-0.77601402,0],[100.61757792,-0.77217102,0],[100.61991396,-0.76894803,0],[100.620765,-0.76777299,0],[100.62578088,-0.76323798,0],[100.62911916,-0.76035798,0],[100.63311696,-0.75707397,0],[100.63337616,-0.75690504,0],[100.63840896,-0.75362904,0],[100.643571,-0.75071898,0],[100.64826,-0.74886804,0],[100.65383604,-0.74629899,0],[100.65858804,-0.74293902,0],[100.66346496,-0.73915299,0],[100.66836996,-0.73472103,0],[100.67112396,-0.730413,0],[100.671399,-0.72982998,0],[100.67615892,-0.73597104,0],[100.68173892,-0.74316996,0],[100.690947,-0.75099402,0],[100.69136712,-0.75135204,0],[100.69861788,-0.75997197,0],[100.69932888,-0.761175,0],[100.69272216,-0.75993597,0],[100.68431904,-0.76087404,0],[100.67927508,-0.76098303,0],[100.67405904,-0.76229397,0],[100.66607892,-0.76740696,0],[100.66435992,-0.76924602,0],[100.66035204,-0.77353299,0],[100.660203,-0.77503599,0],[100.65987792,-0.77829696,0],[100.65949308,-0.77822802,0],[100.65609108,-0.778527,0],[100.65257208,-0.77930001,0],[100.64910888,-0.78111,0],[100.64492388,-0.78343596,0],[100.64111292,-0.78619698,0],[100.63896012,-0.79034301,0],[100.63820592,-0.79098399,0],[100.63629216,-0.79261101,0],[100.63387512,-0.79241202,0]]]'),
(7, 'Lubuk Sikarah', 'Kota Solok', '[[[100.53695016,-0.81389799,0],[100.55960604,-0.80006202,0],[100.56153204,-0.79936002,0],[100.57251096,-0.795834,0],[100.57781088,-0.79476399,0],[100.58237892,-0.79323201,0],[100.58758488,-0.79183404,0],[100.59302304,-0.79001496,0],[100.59913512,-0.78746904,0],[100.603917,-0.78594597,0],[100.60485516,-0.78535098,0],[100.611738,-0.78099003,0],[100.61492112,-0.7767,0],[100.61499492,-0.776574,0],[100.61532288,-0.77601402,0],[100.61713692,-0.77717601,0],[100.62044208,-0.78024996,0],[100.62329004,-0.78346404,0],[100.62461412,-0.78443496,0],[100.62805104,-0.78695604,0],[100.62924408,-0.789102,0],[100.62996588,-0.79040097,0],[100.63239588,-0.79228998,0],[100.63387512,-0.79241202,0],[100.63629216,-0.79261101,0],[100.63820592,-0.79098399,0],[100.63896012,-0.79034301,0],[100.64111292,-0.78619698,0],[100.64492388,-0.78343596,0],[100.64910888,-0.78111,0],[100.65257208,-0.77930001,0],[100.65609108,-0.778527,0],[100.65949308,-0.77822802,0],[100.65987792,-0.77829696,0],[100.65973392,-0.77974704,0],[100.66346892,-0.78644601,0],[100.66374108,-0.78693399,0],[100.66726188,-0.79043202,0],[100.66746204,-0.79458903,0],[100.66609008,-0.79844004,0],[100.66515192,-0.80107497,0],[100.65933684,-0.80676396,0],[100.658943,-0.80691903,0],[100.65485088,-0.80853498,0],[100.64995992,-0.81046602,0],[100.64277504,-0.81048402,0],[100.63460988,-0.80830098,0],[100.63093716,-0.80728596,0],[100.62676584,-0.80613198,0],[100.62222192,-0.80568801,0],[100.62089316,-0.80555904,0],[100.612323,-0.80789202,0],[100.60867008,-0.80805996,0],[100.525365,-0.84007296,0],[100.52755488,-0.83566197,0],[100.534608,-0.828405,0],[100.53820404,-0.81767799,0],[100.53784584,-0.81659898,0],[100.53695016,-0.81389799,0]]]');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konten`
--

CREATE TABLE `konten` (
  `id_konten` int(11) NOT NULL,
  `judul_konten` varchar(35) NOT NULL,
  `tgl_terbit_konten` datetime NOT NULL,
  `isi_konten` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `konten`
--

INSERT INTO `konten` (`id_konten`, `judul_konten`, `tgl_terbit_konten`, `isi_konten`) VALUES
(2, 'Profile', '2018-05-16 19:18:39', '&lt;p&gt;&lt;span style=&quot;font-size: small;&quot;&gt;&lt;strong&gt;Visi dan Misi POLRES Solok Kota&lt;br /&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: small;&quot;&gt;Berdasarkan batas kewenangan tersebut Polres Solok Kota mempunyai Visi dan Misi dalam melaksanakan tugas pokok Polri dengan tujuan dan kebijaksanaan strategis Polres sebagaimana diatur dalam Undang-&lt;span style=&quot;font-family: &#039;times new roman&#039;, times;&quot;&gt;Undang Nomor 2 Tahun 2002 tentang Kepolisian Negara Republik Indonesia, yaitu:&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-size: small;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: small;&quot;&gt;VISI&lt;/span&gt;&lt;/strong&gt;&lt;br /&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-size: small;&quot;&gt;Polres Solok Kota bertekad meningkatkan kualitas pelayanan dan penegakan hukum secara professional untuk merebut kepercayaan masyarakat dalam rangka mewujudkan keamanan dan ketertiban&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-size: small;&quot;&gt;&lt;strong&gt;MISI&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-size: small;&quot;&gt;Untuk mewujudkan visi tersebut maka Polres Solok Kota memiliki misi sebagai berikut&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-size: small;&quot;&gt;1.Meningkatkan kesadaran hukum, partisipasi, kemitraan, kerjasama masyarakat dalam rangka Pemolisian Masyarakat (Polmas).&lt;br /&gt;2. Maningkatkan sistem komunikasi dan informasi secara &lt;em&gt;on line&lt;/em&gt; Polsek sejajaran Polres Solok Kota.&lt;br /&gt;3. Adanya keterpaduan antara Bag dan Fungsi Opsnal dalam pelaksanaan tugas Harkamtibmas&lt;br /&gt;4. Terciptanya masyarakat yang patuh hukum untuk menjaga Kamtibcar Lantas secara profesional, obyektif, transparan dan akuntabel.&lt;br /&gt;5. Melaksanakan deteksi dini dan peringatan dini melalui kegiatan/operasi penyelidikan, pengamanan dan penggalangan&lt;br /&gt;6. Mewujudkan penegakan hukum yang bermoral, professional, modern, transparan dan akuntabel untuk menjamin kepastian hukum dan tidak diskriminatif.&lt;br /&gt;7. Memberikan perlindungan, pengayoman dan pelayanan terhadap harta benda dan diri melalui penyebaran anggota patwal sampai di titik-titik rawan sehingga tercapainya Kamtibmas yang kondusif.&lt;br /&gt;8. Meningkatkan kemampuan personil yang bermoral dan membangun serta mengelola secara profesional, transparan, akuntabel dan modern bagi seluruh sumber daya Polri guna mendukung operasional tugas Polri.&lt;br /&gt;9. Meningkatkan deteksi dini dan wasdal, menegakkan hukum secara profesional, proporsional dan transparan terhadap anggota dalam pelaksanaan tugas.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-size: small;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-size: small;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-size: small;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n&lt;div style=&quot;position: absolute; left: 8px; top: 829px; width: 867px; height: 100px;&quot;&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-size: small;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n&lt;/div&gt;'),
(3, 'Info Lainya', '2018-05-16 19:12:48', '&lt;p&gt;Peta Wilayah Wewenang Polres Solok Kota&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `level`) VALUES
(1, 'admin', '$2y$10$VBzhLp5XbmlBhEam1OqWeuI8NZke.5NsrDbCJiGkfEs0MKSj2fbVu', 1),
(3, 'siapa', '$2y$10$kOSOibzOgHBoraM.FAPR3uCH47wm8XTFVqmB0RlgjgGsvj3J/AdEW', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `titik_kriminal`
--

CREATE TABLE `titik_kriminal` (
  `id` int(11) NOT NULL,
  `no_laporan` varchar(50) NOT NULL,
  `pelapor` text NOT NULL,
  `terlapor` text NOT NULL,
  `tanggal` date NOT NULL,
  `uraian` text NOT NULL,
  `lat` varchar(15) NOT NULL,
  `lng` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `kecamatan` int(11) NOT NULL,
  `pasal` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `titik_kriminal`
--

INSERT INTO `titik_kriminal` (`id`, `no_laporan`, `pelapor`, `terlapor`, `tanggal`, `uraian`, `lat`, `lng`, `alamat`, `kecamatan`, `pasal`, `keterangan`, `kategori`) VALUES
(3, 'LP/01/B/II/2017/Polsek Junjung Sirih', 'Dedi Caniago, Minang, 42 Th, Dagang, Jorong Kampung Baru Gando Nagari Paninggahan Junjung Sirih', 'Lidik', '2017-02-14', 'Pencurian uang tunai Rp 150 Juta, 2 Unit HP, hari selasa 14-02-2017 Pkl 05.30 Wib, di pinggir jln. Umum Ondoh Subarang Paninggahan', '-0.674826', ' 100.473287', 'Nagari Paninggahan', 3, '', '', 'curat_363'),
(4, 'LP/02/B/IV/2017/Polsek Junjung Sirih', 'Mawardi, 50 Th, Minang, Swasta, Dusun Tambak Jorong Koto Tuo Kec. JJS', 'Lidik', '2017-04-05', 'Curanmor Honda Beat BA 2796 PI, hari Rabu tgl 5-04-2017 Pkl 15.00 Wib ', '-0.6753035', '100.4958678', 'Paninggahan', 3, '', '', 'curanmor_363'),
(5, 'LP/04/B/VI/2017/Polsek Junjung Sirih', 'Ismet Roza, 75 Th, Minang, Swasta, Jorong kampung tangah nagari paninggahan', 'Lidik', '2017-06-15', 'Pencurian kotak amal mesjid kerugian Rp 3 Juta, terjadi hari kamis tgl 15-6-2017 Pkl 04.30 Wib di mesjid raya jorong kampung tangah paninggahan', '-0.675540', '100.502548', 'mesjid raya jorong kampung tengah paninggahan', 3, '', '', 'curi_biasa_362'),
(6, 'LP/01/B/I/2017/lubuk sikarah', 'Endang Wahyuni, 20 Th, minang, Karyawan Cafe, Jl. Nasir Pamuncak By Pass Kel. Aro IV Korong Kota Solok', 'Safryanto Pgl Anto Kaliang, 21 Th, Caniago, Pengangguran, SD tidak tamat, Kandang Aur Kel. Simpang Rumbio Kota Solok', '2016-01-03', 'Pencurian 3 Unit HP, 3 Dompet kerugian Rp 10 Juta hari Sabtu 03-01-2016 Pkl 11.45 Wib di Cafe Charly By. Pas Kota Solok', '-0.802668', '100.661003', 'Jl. Nasir Sutan Pemuncak', 7, '', '', 'curi_biasa_362'),
(7, 'LP/02/B/I/2017/lubuk sikarah', 'Elsa Intan, 26 Th, Minang, Wiraswasta, Jl. Dt. Perpatih Nan Sabatang Kel. Sp. Rumbio Kota Solok.\r\nKorban: Gazia Hafiza, 2 Th, Minang, Ikut Ortu\r\n', 'Rani Sagita, 18 Th, Minang, Baby Sister, Jl. Dt. Perpatih Nan Sabatang Sp. Rumbio', '2016-12-07', 'Pencabulan dengan cara menggosokkan jarinya ke kelamin korban ', '-0.7924078', '100.6583978', 'Jl. Datuk Perpatih Nan Sabatang', 7, '', '', 'pencabulan'),
(8, 'LP01/01/ I / 2017Polsek Kota Solok', 'WIWIT, 31 Th', 'LIDIK', '2017-07-01', 'Pencurian pada hari  Sabtu 07 Januari 2017 di ketahui sekira pkl 18.30 Wib di Jl Letnan Jamhur Kota Solok  yang mana saat pulang berjualan di pasar di dapati  mesin penggiling tempe yang berada dirumah sudah tidak ada lagi\r\nKerugian  Rp 4.000.000,', '-0.798721500000', '100.6596998', 'Jalan Letnan Jamhur', 6, '', '', 'curi_biasa_362'),
(9, 'LP/02/ I / 2017Polsek Kota Solok', 'BUSRIYAL', 'ENDO', '2016-09-01', 'Terjadi penganiayaan berat hari Senin, 09 Januari 2016 Pkl 03.00 Wib yang mana saat duduk di Simpang Surya Kota Solok datang tersangka menuduh korban  mencongel mobil kakak iparnya  dan lansung menendang bagian perut dan memukul tangan korban dengan kayu', '-0.7901085', '100.657142', 'Simpang Surya solok', 6, '', '', 'aniaya_berat'),
(10, 'LP/04/ I / 2017Polsek Kota Solok', 'NASRIL IN SH Dt MALINTANG, 51 Th, Angt DPRD Kota Solok, Tj Paku Kota Solok', 'ALEX EFRIZON, 21 Th, Minang, Mhs, Tembok Laing Kota Solok', '2016-01-23', 'Pencurian  hari Sabtu Tgl 14 Jan 2016 Diketahui Pkl 05.30 wib di  Simp Rumbio Kota Solok yang mana saat pulang kerumah di lihat pintu sudah rusak  korban kehilangan 1 unit Laptop Toshiba,  1 Netbokk merk Asus,  HP Samsung, dan jam tangan\r\nKerugian Rp.5.000.000,-\r\n', '-0.797060', '100.663810', 'simpang rumbio solok', 6, '', '', 'curat_363'),
(11, 'LP/04/ I / 2017Polsek Kota Solok ', 'NASRIL IN SH Dt MALINTANG, 51 Th, Angt DPRD Kota Solok, Tj Paku Kota Solok', 'ALEX EFRIZON, 21 Th, Minang, Mhs, Tembok Laing Kota Solok', '2017-01-23', 'Penggelapan 1 Set Ballon Gate Rabu 12 Oktober 2016 pkl 15.00 Wib di Tanjung  Paku Kota Solok yang mana terlapor menyewa ballon gate, Namun Sampai sekarang belum di kembalikan, \r\nKerugian Rp. 9.000.000,-\r\n', '-0.775311099999', '100.6675267', 'kelurahan tanjung paku', 6, '', '', 'penggelapan'),
(12, 'LP/05/ I / 2017Polsek Kota Solok ', 'JOKO PURNOMO, 31 Th, Jawa, Kary PT BMG, Kel.Lengah Jaya Bekasi Jabar', 'Lidik', '2017-05-25', 'Pencurian gulungan Kabel Pawer UK 4X50 Milik PT Indosat  diKetahui hari Selasa Tgl 31 Jan 2015  di Kel Aro IV Korong  saat korban ingin melanjutkan pemb rumah ginset kabel tsb tidak ada lagi.Kerugian Rp. 11.000.000,-', '-0.7928499', '100.6661184', 'kelurahan aro IV korong', 7, '', '', 'curat_363'),
(13, 'LP/06/ II / 2017Polsek Kota Solok', 'YUSMIDARTI,Minang, Islam, RT, Rt1/II Simpang Rumbio KotA Solok', 'JIMMY ANDRIKO,37Th,Swasta Limau\r\n Lunggo  Lb Jaya K\r\n', '2017-10-02', 'Pada Bulan September  2015  di Terminal bareh Solok terlapor meminjam  emas seberat 15 Mas kepada pelapor dan dijanjikan akan di bayar  bulan November 2015, Namun sampai sekarang tidak di bayar', '-0.804035498971', '100.64781188964', ' Kel. Simpang Rumbio.', 7, '', '', 'penipuan'),
(14, 'LP/07 / II / 2017Polsek Kota Solok', 'DESMAWATI,47 Th, Swasta,Minang, Jrg Gelanggang Tangah Selayo.Solok', 'RIKA, 25 Th, Mianag, Swasta, Jr Tanah Sirah Koto Anau Lb Jaya Kab.Solok', '2017-06-02', 'Penganiayaan pada hari senin tgl 06 Peb 2017 Pkl 14,15 Wib di Lukah Pandan Kota Solok yang mana  terjadi kesalah pahaman dan pertengkaran. Kemudian terlapor  mempelintir jari  korban dan mengalami sakit', '-0.804570', '100.652628', 'nasi goreng lukah pandan', 7, '', '', 'aniaya_ringan'),
(15, 'LP/08 / II / 2017Polsek Kota Solok', 'YUSWENDI,39 Th, Minang, Simpang Pulai Simp Rumbio Kota Solok', 'PUTRI ANDRIANI', '2017-09-01', 'Penipuan hari Senin 5 Des 2017 Pkl 14.00 Wib di By Pass Kel Aro IV Korong Kota Solok yg mana sewaktu pelapor  melunasi  sisa pembelian 1 unit Mobil Sedan Civic  terlapor tdk dapat  menunjukan BPKB sesuai perjanjian sebelum pembelian mobil tsb.', '-0.798074899999', '100.6666889', 'Jl. Tj. Paku, Simpang Rumbio', 6, '', '', 'penipuan'),
(16, 'LP/09 / II / 2017Polsek Kota Solok', 'SRI MULYANI, 16 Th, Pelajar, Islam, Aia Luo Kec Py, Sekaki Kab.Solok', 'Lidik', '2017-09-02', 'Pencurian hari Kamis 9 Peb 2017 Pkl 18.15 wib yang mana saat pelapor pulang kerumah dilihat barang2 yg ada di tempat kos seperti 2 unit Laptop, HP tidak ada lagi , Rp. 1.000.000', '-0.761192821439', '100.62034606933', 'Aia Luo Kec Py, Sekaki Kab.Solok', 6, '', '', 'curas_365'),
(17, 'LP/10 / II / 2017Polsek Kota Solok', 'TITI WAHYUNI, 31 Th, jawa, Kary BUMN,Tembok Nan Balimo Kota Solok', 'Lidik', '2017-10-02', 'Pencurian hari Kamis tgl 9 Peb 2017 Pkl,17.30 Wib yamg mana saat pulang dari kantor dilihat rumah sudah berantakan dan emas dalam lemari tidak ada lagi. Kerugian Rp. 13.000.000,-', '-0.7812563', '100.6561274', 'Tembok Nan Balimo Kota Solok', 6, '', '', 'curi_biasa_362'),
(18, 'LP/12 / II / 2017Polsek Kota Solok', 'WENDI AGUSMAN, 37 Th, PNS, Minang, Jl Mangga 2 Comp PLN Simp Rumbio Kota Solok', 'Lidik', '2017-12-02', 'Pencurian hari Rabu tgl 15 Peb 2017 Pkl12.30 Wib di Simp Rumbio  yang mana saat pelapor pulang kerumah ortu utk mematikan lampu karena rumah dalam keadaan Kosong, saat masuk rumah dilihat kaca nako belakang sudah terbuka barang 2 berupa Laptop , Camera Digital, HP,Emas dan uang tdk ada lagi. Kerugian Rp. 11,300.000,-', '-0.800602608032', '100.63682556152', 'kelurahan simpang rumbio', 7, '', '', 'curi_biasa_362'),
(21, 'LP/05/B/VI/2017/Polsek Junjung Sirih', 'Nolid, 28 Th, Tani, Jorong Koto Nagari muaro pingai kec. Junjung Sirih', 'Lidik', '2017-06-16', 'Pencurian 2 ekor kambing terjadi hari jumat 16-6-2017 Pkl 07.00 Wib bertempat di muaro pingai Kec. Junjung sirih', '-0.690369', '100.537598', 'muara pingai', 3, '363 KUHP', '', 'curi_biasa_362'),
(22, 'LP/07/A/VI/2017/Polsek Junjung Sirih', 'Ropi Soldi, 38 TH, Koto/Minang, Polri, Asrama Polres Solok Kota', 'Rudi Saputra, 47 TH, Minang, Wiraswasta, Paninggahan Kec. Junjung Sirih Kab. Solok\r\nDoni Zarman, 44 TH, Minang, Tani, Paninggahan Kec. Junjung Sirih Kab. Solok\r\nEnek, 49 TH, Minang, Tani, paninggahan Kec. Junjung Sirih Kab. Solok\r\nAlek Elvis, 53 TH, Minang, Swasta, Paninggahan Kec. Junjung Sirih Kab. Solok\r\n', '2017-07-02', 'Kejahatan terhadap ketertiban umum (judi Domino) yang terjadi pada hari Rabu tanggal 02 Agustus 2017 sekitar pukul 11.30 WIB bertempat di Paninggahan Kec. Junjung Sirih Kab. Solok\r\n', '-0.680449702408', '100.50979614257', 'paninggahan', 3, '303', 'BB: 1 set batu domino, Uang tunai Rp. 162.000', 'pengrusakan'),
(23, 'LP/09/B/IX/2017/Polsek Junjung Sirih', 'Roslita, 50 TH, Guci, Dagang, Jorong Kampung Tengah Nagari Paninggahan Kec. Junjung Sirih Kab. Solok ', 'Lidik', '2017-09-17', 'Pencurian 15 liter beras, 1 kalung emas seberat 6 gram, pada hari Kamis tgl. 14 Sept 2017 sekitar pukul 02.30 WIB bertempat di sebuahn rumah yang tertelak di Jorong Kampung Tengah Nagari Paninggahan Kec. Junjung Sirih Kab. Solok (Rumat Rp. 3.000.000)	\r\n', '-0.671422', '100.526936', 'jorong kampung tengah, paninggahan, solok', 3, '363', '', 'curi_biasa_362'),
(24, 'LP/10/B/X/2017/Polsek Junjung Sirih', 'Erniwati, 51 TH, Guci, Dagang, Dusun Taha Jorong Subarang Nagari Paniggahan Kec. Junjung Sirih kab. Solok', 'Tam, 35 TH, Minang, Sopir Truk, dusun Ondoh Jorong Subarang nagari Paninggahan Kec. Junjung Sirih kab. Solok', '2017-10-24', 'Penggelapan yang terjadi pada hari Senintanggal 21 Agustus 2017 sekitar pukul 16.30 WIB bertempat di Dusun Taha Nagari Paninggahan Kec. Junjung Sirih Kab. Solok (Rp. 6.000.000)	', '-0.689989', ' 100.494016  ', 'Dusun Taha Nagari Paninggahan Kec. Junjung Sirih Kab. Solok', 3, '372 KUHP', '', 'penggelapan'),
(25, 'LP/08/B/VI/2017/Polsek Junjung Sirih 08-08-2017', 'Yenidar, 39 TH, Pinyalai/Minang, IRT, Cacang Dusun Batua Jorong Subarang Nagari Paninggahan Kec. Junjung Sirih Kab. Solok', 'Susilawati, 35 TH, Pinyalai/Minang, IRT, Cacang Dusun Batua Jorong Subarang Nagari Paninggahan Kec. Junjung Sirih Kab. Solok', '2017-08-08', 'Penganiayaan dengan cara mmbacok pelapor yang terjadi pada hari Selasa tanggal 12.30 WIB bertempat di Cacang Dusun Batua Jorong Subarang Nagari Paninggahan Kec. Junjung Sirih Kab. Solok	\r\n', '-0.678389910712', '100.48095703125', 'Dusun Batua Jorong Subarang Nagari Paninggahan Kec. Junjung Sirih Kab. Solok', 3, '351 KUHP', '', 'aniaya_berat'),
(27, 'LP/01/B/I/2017/Polsek IX Koto Sei. Lasi', 'Gusrianti, 43 Th, Minang, IRT, Guguk Padusi Guguk Sarai', 'Lidik', '2017-01-02', 'Pencurian TV dan speker di rumah korban hari senin 2-01-2017 ', '-0.764005', '100.701383', 'NagariGuguakSaraiKec. IX Koto SeiLasiKab. Solok', 1, '363', '', 'curi_biasa_362'),
(28, 'LP/02/B/I/2017/Polsek IX Koto Sei. Lasi', 'ChrisniHardyanti, 24 Th, Koto/Minang, EksMahasiswi, JorongSubarangNagari Koto BaruKec. KubungKab. Solok', 'Bima, 24 Th, Minang, PegawaiKontrak RSUD Solok, NagariGuguakSaraiKec. IX Koto SeiLasiKab. Solok', '2017-01-27', 'Penganiayaandengancarameninjukorban yang terjadipadahariJumattanggal 27 Januari 2017 sekitarpukul 11.30 WIB bertempat di NagariGuguakSaraiKec. IX Koto SeiLasiKab. Solok', '-0.764438', ' 100.702838', 'NagariGuguakSaraiKec. IX Koto SeiLasiKab. Solok', 5, '332', '', 'aniaya_ringan'),
(29, 'LP/03/B/I/2017/Polsek IX Koto Sei. Lasi', 'Zulkifli, 45 TH, Chaniago/Minang, Wiraswasta, KapaloSawahJorongGuguakManyambahNagari Sungai JamburKec. IX Koto SeiLasikab. Solok', 'Lidik', '2017-02-10', 'Pencurian yang terjadipadahariKamistanggal 09 Februari 2017 sekitarpukul 24.00 WIB bertempat di JorongGuguakManyambahNagari Sungai JamburKec. IX Koto SeiLasikab. Solok (rumatRp. 13.500.000)', '-0.791547', '100.730872', 'JorongGuguakManyambahNagari Sungai JamburKec. IX Koto SeiLasikab', 5, '363', '', 'curat_363'),
(30, 'LP/04/B/III/2017/Polsek IX Koto Sei. Lasi', 'M. Nurin, 73 Th, Melayu/Minang, Pensiunan PNS, JorongBatuKudo Sungai Durian Kec. IX Koto SeiLasiKab. solok', 'Lidik	', '2017-03-13', 'Pengrusakantanamanyang terjadipadahariJumattanggal 03 Maret 2017 sekitarpukul 14.00 WIB bertempat di SubarangLawehJorongBalaiGadangNagariSungau Durian Kec. IX Koto Sungai LasiKab. Solok	\r\n', '-0.797169714220', '100.72059631347', 'SubarangLawehJorongBalaiGadangNagariSungau Durian Kec. IX Koto Sungai LasiKab. Solok', 5, '407KUHP', '', 'pengrusakan'),
(31, 'LP/05/B/VI/2017/Polsek IX Koto Sei. Lasi', 'Anaskar, 51 Th, Minang, Swasta, Jorong Batu Kudo Nagari Sei. Durian Kec. Sei. Lasi	Nofrizal, 30 Th, Minang, Swasa, ', 'Nofrizal, 30 Th, Minang, Swasa, Jorong Batu Kudo Sei. Lasi', '2017-06-06', 'Penganiayaan hari minggu 25-6-2017 Pkl 13.30 Wib bertempat di rumah korban', '-0.794942', '100.773047', 'jorong Batu Kudo Nagari Sei. Durian Kec. Sei. Lasi', 5, '351 KUHP', '', 'aniaya_ringan'),
(32, 'LP/06/B/VI/2017/Polsek IX Koto Sei. Lasi', 'Salman Bhudin, 47 TH, Rejang/Bengkulu, Karyawan BUMN, RT/RW 001/001 Kel. GunungIbulKec. PrabumulihTimur Kota PrabumulihProvSumsel', 'Lidik', '2017-07-28', 'Pencurian Laptop AxiodanuangRp. 7.000.000 dengancaramemecahkahkacamobil yang terjadipadahariJumattanggal 28 Juli 2017 bertempat di halaman parker Masjid Jihad JorongBatangPamoPiangguKec. IX Koto Sungai LasiKab. Solok (RumahRp. 11.000.000)', '-0.750545', '100.753793', 'halaman parker Masjid Jihad JorongBatangPamoPiangguKec. IX Koto Sungai LasiKab. Solok', 5, '363', '', 'curi_biasa_362'),
(33, 'LP/07/B/VI/2017/Polsek IX Koto Sei. Lasi', 'Yushelma, 55 TH, Mandahiliang, PNS, DusunSawahPanjangDesaKolokMudikKec. Baringin Kota Sawahlunto\r\n\r\nRosmaniar, 66 TH, Mandahiling, IRT, DusunSawahPanjangDesaKolokMudikKec. Baringin Kota Sawahlunto\r\n\r\nMardiana, 73 TH, Mandahiling, IRT, DusunSawahPanjangDesaKolokMudikKec. Baringin Kota Sawahlunto\r\n\r\nTasmidar, 58 TH, Payo Bandar, IRT, DusunSawahPanjangDesaKolokMudikKec. Baringin Kota Sawahlunto', 'Lidik\r\n\r\n', '2017-09-16', 'Pencuriandengancaramengambiltasketikasholatsubuhyang terjadipadahariSabtutgl. 16 Sept 2017 sekitarpukul 05.15 WIB bertempat di MusholaIstiqomahJembatanterbakarJorongSungai LasiNagariPiangguKec. IX koto Sungai LasiKab. Solok (rumatRp. 8.000.000)', '-0.768825', ' 100.719648', 'MusholaIstiqomahJembatanterbakarJorongSungai LasiNagariPiangguKec. IX koto Sungai LasiKab. Solok', 5, '363', '', 'curat_363'),
(34, 'LP/08/B/IX/2017/Polsek IX Koto Sei. Lasi', 'Edi Jaya, 48 TH, Chaniago/Minang, PNS, JorongBatuKudo Sungai Durian Kec. IX koto Sungai LasiKab. Solok', 'LIDIK', '2017-09-29', 'Pencurian 3 karungpadidan BPKB motordengancaramerusakjendelarumah yang diketahuipadahariKamistanggal 29 September 2017 sekitarpukul 09.30 WIB bertempat di k(RumatRp. 5.000.000)', '-0.841133', '100.777060', 'Jorong Sikumbang Sungai Durian Kec. IX koto Sungai LasiKab. Solok', 5, '363', '', 'curat_363'),
(35, 'LP/01/B/I/2017/Polsek X KT. Dibawah', '1.	Mulyadi, 34 Th, Minang, Sumagek, Tani, Koto Sani \r\n2.     Bakar, 64 Th, Minang, Koto Sani\r\n', '1.	Hendrianto, 39 Th, sumagek/Minang, Tani, Jalan Lintas Sumatera Jorong Dalimo Nagari Singkarak Kec. X Koto Singkarak Kab. Solok\r\n2.	Agusri Kurniawan, 23 Th, Sumagek/Minang, Tani, Jorong Limo Niniak Nagari Koto Sani Kec. X Koto Singkarak Kab. Solok\r\n', '2017-01-13', 'Penganiayaan hari Kamis tgl 12-01-2017 Pkl 21.00 Wib', '-0.739640', '100.557725', ' di Jorong Sawah Bukit Nagari Koto Sani', 1, '351 KUHP', '', 'aniaya_ringan'),
(36, 'LP/02/B/I/2017/Polsek X KT. Dibawah', 'Pelapor: Rio Septio, 31 Th, Minang, Dagang, Jorong Kubang gajah Singkarak.\r\nKorban : Reno Irawan, 33 Th, Minang, Sopir, Jr. Taluku Singkarak\r\n', 'LIDIK', '2017-01-23', 'Pencurian yang terjadipadahariSenintanggal 20 Februari 2017 sekitarpukul 14.00 WIB  (RumatRp. 10.000.000) ', '-0.695797', '100.603736', 'bertempat di disebuahrumah yang terletak di JorongKalukuNagariSingkarakKec. X Koto SingkarakKab. Solok', 1, '363', '', 'curanmor_363'),
(37, 'LP/04/B/I/2017/Polsek X KT. Dibawah', 'MarweTH, Piliang/MInang, PNS, JorongKalukuNagariSingkarakKec. X Koto SingkarakKab. Solok', 'Lidik', '2017-02-21', 'Pengrusakan pagar kebun hari kamis 9-3-2017 Pkl 17.30 Wib ', '-0.621359', '100.592054', 'Jorong takuang kacang singkarak', 1, '406', '', 'pengrusakan'),
(38, 'LP/01/B/I/2017/Polsek Bukit Sundi', 'Irwan, 37 TH, Tanjung/Minang, Dagang, Sorek 1 Pangkalan Kuras Kab. Palalawan RT/RW 01/09 Prov. Riau', 'Afrizal Malin Pono Pgl. Ijan, 37 TH, Tanjung/Minang, Tani, Jorong Balai Nagari Parambahan Kec. Bukit Sundi Kab. Solok ', '2017-01-15', 'Tindak Pidana Penggelapan dalam penjualan sapi yang diketahui pada hari Sabtu tanggal 14 Januari 2016 sekitar pukul 06.15 WIB bertempat di Jorong Sangka Nagari Dilam Kec. Bukit Sundi Kab. Solok', '-0.863767328437', '100.71304321289', 'Jorong Sangka Nagari Dilam Kec. Bukit Sundi Kab. Solok', 2, '372 KUHP', '', 'penggelapan'),
(39, 'LP/01/B/I/2017/Polsek Bukit Sundi', 'Irwan, 37 TH, Tanjung/Minang, Dagang, Sorek 1 Pangkalan Kuras Kab. Palalawan RT/RW 01/09 Prov. Riau', 'Afrizal Malin Pono Pgl. Ijan, 37 TH, Tanjung/Minang, Tani, Jorong Balai Nagari Parambahan Kec. Bukit Sundi Kab. Solok ', '2017-01-15', 'Tindak Pidana Penggelapan dalam penjualan sapi yang diketahui pada hari Sabtu tanggal 14 Januari 2016 sekitar pukul 06.15 WIB bertempat di Jorong Sangka Nagari Dilam Kec. Bukit Sundi Kab. Solok', '-0.850722524018', '100.71441650390', 'Jorong Sangka Nagari Dilam Kec. Bukit Sundi Kab. Solok', 2, '372 KUHP', '', 'penggelapan'),
(40, 'LP/03/B/I/2017/Polsek Bukit Sundi', 'Irman jaya Pgl Indra, 25 Th, Wiraswasta, Jorong Kubang Rabah Koto Laweh Kec. Lembah Gumanti ', '1.	Ashari Akbar Pgl Ari, 18 Th, Minang, Pelajar SMK 2 Solok, Jorong Parik Nagari Bukit Tandang Kec. Sundi\r\n2.	Arif Rahmat Hakim, 17 Th, Pelajar SMK 2 Solok, Jorong Parik bukit tandang\r\n', '2017-01-18', 'Curanmor Suzuki Satria FU hari Sabtu14-01-2017 Pkl 07.00 Wib BM 4120 ZY Noka. MH8BG41CA8J-169351Nosin. G420-ID-169646 di taruko jorong parik nagari bukik tandang Kec. Bukit Sundi', '-0.886423987189', '100.70823669433', 'taruko jorong parik nagari bukik tandang Kec. Bukit Sundi', 2, '363', '', 'curat_363'),
(41, 'LP/04/B/I/2017/Polsek Bukit Sundi', 'Sandra endrizal, 26 Th, minang, wiraswasta, gelanggang tinggi bungo harum kinari', 'LIDIK', '2017-01-31', 'Pencurian ternak 1 ekor sapi pada hari selasa 31-1-2017 Pkl 03.00 Wib di Kinari, kerugian Rp 14 juta', '-0.871331', '100.720066', 'Kinari', 2, '363', '', 'curi_biasa_362'),
(42, 'LP/01/B/I/2017/Polsek X Koto Diatas', 'Ondrisa, 55 Th, V Singkek/Minang, IRT, JorongTaramNagariSulit Air Kec. X Koto DiatasKab. Solok', 'Sita, 45 Th, Simabua/Minang, IRT, JorongTaramNagariSulit Air Kec. X kotoDiatasKab. Solok', '2017-01-20', 'Penganiayaandengancaramenggigitdanmemukulyang terjadipadahariRabutanggal 18 Januari 2017 sekitarpukul 15.30 WIB bertempat di', '-0.634748', ' 100.641409', ' SopanJorongTaramNagariSulit Air Ke. X Koto DiatasKab. Solok', 4, '352', '', 'aniaya_berat'),
(43, 'LP/02/B/I/2017/Polsek X Koto Diatas', 'Hasan basri, 39 Th, minang, swasta, Jorong Siaru nagari sulit air', 'Riko, 30 Th, Minang, Swasta, Jorong Koto gadang ', '2017-01-26', 'Penipuan uang Rp 2,7 Juta untuk masuk lampu PLN kerumah korban terjadi Bulan juli 2016', '-0.605482', '100.665099', 'Nagari Sulit Air', 4, '378 KUHP', '', 'penipuan'),
(45, 'LP/04/B/V/2017/Polsek X Koto Diatas', 'Sudirman, 34 TH, Sumpadang/ Minang, tani, JorongKubangTigoBatuLirikNagariTanjungBalitKec. X Koto DiatasKab. Solok', 'Yudi, 30 TH, Minang, Wartawan, Kel. Laing Kec. TanjungHarapan Kota Solok', '2017-05-17', 'Penganiayaan yang terjadipadahariRabutanggal 17 Mei 2017 sekitarpukul 18.20 WIB bertempat di ', '-0.648816', ' 100.662009', 'PuncakBalaiBalaiJorongKubangTigoBatuLirikNagariTanjungBalitKec. X Koto DiatasKab. Solok', 4, '', '', 'aniaya_ringan'),
(46, 'LP/05/B/I/2017/Polsek X Koto Diatas', 'Jaruna, 68 TH, Chaniago/Minang, Tani, JorongJaruaiNagariKuncirKec. X Koto DiatasKab. Solok', 'Yusnidar, 50 TH, Chaniago/Minang, Tani, JorongSawahBalaiNagariKuncirKec. X Koto DiatasKab. Solok', '2017-09-20', 'Penganiayaanringan yang terjadipadahariRabutanggal 20 september 2017 sekitarpukul 09.00 WIB bertempat di simpangsawahBalaiJorongJaruaiNagariKuncirKec. X Koto DiatasKab. Solok', '-0.723692', '100.685998', 'simpangsawahBalaiJorongJaruaiNagariKuncirKec. X Koto DiatasKab. Solok', 4, '352', '', 'curat_363'),
(47, 'LP/06/B/I/2017/Polsek X Koto Diatas', 'Fajar, 20 TH, Minang, Swasta, Banda BelantaiAmpangKualo Kota Solok', 'LIDIK', '2017-10-22', 'CuranmorHonda Supra X 125 warnahitam BA 4113 PN, Noka. MH1JB811X9K462355 Nosin. JB81E-1457579 atasnama Tutu IndrawatipadahariMinggutanggal 22 Oktober 2017 sekitarpukul 16.45 WIB bertempat di GantiangBalaiLasaNagariSibarambangKec. X Koto DiatasKab. Solok', '-0.669543', '100.700392', 'GantiangBalaiLasaNagariSibarambangKec. X Koto DiatasKab. Solok', 4, '363', '', 'curanmor_363'),
(48, 'LP/13/ II / 2017Polsek Kota Solok', 'HENDRIUS, 46 Th, Guci, Rt.1/II Kel.IX Korong Kota Solok', 'WILI CS, 21 Th. Minang, Ex\r\n Pelajar,KTK Kota Solok\r\n', '2017-02-21', 'Pengeroyokan Kamis, 06 Peb 2017 Pkl 22.00 Wib di KTK Kota Solok,  berawal saat pelapor di telp oleh Sdr Wili  dan diajak bertemu di Balai Pemuda KTK, Dan Saat sampai pelapor dipukul secara bersama2 yg mengakibatkan pelapor mengalami rasa sakit bagian kepala,', '-0.805226', '100.660583', 'KTK Solok', 6, '170 KUHP', '', 'pengeroyokan'),
(49, 'LP/14/ II / 2017Polsek Kota Solok', 'JUSNA. 52 Th, Minang, RT, Jl Yos Sudarso Rt. 1/V Kp Jawa Kota SOlok', 'YULILIANI, 34 Th, Swasta, Tj.\r\n Bingkung Kota Solok\r\n', '2017-02-21', 'Penipuan yang terjadi pada jumat tgl 18 Nov 2016 Pkl 16.00 Wib di Kp Jawa Kota Solok .Terlapor menawarkan diri menghentikan kasus yg sedang disangkakan kpd suaminya yg saat itu ditahan di Polres Solok Kota dan meminta uang Rp. 17.000.000,-. Namun suaminya  tetap di tahan dan kasusnya tetap berlanjut', '-0.784373', '100.652679', 'Kampung jawa solok', 6, '378', '', 'penipuan'),
(50, 'LP/15/ II / 2017Polsek Kota Solok', 'YUS AMRIL CANIAGO, 40 Th, Minang,Tukang, Rt.1/III ', ' Lidik', '2017-02-23', 'Pencurian hari Kamis, tgl 23 Peb 2017 Pkl 11.00 Wib di IX Korong yang mana saat istri pelapor pulang kerumah di lihat kamar sudah berantakan dan pintu belakang sudah rusak, HP beserta uang dlm celengan sudah hilang.\r\n ( Kerugian Rp.7.500.000,-)\r\n', '-0.800988', ' 100.652424', 'Kel IX Korong Kota Solok', 6, '363', '', 'curat_363'),
(51, 'LP/16/ II / 2017Polsek Kota Solok', 'H.DHARMA LIZA, 66.Minang, Dosen, Padang', 'ARJUNA, Pgl JON, 44 Th, Minang\r\n,Swsata,Jl Ks Tubun Solok\r\n', '2017-02-28', 'Pengrusakan hari senin tgl 27 Peb 2017 Pkl 08.00 Wb yang mana  saat saya mau masuk kerumah gadang saya yg di simp Denpal ternyata pagar Sudah dirusak olewh terlapor', '-0.788872', '100.654776', 'Simpang denpal Solok', 6, '406', '', 'pengrusakan'),
(52, 'LP/17/ III/ 2017Polsek Kota Solok', 'ZURAIDA JABAR, 68 Th, RT,', 'Lidik', '2017-03-06', 'Curanmor hari senin tlgl 06 Maret 2017 Pkl 07.00 Wib di jln m Tamin PPA yang mana pelapor memarkirkan sep motor  Honda Beat hitam BA 2015 KS Nora : MH1JFD214GK266285 dan Nosin JFD2E1258684  dihalaman rumah dan kunci motor  tetap di kontak sep motor tsb. Dan pelapor masuk kerumah, Saat keluar sep motor tsb tidak ada lagi.', '-0.789387', '100.660153', ' Jl M.Yamin  PPA Kota Solok', 6, '363 KUHP', '', 'curanmor_363'),
(53, 'LP/19/ III/ 2017Polsek Kota Solok', 'ZUARIDA Y, 61 Th,Pens, Jl Syeh Kukut Tj Paku Kota Solok', 'ARIF BUDIMAN,38 th,Minang, Dagang, Simp Sigege  VI Suku  Kota Solok', '2017-03-15', 'Penipuan bulan desember 2015  bertempat di BNI Cab Solok  yang mana berawal terlapor membujuk korban  agar meminjamkan sertifikat  tanah utk jaminan di Bank. Setelah uang cair  dari Bank terlapor tidak membayar angsuran di Bank\r\nKerugian Rp. 200.000.000,-', '-0.789055', '100.660841', 'KCK BANK BNI, JL.Dr.Moh Yamin', 6, '378 KUHP', '', 'penipuan'),
(54, 'LP/20/III/ 2017Polsek Kota Solok', 'JONI HARDI,42 Th, Peg BUMN, Sikumbang, Jl Tembok  Kel Laing Kota Solok', 'FITRIA S, 38 Th, Minang, Dagang, Amp Kualo Kota Solok', '2017-03-18', 'Penipuan dan penggelapan bln sep 2015  di Amp Kualo yang mana terlapor menawarkan sebidang tanah  dan pelapor membayar Rp. 55.000.000,-. Terlapor menyerahkan kwitansi  dan sertifikat, Setelah dilihat  ternyata tanah tsb tidak sesuai dg kesepakatan.Lalu terlapor meminjam sertifikat tsb dan sampai sekarang tidak dikembalikan', '-0.762617', '100.653875', 'Jl Tembok  Kel Laing Kota Solok', 6, '378 KUHP', 'pnipuan dan pengelapa.', 'penipuan'),
(55, 'LP/21/III/ 2017Polsek Kota Solok', 'ERBATSI SUSMITA, 36 Th, PNS. Jl Syeh Kukut Tj Paku Kota Solok', 'Lidik', '2017-03-24', 'Pencurian hari jumat tgl 24 april 2018 diket sekira pkl 07.00 wib di ktr bag perekonomian  saat membuat absewn kehadiran dilihat dlm lemari Laptop  tiadak ada lagi,  setelah di periksa barang2 lain berupa  3 bh laptop dan 1 unit  camera tdk ada lagi\r\nKerugian Rp. 8.000.000,-\r\n', '-0.787069', '100.658174', 'Jl Syeh Kukut Tj Paku Kota Solok', 6, '363 KUHP', '', 'curat_363'),
(56, 'LP/22/III/ 2017Polsek Kota Solok', 'ABDI MATOQIN, 62 Th, Minang, Petani, Jl Sihorok  Aro IV Korong Kota Solok', 'Lidik', '2017-03-01', 'Pencurian ternak ( 58 ekor itik ) di Aro IV Korong  hari kamis tgl 30 Maret 2017  di ketahui pkl  06.00 wib  yang mana saat pelapor hendak mengeluarkan bebek  dari kandangnya  didapatio berkurang 58 ekor, dan  melaporkan ke Polsek Kota Solok\r\nKerugian Rp. 3.600.000,-\r\n', '-0.796922', '100.653453', 'Jl Sihorok  Aro IV Korong Kota Solok', 6, '363 KUHP', '', 'curi_ternak_363'),
(57, 'LP/23/IV/ 2017Polsek Kota Solok', 'RENO OKTAFIANDRI, 18 Th, Jualan, bawah duku Kubung Kab.Solok', '1.  FADIL, 22 Th, Balai Mansiang, Sopir, Selayo Kab.Solok.\r\n2.  M.RIDWAN, 29 Th, Minang, Swasta, Sumani Kab.Solok\r\n', '2017-04-16', 'Curanmor  Yamaha No.Pol 4881 HT, minggu 16 April 2017 Pkl 17.00 Wib  di Tanjung paku Kota Solok yang mana kendaraan tsb di parkir dan korban pergi ke objek wisata Pohon Jomblo . Saat Kemba;li sep Motor tdk ada lagi', '-0.790470 ', '100.655853', 'Pasar raya kota solok', 6, '363 KUHP', '', 'curanmor_363'),
(58, 'LP/24/IV/ 2017Polsek Kota Solok', 'YENDRI LOIS, 42 Th, Minang, Swasta, Sn Bakar Kab.Solok', 'Lidik', '2017-12-04', 'Pencurian hari Selasa 18 April 2017 di Ket sekira pkl 08.00 Wib di Los Kios Jilbab pasar Raya Solok yang mana saat mau membuka kios pelapor melihat kios sudah di congkeldan barang dagangan berupa jilbab tdk ada lagi', '-0.791307', ' 100.654298', 'Pasar raya kota solok', 6, '363 KUHP', '', 'curat_363'),
(59, 'LP/25/IV/ 2017Polsek Kota Solok', 'ANDIKA, 41 Th, Minang, Swasta ,Pincuran Baruah Saok Lawe Kubung Kab.Solok', 'Lidik', '2017-04-16', 'Curanmor hari jumat tgl 21 April 2017 Pkl 21.00 Wib di Jl Patimura Tj Paku,  yang mana saat pelapor pulang dari  sungai Rumbai, Sep Mtr di parkir di halaman rumah, Saat mau berangkat sep motor tidak ada lagi.', '-0.785555', '100.666060', 'Jl Patimura Tj Paku', 6, '363 KUHP', '', 'curat_363'),
(60, 'LP/ 26 / V/ 2017 Polsek Kota Solok', 'DIDI, 47 Th, Minang, Sopir,', 'NOVI AKMAL,38 Th, Swasta, Minang, Koto Panjang', '2017-05-05', 'Penggelapan  hari rabu tgl 15  Maret 2017 Pkl 17.00 Wib yang mana terlapor meninjam mobil dan berjanji selama 10 hari,  dan sampai saat ini belum dikembalikan ,', '-0.783763', '100.664204', 'Jl. Patimura, Tj. Harapan, Kota Solok, Sumatera Barat 27317', 6, '372 KUHP', '', 'penggelapan'),
(61, 'LP/ 27 / V/ 2017 Polsek Kota Solok', 'INDRA P. MUZER, 40 Th Minang, PNS, Jl Kh Ahmad Dahlan Kota Solok', 'Lidik', '2017-05-12', 'Pencurian hari Jumat tgl 12 Mai 2017 di ket pkl 10.30 Wib di Samsat Solok yang mana saqat membayar pajak kendaraan di parkir di halana Samsat, Saat kembali dilihat kaca mobil sudah pecah dan tas yang berisi Laptop, Tablet, Hardis dan uang tdk ada lagi\r\nKerugian Rp.13.000.000,-\r\n', '-0.755064', ' 100.658803', 'Laing, Tj. Harapan, Solok, Sumatera Barat 27326', 6, '363 KUHP', '', 'curi_biasa_362'),
(62, 'LP/ 28 / V/ 2017 Polsek Kota Solok', 'ERINAL DIANTO,41 Th, Minang, PNS, Nag Tj Bingkung Kubung Kab.Solok\r\nKorban : ONIK, 17, RT, Jrg Durian Tj Bingkung Kab  Solok\r\n', 'Lidik', '2017-05-14', 'Penganiayaan hari Minggu tgl 14 Mai 2017 Pkl 11.00 Wib di Payo yang mana saat menumpang ojek ketika hendak ke Bandar Pandung, Sampai di Payo korban di turunkan  dan kepala korban dipukul oleh terlapor menggunakan balok sehingga kepala korban luka mendapat 4 jahitan ', '-0.790027', ' 100.650714', 'Jl. DR. Hamka, Vi Suku, Lubuk Sikarah, Kota Solok, Sumatera Barat 27317', 7, '351 KUHP', '', 'aniaya_berat'),
(63, 'LP/ 29 / V/ 2017 Polsek Kota Solok', 'NUSYIRWAN NURSIN, 64 Th, Minang, Pensiunan, Jl Kh Dewantoro Tyanah Garam Kota Solok', 'DELFITA  HENDRIATI,         , ', '2017-05-15', 'Penipuan dan penggelapan Kamis 27 Apr 2017 Pkl 16.00 Wib di Sawah Aro Tj paku yang mana terlapor meminjam uang ke pada Pelapor  utk modak usaha Rp. 34.000.000,- yang akan dibayar  tgl 12 Mai 2017. Namun sampai sekarang belum di bayar', '-0.788248', ' 100.657674', 'Jl. Syech Kukut No.23, Tj. Paku, sawah aro, Kota Solok, Sumatera Barat 27317', 6, '372 KUHP', 'penipian dan pengelapan', 'penggelapan'),
(64, 'LP/ 30 / V/ 2017 Polsek Kota Solok', 'ROZI ZALDI, 24 Th, Minang, Swasta,Aro IV Korong Kota Solok', 'IVO, 20 Th, Minang, Ex Pelajar, Kandang Aur Simp Rumbio Kota Solok.', '2017-05-07', 'Penganiayaan di  hari Rabu tgl 17 Mai 2017 Pkl 02.00 Wib , yang mana saat pelapor sedang ronda datang terlapor dan mengambil rokok pelapor, Lalu Pelapor tegur dan terlapor tersinggung lansung memukul mata dan muka pelapor hingga memar.', '-0.793107', '100.666412', 'Jl. Tj. Paku, Kota Solok, Sumatera Barat', 6, '351 KUHP', '', 'aniaya_ringan'),
(65, 'LP/ 31 / V/ 2017 Polsek Kota Solok', 'RIA WARDI M. 38 Th, Minang, Dagang, Cupak Gn Talang Kab. Solok', 'LIA  PERMATA SARI, 32 Th, Minang, Dagang, Batu gadang Simp Rumbio Kota Solok', '2017-05-08', 'Penganiayaan Kamis 18 Mai 2017 Pkl 15.30 Wib di Pasar Raya Solok yang mana terlapor datang ke kedai pelapor dan mengeluarkan kata â€“ kata Kotor . Pelapor tidak senang terjadi penganiayaan  mengakibatkan Muka pelapor luka ', '-0.790492', ' 100.655542', 'Jalan Dt. Perpatih Nan Sabatang, Pasar Pandan Air Mati, Tanjung Harapan, Ps. Pandan Air Mati, Tj. Harapan, Kota Solok, Sumatera Barat 27317', 6, '351 KUHP', '', 'aniaya_ringan'),
(66, 'LP/ 32 / V/ 2017 Polsek Kota Solok tg', 'LIA  PERMATA SARI, 32 Th, Minang, Dagang, Batu gadang Simp Rumbio Kota Solok', 'RIA WARDI M. 38 Th, Minang, Dagang, Cupak Gn Talang Kab. Solok', '2017-05-08', 'Penganiayaan Kamis, 18 Mai 2017 Pkl 15.30 wib di Pasar raya Solok yang manaterlapor datang ke kedai pelapor dan mengeluarkan kata kata Koror sehingga terjadi penganiayaan.', '-0.790577', '100.656132', 'Jalan Dt. Perpatih Nan Sabatang, Pasar Pandan Air Mati, Tanjung Harapan, Ps. Pandan Air Mati, Tj. Harapan, Kota Solok, Sumatera Barat 27317', 6, '351 KUHP', '', 'curat_363'),
(67, 'LP/ 33 / V/ 2017 Polsek Kota Solok', 'DADANG RUKMANA, 57 Th, Sunda, PNS, Kompl Balitro Laing Kota Solok', 'Lidik', '2017-05-28', 'Pencurian kulit manis  senin, 22 Mai 2017 di ketahui  pkl 08.30 Wib  di Balitbu laing yang mana saat mencek pohon kulit manas dilihat kulitnya sudah dicuri', '-0.739608', '100.622065', 'Jalan Raya Solok Aripan KM 8, Aripan, X Koto Singkarak, Aripan, X Koto Singkarak, Solok, Sumatera Barat 27356', 1, '363 KUHP', '', 'curat_363'),
(68, 'LP/ 34 / V/ 2017 Polsek Kota Solok', 'ASMARWATI, 54 Th, Minang, Swasta,.Sawah Sianik Nan Balim Kota Solok', 'Lidik', '2017-05-28', 'Curanmor Yamaha Mio  BA 6338 PM hari Minggu 28 Mai 2017 sekira pkl 10.30 Wib di Dihalaman Ruko Man Tanjung yang mana saat pelapor hendak pulang keruah dilihat sep motor yang di parkir tdk ada lagi\r\nNora : MH328D0039K788149\r\nNosin : 28D-788045\r\nKerugia : Rp  7.000.000,-', '-0.784095', '100.654784', 'Jl. Sawah Sianik Nan Balimo\r\nTj. HarapanKota Solok Sumatera Barat', 6, '363 KUHP', '', 'curanmor_363'),
(69, 'LP/ 35/ V/ 2017 Polsek Kota Solok ', 'RUDI SURYANTO, 58 Th, Minang, PNS, Jl Surakarta No.E2 Surau Gadang Nanggalo Kota Padang', 'Lidik', '2017-06-02', 'Pencurian  hari jumat tgl 02 Juni 2017 Pkl 11.30 Wib di By pass Kota solok yang mana saata pelapor  sedang menanmbal ban  datang terlapor membuka pintu sebelah kiri mobil dan memgambil tas yg berisi BPKB Mobil No Pol B 8166 YJ, 2 bh BPKB Sep Motor dan buku Tabungan Bank Nagari  yang berada di jok belakang,  kerugian Rp.5.000.000', '-0.793171', '100.666369', 'Jl. Tj. Paku Aro IV Korong Lubuk Sikarah Solok\r\nSumatera Barat', 6, '362 KUHP', '', 'curat_363'),
(70, 'LP/ 36 / V/ 2017 Polsek Kota Solok ', 'ARJUNA NUSA BAKTi, 46 Th, Minang, Tani, Jl Ks Tubun No. 23 Kp Jawa Kota Solok', 'DARMALIZA, 60 Th, Minang, Dosen, Jl Ks Tubun Kp Jawa Kota Solok', '2017-06-06', 'Penganiayaan pada hari selasa tgl 06 Juni 2017 Pkl 17.00 Wib di Rumah gadang Simpang Denpal yang mana saat [pelapor sedang membersihkan teras rumah datang terlapor dan melarang, pelapor tdk mau menghentikan pekerjaannya sehingga pelapor memukul rahang sebelah kiri pelapor', '-0.788855', '100.654936', 'JL. K.S Tubun No. 21 C, Kampung Jawa - Simpang Denpal, Solok, Pasar Pandan Air Mati, Tanjung Harapan, Solok City, West Sumatra 27317', 6, '351 KUHP', '', 'aniaya_ringan'),
(71, 'LP/ 37/ VI/ 2017 Polsek Kota Solok tgl 07 Juni    ', 'ENI MARYANI, 54 Th, PNS, Selayo Tanang Bk Sileh Kab.Solok', 'Lidik', '2017-06-07', 'Pencurian dg kekerasan ( Jambret )  Hari Rabu tgl 07 Juni 2017 Pkl 15.00 Wib di By Paas Kota Solok yang mana saat korban turun dari mobil datang pelaku mengendaraai sep motor dan merampas tas  korban yang berisi uang Rp. 38.000.000 dan terjadi tarik menarik tas tsb dan akhirnya pelaku berhasil membawa tas korban', '-0.793193100', '100.666337', 'Jl. Tj. Paku\r\nAro IV Korong\r\nLubuk Sikarah\r\nSolok\r\nSumatera Barat', 6, '365 KUBP', '', 'curas_365'),
(72, 'LP/ 38/ VI/ 2017 Polsek Kota Solok tgl 28  Juni   ', 'RANI SILVIA, 28 Th. RT, Kandang Aur Simp Rumbio Kota Solok', 'Lidik', '2017-06-28', 'Pencurian  hart Rabu tgl 28 Juni 2017 seikar Pkl 03.30 Wib yang mana korban membeli nasi kepasr dan saat kembali dilihat pintu sudah rusak dan TV Mer Sanken 24 inc, Laptop dan HP Tidak Ada lagi, Kerugian Rp.3.000.000,-', '-0.792182', '100.666565', 'Jl. Tj. Paku\r\nKota Solok\r\nSumatera Barat', 6, '363 KUHP', '', 'curat_363'),
(73, 'LP/ 39/ VII/ 2017 Polsek Kota Solok tgl 10 Juli   ', 'ARNI YULIS, 37 Th, PNS, Minang, Ampang Kualo Kota Solok ', '1.  AFRIYANTI, 47 Th, Swasta, Nan Balimo Kota Solok\r\n2.  DEDEK, 21 Th, Mhs, Nan Balimo Kota Solok\r\n', '2017-07-10', 'Penganiayaan Senin, 10 Juli 2017 Pkl 18.15 di Simpang Berok yang mana saat korban sedang berboncengan datang pelaku yang menggunakan sep motor memukul korban , Setelah korban turun dari sep motor pelaku bergantian memukul Korban.', '-0.789443', '100.655307', 'Jalan Pemuda, Ps. Pandan Air Mati, Tj. Harapan, Kota Solok, Sumatera Barat 27317', 6, '170 KUHP', '', 'aniaya_ringan'),
(74, 'LP/ 40/ VII/ 2017 Polsek Kota Solok ', 'RISNA WARDI, 47 Th, Minang, Dagang,  Jl Sihorok No. 125 Aro IV Korong Kota Solok', 'DONI, 32 Th, Minang, Swasta,  Dsn Subarang Kota Pariaman.', '3017-07-13', 'Penggelapan bulan Mai 2017 Di Ampang Kualo Kota Solok yang mana berawal yang mana korban meminjamkan sep Motor Mio untuk berdagang,Namun Sampai sekarang sep motor tersebut tidak dikembalikan.', '-0.766250', ' 100.647357', 'Kp. Jawa, Tj. Harapan, Solok, Sumatera Barat 27321', 6, '372 KUHP', '', 'penggelapan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jumlah_kriminalitas`
--
ALTER TABLE `jumlah_kriminalitas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `konten`
--
ALTER TABLE `konten`
  ADD PRIMARY KEY (`id_konten`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `titik_kriminal`
--
ALTER TABLE `titik_kriminal`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jumlah_kriminalitas`
--
ALTER TABLE `jumlah_kriminalitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `konten`
--
ALTER TABLE `konten`
  MODIFY `id_konten` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `titik_kriminal`
--
ALTER TABLE `titik_kriminal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
