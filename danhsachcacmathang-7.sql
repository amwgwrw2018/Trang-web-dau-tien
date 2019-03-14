-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 08, 2017 lúc 07:06 CH
-- Phiên bản máy phục vụ: 10.1.21-MariaDB
-- Phiên bản PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `danhsachcacmathang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethanghoatronghoadon`
--

CREATE TABLE `chitiethanghoatronghoadon` (
  `MaHoaDon` int(15) NOT NULL,
  `MaMatHang` int(255) NOT NULL,
  `SoLuongDatMua` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `chitiethanghoatronghoadon`
--

INSERT INTO `chitiethanghoatronghoadon` (`MaHoaDon`, `MaMatHang`, `SoLuongDatMua`) VALUES
(3, 12, 1),
(4, 12, 1),
(5, 12, 1),
(6, 12, 1),
(7, 12, 1),
(8, 12, 1),
(9, 7, 1),
(10, 7, 1),
(11, 12, 19),
(11, 16, 1),
(12, 7, 1),
(13, 12, 1),
(14, 12, 1),
(15, 7, 7),
(16, 7, 1),
(16, 12, 1),
(16, 16, 1),
(17, 7, 10),
(17, 12, 10),
(17, 16, 10),
(18, 7, 1),
(19, 16, 2),
(19, 39, 1),
(20, 12, 1),
(21, 12, 1),
(22, 12, 1),
(22, 16, 1),
(23, 3, 1),
(23, 12, 5),
(24, 3, 1),
(24, 39, 1),
(25, 49, 220),
(26, 38, 1),
(26, 44, 3),
(27, 12, 4),
(27, 16, 1),
(28, 4, 33),
(28, 44, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhsachmamathang`
--

CREATE TABLE `danhsachmamathang` (
  `MaLoaiMatHang` varchar(20) NOT NULL,
  `TenLoaiMatHang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `danhsachmamathang`
--

INSERT INTO `danhsachmamathang` (`MaLoaiMatHang`, `TenLoaiMatHang`) VALUES
('01', 'kyquan'),
('02', 'nhadandung'),
('03', 'denchua'),
('04', 'kientrucchauau'),
('05', 'nhanvathoathinh'),
('06', 'dongvat'),
('07', 'xecogioi'),
('08', 'caycoi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `MaDonHang` int(15) NOT NULL,
  `MaHoaDon` int(15) DEFAULT NULL,
  `NgayTaoDonHang` datetime DEFAULT NULL,
  `TrangThaiThanhToan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `tongTien` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`MaDonHang`, `MaHoaDon`, `NgayTaoDonHang`, `TrangThaiThanhToan`, `tongTien`) VALUES
(1, 21, '2017-06-08 17:37:54', 'Đã Thanh Toán', 400000),
(2, 28, '2017-06-08 18:55:02', 'Chưa Thanh Toán', 12650000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHoaDon` int(15) NOT NULL,
  `MaKhachHang` bigint(255) DEFAULT NULL,
  `HinhThucThanhToan` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `NgayCapNhatHoaDon` datetime DEFAULT NULL,
  `GhiChu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  `tenNguoiNhanThayThe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `diaChiThayThe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `soDienThoaiThayThe` char(15) DEFAULT NULL,
  `trangthaixacnhan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHoaDon`, `MaKhachHang`, `HinhThucThanhToan`, `NgayCapNhatHoaDon`, `GhiChu`, `tenNguoiNhanThayThe`, `diaChiThayThe`, `soDienThoaiThayThe`, `trangthaixacnhan`) VALUES
(3, 9, 'Thanh Toán Bằng Thẻ ATM', '2017-05-20 04:22:49', '', NULL, NULL, NULL, 0),
(4, 9, 'Thanh Toán Bằng Thẻ ATM', '2017-05-20 04:23:52', '', NULL, NULL, NULL, 0),
(5, 9, 'Thanh Toán Bằng Thẻ ATM', '2017-05-20 04:25:33', '', NULL, NULL, NULL, 0),
(6, 9, 'Thanh Toán Bằng Thẻ ATM', '2017-05-20 04:26:04', '', NULL, NULL, NULL, 0),
(7, 9, 'Thanh Toán Bằng Thẻ ATM', '2017-05-20 04:27:21', '', NULL, NULL, NULL, 0),
(8, 9, 'Thanh Toán Bằng Thẻ ATM', '2017-05-20 04:27:35', '', NULL, NULL, NULL, 0),
(9, 9, 'Thanh Toán Bằng Thẻ ATM', '2017-05-20 04:28:48', '', NULL, NULL, NULL, 0),
(10, 11, 'Thanh Toán Bằng Thẻ ATM', '2017-05-21 04:51:45', '', 'loan', 'tphcm', '0916532456', 0),
(11, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-05-22 04:23:49', 'giao sớm', 'rảnh', 'TPHCM', '1111111111', 0),
(12, 14, 'Thanh Toán Bằng Thẻ ATM', '2017-05-22 08:54:05', 'giao nhanh', 'nguyễn ánh', '6A Việt Trì', '0956231456', 0),
(13, 15, 'Thanh Toán Bằng Thẻ ATM', '2017-05-23 01:33:19', '', 'Nhựt', 'Google', '0932635603', 0),
(14, 17, 'Thanh Toán Bằng Thẻ ATM', '2017-05-24 09:31:24', 'test ghi chu', 'ahashserh', 'TEST GOOGLE', '2046565646', 0),
(15, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-05-24 10:07:03', '', NULL, NULL, NULL, 0),
(16, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-05-24 10:08:43', '', NULL, NULL, NULL, 0),
(17, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-05-24 10:09:45', '', NULL, NULL, NULL, 0),
(18, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-05-25 04:18:57', '', NULL, NULL, NULL, 0),
(19, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-05-29 07:15:40', '', NULL, NULL, NULL, 0),
(20, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-05-31 16:08:00', 'ghi chú ttt', NULL, NULL, NULL, 0),
(21, 1, 'Thanh Toán Bằng Thẻ ATM', '2017-06-05 19:28:46', '', NULL, NULL, NULL, 1),
(22, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-06-05 19:38:32', '', NULL, NULL, NULL, 0),
(23, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-06-05 19:42:04', '', NULL, NULL, NULL, 0),
(24, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-06-05 19:47:48', '', NULL, NULL, NULL, 0),
(25, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-06-07 20:12:37', '', NULL, NULL, NULL, 0),
(26, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-06-08 10:31:29', 'giao thiệt sớm', NULL, NULL, NULL, 0),
(27, 12, 'Thanh Toán Bằng Thẻ ATM', '2017-06-08 12:55:09', '', 'sdsd', 'fgdfdfhfh', '01234567890', 0),
(28, 1, 'Thanh Toán Bằng Thẻ ATM', '2017-06-08 18:52:50', '', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKhachHang` bigint(255) NOT NULL,
  `ten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `gioitinh` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  `birthday` text,
  `diachi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  `SoDienThoai` varchar(20) DEFAULT NULL,
  `MaTaiKhoan` bigint(255) DEFAULT NULL,
  `facebookName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `facebookID` varchar(255) DEFAULT NULL,
  `GoogleId` varchar(255) DEFAULT NULL,
  `GoogleName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKhachHang`, `ten`, `gioitinh`, `birthday`, `diachi`, `SoDienThoai`, `MaTaiKhoan`, `facebookName`, `facebookID`, `GoogleId`, `GoogleName`) VALUES
(1, 'nhut', 'nam', '1996-1-2', '7B,Ninh Thuận', '0956412356', 1, NULL, NULL, NULL, NULL),
(4, 'Long', 'male', '2003-3-22', '7B,HCM', '0213232565', 3, NULL, NULL, NULL, NULL),
(5, 'Nhan', 'male', '1993-3-4', 'TPHCm', '1234567890', 4, NULL, NULL, NULL, NULL),
(6, 'Thảo', 'male', '1996-5-8', 'TPHCM', '1234567890', 5, NULL, NULL, NULL, NULL),
(7, 'Vũ', 'male', '2001-4-6', 'TPHCM Việt Nam', '0232565656', 6, NULL, NULL, NULL, NULL),
(8, 'xuân', 'female', '1997-5-8', '6A tphcm', '1234567890', 7, NULL, NULL, NULL, NULL),
(9, 'Tuấn', 'male', '2001-6-6', 'TPHCM', '5454544545', 8, NULL, NULL, NULL, NULL),
(11, NULL, 'female', NULL, NULL, NULL, NULL, 'Lê Thị Hoàng', '106246829961354', NULL, NULL),
(12, 'Vũ Tuấn Nam', 'female', '1997-4-18', 'Long An', '0962156321', 9, NULL, NULL, NULL, NULL),
(14, NULL, 'female', NULL, NULL, NULL, NULL, 'Văn A Lê', '107454256507567', NULL, NULL),
(15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '100190618006454550934', 'Tấn Nhựt Nguyễn'),
(16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
(17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '104674480402976582891', 'Nhựt Nguyễn Tấn'),
(18, 'khánh', 'male', '1992-3-3', 'TPHCM', '0932653623', 11, NULL, NULL, NULL, NULL),
(19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '101585686807167977542', 'Nhựt Nguyễn Tấn'),
(20, NULL, NULL, NULL, NULL, NULL, NULL, 'Tấn Nhựt Nguyễn', '1939487532946918', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsugiamathang`
--

CREATE TABLE `lichsugiamathang` (
  `MaMatHang` int(255) NOT NULL,
  `dongia` bigint(20) NOT NULL,
  `ngaycapnhat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `lichsugiamathang`
--

INSERT INTO `lichsugiamathang` (`MaMatHang`, `dongia`, `ngaycapnhat`) VALUES
(1, 200000, '2017-05-11 06:37:36'),
(1, 200000, '2017-05-11 14:02:06'),
(2, 350000, '2017-04-22 00:00:00'),
(3, 500000, '2017-04-22 00:00:00'),
(4, 350000, '2017-04-22 00:00:00'),
(7, 850000, '2017-05-16 17:07:42'),
(10, 600000, '2017-04-22 00:00:00'),
(11, 700000, '2017-04-22 00:00:00'),
(12, 400000, '2017-04-22 00:00:00'),
(13, 750000, '2017-04-22 00:00:00'),
(14, 700000, '2017-04-22 00:00:00'),
(15, 650000, '2017-04-29 00:00:00'),
(15, 700000, '2017-04-22 00:00:00'),
(16, 399000, '2017-04-29 00:00:00'),
(16, 700000, '2017-04-22 00:00:00'),
(17, 600000, '2017-04-23 00:00:00'),
(18, 350000, '2017-04-29 00:00:00'),
(19, 230000, '2017-04-29 00:00:00'),
(20, 200000, '2017-04-29 00:00:00'),
(21, 150000, '2017-04-29 00:00:00'),
(23, 320000, '2017-04-29 00:00:00'),
(24, 600000, '2017-05-07 00:00:00'),
(25, 750000, '2017-05-07 00:00:00'),
(26, 450000, '2017-05-07 00:00:00'),
(27, 200000, '2017-05-13 00:00:00'),
(27, 200000, '2017-05-21 11:15:12'),
(31, 1500000, '2017-05-21 08:26:21'),
(31, 1500000, '2017-05-21 10:47:13'),
(31, 1500000, '2017-05-21 10:48:53'),
(31, 1500000, '2017-05-21 11:14:11'),
(31, 1500000, '2017-05-21 11:14:26'),
(32, 500000, '2017-05-24 09:39:28'),
(35, 950000, '2017-05-24 09:44:23'),
(35, 950000, '2017-05-27 01:08:44'),
(37, 1200000, '2017-05-24 09:47:51'),
(38, 1000000, '2017-05-24 09:48:59'),
(39, 1300000, '2017-05-24 09:53:24'),
(40, 1000000, '2017-05-24 09:54:52'),
(41, 1200000, '2017-05-24 09:55:48'),
(42, 1200000, '2017-05-30 01:40:12'),
(43, 1100000, '2017-05-30 01:49:54'),
(44, 1100000, '2017-06-06 04:29:32'),
(46, 1200000, '2017-06-06 04:33:40'),
(47, 1200000, '2017-06-06 04:39:06'),
(48, 1000000, '2017-06-06 04:45:31'),
(49, 1200000, '2017-06-06 04:47:06'),
(50, 1000000, '2017-06-06 04:52:18'),
(50, 1000000, '2017-06-06 04:52:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mathang`
--

CREATE TABLE `mathang` (
  `MaMatHang` int(255) NOT NULL,
  `tenmathang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `mota` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  `MaNhaSanXuat` varchar(255) NOT NULL,
  `MaLoaiMatHang` varchar(20) NOT NULL,
  `soluongconlai` int(11) NOT NULL,
  `luotXem` bigint(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `mathang`
--

INSERT INTO `mathang` (`MaMatHang`, `tenmathang`, `img`, `mota`, `MaNhaSanXuat`, `MaLoaiMatHang`, `soluongconlai`, `luotXem`) VALUES
(1, 'tháp eiffel', 'image/effel.jpg', 'Tháp nổi tiếng của Pháp,biểu tượng của nước pháp', 'P03', '01', 99, 32),
(2, 'mô hình tháp nghiêng PISA', 'image/pisa.jpg', 'Mô Hình Tháp Nghiêng PISA là mô hình thu nhỏ từ một kiến trúc nổi tiếng đó là Tháp Nghiêng PISA ,chế tạo từ vật liều nhôm cao cấp từ Mỹ và độ tinh tế đến từ milimet', 'P03', '01', 100, 9),
(3, 'lâu đài giấy', 'image/castle.jpg', 'Mô hình lâu đài được làm từ giấy lụa cao cấp Hàn Quốc , được thiết kế và gia công đẹp mắt , sống động ', 'P02', '04', 98, 16),
(4, 'mô hình Hatsune Miku', 'image/miku.jpg', 'Mô Hình Hatsune Miku', 'P01', '05', 67, 10),
(5, 'mô hình Batman', 'image/batman.jpg', 'Mô hình nhân vật Batman', 'P05', '05', 100, 8),
(6, 'Thành Sunpu', 'image/japanCastle.jpg', 'Mô Hình Thành Sunpu', 'P03', '03', 100, 8),
(7, 'Mô hình búp bê Shinku', 'image/shinku.jpg', 'Mô hình búp bê Shinku thiết kế từ nhựa Lattic cao cấp từ Nhật , thiết kế nhân vật như thật , vô cùng đẹp mắt và sinh động', 'P01', '05', 0, 29),
(10, 'Kim Tự Tháp Ai Cập', 'image/kimtuthap.jpg', 'Mô hình kim tự tháp cổ xưa tại Ai Cập', 'P04', '01', 100, 16),
(11, 'Nhà Hát Opera Úc', 'image/OperaHouse.jpg', 'Mô Hình Nhà Hát Opera tại Úc', 'P02', '01', 100, 14),
(12, 'Chùa Một Cột', 'image/chuaMotCot.jpg', 'Mô hình chùa một cột tại Việt Nam', 'P01', '03', 40, 18),
(13, 'Mô hình búp bê Suiseiseki', 'image/suiseiseki.jpg', 'Đây là mô hình nhân vật hoạt hình nổi tiếng búp bê Suiseiseki , thiết kế tỉ mĩ ,sống động và siêu dễ thương', 'P04', '05', 100, 9),
(14, 'Mô hình búp bê Souseiseki', 'image/souseiseki.jpg', 'Mô hình búp bê Souseiseki được thiết kế tinh tế và được chế tạo từ vật liệu nhựa cao cấp của Nhật ', 'P05', '05', 100, 12),
(15, 'Mô Hình Saber', 'image/saber.jpg', 'Mô hình nhân vật Saber trong Fate Stay Night', 'P02', '05', 95, 11),
(16, 'Mô hình búp bê Dark Saber', 'image/darkSaber.jpg', 'Mô hình búp bê Dark Saber là một thiết kế hoàn mỹ về nhân vật hoạt hình Dark Saber', 'P01', '05', 84, 14),
(17, 'Mô Hình Kanna', 'image/kanna.png', 'Mô Hình Bé Rồng Kanna', 'P03', '05', 100, 12),
(18, 'Mô Hình Cây Số 1', 'image/tree1.jpg', 'Mô Hình Cây Dùng Cho Việc Trang Trí Phong Cảnh', 'P03', '08', 50, 9),
(19, 'Mô Hình Cây Số 2', 'image/tree2.jpg', 'Mô Hình Cây Dùng Cho Việc Trang Trí Phong Cảnh', 'P03', '08', 50, 10),
(20, 'Mô Hình Cây Số 3', 'image/tree3.jpg', 'Mô Hình Cây Dùng Cho Việc Trang Trí Phong Cảnh', 'P03', '08', 50, 8),
(21, 'Mô Hình Cây Số 4', 'image/tree4.jpg', 'Mô Hình Cây Dùng Cho Việc Trang Trí Phong Cảnh', 'P03', '08', 60, 10),
(23, 'Mô Hình Cây Mùa Thu', 'image/autuumtree.jpg', 'Mô hình cây vào mùa thu', 'P02', '08', 50, 9),
(24, 'Mô Hình Xe Hơi', 'image/car.jpg', 'Mô Hình Xe Phù Hợp Cho Việc Trang Trí', 'P02', '07', 75, 8),
(25, 'Mô Hình Xe Hơi 2', 'image/car2.jpg', 'Mô Hình Xe Dùng Cho Trang Trí', 'P03', '07', 75, 8),
(26, 'Mô Hình Hổ Con', 'image/tiger.jpg', 'Mô Hình Hổ Dùng Cho Trang Trí', 'P02', '06', 80, 8),
(27, 'Mô Hình Sói', 'image/wolf.jpg', 'Mô Hình Sói Trang Tri', 'P02', '06', 78, 7),
(29, 'mô hình nhân vật zoro', 'image/zoro.jpg', 'Mô Hình Nhân Vật Zoro được chế tạo từ chất liệu Nhựa PolyMatic từ Nhật Bản và thiết kế theo mô hình 4D đầy sống động', 'P03', '05', 100, 8),
(30, 'mô hình nhà kiểu châu âu', 'image/nhaTrungCo.jpg', 'house', 'P02', '02', 100, 8),
(31, 'Xe Số 11', 'image/carIcon.png', 'Mô Hình Xe 333333333333', 'P03', '07', 100, 0),
(32, 'Cây Mô Hình Số 8', 'image/cayso1.jpg', 'Mô Hình Cây Cối Trang Trí', 'P03', '08', 100, 0),
(35, 'Mô Hình Cây Đa', 'image/cayda.jpg', 'Mô Hình Cây Trang Trí Cho Nhà', 'P01', '08', 100, 5),
(37, 'Nhà Châu Âu 1', 'image/chauau1.jpg', 'Mô Hình Nhà Châu Âu', 'P01', '04', 0, 8),
(38, 'Mô Hình Nhà Châu Âu 2', 'image/chauau2.jpg', 'Mô Hình Trang Trí Nhà Châu Âu', 'P03', '04', 99, 8),
(39, 'Mô Hình Nhà Châu Âu 3', 'image/chauau3.jpg', 'Mô Hình Trang Trí Nhà Châu Âu 3', 'P01', '07', 98, 1),
(40, 'Mô Hình Châu Âu 4', 'image/chauau4.jpg', 'Mô Hình Trang Trí Nhà Châu Âu', 'P03', '04', 100, 16),
(41, 'Mô Hình Châu Âu 5', 'image/chauau5.jpg', 'Mô Hình Nhà Châu Âu Trang Trí', 'P04', '04', 100, 7),
(42, 'Mô Hình Thần Đạo', 'image/thandao.jpg', 'Mô Hình Đền Thờ Thần Đạo Nhật Bản', 'P04', '03', 500, 1),
(43, 'Mô hình tháp phật giáo', 'image/towerbuhha.jpg', 'Mô hình tháp thường thấy ở các nước đông á', 'P04', '03', 250, 0),
(44, 'Mô Hình SaiKa(Touhou)', 'image/saika.jpg', 'Mô Hình Saika Trong Touhou', 'P01', '05', 216, 1),
(46, 'Mô Hình Enma(Touhou)', 'image/enma.jpg', 'Mô Hình Enma trong Touhou', 'P02', '05', 220, 0),
(47, 'Mô Hình Flandre Scarlet(Touhou)', 'image/flandre.jpg', 'Mô Hình Flandre Scarlet trong Touhou', 'P02', '05', 220, 0),
(48, 'Nhà Dân Dụng 1', 'image/livinghouse.jpg', 'Mô Hình Nhà Dân Dụng ', 'P02', '02', 220, 0),
(49, 'Nhà Dân Dụng 2', 'image/livinghouse2.jpg', 'Mô Hình Nhà Dân Dụng 2 ', 'P02', '02', 0, 0),
(50, 'Nhà Dân Dụng 3', 'image/livinghouse3.jpg', 'Mô Hình Nhà Dân Dụng 3', 'P01', '02', 220, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhasanxuat`
--

CREATE TABLE `nhasanxuat` (
  `MaNhaSanXuat` varchar(255) NOT NULL,
  `TenNhaSanXuat` varchar(255) DEFAULT NULL,
  `NgayThanhLap` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `nhasanxuat`
--

INSERT INTO `nhasanxuat` (`MaNhaSanXuat`, `TenNhaSanXuat`, `NgayThanhLap`) VALUES
('P01', 'Good Smile', '2004-02-01'),
('P02', 'Max Factory', '2004-02-01'),
('P03', 'Kotobukiya', '2004-02-01'),
('P04', 'Alter', '2004-02-01'),
('P05', 'Kaiyodo', '2004-02-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `soluongkhachhangtruycap`
--

CREATE TABLE `soluongkhachhangtruycap` (
  `soluongkhachhangtruycapweb` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `soluongkhachhangtruycap`
--

INSERT INTO `soluongkhachhangtruycap` (`soluongkhachhangtruycapweb`) VALUES
(2185);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MaTaiKhoan` bigint(255) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `ngaydangkytaikhoan` datetime DEFAULT NULL,
  `NgayPassWordDuocThayDoi` datetime DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `quyenHan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`MaTaiKhoan`, `Username`, `pass`, `ngaydangkytaikhoan`, `NgayPassWordDuocThayDoi`, `Email`, `quyenHan`) VALUES
(1, 'AMWGWRW', '48690', '2017-04-22 00:00:00', '2017-04-22 00:00:00', 'abc@gmail.com', 1),
(3, 'nhan', '49', '2017-05-13 02:19:47', '2017-05-13 02:19:47', 'a@gmail.com', 0),
(4, 'thao', '49', '2017-05-15 09:35:36', '2017-05-15 09:35:36', 'h@gmail.com', 0),
(5, 'dragon', '49', '2017-04-26 00:00:00', '2017-05-11 09:59:01', 'long@gmail.com', 0),
(6, 'storm', '48690', '2017-05-08 00:00:00', '2017-05-08 00:00:00', 'sf@gmail.com', 0),
(7, 'xuancute', '1660192414', '2017-05-08 00:00:00', '2017-05-20 04:43:50', 'tannhut1391997@gmail.com', 0),
(8, 'tuan', '49', '2017-05-20 04:11:35', '2017-05-20 04:16:48', 'abs@gmail.com', 0),
(9, 'nam', '49', '2017-05-21 07:57:49', '2017-05-21 07:57:49', 'vu@gmail.com', 0),
(10, 'themm', '-479881500', '2017-05-21 08:31:02', '2017-06-05 05:18:42', 'abc111@gmail.com', 0),
(11, 'khanh', '123', '2017-05-27 02:16:41', '2017-05-27 02:16:41', 'khanh@gmail.com', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethanghoatronghoadon`
--
ALTER TABLE `chitiethanghoatronghoadon`
  ADD PRIMARY KEY (`MaHoaDon`,`MaMatHang`);

--
-- Chỉ mục cho bảng `danhsachmamathang`
--
ALTER TABLE `danhsachmamathang`
  ADD PRIMARY KEY (`MaLoaiMatHang`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`MaDonHang`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHoaDon`),
  ADD KEY `MaKhachHang` (`MaKhachHang`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKhachHang`),
  ADD KEY `MaTaiKhoan` (`MaTaiKhoan`);

--
-- Chỉ mục cho bảng `lichsugiamathang`
--
ALTER TABLE `lichsugiamathang`
  ADD PRIMARY KEY (`MaMatHang`,`dongia`,`ngaycapnhat`);

--
-- Chỉ mục cho bảng `mathang`
--
ALTER TABLE `mathang`
  ADD PRIMARY KEY (`MaMatHang`),
  ADD KEY `MaNhaSanXuat` (`MaNhaSanXuat`),
  ADD KEY `MaLoaiMatHang` (`MaLoaiMatHang`);

--
-- Chỉ mục cho bảng `nhasanxuat`
--
ALTER TABLE `nhasanxuat`
  ADD PRIMARY KEY (`MaNhaSanXuat`);

--
-- Chỉ mục cho bảng `soluongkhachhangtruycap`
--
ALTER TABLE `soluongkhachhangtruycap`
  ADD PRIMARY KEY (`soluongkhachhangtruycapweb`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`MaTaiKhoan`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `MaDonHang` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MaHoaDon` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MaKhachHang` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT cho bảng `mathang`
--
ALTER TABLE `mathang`
  MODIFY `MaMatHang` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `MaTaiKhoan` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethanghoatronghoadon`
--
ALTER TABLE `chitiethanghoatronghoadon`
  ADD CONSTRAINT `chitiethanghoatronghoadon_ibfk_1` FOREIGN KEY (`MaHoaDon`) REFERENCES `hoadon` (`MaHoaDon`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`);

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `taikhoan` (`MaTaiKhoan`);

--
-- Các ràng buộc cho bảng `lichsugiamathang`
--
ALTER TABLE `lichsugiamathang`
  ADD CONSTRAINT `lichsugiamathang_ibfk_1` FOREIGN KEY (`MaMatHang`) REFERENCES `mathang` (`MaMatHang`);

--
-- Các ràng buộc cho bảng `mathang`
--
ALTER TABLE `mathang`
  ADD CONSTRAINT `mathang_ibfk_1` FOREIGN KEY (`MaNhaSanXuat`) REFERENCES `nhasanxuat` (`MaNhaSanXuat`),
  ADD CONSTRAINT `mathang_ibfk_2` FOREIGN KEY (`MaLoaiMatHang`) REFERENCES `danhsachmamathang` (`MaLoaiMatHang`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
