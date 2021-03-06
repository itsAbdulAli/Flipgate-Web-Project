USE [master]
GO
/****** Object:  Database [FLIP_GATE]    Script Date: 25/06/2021 12:16:22 pm ******/
CREATE DATABASE [FLIP_GATE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FLIP_GATE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FLIP_GATE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FLIP_GATE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FLIP_GATE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FLIP_GATE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FLIP_GATE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FLIP_GATE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FLIP_GATE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FLIP_GATE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FLIP_GATE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FLIP_GATE] SET ARITHABORT OFF 
GO
ALTER DATABASE [FLIP_GATE] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FLIP_GATE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FLIP_GATE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FLIP_GATE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FLIP_GATE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FLIP_GATE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FLIP_GATE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FLIP_GATE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FLIP_GATE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FLIP_GATE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FLIP_GATE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FLIP_GATE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FLIP_GATE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FLIP_GATE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FLIP_GATE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FLIP_GATE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FLIP_GATE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FLIP_GATE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FLIP_GATE] SET  MULTI_USER 
GO
ALTER DATABASE [FLIP_GATE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FLIP_GATE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FLIP_GATE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FLIP_GATE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FLIP_GATE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FLIP_GATE] SET QUERY_STORE = OFF
GO
USE [FLIP_GATE]
GO
/****** Object:  Schema [FLIP_GATE_SCHEMA]    Script Date: 25/06/2021 12:16:22 pm ******/
CREATE SCHEMA [FLIP_GATE_SCHEMA]
GO
/****** Object:  Table [FLIP_GATE_SCHEMA].[User_]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FLIP_GATE_SCHEMA].[User_](
	[Userid] [int] IDENTITY(1,1) NOT NULL,
	[FName] [varchar](50) NOT NULL,
	[LName] [varchar](50) NULL,
	[Passsword] [varchar](16) NOT NULL,
	[DOB] [date] NULL,
	[Bank_Account_Title] [varchar](50) NULL,
	[Bank_Name] [varchar](30) NULL,
	[Bank_Account_ID] [varchar](13) NULL,
	[Contact_No] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Region] [varchar](30) NULL,
	[Ratings] [float] NULL,
	[UserType] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [FLIP_GATE_SCHEMA].[Listings]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FLIP_GATE_SCHEMA].[Listings](
	[Userid] [int] NOT NULL,
	[sellerListingNo] [int] NOT NULL,
	[ListingType] [varchar](50) NOT NULL,
	[ListingDescription] [text] NOT NULL,
	[ListingStatus] [bit] NOT NULL,
	[ListingWishlists] [int] NOT NULL,
	[Financial_History_ID] [int] NOT NULL,
	[Listing_Posting_date] [date] NOT NULL,
	[Price] [int] NULL,
	[Listing_Title] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Userid] ASC,
	[sellerListingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Listings_View_Simple]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Listings_View_Simple]
as
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where Listings.ListingStatus=1
GO
/****** Object:  Table [FLIP_GATE_SCHEMA].[ListingType]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FLIP_GATE_SCHEMA].[ListingType](
	[Category_No] [int] NOT NULL,
	[Category_Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[listings_categories]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[listings_categories]
as
select * from FLIP_GATE_SCHEMA.ListingType
GO
/****** Object:  Table [FLIP_GATE_SCHEMA].[Cart]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FLIP_GATE_SCHEMA].[Cart](
	[UserID] [int] NOT NULL,
	[SellerID] [int] NOT NULL,
	[SellerListingNo] [int] NOT NULL,
	[Price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[SellerID] ASC,
	[SellerListingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [FLIP_GATE_SCHEMA].[Deal]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FLIP_GATE_SCHEMA].[Deal](
	[Deal_id] [int] IDENTITY(1,1) NOT NULL,
	[Seller_id] [int] NULL,
	[Buyer_id] [int] NULL,
	[date_of_deal] [date] NULL,
	[sellerListingNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Deal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [FLIP_GATE_SCHEMA].[Financial_Insights]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FLIP_GATE_SCHEMA].[Financial_Insights](
	[InsightID] [int] NOT NULL,
	[month1] [float] NULL,
	[month2] [float] NULL,
	[month3] [float] NULL,
	[month4] [float] NULL,
	[month5] [float] NULL,
	[month6] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[InsightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [FLIP_GATE_SCHEMA].[InteractionBS_Table]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FLIP_GATE_SCHEMA].[InteractionBS_Table](
	[InteractionID] [int] NOT NULL,
	[BuyerID] [int] NOT NULL,
	[SellerID] [int] NOT NULL,
	[InteractionDate] [date] NOT NULL,
	[InteractionTime] [time](7) NOT NULL,
	[Chat] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[InteractionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [FLIP_GATE_SCHEMA].[Listing_FinancialHistory]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FLIP_GATE_SCHEMA].[Listing_FinancialHistory](
	[Financial_History_ID] [int] NOT NULL,
	[MonthlyProfits] [int] NOT NULL,
	[Revenue] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Financial_History_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [FLIP_GATE_SCHEMA].[PremiumStatus]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FLIP_GATE_SCHEMA].[PremiumStatus](
	[Userid] [int] NOT NULL,
	[PremiumStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [FLIP_GATE_SCHEMA].[Surfing_History]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FLIP_GATE_SCHEMA].[Surfing_History](
	[Buyer_id] [int] NOT NULL,
	[VisitedListing1] [int] NULL,
	[VisitedListing2] [int] NULL,
	[VisitedListing3] [int] NULL,
	[VisitedListing4] [int] NULL,
	[VisitedListing5] [int] NULL,
	[VisitedListing6] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Buyer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[Cart]  WITH CHECK ADD FOREIGN KEY([SellerID], [SellerListingNo])
REFERENCES [FLIP_GATE_SCHEMA].[Listings] ([Userid], [sellerListingNo])
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[Cart]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [FLIP_GATE_SCHEMA].[User_] ([Userid])
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[Deal]  WITH CHECK ADD FOREIGN KEY([Buyer_id])
REFERENCES [FLIP_GATE_SCHEMA].[User_] ([Userid])
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[Deal]  WITH CHECK ADD FOREIGN KEY([Seller_id])
REFERENCES [FLIP_GATE_SCHEMA].[User_] ([Userid])
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[InteractionBS_Table]  WITH CHECK ADD FOREIGN KEY([BuyerID])
REFERENCES [FLIP_GATE_SCHEMA].[User_] ([Userid])
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[InteractionBS_Table]  WITH CHECK ADD FOREIGN KEY([SellerID])
REFERENCES [FLIP_GATE_SCHEMA].[User_] ([Userid])
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[Listing_FinancialHistory]  WITH CHECK ADD FOREIGN KEY([MonthlyProfits])
REFERENCES [FLIP_GATE_SCHEMA].[Financial_Insights] ([InsightID])
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[Listing_FinancialHistory]  WITH CHECK ADD FOREIGN KEY([Revenue])
REFERENCES [FLIP_GATE_SCHEMA].[Financial_Insights] ([InsightID])
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[Listings]  WITH CHECK ADD FOREIGN KEY([Financial_History_ID])
REFERENCES [FLIP_GATE_SCHEMA].[Listing_FinancialHistory] ([Financial_History_ID])
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[Listings]  WITH CHECK ADD FOREIGN KEY([Userid])
REFERENCES [FLIP_GATE_SCHEMA].[User_] ([Userid])
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[PremiumStatus]  WITH CHECK ADD FOREIGN KEY([Userid])
REFERENCES [FLIP_GATE_SCHEMA].[User_] ([Userid])
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[Surfing_History]  WITH CHECK ADD FOREIGN KEY([Buyer_id])
REFERENCES [FLIP_GATE_SCHEMA].[User_] ([Userid])
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[User_]  WITH CHECK ADD  CONSTRAINT [Accountitle_CONSTRAINT] CHECK  ((len([Bank_Account_ID])=(11) OR len([Bank_Account_ID])=(13)))
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[User_] CHECK CONSTRAINT [Accountitle_CONSTRAINT]
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[User_]  WITH CHECK ADD CHECK  (([Ratings]>=(0) AND [Ratings]<=(5)))
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[User_]  WITH CHECK ADD  CONSTRAINT [Email_CONSTRAINT] CHECK  (([Email] like '%@%'))
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[User_] CHECK CONSTRAINT [Email_CONSTRAINT]
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[User_]  WITH CHECK ADD  CONSTRAINT [PASSWORD_CONSTRAINT1] CHECK  (([Passsword] like '%[0-9]%' AND [Passsword] like '%[A-Z]%' AND [Passsword] like '%[!@#$%a^&*()-_+=.,;:"`~]%' AND len([Passsword])>=(8)))
GO
ALTER TABLE [FLIP_GATE_SCHEMA].[User_] CHECK CONSTRAINT [PASSWORD_CONSTRAINT1]
GO
/****** Object:  StoredProcedure [dbo].[AddListing]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddListing]
@Email varchar(50),
@Price int,
@ListingType varchar(50),
@ListingDescription text,
@ListingTitle varchar(30),
@MPm1 float ,
@MPm2 float ,
@MPm3 float ,
@MPm4 float ,
@MPm5 float ,
@MPm6 float ,
@Rm1 float ,
@Rm2 float ,
@Rm3 float ,
@Rm4 float ,
@Rm5 float ,
@Rm6 float 
as 
begin
	declare @SellerID int
	declare @SellerListingNo int
	declare @Listing_FHID int
	declare @Listing_MPID int
	declare @Listing_RevID int
	
	set @SellerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)
	if ((select (COUNT(FLIP_GATE_SCHEMA.Listings.Userid)) from FLIP_GATE_SCHEMA.Listings where Listings.Userid=@SellerID group by Userid) > 0)
		begin
		set @SellerListingNo= (select (MAX(FLIP_GATE_SCHEMA.Listings.sellerListingNo)+1) from FLIP_GATE_SCHEMA.Listings where Listings.Userid=@SellerID)
		end
	else
		begin
		set @SellerListingNo=1
		end
	set @Listing_FHID = (select (MAX(Listing_FinancialHistory.Financial_History_ID)+1) from FLIP_GATE_SCHEMA.Listing_FinancialHistory)
	set @Listing_MPID = (select (MAX(Financial_Insights.InsightID)+1) from FLIP_GATE_SCHEMA.Financial_Insights)
	set @Listing_RevID = (select (MAX(Financial_Insights.InsightID)+2) from FLIP_GATE_SCHEMA.Financial_Insights)
	
	Insert into FLIP_GATE_SCHEMA.Financial_Insights
	values (@Listing_MPID,@MPm1,@MPm2,@MPm3,@MPm4,@MPm5,@MPm6)

	Insert into FLIP_GATE_SCHEMA.Financial_Insights
	values (@Listing_RevID,@Rm1,@Rm2,@Rm3,@Rm4,@Rm5,@Rm6)

	Insert into FLIP_GATE_SCHEMA.Listing_FinancialHistory
	values (@Listing_FHID,@Listing_MPID,@Listing_RevID)

	Insert into FLIP_GATE_SCHEMA.Listings
	values(@SellerID, @SellerListingNo,@ListingType,@ListingDescription,1,0,@Listing_FHID, CAST(GETDATE() as date),@Price,@ListingTitle)


End
GO
/****** Object:  StoredProcedure [dbo].[addToCart]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addToCart]
@Email varchar (50),
@SellerID int,
@sellerListingNo int,
@Price int
as
begin
 declare @BuyerID int
 set @BuyerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)
 Insert into FLIP_GATE_SCHEMA.Cart
 values (@BuyerID,@SellerID,@sellerListingNo,@Price)

end
GO
/****** Object:  StoredProcedure [dbo].[CartTotalPrice]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CartTotalPrice]
@Email varchar(30),
@Cost int OUTPUT
as
begin
declare @BuyerID int
set @BuyerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)
if (Select Count(Listings.Price) from FLIP_GATE_SCHEMA.Cart 
join FLIP_GATE_SCHEMA.Listings on Listings.Userid=Cart.SellerID AND Listings.sellerListingNo=Cart.SellerListingNo
where Cart.UserID=@BuyerID)>0
begin
set @Cost= (Select SUM(Listings.Price) from FLIP_GATE_SCHEMA.Cart 
join FLIP_GATE_SCHEMA.Listings on Listings.Userid=Cart.SellerID AND Listings.sellerListingNo=Cart.SellerListingNo
where Cart.UserID=@BuyerID )
end
else 
begin
set @Cost=0
end
end
GO
/****** Object:  StoredProcedure [dbo].[checkoutCart]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[checkoutCart]
@Email varchar(50)
as
begin
declare @sellerID int
declare @buyerID int
declare @sellerListingNo int
declare @date_of_deal date
set @buyerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)
if (select COUNT(Cart.UserID) from FLIP_GATE_SCHEMA.Cart where Cart.UserID=@buyerID) >0
begin
insert into FLIP_GATE_SCHEMA.Deal (Seller_id,Buyer_id,date_of_deal,sellerListingNo)
(select T.Seller_id,T.Buyer_id,Cast(GETDATE() as date),T.sellerListingNo from 
(Select Listings.Userid as Seller_id , Cart.UserID as Buyer_id,Listings.sellerListingNo as sellerListingNo
from FLIP_GATE_SCHEMA.Cart 
join FLIP_GATE_SCHEMA.Listings on Listings.Userid=Cart.SellerID AND Listings.sellerListingNo=Cart.SellerListingNo
where Cart.UserID=@buyerID and Listings.ListingStatus=1) as T)
update FLIP_GATE_SCHEMA.Listings
set ListingStatus = 0
where Listings.Userid in (select Cart.SellerID from FLIP_GATE_SCHEMA.Cart where Cart.UserID=@buyerID)
And Listings.sellerListingNo in (select Cart.SellerListingNo from FLIP_GATE_SCHEMA.Cart where Cart.UserID=@buyerID)

delete from FLIP_GATE_SCHEMA.Cart
where Cart.SellerID in (select Cart.SellerID from FLIP_GATE_SCHEMA.Cart where Cart.UserID=@buyerID)
And Cart.sellerListingNo in (select Cart.SellerListingNo from FLIP_GATE_SCHEMA.Cart where Cart.UserID=@buyerID)

delete from FLIP_GATE_SCHEMA.Cart
where Cart.UserID=@buyerID


end

end
GO
/****** Object:  StoredProcedure [dbo].[DeleteFromCart]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteFromCart]
@Email varchar(50),
@sellerListingNo int,
@Sellerid int
as
begin
delete from FLIP_GATE_SCHEMA.Cart
where Cart.SellerID=@SellerID and Cart.SellerListingNo=@sellerListingNo
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteSellerListing]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteSellerListing]
@Email varchar(50),
@sellerListingNo int
as
begin
declare @SellerID int
set @SellerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)
delete from FLIP_GATE_SCHEMA.Listings
where Listings.Userid=@SellerID and Listings.sellerListingNo=@sellerListingNo
end
GO
/****** Object:  StoredProcedure [dbo].[edit_profile_info]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[edit_profile_info]
@Email_ID varchar(50),
@FName varchar(50) ,
@LName varchar(50) ,
@Password varchar(16) ,
@Bank_Acc_Title varchar(50) ,
@Bank_Name varchar(30) ,
@Bank_Acc_ID varchar(13) ,
@Contact_No varchar(10)
as
begin
update FLIP_GATE_SCHEMA.User_
set FName=@FName, LName=@LName,Passsword=@Password,Bank_Account_Title=@Bank_Acc_Title,Bank_Name=@Bank_Name,Bank_Account_ID=@Bank_Acc_ID,Contact_No=@Contact_No
where Email=@Email_ID
end
GO
/****** Object:  StoredProcedure [dbo].[EditPrevListing]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EditPrevListing]
@Email varchar(50),
@SellerListingNo int,
@Price int,
@ListingType varchar(50),
@ListingDescription text,
@ListingTitle varchar(30),
@MPm1 float ,
@MPm2 float ,
@MPm3 float ,
@MPm4 float ,
@MPm5 float ,
@MPm6 float ,
@Rm1 float ,
@Rm2 float ,
@Rm3 float ,
@Rm4 float ,
@Rm5 float ,
@Rm6 float 
as 
begin
	declare @SellerID int
	
	declare @Listing_FHID int
	declare @Listing_MPID int
	declare @Listing_RevID int
	
	set @SellerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)
	set @Listing_FHID = (select Listings.Financial_History_ID from FLIP_GATE_SCHEMA.Listings where Listings.Userid=@SellerID AND Listings.sellerListingNo=@SellerListingNo)
	set @Listing_MPID = (select Listing_FinancialHistory.MonthlyProfits from FLIP_GATE_SCHEMA.Listing_FinancialHistory where Listing_FinancialHistory.Financial_History_ID=@Listing_FHID)
	set @Listing_RevID = (select Listing_FinancialHistory.Revenue from FLIP_GATE_SCHEMA.Listing_FinancialHistory where Listing_FinancialHistory.Financial_History_ID=@Listing_FHID)
	

	update FLIP_GATE_SCHEMA.Financial_Insights
	set month1=@MPm1,month2=@MPm2,month3=@MPm3,month4=@MPm4,month5=@MPm5,month6=@MPm6
	where Financial_Insights.InsightID=@Listing_MPID

	update FLIP_GATE_SCHEMA.Financial_Insights
	set month1=@Rm1,month2=@Rm2,month3=@Rm3,month4=@Rm4,month5=@Rm5,month6=@Rm6
	where Financial_Insights.InsightID=@Listing_RevID

	update FLIP_GATE_SCHEMA.Listings
	set ListingType=@ListingType,ListingDescription=@ListingDescription,Listing_Posting_date= CAST(GETDATE() as date),Price=@Price,Listing_Title=@ListingTitle
	where Listings.Userid=@SellerID AND Listings.sellerListingNo=@SellerListingNo

End
GO
/****** Object:  StoredProcedure [dbo].[get_deals_info_Buyer_Side]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_deals_info_Buyer_Side]
@Email_ID varchar (50)
as
begin
declare @UserID int
declare @SellerID int
declare @ListingName varchar (30)
set @UserID = (select FLIP_GATE_SCHEMA.User_.Userid from FLIP_GATE_SCHEMA.User_ where FLIP_GATE_SCHEMA.User_.Email=@Email_ID)
select Listings.Listing_Title, Deal.date_of_deal,Listings.Price from FLIP_GATE_SCHEMA.Deal
join FLIP_GATE_SCHEMA.User_ on User_.Userid=Deal.Seller_id
join FLIP_GATE_SCHEMA.Listings on Listings.Userid= Seller_id AND Listings.sellerListingNo=Deal.sellerListingNo
where (Deal.Buyer_id=@UserID OR Deal.Seller_id=@UserID )

end
GO
/****** Object:  StoredProcedure [dbo].[get_profile_info]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_profile_info]
@Email_ID varchar(50),
@FName varchar(50) OUTPUT,
@LName varchar(50) OUTPUT,
@Password varchar(16) OUTPUT,
@DOB date OUTPUT,
@Bank_Acc_Title varchar(50) OUTPUT,
@Bank_Name varchar(30) OUTPUT,
@Bank_Acc_ID varchar(13) OUTPUT,
@Contact_No varchar(10) OUTPUT,
@Region varchar(30) OUTPUT,
@Ratings float OUTPUT,
@UserType bit OUTPUT
as
begin
set @FName =( select FLIP_GATE_SCHEMA.User_.FName from FLIP_GATE_SCHEMA.User_ where FLIP_GATE_SCHEMA.User_.Email = @Email_ID)
set @LName =( select FLIP_GATE_SCHEMA.User_.LName from FLIP_GATE_SCHEMA.User_ where FLIP_GATE_SCHEMA.User_.Email = @Email_ID)
set @Password =( select FLIP_GATE_SCHEMA.User_.Passsword from FLIP_GATE_SCHEMA.User_ where FLIP_GATE_SCHEMA.User_.Email = @Email_ID)
set @DOB =( select FLIP_GATE_SCHEMA.User_.DOB from FLIP_GATE_SCHEMA.User_ where FLIP_GATE_SCHEMA.User_.Email = @Email_ID)
set @Bank_Acc_Title =( select FLIP_GATE_SCHEMA.User_.Bank_Account_Title from FLIP_GATE_SCHEMA.User_ where FLIP_GATE_SCHEMA.User_.Email = @Email_ID)
set @Bank_Name =( select FLIP_GATE_SCHEMA.User_.Bank_Name from FLIP_GATE_SCHEMA.User_ where FLIP_GATE_SCHEMA.User_.Email = @Email_ID)
set @Bank_Acc_ID =( select FLIP_GATE_SCHEMA.User_.Bank_Account_ID from FLIP_GATE_SCHEMA.User_ where FLIP_GATE_SCHEMA.User_.Email = @Email_ID)
set @Contact_No =( select FLIP_GATE_SCHEMA.User_.Contact_No from FLIP_GATE_SCHEMA.User_ where FLIP_GATE_SCHEMA.User_.Email = @Email_ID)
set @Region =( select FLIP_GATE_SCHEMA.User_.Region from FLIP_GATE_SCHEMA.User_ where FLIP_GATE_SCHEMA.User_.Email = @Email_ID)
set @Ratings =( select FLIP_GATE_SCHEMA.User_.Ratings from FLIP_GATE_SCHEMA.User_ where FLIP_GATE_SCHEMA.User_.Email = @Email_ID)
set @UserType =( select FLIP_GATE_SCHEMA.User_.UserType from FLIP_GATE_SCHEMA.User_ where FLIP_GATE_SCHEMA.User_.Email = @Email_ID)
end
GO
/****** Object:  StoredProcedure [dbo].[ItemsInCart]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ItemsInCart]
@Email varchar (50)
as
begin
declare @BuyerID int
set @BuyerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)
Select Listings.Listing_Title,Listings.Price,Listings.Userid,Listings.sellerListingNo from FLIP_GATE_SCHEMA.Cart 
join FLIP_GATE_SCHEMA.Listings on Listings.Userid=Cart.SellerID AND Listings.sellerListingNo=Cart.SellerListingNo
where Cart.UserID=@BuyerID 
end
GO
/****** Object:  StoredProcedure [dbo].[Listing_View_Category]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Listing_View_Category]
@category varchar(50)
as
begin
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where ListingType=@category AND Listings.ListingStatus=1
end
GO
/****** Object:  StoredProcedure [dbo].[Listing_View_Keyword]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Listing_View_Keyword]
@keyword varchar(50)
as
begin
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where ListingDescription like '%' + @keyword + '%' OR Listing_Title like '%'+@keyword+'%'
AND Listings.ListingStatus=1
end

GO
/****** Object:  StoredProcedure [dbo].[ListingDetails]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListingDetails]
@SellerID int,
@SellerListingNo int,
@Price int output,
@ListingType varchar(50) output,
@ListingDescription text output,
@ListingStatus bit output,
@ListingPostingDate date output,
@ListingWishlists int output,

@MPm1 float output,
@MPm2 float output,
@MPm3 float output,
@MPm4 float output,
@MPm5 float output,
@MPm6 float output,
@Rm1 float output,
@Rm2 float output,
@Rm3 float output,
@Rm4 float output,
@Rm5 float output,
@Rm6 float output
as 
begin
    declare @Listing_FHID int
	declare @Listing_MPID int
	declare @Listing_RevID int
	set @Price = (select FLIP_GATE_SCHEMA.Listings.Price from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @ListingType = (select FLIP_GATE_SCHEMA.Listings.ListingType from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @ListingDescription = (select FLIP_GATE_SCHEMA.Listings.ListingDescription from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @ListingStatus = (select FLIP_GATE_SCHEMA.Listings.ListingStatus from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @ListingWishlists = (select FLIP_GATE_SCHEMA.Listings.ListingWishlists from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @ListingPostingDate = (select FLIP_GATE_SCHEMA.Listings.Listing_Posting_date from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @Listing_FHID = (select FLIP_GATE_SCHEMA.Listings.Financial_History_ID from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @Listing_MPID = (select FLIP_GATE_SCHEMA.Listing_FinancialHistory.MonthlyProfits from FLIP_GATE_SCHEMA.Listing_FinancialHistory
	where FLIP_GATE_SCHEMA.Listing_FinancialHistory.Financial_History_ID=@Listing_FHID
	)
	set @Listing_RevID = (select FLIP_GATE_SCHEMA.Listing_FinancialHistory.Revenue from FLIP_GATE_SCHEMA.Listing_FinancialHistory
	where FLIP_GATE_SCHEMA.Listing_FinancialHistory.Financial_History_ID=@Listing_FHID
	)
	set @Rm1 = (select FLIP_GATE_SCHEMA.Financial_Insights.month1 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_RevID)
	set @Rm2 = (select FLIP_GATE_SCHEMA.Financial_Insights.month2 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_RevID)
	set @Rm3 = (select FLIP_GATE_SCHEMA.Financial_Insights.month3 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_RevID)
	set @Rm4 = (select FLIP_GATE_SCHEMA.Financial_Insights.month4 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_RevID)
	set @Rm5 = (select FLIP_GATE_SCHEMA.Financial_Insights.month5 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_RevID)
	set @Rm6 = (select FLIP_GATE_SCHEMA.Financial_Insights.month6 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_RevID)

	set @MPm1 = (select FLIP_GATE_SCHEMA.Financial_Insights.month1 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_MPID)
	set @MPm2 = (select FLIP_GATE_SCHEMA.Financial_Insights.month2 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_MPID)
	set @MPm3 = (select FLIP_GATE_SCHEMA.Financial_Insights.month3 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_MPID)
	set @MPm4 = (select FLIP_GATE_SCHEMA.Financial_Insights.month4 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_MPID)
	set @MPm5 = (select FLIP_GATE_SCHEMA.Financial_Insights.month5 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_MPID)
	set @MPm6 = (select FLIP_GATE_SCHEMA.Financial_Insights.month6 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_MPID)

End
GO
/****** Object:  StoredProcedure [dbo].[ListingDetailsfromSellerEmail]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListingDetailsfromSellerEmail]
@Email varchar(50),
@SellerListingNo int,
@Price int output,
@ListingType varchar(50) output,
@ListingDescription text output,
@ListingStatus bit output,
@ListingPostingDate date output,
@ListingWishlists int output,
@ListingTitle varchar(30) output,
@MPm1 float output,
@MPm2 float output,
@MPm3 float output,
@MPm4 float output,
@MPm5 float output,
@MPm6 float output,
@Rm1 float output,
@Rm2 float output,
@Rm3 float output,
@Rm4 float output,
@Rm5 float output,
@Rm6 float output
as 
begin
	declare @SellerID int
	set @SellerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)
	
    declare @Listing_FHID int
	declare @Listing_MPID int
	declare @Listing_RevID int
	set @Price = (select FLIP_GATE_SCHEMA.Listings.Price from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @ListingType = (select FLIP_GATE_SCHEMA.Listings.ListingType from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @ListingDescription = (select FLIP_GATE_SCHEMA.Listings.ListingDescription from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @ListingStatus = (select FLIP_GATE_SCHEMA.Listings.ListingStatus from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @ListingTitle = (select FLIP_GATE_SCHEMA.Listings.Listing_Title from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @ListingWishlists = (select FLIP_GATE_SCHEMA.Listings.ListingWishlists from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @ListingPostingDate = (select FLIP_GATE_SCHEMA.Listings.Listing_Posting_date from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @Listing_FHID = (select FLIP_GATE_SCHEMA.Listings.Financial_History_ID from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)
	set @Listing_MPID = (select FLIP_GATE_SCHEMA.Listing_FinancialHistory.MonthlyProfits from FLIP_GATE_SCHEMA.Listing_FinancialHistory
	where FLIP_GATE_SCHEMA.Listing_FinancialHistory.Financial_History_ID=@Listing_FHID
	)
	set @Listing_RevID = (select FLIP_GATE_SCHEMA.Listing_FinancialHistory.Revenue from FLIP_GATE_SCHEMA.Listing_FinancialHistory
	where FLIP_GATE_SCHEMA.Listing_FinancialHistory.Financial_History_ID=@Listing_FHID
	)
	set @Rm1 = (select FLIP_GATE_SCHEMA.Financial_Insights.month1 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_RevID)
	set @Rm2 = (select FLIP_GATE_SCHEMA.Financial_Insights.month2 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_RevID)
	set @Rm3 = (select FLIP_GATE_SCHEMA.Financial_Insights.month3 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_RevID)
	set @Rm4 = (select FLIP_GATE_SCHEMA.Financial_Insights.month4 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_RevID)
	set @Rm5 = (select FLIP_GATE_SCHEMA.Financial_Insights.month5 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_RevID)
	set @Rm6 = (select FLIP_GATE_SCHEMA.Financial_Insights.month6 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_RevID)

	set @MPm1 = (select FLIP_GATE_SCHEMA.Financial_Insights.month1 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_MPID)
	set @MPm2 = (select FLIP_GATE_SCHEMA.Financial_Insights.month2 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_MPID)
	set @MPm3 = (select FLIP_GATE_SCHEMA.Financial_Insights.month3 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_MPID)
	set @MPm4 = (select FLIP_GATE_SCHEMA.Financial_Insights.month4 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_MPID)
	set @MPm5 = (select FLIP_GATE_SCHEMA.Financial_Insights.month5 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_MPID)
	set @MPm6 = (select FLIP_GATE_SCHEMA.Financial_Insights.month6 from FLIP_GATE_SCHEMA.Financial_Insights
	where FLIP_GATE_SCHEMA.Financial_Insights.InsightID=@Listing_MPID)

End
GO
/****** Object:  StoredProcedure [dbo].[ListingOverview]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ListingOverview]
@SellerID int
as
begin
 select FLIP_GATE_SCHEMA.Listings.Price as 'Price',
		FLIP_GATE_SCHEMA.Listings.Listing_Posting_date as 'PostingDate',
		FLIP_GATE_SCHEMA.Listings.ListingDescription as 'Description',
		FLIP_GATE_SCHEMA.Listings.ListingWishlists as 'Wishlists' 
 from FLIP_GATE_SCHEMA.Listings
 where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID
end

GO
/****** Object:  StoredProcedure [dbo].[ListingPrice]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListingPrice]
@SellerID int,
@SellerListingNo int,
@Price int output
as 
begin

	set @Price = (select FLIP_GATE_SCHEMA.Listings.Price from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)

End
GO
/****** Object:  StoredProcedure [dbo].[Listings_ofASeller_Overview]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Listings_ofASeller_Overview]
@Email varchar(50)
as
begin
	declare @SellerID int
	set @SellerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)
	select Listings.Listing_Title,Listings.Price,Listings.ListingWishlists,Listings.sellerListingNo from FLIP_GATE_SCHEMA.Listings
	where Listings.Userid=@SellerID AND Listings.ListingStatus=1
end
GO
/****** Object:  StoredProcedure [dbo].[Listings_View_Category_Buyer]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Listings_View_Category_Buyer]
@Email varchar(50),
@category varchar(50)
as
begin
declare @BuyerID int
set @BuyerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)

select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where ListingType=@category AND Listings.ListingStatus=1
except
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Listings.Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
join FLIP_GATE_SCHEMA.Cart on [Cart].UserID=@BuyerID
where ListingType=@category AND Listings.ListingStatus=1
AND Cart.SellerID=Listings.Userid AND Cart.SellerListingNo = Listings.sellerListingNo
end

GO
/****** Object:  StoredProcedure [dbo].[Listings_View_Keyword_Buyer]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Listings_View_Keyword_Buyer]
@Email varchar(50),
@keyword varchar(50)
as
begin
declare @BuyerID int
set @BuyerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)

select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where ListingDescription like '%' + @keyword + '%' OR Listing_Title like '%'+@keyword+'%'
AND Listings.ListingStatus=1
except
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Listings.Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
join FLIP_GATE_SCHEMA.Cart on [Cart].UserID=@BuyerID
where ListingDescription like '%' + @keyword + '%' OR Listing_Title like '%'+@keyword+'%' AND Listings.ListingStatus=1 
AND Cart.SellerID=Listings.Userid AND Cart.SellerListingNo = Listings.sellerListingNo
end
GO
/****** Object:  StoredProcedure [dbo].[Listings_View_Simple_Buyer]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Listings_View_Simple_Buyer]
@Email varchar(50)
as
begin
declare @BuyerID int
set @BuyerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)

select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where Listings.ListingStatus=1
except
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Listings.Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
join FLIP_GATE_SCHEMA.Cart on [Cart].UserID=@BuyerID
where Listings.ListingStatus=1 AND Cart.SellerID=Listings.Userid AND Cart.SellerListingNo = Listings.sellerListingNo

end
GO
/****** Object:  StoredProcedure [dbo].[Listings_View_Simple_Price_Asc]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Listings_View_Simple_Price_Asc]
as
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where Listings.ListingStatus=1
order by Listings.Price ASC
GO
/****** Object:  StoredProcedure [dbo].[Listings_View_Simple_Price_Asc_Buyer]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Listings_View_Simple_Price_Asc_Buyer]
@Email varchar(50)
as
begin
declare @BuyerID int
set @BuyerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)

select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where Listings.ListingStatus=1
except
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Listings.Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
join FLIP_GATE_SCHEMA.Cart on [Cart].UserID=@BuyerID
where Listings.ListingStatus=1 AND Cart.SellerID=Listings.Userid AND Cart.SellerListingNo = Listings.sellerListingNo
order by Listings.Price ASC

end
GO
/****** Object:  StoredProcedure [dbo].[Listings_View_Simple_Price_DSC]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Listings_View_Simple_Price_DSC]
as
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where Listings.ListingStatus=1
order by Listings.Price DESC
GO
/****** Object:  StoredProcedure [dbo].[Listings_View_Simple_Price_DSC_Buyer]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Listings_View_Simple_Price_DSC_Buyer]
@Email varchar(50)
as
begin
declare @BuyerID int
set @BuyerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)

select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where Listings.ListingStatus=1
except
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Listings.Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
join FLIP_GATE_SCHEMA.Cart on [Cart].UserID=@BuyerID
where Listings.ListingStatus=1 AND Cart.SellerID=Listings.Userid AND Cart.SellerListingNo = Listings.sellerListingNo
order by Listings.Price DESC

end
GO
/****** Object:  StoredProcedure [dbo].[NoOfListingsOfASeller]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[NoOfListingsOfASeller]
@SellerID int,
@NoOfListings int
as
begin
set @NoOfListings= (
select COUNT(FLIP_GATE_SCHEMA.Listings.sellerListingNo) from FLIP_GATE_SCHEMA.Listings
where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID
)
end
GO
/****** Object:  StoredProcedure [dbo].[SignIn]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[SignIn]
@Email varchar(50),
@Password varchar(16),
@Valid int Output
as
Begin
if exists (select * from FLIP_GATE_SCHEMA.User_ where Email=@Email and Passsword=@password)
begin
set @Valid=1
end
else
begin
set @Valid=0
end
END

GO
/****** Object:  StoredProcedure [dbo].[SignUp]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SignUp]
@FNAME varchar(50),
@LNAME varchar(50),
@Password varchar(16),
@Email varchar(50),
@phone varchar(10),
@Accounttype int,
@DOB date,
@AccountNo varchar(13),
@AccountTitle varchar(50),
@BankName varchar(30),
@flag int output
as 
begin
set @flag=1
if(Len(@FName)>50)
begin
set @flag=0
end
else if(Len(@BankName)>30)
begin
set @flag=0
end
else if(Len(@AccountTitle)>50)
begin
set @flag=0
end
else if((Len(@AccountNo)!=13) and (Len(@AccountNo)!=11) )
begin
set @flag=0
end
else if(Len(@LNAME)>50)
begin
set @flag=0
end
else if(@Password not like '%[0-9]%' or @Password not like '%[A-Z]%'or @Password not like '%[!@#$%a^&*()-_+=.,;:"`~]%' )
begin
set @flag=0
end
else if(len(@Password)<8 or len(@Password)>16)
begin
set @flag=0
end
else if(@Email not like '%@%' or len(@Email)>50)
begin
set @flag=0
end
else if(len(@phone)>10)
begin
set @flag=0
end
else if(@Accounttype>1 or @Accounttype<0)
begin
set @flag=0
end
if(@flag=1)
begin
insert FLIP_GATE_SCHEMA.User_ (FName,LName,Passsword,Email,Contact_No,Bank_Account_ID,Bank_Account_Title,Bank_Name,DOB) values (@FNAME,@LNAME,@Password,@Email,@phone,@AccountNo,@AccountTitle,@BankName,@DOB)
if(@Accounttype=1)
begin
update FLIP_GATE_SCHEMA.User_
set UserType=1
where Email=@Email
end
else
begin
update FLIP_GATE_SCHEMA.User_
set UserType=0
where Email=@Email
end
end
End
GO
/****** Object:  StoredProcedure [dbo].[UserType]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UserType]
@Email varchar(50),
@Type int output
as Begin
declare @user bit
set @user=(select UserType from FLIP_GATE_SCHEMA.User_ where Email=@Email)
if(@user=1)
begin
set @Type=1
end
else
begin
set @Type=0
end
End

GO
/****** Object:  StoredProcedure [dbo].[ViewCart]    Script Date: 25/06/2021 12:16:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ViewCart]
@BuyerID int
as
begin
	select* from FLIP_GATE_SCHEMA.Cart
	where FLIP_GATE_SCHEMA.Cart.UserID=@BuyerID
end

GO
USE [master]
GO
ALTER DATABASE [FLIP_GATE] SET  READ_WRITE 
GO
