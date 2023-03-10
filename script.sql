USE [master]
GO
/****** Object:  Database [shopgiay]    Script Date: 12/23/2022 9:48:42 PM ******/
CREATE DATABASE [shopgiay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shopgiay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\shopgiay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shopgiay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\shopgiay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [shopgiay] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shopgiay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shopgiay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shopgiay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shopgiay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shopgiay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shopgiay] SET ARITHABORT OFF 
GO
ALTER DATABASE [shopgiay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shopgiay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shopgiay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shopgiay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shopgiay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shopgiay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shopgiay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shopgiay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shopgiay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shopgiay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [shopgiay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shopgiay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shopgiay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shopgiay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shopgiay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shopgiay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shopgiay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shopgiay] SET RECOVERY FULL 
GO
ALTER DATABASE [shopgiay] SET  MULTI_USER 
GO
ALTER DATABASE [shopgiay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shopgiay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shopgiay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shopgiay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shopgiay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shopgiay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'shopgiay', N'ON'
GO
ALTER DATABASE [shopgiay] SET QUERY_STORE = OFF
GO
USE [shopgiay]
GO
/****** Object:  Table [dbo].[Account_HE161883]    Script Date: 12/23/2022 9:48:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_HE161883](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
	[secretword] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_HE161883]    Script Date: 12/23/2022 9:48:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_HE161883](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_HE161883]    Script Date: 12/23/2022 9:48:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_HE161883](
	[Id] [int] NOT NULL,
	[Customer_id] [int] NULL,
	[TotalMomney] [float] NULL,
	[Date] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail_HE161883]    Script Date: 12/23/2022 9:48:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail_HE161883](
	[Id] [int] NOT NULL,
	[Order_Id] [int] NULL,
	[Product_Id] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_HE161883]    Script Date: 12/23/2022 9:48:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_HE161883](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account_HE161883] ON 

INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (1, N'adam', N'12345', 1, 0, N'blue')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (9, N'Rowan', N'345345', 1, 1, N'yellow')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (10, N'Kirby', N'345345', 1, 0, N'dog')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (15, N'Echo', N'345345', 1, 0, N'love')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (16, N'Slade', N'OFO6QS', 0, 0, N'die')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (17, N'Devin', N'345345', 1, 0, N'none')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (18, N'Rowan', N'345345', 1, 0, N'king')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (19, N'Rafael', N'345345', 1, 0, N'high')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (20, N'datb', N'1234', 0, 0, N'grug')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (21, N'Vera', N'CZB2VM', 1, 1, N'medit')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (22, N'Declan', N'345345', 1, 1, N'alure')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (23, N'Katell', N'345345', 1, 1, N'creed')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (25, N'Robin', N'345345', 1, 1, N'ultra')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (26, N'Dominique', N'IKV0IX', 0, 0, N'ret')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (27, N'admin', N'345345', 1, 1, N'red')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (28, N'mra', N'345345', 0, 0, N'right')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (29, N'mrb', N'123', 0, 0, N'hand')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (1001, N'dat', N'1234', 1, 0, N'some')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (1002, N'aaa', N'234', 0, 0, N'kill')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (1003, N'minha', N'222', 0, 0, N'jouts')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (1005, N'rrr', N'123', 0, 0, N'ter')
INSERT [dbo].[Account_HE161883] ([uID], [user], [pass], [isSell], [isAdmin], [secretword]) VALUES (1006, N'adr', N'333', 0, 0, N'your')
SET IDENTITY_INSERT [dbo].[Account_HE161883] OFF
GO
INSERT [dbo].[Category_HE161883] ([cid], [cname]) VALUES (1, N'Sách nấu ăn')
INSERT [dbo].[Category_HE161883] ([cid], [cname]) VALUES (2, N'Sách lập trình')
INSERT [dbo].[Category_HE161883] ([cid], [cname]) VALUES (3, N'Tiểu thuyết')
INSERT [dbo].[Category_HE161883] ([cid], [cname]) VALUES (4, N'Truyện tranh')
GO
SET IDENTITY_INSERT [dbo].[product_HE161883] ON 

INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (2, N'Lập trình Python', N'https://salt.tikicdn.com/cache/280x280/ts/product/38/40/88/b962e19641b05c06324b416c6aa5d38b.jpg.webp', 120.0000, N'Python programming', N'Cung cấp các dạng bài tập khác nhau để bạn thực hành khi học lập trình Python....', 1, 6, 456465)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (3, N'Nấu ăn nhẹ', N'https://cf.shopee.vn/file/6a0630d6ebf03f5dd6d1bbac0d62ef30', 130.0000, N'Các món ăn nhẹ', N'Đúng với cái nhan đề của cuốn sách, “Bếp ấm nhà vui” là tuyển tập những món ăn đặc chưng của Miền Nam Bộ, đặc biệt là ở Miền Tây thông qua những món ăn đặc sản như: Ba khía, canh chua, bánh ướt, chè kiểm. Cùng với giọng văn sâu lắng, nhẹ nhàng, tình cảm. Tác giả đã gợi cho người đọc hình dung ra những hình ảnh, những nét văn hóa đặc chưng của người dân miền Tây Nam Bộ. Từ đó, ta có thể thấy rõ hơn về đời sống và con người nơi đây và đồng thời người viết cũng muốn truyền tải tới người đọc thông điệp rằng đàn ông vào bếp là một điều thú vị:“Tôi vô bếp 1 phần vì đam mê”. Đây cũng chính là cẩm nang cho các bà nội trợ khi gia đình muốn trải nghiệm các món ăn Nam Bộ tại nhà mà vẫn không mất đi hương vị của xứ sở. Đặc biệt đối với những người con xa quê, họ luôn muốn thưởng thức những món ăn của quê hương mình.', 1, 7, 42)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (5, N'ĐÔ DÊ Mon', N'https://salt.tikicdn.com/cache/280x280/ts/product/38/ba/e8/c1787ee8cb8d80fd80493e27530e02aa.jpg.webp', 150.0000, N'Doremon tập 3', N'Doraemon (Đôrêmon) là một chú mèo máy được Sewashi (Nôbitô), cháu ba đời của Nobita gửi về quá khứ cho ông mình để giúp đỡ Nobita tiến bộ, tức là cũng sẽ cải thiện hoàn cảnh của con cháu Nobita sau này. Còn ở hiện tại, Nobita là một cậu bé luôn thất bại ở trường học, và sau đó là thất bại trong công việc, đẩy gia đình và con cháu sau này vào cảnh nợ nần.', 1, 6, 9)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (6, N'Doremon vol 1', N'https://salt.tikicdn.com/cache/280x280/ts/product/23/a2/34/0584d8e0a0bae5c46ee37547ea7585a7.jpg.webp', 160.0000, N'Chú khủng long của nobita', N'Doraemon (Đôrêmon) là một chú mèo máy được Sewashi (Nôbitô), cháu ba đời của Nobita gửi về quá khứ cho ông mình để giúp đỡ Nobita tiến bộ, tức là cũng sẽ cải thiện hoàn cảnh của con cháu Nobita sau này. Còn ở hiện tại, Nobita là một cậu bé luôn thất bại ở trường học, và sau đó là thất bại trong công việc, đẩy gia đình và con cháu sau này vào cảnh nợ nần.', 4, 7, 789)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (7, N'Naruto ', N'https://cf.shopee.vn/file/c8df0f55b3a37555e36bcef02da78b0f', 170.0000, N'Naruto shippuden', N'ne Piece (Vua Hải Tặc) bộ truyện thuộc thể loại truyện tranh hành động kể về một cậu bé tên Monkey D. Luffy, giong buồm ra khơi trên chuyến hành trình tìm kho báu huyền thoại One Piece và trở thành Vua hải tặc. Để làm được điều này, cậu phải đến được tận cùng của vùng biển nguy hiểm và chết chóc nhất thế giới: Grand Line (Đại Hải Trình). Luffy đội trên đầu chiếc mũ rơm như một nhân chứng lịch sử vì chiếc mũ rơm đó đã từng thuộc về hải tặc hùng mạnh: Hải tặc vương Gol. D. Roger và tứ hoàng Shank "tóc đỏ". Luffy lãnh đạo nhóm hải tặc Mũ Rơm qua East Blue (Biển Đông) và rồi tiến đến Grand Line. ', 4, 1001, 9)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (8, N'Kỹ thuật lập trình C/C++', N'https://salt.tikicdn.com/cache/280x280/ts/product/ab/72/d8/9f840550c93147f88cd10e1cf970acf8.jpg.webp', 150.0000, N'C/C++ Programming', N'Nội dung chính của cuốn sách “Giáo Trình C++ Và Lập Trình Hướng Đối Tượng” này chính là các khái niệm của OOP (lập trình hướng đối tượng) trong C++.

Chẳng hạn như đối tượng, lớp, thuộc tính, phương thức, các nguyên tắc và cách sử dụng các hàm.', 2, 1001, 768)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (9, N'Lập trình android ', N'https://salt.tikicdn.com/cache/w1200/ts/product/7c/89/f5/4e3f9ae4ee6d6843b4abf31fdc4bdc6e.jpg', 180.0000, N'Android Programming', N'Android là hệ điều hành thu hút nhiều lập trình viên và chiếm một thị phần lớn trong thị trường di động. Do vậy, đi cùng việc phát triển và sử', 2, 1001, 234)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (10, N'Ăn chay', N'https://bizweb.dktcdn.net/100/386/441/files/sach-day-nau-mon-an-viet-nam.jpg?v=1625189518839', 180.0000, N'Món chay không ngon', N'Nếu bạn là tín đồ của món chay thì đây chính là cuốn sách dành cho bạn. Với cuốn sách: về nhà ăn cơm bạn sẽ được trải nghiệm nhiều món ăn chay đơn giản tại nhà với những công thức khác lạ. Nó như một làn gió mới thổi vào trong bữa ăn của gia đình bạn giúp bạn có thêm cảm hứng với lối sống lành mạnh. Xóa bỏ mọi định kiến: ăn chay giả thịt hay: ăn chay là nhạt nhẽo đã tồn tại trong tâm ý của người việt từ bao đời nay.', 1, 15, 4)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (11, N'Món ăn gia đình', N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_195509_1_16887.jpg', 150.0000, N'Món nhà làm ngon', N'Cuốn sách này chính là cứu cánh cho các bà nội trợ khi suốt ngày họ phải đau đầu suy nghĩ về bài toán:“Hôm nay ăn gì”. Cuốn sách này sẽ đưa tới bạn những công thức nấu ăn tuyệt vời, cách chế biến đa dạng phù hợp với khẩu vị của nhiều người và dưới nhiều điều kiện thời tiết khác nhau. Chính vì vậy, những ai không giỏi việc bếp cũng có thể tự chế biến ra những món ăn ngon cho gia đình. Mỗi ngày dành ra 1 ít thời gian lăn vào bếp tự chế biến cho mình 1 món trong 100 món ăn thường ngày đó thì chẳng mấy chốc mà tay nghề của bạn lên cao.', 1, 20, 12)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (12, N'7 viên bi rồng', N'https://salt.tikicdn.com/cache/280x280/ts/product/7d/0b/85/0638f4f6d82c67f2d23bc1913c680af2.jpg.webp', 165.0000, N'Dragon ball tập 1', N'Dragon Ball - 7 Viên Ngọc Rồng là câu chuyện kể về cậu bé có đuôi khỉ tên là Goku được tìm thấy bởi ông lão sống một mình trong rừng, ông lão xem đứa bé như là cháu của mình. Một ngày nọ Goku tình cờ gặp cô gái tên là Bulma trên đường đi bắt cá về, Goku và Bulma đã cùng nhau truy tìm bảy viên ngọc rồng. Bảy viên ngọc rồng chứa đựng bí mật có thể triệu hồi một con rồng và ban điều ước cho ai sở hữu chúng.', 4, 19, 345)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (13, N'conan', N'https://cf.shopee.vn/file/510df9c4781fec3532c03c59a355eaf0', 185.0000, N'Conan tập 1', N'Trong khi đó, Conan đã tiến đến gần chân tướng của “em gái ngoài lãnh địa” - Mary…!?
Haneda Shukichi bất ngờ gặp án mạng tại buổi học nhóm shogi! Vụ án diễn biến bất ngờ với nhiều khúc ngoặt để rồi cuối cùng, Akai Shuichi xuất hiện…!? Không dừng lại ở đó, tập 98 còn mang tới vụ án giải mật mã của một người giúp việc, nơi cuộc đua phá án giữa Conan và Heiji đã khởi phát từ mưu kế của Ooka Momiji!!', 4, 18, 346)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (15, N'Mặt nạ', N'https://salt.tikicdn.com/cache/750x750/ts/product/79/cb/7f/219f98e7f609290fd8a513fa25c41b17.jpg.webp', 100.0000, N'Mặt Nạ', N'Ngày ngày họ đeo mặt nạ lên, sắm vai kẻ khác rồi trở nên xa lạ với chính con người thật của mình. Họ - chàng diễn viên hài luôn lẩm bẩm “Biết sai rồi” nhiều lần đến độ u uất, cười nhiều tới mức trầm cảm, đứng trên sân khấu thấy khán giả vui cười mà trong lòng quặn thắt. Họ - nam diễn viên nổi tiếng được xưng tụng “người chồng quốc dân” cứ mỗi lần lên nhận giải thưởng lại giở chiêu trò bày tỏ tình cảm “Vợ ơi anh yêu em”, chẳng biết đang nói với cô vợ danh chính ngôn thuận đương ngồi nhà xem ti vi hay tình nhân phim giả tình thật mỉm cười dịu dàng dưới khán đài. Họ - Nữ diễn viên vốn được mệnh danh có gương mặt trong sáng cao cấp, nhưng để xin thêm cảnh diễn mà bất chấp tất cả, nhắm mắt đưa chân tới tìm nhà sản xuất…', 3, 6, 4)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (16, N'Kiêu Hãnh Và Định Kiến (Tái Bản)
', N'https://salt.tikicdn.com/cache/750x750/ts/product/13/1a/c5/8de00e3c753d0d571b793caeab329d8d.jpg.webp', 120.0000, N'Kiêu Hãnh Và Định Kiến (Tái Bản)
', N'Khắp làng trên xóm dưới Herfordshire xôn xao: Netherfield sắp có người thuê, mà còn là một quý ông chưa vợ với khoản lợi tức lên đến năm nghìn bảng mỗi năm. Chao ôi, quả là tin đáng mừng đối với gia đình ông bà Bennett, vốn có tới năm cô con gái cần phải gả chồng. Giữa những quay cuồng vũ hội cùng âm mưu toan tính của cả một xã hội ganh đua nhau tìm tấm chồng tốt cho các cô gái, nổi lên câu chuyện tình của cô con gái thứ cứng đầu Elizabeth và chàng quý tộc Darcy - nơi lòng Kiêu hãnh phải nhún nhường và Định kiến cần giải tỏa để có thể đi đến kết cục hoàn toàn viên mãn.
Suốt hơn 200 năm qua, Kiêu hãnh và Định kiến luôn nằm trong số những tiểu thuyết tiếng Anh được yêu mến nhất. Chính Jane Austen cũng coi tác phẩm xuất sắc này là “đứa con cưng” của bà. Tài năng của Austen quả thực đã biến câu chuyện tình sôi nổi nơi miền quê nước Anh thành một bản châm biếm sắc sảo hóm hỉnh và một viên ngọc quý trong kho tàng Anh ngữ.', 3, 1001, 7)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (18, N'Những Người Đàn Bà (Tiểu Thuyết Văn Học Hiện Đại)', N'https://salt.tikicdn.com/cache/750x750/ts/product/b2/b5/6a/051dccbb56c98b28b29d04ec9e8f3f4c.jpg.webp', 120.0000, N'Những Người Đàn Bà (Tiểu Thuyết Văn Học Hiện Đại)
', N'NHỮNG NGƯỜI ĐÀN BÀ là câu chuyện đầy đau đớn, dữ dội về số phận của những người phụ nữ yếm thế trong xã hội Palestine. Họ không có tiếng nói ngay trong gia đình mình, lấy chồng theo sự sắp đặt của cha mẹ và chỉ quẩn quanh bên căn bếp, chăm lo con cái.
Xuyên suốt câu chuyện là sự câm lặng của ba thế hệ phụ nữ. Thế hệ đầu thoát khỏi sự chiếm đóng của Israel trong xung đột Palestine và Israel, chạy trốn đến nước Mỹ với mong muốn tránh khỏi cuộc sống ở trại tị nạn. Thế hệ thứ 2 đồng ý một cuộc hôn nhân sắp đặt với người Mỹ gốc Palestine với hi vọng đất Mỹ tự do thì tiếng nói của nữ giới sẽ được tôn trọng hơn trên đất Palestine. Thế hệ thứ 3, suýt nữa thì rơi vào bánh xe đổ của các thế hệ trước, nếu cô ấy không phát hiện ra bí mật kinh khủng của gia đình mình và số phận của người mẹ đáng thươ Mỗi thế hệ đều có giấc mơ và khát vọng về sự tự do và nữ quyền, nhưng không phải ai cũng có thể đấu tranh đến tận cùng.
Lấy bối cảnh ở một nước Mỹ đầy khát khao cùng những lời hứa hẹn rộng mở, để kể một nền văn hóa với hủ tục cực đoan, khép kín và kiểm soát đối người phụ nữ, NHỮNG NGƯỜI ĐÀN BÀ là một cái nhìn sâu sắc về sự tuyệt vọng, thống khổ của phụ nữ gốc Palestine. Dù vậy, ẩn chứa bên trong họ là sức mạnh phi thường, lòng dũng cảm để tìm lại tiếng nói và phẩm giá của mình.
Với những trang sách đầy mê hoặc, lôi cuốn và hấp dẫn đến phút cuối cùng, NHỮNG NGƯỜI ĐÀN BÀ đã được Amazon bình chọn là cuốn sách viết về phụ nữ hay nhất năm.', 3, 1001, 546)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (1005, N'Món Ngon trong tù', N'https://salt.tikicdn.com/cache/280x280/ts/product/f0/34/cb/1e83e9fc362799fbb81b7d05b008be3f.jpg.webp', 444.0000, N'ik tù ăn gì', N'Cuốn sách nhỏ này với các món Canh, Kho, Xào sẽ giúp bạn xây dựng lên những thực đơn mới cho bữa ăn hàng ngày của gia đình mình luôn mới lạ, thơm ngon và đầy đủ dưỡng chất. Bạn hãy bắt tay vào thử làm một thực đơn mới để đem lại niềm vui bất ngờ cho mọi thành viên trong gia đình mình nhé. Mỗi ngày một thực đơn mới, mỗi ngày thêm một niềm vui!”.', 1, 1001, 89)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (2001, N'Tôi tài giỏi bạn thì không', N'https://salt.tikicdn.com/cache/280x280/ts/product/e9/ed/9f/d3d21c2e108159caa1fc496b3cb8379e.jpg.webp', 234.0000, N'Tôi tài giỏi bạn thì không', N'Tác giả không chỉ đơn thuần giải thích người khác đã thành công như thế nào, mà còn nói làm sao để họ làm được như thế để giúp người đọc khám phá ra tiềm năng của bản thân, và phát huy điều đó. Ngoài ra, sách còn cung cấp những phương pháp học thông minh (như áp dụng các công cụ học bằng cả não bộ như Sơ Đồ Tư Duy, phát triển trí nhớ siêu việt để ghi nhớ các sự kiện, con số một cách dễ dàng, thành thạo việc quản lý thời gian và xác định mục tiêu). Adam Khoo đã cho thấy, tài giỏi mang lại sự tự tin như thế nào và còn hướng dẫn bạn cách thức trở thành người tài giỏi. Qua đó độc giả sẽ lập được kế hoạch cho cuộc đời của chính mình.

Tôi Tài Giỏi - Bạn Cũng Thế sẽ giúp tìm ra giải pháp tốt nhất cho mọi vấn đề, và giúp nhận ra cách thức để thành công. Tuy nhiên để làm một người tài giỏi thì người đọc cần đặt quyển sách xuống và thực thi ngay các kế hoạch. Đương nhiên, không phải chỉ chăm chỉ ngày một, ngày hai mà mỗi người phải thực hiện lâu dài, thậm chí cả đời thì mới đạt được những gì mình muốn.

Thật sự đây là một quyển sách rất tuyệt vời và bổ ích, đem lại cho chúng ta những kinh nghiệm quý báu. Một quyển sách không - thể - thiếu trong tủ sách!


“Thật không biết phải làm sao với con trai chúng tôi. Nó được gởi đi học thêm khắp nơi mà vẫn làm bài thi tệ hại. Chúng tôi tự hỏi sau này nó có làm nên trò trống gì không nữa”…

Đó chính là những gì mà cha mẹ của Adam Khoo đã từng than vãn về sự kém cõi và kết quả thi cử thảm hại của cậu bé Adam nhiều năm về trước. May mắn thay, vào thời điểm tăm tối nhất trong đời, Adam đã tìm thấy và học tập theo công thức thành công của những người tài giỏi vượt bậc. Chính vì thế, từ một cậu học trò kém cỏi nhất trong số những học sinh kém, không những anh đã vươn lên để đạt đuợc kết quả xuất sắc trong các kỳ thi cuối cấp hai và cấp ba, anh còn đuợc xếp hạng trong số 1% sinh viên tài năng nhất của trường Đại học Quốc Gia Singapore (NUS).

Tôi tài giỏi, bạn cũng thế ! tổng hợp những kỹ năng và phương pháp đã mang tới thành công vượt bậc cho cậu bé Adam kém cõi và dĩ nhiên bạn cũng có thể thành công như vậy! Quyển sách này dành cho các học sinh, sinh viên, các bậc phụ huynh, các nhà giáo và bất kỳ ai luôn mong muốn tăng cường khả năng tận dụng não bộ hoặc phát huy tối đa tiềm năng của mình.

Nếu bạn muốn “tài giỏi” trong các phương pháp học tập và suy nghĩ vượt bậc, hãy đọc quyển sách này. Bạn sẽ học đuợc cách:

Tăng cường sự tự tin và làm chủ cuộc sống của bạn

Áp dụng các công cụ học bằng cả não bộ như Sơ Đồ tư Duy

Phát huy trí nhớ siêu việt để nhớ lại các sự kiện, con số một cách dễ dàng

Thành thạo việc quản lý thời gian và xác định mục tiêu

Mang lại khả năng đạt được những thành tích cao nhất có thể

Áp dụng các phương pháp thi cử hiệu quả để “chiến đấu” và “Chiến thắng” trong các kỳ thi quan trọng.

Tài năng đặc biệt của Adam nằm ở việc anh có thể hệ thống và chia sẻ các kỹ thuật và phương pháp mà bất kỳ học sinh nào cũng có thể áp dụng để đạt được những kết quả xuất sắc như anh đã từng đạt được.

Mục Lục Sách Tôi Tài Giỏi, Bạn Cũng Thế !

Lời mở đầu của Tony Buzan và Ernest Wong
Phần 1: Tôi tài giỏi, bạn cũng thế!

Chương 1: Từ đần độn trở thành thiên tài
Chương 2: Quá trình học tập hiệu quả
Chương 3: Bạn đã sẵn sàng để thành công chưa?
Chương 4: Tôi tin tôi có thể bay cao… và tôi làm được
Phần 2: Những phương pháp học siêu đẳng

Chương 5: Bạn sở hữu bộ não của một thiên tài
Chương 6: Phương pháp đọc để nắm bắt thông tin
Chương 7: Sơ đồ tư duy: Công cụ ghi chú tối ưu
Chương 8: Trí nhờ siêu đẳng dành cho từ
Chương 9: Trí nhớ siêu đẳng dành cho số
Chương 10: Mô hình trí nhớ
Chương 11: Nghệ thuật ứng dụng lý thuyết vào thực hành
Phần 3: Động lực cá nhân của bạn

Chương 12: Dám mơ ước: Sức mạnh của mục tiêu
Chương 13: Động lực mạnh mẽ - vượt qua sự lười biếng
Chương 14: Công thức để đạt điểm tuyệt đối
Chương 15: Thời gian là tiền bạc
Chương 16: Tạo quyết tâm mạnh mẽ tức thì
Phần 4: Phương pháp thi cử

Chương 17: Tăng tốc về đích
Chương 18: Chiến thắng và vinh quang.
Mời bạn đón đọc.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....

', 3, 4, 6)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (3001, N'Nhật Ký Trong Tù', N'https://salt.tikicdn.com/cache/280x280/media/catalog/product/i/m/img557_1_4.jpg.webp', 444.0000, N'Nhật Ký Trong Tù', N'Nhật Ký Trong Tù

Nhật ký trong tù là một tập thơ chữ Hán, gồm hơn một trăm bài thơ, phần cuối có một số ghi chép về quân sự và thời sự, được Chủ tịch Hồ Chí Minh sáng tác trong thời gian hơn một năm (từ 29-8-1942 đến 10-9-1943) Người bị chính quyền địa phương của Tưởng Giới Thạch bắt giam trái phép tại các nhà tù ở tỉnh Quảng tây, Trung Quốc. Nhật ký trong tù lên án chế độc nhà tù hà khắc của chính quyền Quốc dân Đảng, thể hiện tinh thần lạc quan cách mạng và tình cảm nhân đạo cộng sản chủ nghĩa cao đẹp của Chủ tịch Hồ Chí Minh. Tập thơ được đánh giá là một văn kiện lịch sử quan trọng, một tác phẩm văn học xuất sắc, có tác dụng giáo dục sâu sắc phẩm chất và đạo đức cách mạng cho nhiều thế hệ.

Tác phẩm Nhật ký trong tù đã được xuất bản nhiều lần, được dịch và giới thiệu ở nhiều nước trên thế giới.', 3, 1, 4)
INSERT [dbo].[product_HE161883] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (4027, N'Đíp lơn ningggg', N'https://salt.tikicdn.com/cache/750x750/ts/product/f4/4f/ec/c8d7c174cbca49acb9b8ef31cb690557.jpg.webp', 4342.0000, N'sdas', N'dd', 1, 1001, 45)
SET IDENTITY_INSERT [dbo].[product_HE161883] OFF
GO
ALTER TABLE [dbo].[Order_HE161883]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Account_HE161883] ([uID])
GO
ALTER TABLE [dbo].[Order_HE161883] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetail_HE161883]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Order_HE161883] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail_HE161883] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail_HE161883]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_product] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[product_HE161883] ([id])
GO
ALTER TABLE [dbo].[OrderDetail_HE161883] CHECK CONSTRAINT [FK_OrderDetail_product]
GO
ALTER TABLE [dbo].[product_HE161883]  WITH CHECK ADD  CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category_HE161883] ([cid])
GO
ALTER TABLE [dbo].[product_HE161883] CHECK CONSTRAINT [FK_product_Category]
GO
USE [master]
GO
ALTER DATABASE [shopgiay] SET  READ_WRITE 
GO
