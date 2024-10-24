-- Check if the database exists and drop it if it does
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'PRJ_SportsShopping')
BEGIN
    USE master;
    ALTER DATABASE PRJ_SportsShopping SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PRJ_SportsShopping;
END
GO

-- Create the database PRJ_SportsShopping
CREATE DATABASE PRJ_SportsShopping;
GO

-- Use the PRJ_SportsShopping database
USE PRJ_SportsShopping;
GO

-- Create the Accounts table
CREATE TABLE Accounts (
	[uID] [int]  IDENTITY(1,1) PRIMARY KEY,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
);
GO

-- Create the Categories table
CREATE TABLE Categories (
  [cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create the Cart table
CREATE TABLE Cart (
	[AccountID] [int] NULL,
	[ProductID] [int] NULL,
	[Amount] [int] NULL
) ON [PRIMARY]
GO

-- Create the Products table with foreign key to Categories table
CREATE TABLE Products (
 [id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO





--INSERT DATA AND FOREIGN KEYS CONSTRAINTS
USE PRJ_SportsShopping;
-- Insert into the Accounts table
INSERT INTO Accounts ( [user], [pass], [isSell], [isAdmin]) VALUES ( N'Adam', N'123456', 1, 0),
( N'Tuan', N'123456', 1, 0),
( N'Kien', N'123456', 0, 1),
( N'Tung', N'123456', 1, 1),
(N'My', N'123456', 0, 0),
( N'Huyen', N'123456', 1, 0);
GO

-- Insert categories into the Categories table
INSERT INTO Categories   ([cid], [cname]) VALUES (1, N'GIÀY ADIDAS'),
   (2, N'GIÀY NIKE'),
   (3, N'GIÀY PUMA'),
   (4, N'GIÀY THƯỢNG ĐÌNH'),
   (5,N'GIÀY CONVERSE'),
   (6,N'GIÀY NEW BALANCE'),
   (7,N'GIÀY FILA');

GO

-- Insert into the Products table
INSERT INTO Products( [name], [image], [price], [title], [description], [cateID], [sell_ID])
VALUES
    (N'Giày Sneaker Nữ Nike Cortez Leather - Trắng', 'https://supersports.com.vn/cdn/shop/files/DN1791-107-1.jpg?v=1728295224&width=1000', 2749000, N'GIÀY SNEAKER NỮ NIKE CORTEZ LEATHER', N'Xuất phát từ thiết kế dành riêng cho chạy bộ, Giày Sneaker Nữ Nike Cortez Leather trở thành hiện tượng thời trang bởi sức hấp dẫn cổ điển, mang đến sự tinh xảo từ thập kỷ này sang thập kỷ khác. Sự lặp kết hợp từ da và màu sắc hài hòa tạo cảm giác cổ điển cho đôi giày.',2,1),
    (N'Giày Thời Trang Unisex Converse Chuck Taylor All Star - Xanh Navy','https://supersports.com.vn/cdn/shop/products/M9697C-1.jpg?v=1700129720&width=1920', 1450000, N'GIÀY THỜI TRANG UNISEX CONVERSE CHUCK TAYLOR ALL STAR',N'Ra mắt lần đầu năm 1917 với tư cách là một đôi giày bóng rổ, giày Converse All Star ban đầu được bậc thầy bóng rổ Chuck Taylor quảng bá cho sự linh hoạt và lợi ích trên sân bóng. Tuy nhiên qua nhiều thập kỷ, một điều đáng kinh ngạc đã xảy ra: đôi giày thể thao với kiểu dáng mang phong cách vượt thời gian và logo đặc trưng ở mắt cá này đã được các nghệ sĩ, nhạc sĩ và những người nổi tiếng yêu thích và mang biểu diễn tạo nên cơn sốt trên toàn cầu – và chúng vẫn được yêu thích cho đến ngày nay.',5,1),
    (N'Giày Thời Trang Nam New Balance Xc-72 / Daydream - Trắng','https://supersports.com.vn/cdn/shop/files/UXC72DG-1.jpg?v=1695896969&width=1000', 1715400, N'GIÀY THỂ THAO NAM NEW BALANCE', N'TheXC-72 mang đến nguồn cảm hứng khám phá bất tận, với thiết kế bẻ cong thời gian được lấy ý tưởng từ bộ sưu tập xe hơi những năm 1970. Thiết kế đế ngoài đặc biệt hỗ trợ lực kéo tối đa và các đặc điểm góc cạnh được sử dụng tạo nên kiểu dáng độc đáo, thu hút ngay từ ánh nhìn đầu tiên. XC-72 là tương lai mà quá khứ mơ ước và đã được hiện thực hóa thành công.',6,1),
    (N'Giày Sneaker Unisex Fila Float Max - Trắng','https://supersports.com.vn/cdn/shop/files/1RM02855G-100-1.jpg?v=1729073731&width=1000', 2495000, N'GIÀY SNEAKER UNISEX FILA FLOAT MAX',  N'Giày Sneaker Unisex Fila Float Max thuộc dòng FLOAT MAX với đệm vượt trội - phù hợp với chạy bộ hàng ngày. Mũ giày có lớp lưới thoáng khí, giúp bạn luôn thoải mái khi sử dụng thời gian dài.',7,1),
    (N'Giày Sneaker Unisex Fila Float Max - Đen','https://supersports.com.vn/cdn/shop/files/1RM02855G-001-1.jpg?v=1729073697&width=1000', 2495000, N'GIÀY SNEAKER UNISEX FILA FLOAT MAX',   N'Giày Sneaker Unisex Fila Float Max thuộc dòng FLOAT MAX với đệm vượt trội - phù hợp với chạy bộ hàng ngày. Mũ giày có lớp lưới thoáng khí, giúp bạn luôn thoải mái khi sử dụng thời gian dài.',7,1),
    (N'Giày Sneaker Unisex Fila Float Max - Be','https://supersports.com.vn/cdn/shop/files/1RM02853G-920-1.jpg?v=1729073660&width=1000', 2495000, N'GIÀY SNEAKER UNISEX FILA FLOAT MAX',  N'Giày Sneaker Unisex Fila Float Max thuộc dòng FLOAT MAX với đệm vượt trội - phù hợp với chạy bộ hàng ngày. Mũ giày có lớp lưới thoáng khí, giúp bạn luôn thoải mái khi sử dụng thời gian dài.',7,1),
    (N'Giày Sneaker Unisex Fila Replica Max - Đen','https://supersports.com.vn/cdn/shop/files/1RM02853G-002-1.jpg?v=1729073582&width=1000', 2495000,N'GIÀY SNEAKER UNISEX FILA REPLICA MAX',   N'Giày Sneaker Unisex Fila Float Max thuộc dòng FLOAT MAX với đệm vượt trội - phù hợp với chạy bộ hàng ngày. Mũ giày có lớp lưới thoáng khí, giúp bạn luôn thoải mái khi sử dụng thời gian dài.',7,1),
    (N'Giày Sneaker Bé Trai Nike Court Legacy (Psv)', 'https://supersports.com.vn/cdn/shop/files/DA5381-124-1.jpg?v=1728295224&width=832', 1119000,N'GIÀY SNEAKER BÉ TRAI NIKE NIKE COURT LEGACY (PSV)',N'Giày Sneaker Bé Trai Nike Court Legacy (Psv) mang đến phong cách tennis cổ điển cho các bé. Chúng bền bỉ và thoải mái với các đường may mang dấu ấn di sản và logo Swoosh retro. Khi bé yêu của bạn xỏ chân vào đôi giày này—trận đấu bắt đầu và chiến thắng trong tầm tay.',2,1),
    (N'Giày Sneaker Unisex Fila Oakmont Tr V4 - Nâu', 'https://supersports.com.vn/cdn/shop/files/1RM02903G-200-1.jpg?v=1729073784&width=1000', 2795000, N'GIÀY SNEAKER UNISEX FILA OAKMONT TR V4', N'Giày Sneaker Unisex Fila Oakmont Tr V4 nổi bật với đế ngoài dày dặn - gợi nhớ đến các mẫu giày trekking. Thiết kế thân giày được phối từ tông nền trắng tinh tế, màu đen tối giản và nhấn nhá các lớp màu sắc; tạo nên vẻ ngoài độc đáo, khỏe khoắn và đậm chất dã ngoại.',7,1),
    (N'Giày Sneaker Unisex Fila Oakmont Tr V4 - Đen', 'https://supersports.com.vn/cdn/shop/files/1RM02903G-001-1.jpg?v=1729073760&width=1000', 2795000, N'GIÀY SNEAKER UNISEX FILA OAKMONT TR V4', N'Giày Sneaker Unisex Fila Oakmont Tr V4 nổi bật với đế ngoài dày dặn - gợi nhớ đến các mẫu giày trekking. Thiết kế thân giày được phối từ tông nền trắng tinh tế, màu đen tối giản và nhấn nhá các lớp màu sắc; tạo nên vẻ ngoài độc đáo, khỏe khoắn và đậm chất dã ngoại.',7,1),
    
    (N'Giày Luyện Tập Nam Nike Metcon 9 - Xám', 'https://supersports.com.vn/cdn/shop/files/DZ2617-002-1.jpg?v=1726563163&width=1000', 4519000, N'GIÀY LUYỆN TẬP NAM NIKE METCON 9', N'Không gì có thể ngăn cản hành trình tập luyện của bạn với Nike Metcon 9. Được cải tiến từ phiên bản Metcon 8 huyền thoại, Metcon 9 tiếp tục là người bạn đồng hành đáng tin cậy, giúp bạn chinh phục mọi thử thách.',2,2),
    (N'Giày Luyện Tập Nữ Nike Motiva - Be', 'https://supersports.com.vn/cdn/shop/files/DV1238-104-1.jpg?v=1726562996&width=1000', 2749000,N'GIÀY LUYỆN TẬP NỮ NIKE MOTIVA', N'The Nikon Z7 II is a full-frame mirrorless camera that offers exceptional image quality and performance. It features a 45.7-megapixel sensor and dual EXPEED 6 processors, providing fast processing speeds and superior image detail. The Z7 II includes a sophisticated autofocus system with 493 focus points, ensuring precise focus in any situation. It supports 4K UHD video recording and has dual card slots for added flexibility. The cameras robust build, weather sealing, and ergonomic design make it suitable for professional photographers who need a reliable and high-performing camera for various shooting conditions.',2,2),
    (N'Giày Luyện Tập Nam Nike Reax 8 - Đen', 'https://supersports.com.vn/cdn/shop/files/621716-020-1.jpg?v=1726562753&width=1000', 2749000, N'Giày Luyện Tập Nam Nike Reax 8', N'Giày Luyện Tập Nam Nike Reax 8 "Metalic Silver" là lựa chọn hoàn hảo cho buổi tập luyện hăng say. Với thiết kế kết hợp lớp đệm nhẹ và lớp đệm đàn hồi giúp hỗ trợ quá trình tập luyện và nâng cao hiệu suất.',2,2),
    (N'Giày Luyện Tập Nam Nike Air Max Alpha Trainer 6 - Xám', 'https://supersports.com.vn/cdn/shop/files/FQ1833-006-1.jpg?v=1726563762&width=1000', 2919000, N'Giày Luyện Tập Nam Nike Air Max Alpha Trainer 6', N'Giày Luyện Tập Nam Nike Air Max Alpha Trainer 6 kết hợp sự chắc chắn và thoải má, là lựa chọn hoàn hảo cho những buổi tập luyện căng thẳng. Thiết kế đế phẳng, rộng hỗ trợ đứng vững chắc suốt buổi tập. Gót giày có đệm "performance Air" mang đến sự ổn định tối ưu cho mỗi lần nâng tạ. Hãy để Giày Luyện Tập Nam Nike Air Max Alpha Trainer 6 đồng hành cùng bạn chinh phục mục tiêu tập luyện của mình.',2,2),
    (N'Giày Luyện Tập Nam Nike Air Max Alpha Trainer 6 - Đen', 'https://supersports.com.vn/cdn/shop/files/FQ1833-001-1.jpg?v=1726563708&width=1000', 2919000, N'Giày Luyện Tập Nam Nike Air Max Alpha Trainer 6', N'Giày Luyện Tập Nam Nike Air Max Alpha Trainer 6 kết hợp sự chắc chắn và thoải má, là lựa chọn hoàn hảo cho những buổi tập luyện căng thẳng. Thiết kế đế phẳng, rộng hỗ trợ đứng vững chắc suốt buổi tập. Gót giày có đệm "performance Air" mang đến sự ổn định tối ưu cho mỗi lần nâng tạ. Hãy để Giày Luyện Tập Nam Nike Air Max Alpha Trainer 6 đồng hành cùng bạn chinh phục mục tiêu tập luyện của mình.',2,2),
    (N'Giày Chạy Bộ Nữ Adidas Supernova Rise - Xanh Dương', 'https://supersports.com.vn/cdn/shop/files/ID3595-1.jpg?v=1726651554&width=1000', 3800000, N'GIÀY CHẠY BỘ NỮ ADIDAS SUPERNOVA RISE', N'Được Womens Health trao giải thưởng đôi giày chạy bộ "tốt nhất cho mọi cấp độ", Giày Chạy Bộ Nữ Adidas Supernova Rise luôn thoải mái trên mọi dặm đường. Với công nghệ Dreamstrike+, đế giữa sở hữu ​mút foam cải tiến siêu mềm mại. Hệ thống foam Support Rods truyền lực mượt mà tuyệt đối, từ gót chân đến mũi chân. Độ ôm gót chân chắc chắn nhờ vào thiết kế gót giày đặc biệt và vải dệt mềm mại.',1,2),
    (N'Giày Thể Thao Nam Adidas Ultraboost 1.0 - Đen', 'https://supersports.com.vn/cdn/shop/files/HQ4199-1.jpg?v=1717755517&width=1000', 3600000, N'GIÀY THỂ THAO NAM ADIDAS ULTRABOOST 1.0', N'Khi đi dạo trong công viên cũng như chạy bộ cuối tuần cùng bạn bè, đôi giày adidas Ultraboost 1.0 này sẽ giúp bạn luôn thoải mái. Thân giày adidas PRIMEKNIT ôm chân nhẹ nhàng, đồng thời đệm BOOST ở đế giữa nâng niu từ bước chân đầu tiên cho tới tận cây số cuối cùng. Đế ngoài Stretchweb linh hoạt tự nhiên cho sải bước tràn đầy năng lượng, cùng chất liệu cao su Continental™ Rubber tạo độ bám cần thiết để bạn luôn vững bước.',1,2),
    (N'Giày Chạy Bộ Nam Adidas Supernova Stride - Xanh Dương', 'https://supersports.com.vn/cdn/shop/files/IG8311-1.jpg?v=1706783520&width=1000', 2240000, N'GIÀY CHẠY BỘ NAM ADIDAS SUPERNOVA STRIDE', N'Đôi giày chạy bộ nam Adidas Supernova Stride chính là người bạn đồng hành lý tưởng, giúp bạn sải bước tự tin trên hành trình chinh phục những mục tiêu chạy bộ. Được thiết kế với công nghệ tiên tiến và vật liệu bền vững, Supernova Stride mang đến sự thoải mái, linh hoạt và hiệu suất tối ưu cho mọi buổi chạy của bạn. Sản phẩm này sử dụng ít nhất 20% chất liệu tái chế, góp phần giảm thiểu rác thải và bảo vệ tài nguyên thiên nhiên.',1,2),
    (N'Giày Tập Luyện Nữ Adidas Dropset 3 Trainer - Be', 'https://supersports.com.vn/cdn/shop/files/ID8635-1.jpg?v=1717755617&width=1000', 3150000, N'GIÀY TẬP LUYỆN NỮ ADIDAS DROPSET 3 TRAINER',N'Bất kể buổi tập của bạn đòi hỏi sức mạnh hay sức bền, đôi giày adidas này sẽ mang đến cho bạn sự hỗ trợ cần thiết để rèn luyện thể lực. Đế giữa mật độ kép giúp bàn chân duy trì ổn định khi nâng tạ, đồng thời vẫn đủ linh hoạt cho bài tập cardio. Công nghệ HEAT.RDY và thân giày thoáng khí hợp lực giúp đánh bật hơi nóng để bạn tập trung vào các rep tập. Kiểu dáng rộng chiều ngang đáp ứng tình trạng bàn chân nở ra, cùng đế ngoài Adiwear bám tốt trên mặt sàn để tăng cường hiệu năng tập luyện. Sản phẩm này có chứa tối thiểu 20% chất liệu tái chế. Bằng cách tái sử dụng các chất liệu đã được tạo ra, chúng tôi góp phần giảm thiểu lãng phí và hạn chế phụ thuộc vào các nguồn tài nguyên hữu hạn, cũng như giảm phát thải từ các sản phẩm mà chúng tôi sản xuất.',1,2),
    (N'Giày Sneaker Nữ Adidas Grand Court 2.0 - Hồng', 'https://supersports.com.vn/cdn/shop/files/ID3004-1.jpg?v=1716869851&width=1000', 1400000, N'GIÀY SNEAKER NỮ ADIDAS GRAND COURT 2.0', N'Nhẹ nhàng lướt qua những ngày dài bận rộn. Đôi giày sneaker adidas này giúp bạn vận động dễ dàng, với lót giày Cloudfoam Comfort tạo lớp đệm êm ái. Là phiên bản cải tiến của dòng giày Grand Courts iconic, đôi giày này khoe trọn di sản thể thao, từ 3 Sọc kinh điển tới đế cupsole bằng cao su classic. Sản phẩm này có chứa tối thiểu 20% chất liệu tái chế. Bằng cách tái sử dụng các chất liệu đã được tạo ra, chúng tôi góp phần giảm thiểu lãng phí và hạn chế phụ thuộc vào các nguồn tài nguyên hữu hạn, cũng như giảm phát thải từ các sản phẩm mà chúng tôi sản xuất.',1,2),
    
    (N'Giày Thời Trang Unisex Puma Slipstream Expedition - Vàng', 'https://supersports.com.vn/cdn/shop/files/39574702-1.jpg?v=1714987056&width=1000', 2169300, N'GIÀY THỜI TRANG UNISEX PUMA SLIPSTREAM EXPEDITION', N'Đưa phong cách đường phố của bạn lên một tầm cao mới với Giày Thời Trang Unisex Puma Slipstream Expedition. Sản phẩm kết hợp giữa chất liệu da thuộc cao cấp và thiết kế táo bạo, mang đến cho bạn vẻ ngoài năng động, cá tính và thời trang. Giày Slipstream Expedition đồng hành cùng bạn trong mọi cuộc phiêu lưu, khơi nguồn cảm hứng để bạn khám phá những điều mới mẻ và chinh phục mọi thử thách.',3,6),
    (N'Giày Thời Trang Unisex Puma Slipstream Bball - Trắng', 'https://supersports.com.vn/cdn/shop/files/39326606-1.jpg?v=1693889146&width=1000', 1919400, N'GIÀY THỜI TRANG UNISEX PUMA SLIPSTREAM EXPEDITION', N'Back in 1987, the PUMA Slipstream entered the scene as a high-flying, slam-dunking, statement-making basketball sneaker. With the Slipstream Bball, we are going back to its proud basketball roots. It features a leather upper with subtle pops of colour, as well as a synthetic PUMA Formstrip and synthetic underlays for a clean court-side look.',3,6),
    (N'Giày Sneaker Unisex Puma Rs-X Suede Sugared - Be', 'https://supersports.com.vn/cdn/shop/files/39117610-1.jpg?v=1716806448&width=1000', 2169300, N'GIÀY SNEAKER UNISEX PUMA RS-X SUEDE SUGARED', N'Giày Sneaker Unisex Puma Rs-X Suede Sugared đã trở lại với diện mạo và nguồn năng lượng tươi mới hơn! Đôi giày với sức mạnh khơi gợi sự sáng tạo không giới hạn trong bạn, không chỉ gây ấn tượng ở quá khứ và hiện tại mà còn tiềm ẩn nhiều thông điệp biểu tượng của tương lai. Thiết kế kết hợp hoàn hảo giữa phong cách cổ điển và những tiến bộ hiện đại, Giày Sneaker Unisex Puma Rs-X Suede Sugared mang đến một cái nhìn mới mẻ và sắc nét, phản ánh tinh thần thời đại và tính thẩm mỹ tiến bộ vượt bậc.',3,6),
    (N'Giày Sneaker Unisex Puma Rs-X 3D - Đỏ', 'https://supersports.com.vn/cdn/shop/files/39002507-1.jpg?v=1702289714&width=1000', 2099400, N'GIÀY SNEAKER UNISEX PUMA RS-X 3D', N'Hãy bứt phá mọi giới hạn của phong cách và tự tin thể hiện cá tính của bạn với Giày Sneaker Unisex Puma Rs-X 3D. Với thiết kế phá cách, họa tiết táo bạo và gam màu nổi bật, đôi giày này sẽ biến bạn thành tâm điểm chú ý và truyền cảm hứng cho những người xung quanh. Hãy sở hữu ngay Giày Sneaker Unisex Puma Rs-X 3D để bứt phá phong cách và tỏa sáng với cá tính riêng của bạn!',3,6),
    (N'Giày Thời Trang Nữ Puma Tevaris Nitro Metallic - Đen', 'https://supersports.com.vn/cdn/shop/files/39686302-1.jpg?v=1694399536&width=1000', 1979400, N'GIÀY NỮ PUMA BLACK- GOLD-SHADOW GRAY', N'Chiến thắng mọi thử thách với đôi Giày Nữ Puma Black-Gold-Shadow Gray. Sự kết hợp tinh tế giữa màu đen, vàng và xám tạo nên một phong cách độc đáo và cuốn hút, giúp bạn tỏa sáng trong mọi bước đi.',3,6),
    (N'Giày Sneaker Unisex Puma Rs-Trck Expeditions - Xanh Dương', 'https://supersports.com.vn/cdn/shop/files/39534401-1.jpg?v=1716806502&width=1000', 2309300, N'GIÀY SNEAKER UNISEX PUMA RS-TRCK EXPEDITIONS', N'Bứt phá mọi giới hạn với Giày Sneaker Unisex Puma Rs-Trck Expeditions. Với phom dáng ôm chân giúp bạn di chuyển tự tin và linh hoạt. Đế ngoài cao su chống trơn trượt, tăng cường khả năng bám đường. Trải nghiệm đôi giày Sneaker Unisex Puma Rs-Trck Expeditions được chế tạo để chinh phục mọi thử thách, giày đảm bảo sự bền bỉ và phong cách, giúp bạn tăng tốc mạnh mẽ trong mỗi bước chân.',3,6),
    (N'Giày Thời Trang Nữ Puma Puma-180 - Trắng', 'https://supersports.com.vn/cdn/shop/files/38926705-1.jpg?v=1695198487&width=1000', 1859400, N'GIÀY NỮ PUMA PUMA-180', N'Giày Puma Puma-180 là một bước tiến đột phá, phá vỡ mọi giới hạn và kết hợp văn hóa skateboard cùng với thời trang mới mẻ. Lấy cảm hứng từ các mẫu giày retro của PUMA từ thập kỷ 1990, phiên bản này vô cùng sáng tạo trong việc thể hiện văn hóa thể thao vượt thời gian của thương hiệu bằng ngôn ngữ thiết kế hiện đại. PUMA-180 kết hợp giữa yếu tố cổ điển và xu hướng. Bốn phiên bản giày với màu chủ đạo là xám sương, đen cổ điển, nâu đất và xanh dương hải quân đã ra mắt. Chúng không chỉ đem đến sự mới mẻ cho văn hóa skateboard, mà còn mở ra nhiều khả năng sáng tạo cho những người yêu thời trang đường phố.',3,6),
    (N'Giày Thể Thao Nữ Puma Cali Court Pure Luxe Wns - Đen', 'https://supersports.com.vn/cdn/shop/files/39527502-1.jpg?v=1711361105&width=1000', 1679400, N'GIÀY THỂ THAO NỮ PUMA CALI COURT PURE LUXE WNS', N'Puma Cali Court Pure Luxe Wns là sự kết hợp hoàn hảo giữa phong cách đường phố năng động và vẻ đẹp sang trọng. Đôi giày này phá vỡ các quy tắc bằng cách pha trộn các chi tiết công nghệ tương lai nổi bật với kiểu dáng tối giản siêu đẹp. Chất liệu cao cấp và cảm hứng xa hoa được kết hợp tinh tế để tạo nên một đôi giày độc đáo, thu hút mọi ánh nhìn.',3,6),
    (N'Giày Thời Trang Nữ Puma Teveris Nitro Metallic - Xám', 'https://supersports.com.vn/cdn/shop/files/39686301-1.jpg?v=1695378082&width=1000', 2039400, N'GIÀY THỂ THAO NỮ PUMA FEATHER ', N'Giày thể thao nữ Puma Feather là sự kết hợp tinh tế giữa phong cách thể thao và thời trang hiện đại. Với nguồn cảm hứng từ dòng sản phẩm chạy của PUMA trong những năm 2000, Teveris NITRO mang đến một diện mạo phù hợp cho cuộc sống năng động của bạn. Dòng sản phẩm này được tái tạo và trang bị công nghệ NITRO™ trên lớp đế giữa để tạo ra sự thoải mái tối đa, đồng thời sở hữu một upper bằng vải canvas kết hợp với lớp lót bằng da lông màu bạc tạo nên một vẻ ngoài độc đáo.',3,6),
    (N'Giày Sneaker Unisex Puma Spirex Speed Mist - Xám', 'https://supersports.com.vn/cdn/shop/files/39726302-1.jpg?v=1702289868&width=1000', 2579400, N'GIÀY SNEAKER UNISEX PUMA SPIREX SPEED MIST', N'Được lấy cảm hứng từ những biểu tượng tốc độ của PUMA, đây là sự tiếp nối của phong cách retro mang đến hơi thở mới mẻ. Hãy sở hữu ngay Giày Sneaker Unisex Puma Spirex Speed Mist để thêm nét cá tính táo bạo cho phong cách thời trang của bạn!',3,6)
    
  ;
GO
