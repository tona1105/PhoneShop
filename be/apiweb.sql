Create database Apiweb1
go

use Apiweb1
go 




CREATE TABLE menu(
	menuid int IDENTITY (1,1) NOT NULL,
	menuname NVARCHAR(1000)  NOT NULL,
	menuavata  NVARCHAR(1000)  NOT NULL, 
	PRIMARY KEY (menuid)
)

INSERT INTO menu(menuname,menuavata)
VALUES(N'Iphone',N'https://cdn1.viettelstore.vn/Images/Product/ProductImage/134891339.jpeg')
INSERT INTO menu(menuname,menuavata)
VALUES(N'Samsung',N'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_burgundy_211119_2.jpg')
INSERT INTO menu(menuname,menuavata)
VALUES(N'Xiaomi',N'https://cdn.tgdd.vn/Products/Images/42/291623/xiaomi-12t-thumb-600x600.jpg')
INSERT INTO menu(menuname,menuavata)
VALUES(N'Tất cả',N'https://m-cdn.phonearena.com/images/article/141696-wide-two_1200/Too-good-to-compete-with-iPhone-and-Samsung-The-Xiaomi-phone-that-must-be-protected-at-all-costs.jpg')


CREATE TABLE product ( 
	productid  INT  IDENTITY   (1,1) NOT NULL, 
	productname NVARCHAR(1000)  NOT NULL, 
	menuid INT NOT NULL,
	price INT NOT NULL,
	imghp  NVARCHAR(1000)  NOT NULL, 
	img1  NVARCHAR(1000)  NOT NULL,
	img2  NVARCHAR(1000) ,  
	img3  NVARCHAR(1000)  ,
	img4  NVARCHAR(1000)   ,
	productDescription NTEXT  NOT NULL,
	inStock int,
	typeProduct int 
	PRIMARY KEY (productid)
)

	GO
INSERT INTO product(productname,menuid,price,imghp,img1,img2,img3,img4,productDescription,inStock,typeProduct)
VALUES(N'iPhone 14 Pro Max (128GB)',1,24000000,
N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2022/09/08/44444.png',
N'https://i.ibb.co/mXJSbYk/mota1.png',
N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2022/09/08/222222.png',
N'https://admin.hoanghamobile.com/Uploads/2022/10/05/33.jpg',
N'https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/Phone/Apple/iphone-14/iphone-14-pro-max-4.jpg',
N'iPhone 14 Pro Max là mẫu flagship nổi bật nhất của Apple trong lần trở lại năm 2022 với nhiều cải tiến về công nghệ cũng như vẻ ngoài cao cấp, 
sang chảnh hợp với gu thẩm mỹ đại chúng. Những chiếc điện thoại đến từ nhà Táo Khuyết nhận được rất nhiều sự kỳ vọng của thị trường ngay từ khi 
chưa ra mắt',12,1)
INSERT INTO product(productname,menuid,price,imghp,img1,img2,img3,img4,productDescription,inStock,typeProduct)
VALUES(N'Apple iPhone 13 - 128GB',1,16500000,
N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2021/09/15/image-removebg-preview-14.png',
N'https://i.ibb.co/3z68h4D/mota2.png',
N'https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-4.jpg',
N'https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-6.jpg',
N'https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-19.jpg',
N'iPhone 13 mini được Apple ra mắt với hàng loạt nâng cấp về cấu hình và các tính năng hữu ích, lại có thiết kế vừa vặn. 
Chiếc điện thoại này hứa hẹn là một thiết bị hoàn hảo hướng tới những khách hàng thích sự nhỏ gọn nhưng 
vẫn giữ được sự mạnh mẽ bên trong. ',15,0)

INSERT INTO product(productname,menuid,price,imghp,img1,img2,img3,img4,productDescription,inStock,typeProduct)
VALUES(N'Điện thoại iPhone 12 64GB ',1,15000000,
N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2021/04/22/image-removebg-preview_637547045799326930.png',
N'https://i.ibb.co/kyHrXdT/mota3.png',
N'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-13.jpg',
N'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-040321-030352.jpg',
N'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-040421-030410.jpg',
N'Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới 
với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, 
hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB.',20,1)

INSERT INTO product(productname,menuid,price,imghp,img1,img2,img3,img4,productDescription,inStock,typeProduct)
VALUES(N'iPhone 11 (64GB)',1,10150000,
N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2020/09/17/ip11_white.jpg',
N'https://i.ibb.co/XWSf7dB/mtoa4.png',
N'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-tgdd45.jpg',
N'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-119.jpg',
N'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-112-1.jpg',
N'Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng
vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.',16,0)

INSERT INTO product(productname,menuid,price,imghp,img1,img2,img3,img4,productDescription,inStock,typeProduct)
VALUES(N'Samsung Galaxy A54 5G',2,4700000,
N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2023/03/15/a3455.png',
N'https://i.ibb.co/mJryHhQ/mota5.png',
N'https://cdn.tgdd.vn/Products/Images/42/250103/samsung-galaxy-a54-150323-045109.jpg',
N'https://cdn.tgdd.vn/Products/Images/42/250103/samsung-galaxy-a54-150323-045105.jpg',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2023/03/16/11_638145742534471870.png',
N'Samsung vừa tung ra thị trường mẫu điện thoại thông minh Samsung Galaxy A54 5G 128GB vào tháng 03/2023. Đây là một sản phẩm tầm trung đáng chú ý, 
được trang bị màn hình Super AMOLED hiện đại và sử dụng con chip Exynos 1380 do Samsung sản xuất.',13,0)

INSERT INTO product(productname,menuid,price,imghp,img1,img2,img3,img4,productDescription,inStock,typeProduct)
VALUES(N'Samsung Galaxy S22',2,15000000,
N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2022/02/09/image-removebg-preview_637800437459949020.png',
N'https://i.ibb.co/gMfXRVp/mota6.png',
N'https://admin.hoanghamobile.com/Uploads/2022/02/17/galaxy-s22-5g.png',
N'https://admin.hoanghamobile.com/Uploads/2022/02/17/galaxy-s22-5g-3.png',
N'https://admin.hoanghamobile.com/Uploads/2022/02/17/galaxy-s22-5g-4.png',
N'Samsung Galaxy S22 đã được Samsung cho ra mắt vào ngày 09/02/2022. Máy nổi bật với cụm camera được cải tiến 
giúp bạn sáng tạo khoảnh khắc ấn tượng mỗi ngày, một vi xử lý mạnh mẽ cho mọi tác vụ sử dụng đều trở nên mượt mà hơn.',20,1)

INSERT INTO product(productname,menuid,price,imghp,img1,img2,img3,img4,productDescription,inStock,typeProduct)
VALUES(N'Samsung Galaxy S22 Ultra',2,17390000,
N'https://sieuthismartphone.com/data/product/vhi1644578946.jpg',
N'https://i.ibb.co/Th98Lq7/mota7.png',
N'https://admin.hoanghamobile.com/Uploads/2022/02/17/samsung-galaxy-s22-ultra.png',
N'https://admin.hoanghamobile.com/Uploads/2022/02/17/samsung-galaxy-s22-ultra-3.png',
N'https://admin.hoanghamobile.com/Uploads/2022/02/17/samsung-galaxy-s22-ultra-2.png',
N'Samsung Galaxy S22 Ultra 256GB - chiếc điện thoại Galaxy S đầu tiên sở hữu bút S Pen trong thân máy, được cung cấp sức mạnh bởi CPU
đến từ Qualcomm, sở hữu thiết kế sang trọng, màn hình có nhiều cải tiến cùng cụm camera zoom 100x.',19,0)

INSERT INTO product(productname,menuid,price,imghp,img1,img2,img3,img4,productDescription,inStock,typeProduct)
VALUES(N'Samsung Galaxy S23 Ultra',2,28000000,
N'https://i.ibb.co/PzTkDJT/ssutra23.jpg',
N'https://i.ibb.co/sHn77K7/mota8.png',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2023/02/06/11_638112954228119030.jpg',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2023/02/06/22_638112954228119030.jpg',
N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2023/02/02/image-removebg-preview-2_638109032737377121.png',
N'Với những ai là tín đồ công nghệ thì Samsung Galaxy S23 Ultra 5G 512GB chắc hẳn không còn là cái tên quá xa lạ tại thời điểm này nữa,
mới đây thì máy cũng đã chính thức được giới thiệu với hàng loạt các tính năng cũng như công nghệ nổi bật, có thể thấy thì đây được 
xem là một trong những sản phẩm đột phá về mọi mặt đến từ nhà Samsung 
trong năm 2023 nhằm hướng đến vị trí thương hiệu hàng đầu trong ngành.',10,1)


INSERT INTO product(productname,menuid,price,imghp,img1,img2,img3,img4,productDescription,inStock,typeProduct)
VALUES(N'Redmi Note 12 (4GB/128GB)',3,4490000,
N'https://product.hstatic.net/1000379792/product/note-12-turbo-hai-phong-3_a7f8151d7abe4f739fcfb94e1ef23931.jpg',
N'https://i.ibb.co/P63gwXt/mota9.png',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2023/03/25/22.jpg',
N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2023/03/24/redminote12-black-1.png',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2023/03/25/image-removebg-preview-1.png',
N'Redmi Note 12 (4GB/128GB) được kì vọng sẽ tiếp nối sự thành công của các mẫu điện thoại tầm trung trước đó đến từ Xiaomi. 
Sau khi ra mắt tại thị trường Trung Quốc, sản phẩm này đã được giới thiệu trên toàn cầu với rất nhiều ưu điểm nổi bật.',11,1)

INSERT INTO product(productname,menuid,price,imghp,img1,img2,img3,img4,productDescription,inStock,typeProduct)
VALUES(N' Xiaomi 12 Lite 5G ',3,8590000,
N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2022/10/05/image-removebg-preview-1.png',
N'https://i.ibb.co/b6gqY7r/mota10.png',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2022/09/08/11.jpeg',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2022/09/08/22.jpeg',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2022/09/08/44.jpeg',
N'Với trọng lượng 173g và mỏng chỉ 7,29mm, Xiaomi 12 Lite có thiết kế siêu mỏng và nhẹ như lông vũ với khung viền phẳng kiểu dáng đẹp để thêm 
gia vị cho phong cách sống thời trang của bạn. Điện thoại sở hữu 3 tùy chọn màu sắc nổi bật bao gồm 3 màu sắc tuyệt đẹp là Lite Green, 
Lite Pink và Đen huyền bí.',15,0)


INSERT INTO product(productname,menuid,price,imghp,img1,img2,img3,img4,productDescription,inStock,typeProduct)
VALUES(N'Xiaomi 13 Lite (8GB/256GB)',3,9690000,
N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2023/02/27/xiaomi-13-lite-xanh-234567890.png',
N'https://i.ibb.co/JHXqSWx/mota11.png',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2023/03/13/11_638143198606931470.jpg',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2023/03/13/22_638143198606931470.jpg',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2023/03/13/44_638143198606931470.jpg',
N'Dù mới ra mắt cách đây không lâu nhưng Xiaomi 13 Lite lại chiếm được cảm tình của nhiều người dùng yêu công nghệ. Đáng nói là, giá của dòng điện thoại này mềm hơn hẳn 2
“anh em” cùng dòng là Xiaomi 13 và Xiaomi 13 pro, và cũng có thiết kế “mềm mại” hơn.',13,0)

INSERT INTO product(productname,menuid,price,imghp,img1,img2,img3,img4,productDescription,inStock,typeProduct)
VALUES(N'Redmi Note 11 - 4GB/128GB',3,3990000,
N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2022/01/27/image-removebg-preview-3.png',
N'https://i.ibb.co/QJLg14W/mota12.png',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2022/01/28/redmi-note-11.png',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2022/01/28/redmi-note-11-3.jpg',
N'https://cdn.hoanghamobile.com/i/content/Uploads/2022/01/28/redmi-note-11-2.png',
N'Điện thoại Xiaomi Redmi Note 11 hội tụ đủ những yếu tố ấn tượng của một chiếc smartphone tầm trung: 
Camera 108 MP số 1 phân khúc, màn hình AMOLED 120 Hz, pin 5000 mAh, 
sạc nhanh 67 W, hỗ trợ 5G cùng con chip Snapdragon 695 mạnh mẽ.',16,1)


CREATE TABLE news(
  newsid INT IDENTITY (1,1) NOT NULL,
  newsname NVARCHAR(1000)  NOT NULL,
  newsavata  NVARCHAR(1000)  NOT NULL, 
  Descriptions NTEXT  NOT NULL,
  PRIMARY KEY (newsid)
)


 CREATE TABLE CustomerSP(
	 customerSPid int IDENTITY (1,1) NOT NULL,
	 customerSPname NVARCHAR(1000),
	 customerSPemail NVARCHAR(1000),
	 customerSPDescriptions NTEXT  NOT NULL,
	 PRIMARY KEY (customerSPid)
 )

 --Tạo table Slide 
create table slide(
	slideid int identity(1,1) NOT NULL,
	slidetitle nvarchar (1000) NOT NULL ,
	slidedescription nvarchar (1000),
	slideimg nvarchar(1000),
	slideActive int,
	slidetype int ,
)
insert into slide (slidetitle,slidedescription,slideimg,slideActive,slidetype )
values ( N'Iphone',N'iPhone là chiếc điện thoại thông minh đầu tiên và duy nhất trên thế giới chạy hệ điều hành iOS được sản xuất bởi Apple. Đến nay sau hơn 15 năm phát hành (kể từ ngày 29/6/2007), 
iPhone đã có 32 phiên bản khác nhau. Đi kèm với đó Apple đã cho ra mắt hơn 15 phiên bản mới của hệ điều hành iOS.'
,'https://lh3.googleusercontent.com/-vuthHqd-E0RH84yyuUzrjjRoDSxS2yGJYPEm7a_u5Zdzc5Z4Iedqfy33VNzV2rohZfhLWfBr7a5gSFx0MYXTZ5Z8ykG1Tm8o3hmaLFy-zRm875GqZOVpm0DCAlrpq36SkcNXkdpILqX1D5odrN112g',1,1)
insert into slide (slidetitle,slidedescription,slideimg,slideActive,slidetype )
values ( N'Samsung', N'Samsung là một thương hiệu điện tử, viễn thông có trụ sở đặt tại hàn Quốc, được thành lập vào năm 1938. 
Cho tới nay, Samsung là một trong những thương hiệu điện tử lớn trên thế giới, và là nhà sản xuất điện thoại lớn nhất trên thế giới.'
,'https://cdn11.dienmaycholon.vn/filewebdmclnew/public//userupload/images/dien-thoai-samsung-co-tot-khong-1.jpg',0,1)
insert into slide (slidetitle,slidedescription,slideimg,slideActive,slidetype )
values ( N'Xiaomi', N'Được sản xuất và lắp ráp ngay tại Trung Quốc với công nghệ hiện đại đạt tiêu chuẩn quốc tế, những chiếc điện thoại Xiaomi chính hãng hoàn toàn có thể chinh phục người dùng Việt bởi cấu hình phần cứng cao,
phần mềm tùy biến nhiều tính năng và giá bán hấp dẫn..'
,'https://cdn.tgdd.vn/Files/2018/06/26/1097596/dien-thoai-xiaomi-la-thuong-hieu-cua-nuoc-nao-san-xuat-o-dau--5.jpg',0,1)

 
	CREATE TABLE Customer(
customerid int IDENTITY (1,1) NOT NULL,
customername NVARCHAR(1000)  NOT NULL,
customeremail NVARCHAR(1000)  NOT NULL,
customernumber  NVARCHAR(1000)  NOT NULL,
customerpassword NVARCHAR(1000),
PRIMARY KEY (customerid)
)


CREATE TABLE Cart ( 
	Cartid  INT  IDENTITY (1,1) NOT NULL, 
	productid INT,
	productname NVARCHAR(1000)  NOT NULL, 
	price INT NOT NULL,
	imghp  NVARCHAR(1000)  NOT NULL, 
	Allprice int  NOT NULL, 
    cartquantity INT,
	PRIMARY KEY (Cartid),
	customerid int   NOT NULL,
	CONSTRAINT PK_Customer_Cart FOREIGN KEY(customerid)
	REFERENCES Customer(customerid),
	)
	GO
	select * from Cart


	CREATE TABLE About ( 
	Abouttid  INT  IDENTITY (1,1) NOT NULL, 
	Abouttitle NVARCHAR(1000)  NOT NULL, 
	Aboutimg NVARCHAR(1000)  NOT NULL, 
	AboutDescriptions  NVARCHAR(1000)  NOT NULL, 
	PRIMARY KEY (Abouttid)
	)
	GO
	
	insert into About(Abouttitle,Aboutimg, AboutDescriptions)
     values(N'Tona Shop',N'https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/mobile/dien-thoai-1.jpg',
	 N'Tona Shop luôn hoạt động dựa trên tôn chỉ đặt khách hàng là trung tâm, mọi nỗ lực để đạt được mục tiêu cao nhất là làm hài lòng 
	 người dùng thông qua các sản phẩm được cung cấp và dịch vụ khách hàng. Tona Shope đang từng bước xây dựng dịch vụ khách hàng vượt trội, 
	 xứng đáng là đơn vị bán lẻ hàng đầu tại Việt Nam. Sự tin tưởng và ủng hộ nhiệt tình của quý khách hàng tại chuỗi chi nhánh đã phần nào khẳng định hiệu quả hoạt động của đội ngũ nhân viên.')
	 
	

	
	CREATE TABLE Bill ( 
BillId  INT  IDENTITY (1,1) NOT NULL, 
Customer NVARCHAR(1000)  NOT NULL, 
Phonenumber NVARCHAR(1000)  NOT NULL, 
Address  NVARCHAR(1000)  NOT NULL, 
customerid int   NOT NULL,
DayOrder datetime DEFAULT (getdate()),
Status  INT  NOT NULL, 
PRIMARY KEY (BillId),
CONSTRAINT PK_Customer FOREIGN KEY(customerid)
	REFERENCES Customer(customerid)
	)
	GO 


	CREATE TABLE BillDetail ( 
BiDid  INT  IDENTITY (1,1) NOT NULL, 
Quantity INT  NOT NULL, 
BillId Int,
productname NVARCHAR(1000)  NOT NULL, 
price INT NOT NULL,
Allprice int  NOT NULL, 
PRIMARY KEY (BiDid),
)



	CREATE TABLE Comments (
commentid int IDENTITY (1,1) NOT NULL,
productid int  NOT NULL,
productname NVARCHAR(1000) NOT NULL,
customername NVARCHAR(1000) NOT NULL,
commentDescriptions NVARCHAR(1000) NOT NULL,
PRIMARY KEY (Commentid)
)
go


CREATE TABLE admin (
adminid int IDENTITY (1,1) NOT NULL,
UserName NVARCHAR(1000) NOT NULL,
Password NVARCHAR(1000) NOT NULL,
PRIMARY KEY (adminid),
)
go

select * from admin
 

