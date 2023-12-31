USE [master]
GO
/****** Object:  Database [DB_MICU]    Script Date: 30/12/2022 08:48:08 ******/
CREATE DATABASE [DB_MICU]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_MICU', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_MICU.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_MICU_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_MICU_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_MICU] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_MICU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_MICU] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_MICU] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_MICU] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_MICU] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_MICU] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_MICU] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_MICU] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_MICU] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_MICU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_MICU] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_MICU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_MICU] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_MICU] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_MICU] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_MICU] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_MICU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_MICU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_MICU] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_MICU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_MICU] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_MICU] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_MICU] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_MICU] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_MICU] SET  MULTI_USER 
GO
ALTER DATABASE [DB_MICU] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_MICU] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_MICU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_MICU] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_MICU] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_MICU] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_MICU] SET QUERY_STORE = OFF
GO
USE [DB_MICU]
GO
/****** Object:  Table [dbo].[tbl_detailtransaksi]    Script Date: 30/12/2022 08:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_detailtransaksi](
	[NoTransaksi] [varchar](10) NULL,
	[KodeMenu] [varchar](10) NULL,
	[NamaMenu] [varchar](50) NULL,
	[HargaMenu] [numeric](18, 0) NULL,
	[JumlahJual] [numeric](18, 0) NULL,
	[SubTotal] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_laporantransaksi]    Script Date: 30/12/2022 08:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_laporantransaksi](
	[NoTransaksi] [varchar](50) NOT NULL,
	[NamaPembeli] [varchar](50) NULL,
	[Item] [numeric](18, 0) NULL,
	[SubTotal] [numeric](18, 0) NULL,
 CONSTRAINT [PK_tbl_laporantransaksi] PRIMARY KEY CLUSTERED 
(
	[NoTransaksi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_menu]    Script Date: 30/12/2022 08:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_menu](
	[KodeMenu] [varchar](10) NOT NULL,
	[NamaMenu] [varchar](50) NULL,
	[StokMenu] [int] NULL,
	[HargaMenu] [int] NULL,
 CONSTRAINT [PK_tbl_menu] PRIMARY KEY CLUSTERED 
(
	[KodeMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_pegawai]    Script Date: 30/12/2022 08:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pegawai](
	[KodePegawai] [varchar](5) NOT NULL,
	[NamaPegawai] [varchar](50) NULL,
	[PasswordPegawai] [varchar](50) NULL,
	[AlamatPegawai] [varchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[KodePegawai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_pembeli]    Script Date: 30/12/2022 08:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pembeli](
	[KodePembeli] [varchar](10) NOT NULL,
	[NamaPembeli] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_pembeli] PRIMARY KEY CLUSTERED 
(
	[KodePembeli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_transaksi]    Script Date: 30/12/2022 08:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_transaksi](
	[NoTransaksi] [varchar](50) NOT NULL,
	[TglTransaksi] [date] NULL,
	[JamTransaksi] [time](7) NULL,
	[KodePembeli] [varchar](50) NULL,
	[JumlahBeli] [numeric](18, 0) NULL,
	[TotalTransaksi] [numeric](18, 0) NULL,
	[Tunai] [numeric](18, 0) NULL,
	[Kembalian] [numeric](18, 0) NULL,
 CONSTRAINT [PK_tbl_transaksi] PRIMARY KEY CLUSTERED 
(
	[NoTransaksi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000002', N'MK07', N'KopiSusuMatcha', CAST(20000 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(40000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000002', N'MK03', N'DimsumCampur', CAST(16000 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(32000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000003', N'MK01', N'IndomieGalak', CAST(16000 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(16000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000003', N'MK08', N'SusuRegal', CAST(20000 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(20000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000004', N'MK10', N'SusuTaro', CAST(20000 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(60000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000005', N'MK01', N'IndomieGalak', CAST(16000 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(32000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000006', N'MK01', N'IndomieGalak', CAST(16000 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(64000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000001', N'MK05', N'CornDog', CAST(12500 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(12500 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000005', N'MK07', N'KopiSusuMatcha', CAST(20000 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(40000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000002', N'MK02', N'IndomieKalem', CAST(16000 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(32000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000003', N'MK04', N'KentangGoreng', CAST(12500 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(12500 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000005', N'MK03', N'DimsumCampur', CAST(16000 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(32000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000001', N'MK01', N'IndomieGalak', CAST(16000 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(48000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000001', N'MK06', N'KopiSusuAren', CAST(20000 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(60000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_detailtransaksi] ([NoTransaksi], [KodeMenu], [NamaMenu], [HargaMenu], [JumlahJual], [SubTotal]) VALUES (N'TRK0000004', N'MK05', N'CornDog', CAST(12500 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(37500 AS Numeric(18, 0)))
GO
INSERT [dbo].[tbl_laporantransaksi] ([NoTransaksi], [NamaPembeli], [Item], [SubTotal]) VALUES (N'TRK0000001', N'LISA', CAST(7 AS Numeric(18, 0)), CAST(120500 AS Numeric(18, 0)))
INSERT [dbo].[tbl_laporantransaksi] ([NoTransaksi], [NamaPembeli], [Item], [SubTotal]) VALUES (N'TRK0000002', N'AULIA', CAST(6 AS Numeric(18, 0)), CAST(104000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_laporantransaksi] ([NoTransaksi], [NamaPembeli], [Item], [SubTotal]) VALUES (N'TRK0000003', N'DITI', CAST(3 AS Numeric(18, 0)), CAST(48500 AS Numeric(18, 0)))
INSERT [dbo].[tbl_laporantransaksi] ([NoTransaksi], [NamaPembeli], [Item], [SubTotal]) VALUES (N'TRK0000004', N'DINDA', CAST(6 AS Numeric(18, 0)), CAST(97500 AS Numeric(18, 0)))
INSERT [dbo].[tbl_laporantransaksi] ([NoTransaksi], [NamaPembeli], [Item], [SubTotal]) VALUES (N'TRK0000005', N'DITA', CAST(6 AS Numeric(18, 0)), CAST(104000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_laporantransaksi] ([NoTransaksi], [NamaPembeli], [Item], [SubTotal]) VALUES (N'TRK0000006', N'DITI', CAST(4 AS Numeric(18, 0)), CAST(64000 AS Numeric(18, 0)))
GO
INSERT [dbo].[tbl_menu] ([KodeMenu], [NamaMenu], [StokMenu], [HargaMenu]) VALUES (N'MK01', N'IndomieGalak', 86, 16000)
INSERT [dbo].[tbl_menu] ([KodeMenu], [NamaMenu], [StokMenu], [HargaMenu]) VALUES (N'MK02', N'IndomieKalem', 90, 16000)
INSERT [dbo].[tbl_menu] ([KodeMenu], [NamaMenu], [StokMenu], [HargaMenu]) VALUES (N'MK03', N'DimsumCampur', 93, 16000)
INSERT [dbo].[tbl_menu] ([KodeMenu], [NamaMenu], [StokMenu], [HargaMenu]) VALUES (N'MK04', N'KentangGoreng', 88, 12500)
INSERT [dbo].[tbl_menu] ([KodeMenu], [NamaMenu], [StokMenu], [HargaMenu]) VALUES (N'MK05', N'CornDog', 94, 12500)
INSERT [dbo].[tbl_menu] ([KodeMenu], [NamaMenu], [StokMenu], [HargaMenu]) VALUES (N'MK06', N'KopiSusuAren', 68, 20000)
INSERT [dbo].[tbl_menu] ([KodeMenu], [NamaMenu], [StokMenu], [HargaMenu]) VALUES (N'MK07', N'KopiSusuMatcha', 91, 20000)
INSERT [dbo].[tbl_menu] ([KodeMenu], [NamaMenu], [StokMenu], [HargaMenu]) VALUES (N'MK08', N'SusuRegal', 96, 20000)
INSERT [dbo].[tbl_menu] ([KodeMenu], [NamaMenu], [StokMenu], [HargaMenu]) VALUES (N'MK09', N'SusuOreo', 90, 20000)
INSERT [dbo].[tbl_menu] ([KodeMenu], [NamaMenu], [StokMenu], [HargaMenu]) VALUES (N'MK10', N'SusuTaro', 97, 20000)
INSERT [dbo].[tbl_menu] ([KodeMenu], [NamaMenu], [StokMenu], [HargaMenu]) VALUES (N'MK11', N'MieGoreng', 100, 15000)
INSERT [dbo].[tbl_menu] ([KodeMenu], [NamaMenu], [StokMenu], [HargaMenu]) VALUES (N'MK12', N'Nas iGoreng', 100, 15000)
GO
INSERT [dbo].[tbl_pegawai] ([KodePegawai], [NamaPegawai], [PasswordPegawai], [AlamatPegawai]) VALUES (N'ADM01', N'AUDITI', N'AUDIT', N'Rewwin Jl. Garuda 3 No. 51, Waru')
INSERT [dbo].[tbl_pegawai] ([KodePegawai], [NamaPegawai], [PasswordPegawai], [AlamatPegawai]) VALUES (N'ADM02', N'AULIA', N'AULIA', N'Jl. Randu Barat gg VII No. 31,Surabaya')
INSERT [dbo].[tbl_pegawai] ([KodePegawai], [NamaPegawai], [PasswordPegawai], [AlamatPegawai]) VALUES (N'ADM03', N'DISA', N'DISA', N'Jalan Pahlawan 93, Probolinggo')
INSERT [dbo].[tbl_pegawai] ([KodePegawai], [NamaPegawai], [PasswordPegawai], [AlamatPegawai]) VALUES (N'ADM04', N'DINDA', N'DINDA', N'Asrama Polisi No.10, Ketintang, Gayungan')
GO
INSERT [dbo].[tbl_pembeli] ([KodePembeli], [NamaPembeli]) VALUES (N'PBL0000001', N'LISA')
INSERT [dbo].[tbl_pembeli] ([KodePembeli], [NamaPembeli]) VALUES (N'PBL0000002', N'AULIA')
INSERT [dbo].[tbl_pembeli] ([KodePembeli], [NamaPembeli]) VALUES (N'PBL0000003', N'DITI')
INSERT [dbo].[tbl_pembeli] ([KodePembeli], [NamaPembeli]) VALUES (N'PBL0000004', N'DINDA')
INSERT [dbo].[tbl_pembeli] ([KodePembeli], [NamaPembeli]) VALUES (N'PBL0000005', N'LILIS')
INSERT [dbo].[tbl_pembeli] ([KodePembeli], [NamaPembeli]) VALUES (N'PBL0000006', N'DITA')
GO
INSERT [dbo].[tbl_transaksi] ([NoTransaksi], [TglTransaksi], [JamTransaksi], [KodePembeli], [JumlahBeli], [TotalTransaksi], [Tunai], [Kembalian]) VALUES (N'TRK0000001', CAST(N'2022-12-22' AS Date), CAST(N'20:43:58' AS Time), N'PBL0000001', CAST(7 AS Numeric(18, 0)), CAST(120500 AS Numeric(18, 0)), CAST(150000 AS Numeric(18, 0)), CAST(29500 AS Numeric(18, 0)))
INSERT [dbo].[tbl_transaksi] ([NoTransaksi], [TglTransaksi], [JamTransaksi], [KodePembeli], [JumlahBeli], [TotalTransaksi], [Tunai], [Kembalian]) VALUES (N'TRK0000002', CAST(N'2022-12-22' AS Date), CAST(N'20:44:32' AS Time), N'PBL0000002', CAST(6 AS Numeric(18, 0)), CAST(104000 AS Numeric(18, 0)), CAST(105000 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_transaksi] ([NoTransaksi], [TglTransaksi], [JamTransaksi], [KodePembeli], [JumlahBeli], [TotalTransaksi], [Tunai], [Kembalian]) VALUES (N'TRK0000003', CAST(N'2022-12-22' AS Date), CAST(N'20:45:05' AS Time), N'PBL0000003', CAST(3 AS Numeric(18, 0)), CAST(48500 AS Numeric(18, 0)), CAST(50000 AS Numeric(18, 0)), CAST(1500 AS Numeric(18, 0)))
INSERT [dbo].[tbl_transaksi] ([NoTransaksi], [TglTransaksi], [JamTransaksi], [KodePembeli], [JumlahBeli], [TotalTransaksi], [Tunai], [Kembalian]) VALUES (N'TRK0000004', CAST(N'2022-12-22' AS Date), CAST(N'20:45:35' AS Time), N'PBL0000004', CAST(6 AS Numeric(18, 0)), CAST(97500 AS Numeric(18, 0)), CAST(100000 AS Numeric(18, 0)), CAST(2500 AS Numeric(18, 0)))
INSERT [dbo].[tbl_transaksi] ([NoTransaksi], [TglTransaksi], [JamTransaksi], [KodePembeli], [JumlahBeli], [TotalTransaksi], [Tunai], [Kembalian]) VALUES (N'TRK0000005', CAST(N'2022-12-23' AS Date), CAST(N'19:28:44' AS Time), N'PBL0000006', CAST(6 AS Numeric(18, 0)), CAST(104000 AS Numeric(18, 0)), CAST(150000 AS Numeric(18, 0)), CAST(46000 AS Numeric(18, 0)))
INSERT [dbo].[tbl_transaksi] ([NoTransaksi], [TglTransaksi], [JamTransaksi], [KodePembeli], [JumlahBeli], [TotalTransaksi], [Tunai], [Kembalian]) VALUES (N'TRK0000006', CAST(N'2022-12-26' AS Date), CAST(N'09:51:53' AS Time), N'PBL0000003', CAST(4 AS Numeric(18, 0)), CAST(64000 AS Numeric(18, 0)), CAST(100000 AS Numeric(18, 0)), CAST(36000 AS Numeric(18, 0)))
GO
USE [master]
GO
ALTER DATABASE [DB_MICU] SET  READ_WRITE 
GO
