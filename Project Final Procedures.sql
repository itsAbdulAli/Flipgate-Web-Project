
create procedure Listings_View_Simple_Buyer
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
--Show listings on buyer side (total - cart)


create view Listings_View_Simple
as
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where Listings.ListingStatus=1
go
select* from Listings_View_Simple

--show all listings


create view listings_categories
as
select * from FLIP_GATE_SCHEMA.ListingType

--used for the dropdown menu of categories

create procedure ListingDetails
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

--Show the details for the given listing

create procedure get_profile_info
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
go

--get profile info of user

create procedure get_deals_info_Buyer_Side
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
go
--output the deals for both buyer and seller


create view view_profile_info
as
select * from FLIP_GATE_SCHEMA.User_
go

--creates a view for profile info


create view view_deals
as
select * from FLIP_GATE_SCHEMA.Deal
go
-- creates a view to view all deals(all users)



create procedure edit_profile_info
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
go
--edits the profile for given user


create procedure AddListing
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
--creates a listing for given seller


create procedure Listings_ofASeller_Overview
@Email varchar(50)
as
begin
	declare @SellerID int
	set @SellerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)
	select Listings.Listing_Title,Listings.Price,Listings.ListingWishlists,Listings.sellerListingNo from FLIP_GATE_SCHEMA.Listings
	where Listings.Userid=@SellerID AND Listings.ListingStatus=1
end
go

--Selects (output) all the basic info of listings of the seller


create procedure DeleteSellerListing
@Email varchar(50),
@sellerListingNo int
as
begin
declare @SellerID int
set @SellerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)
delete from FLIP_GATE_SCHEMA.Listings
where Listings.Userid=@SellerID and Listings.sellerListingNo=@sellerListingNo
end
go

--delete a seller listing
create procedure ItemsInCart
@Email varchar (50)
as
begin
declare @BuyerID int
set @BuyerID= (select User_.Userid from FLIP_GATE_SCHEMA.User_ where User_.Email=@Email)
Select Listings.Listing_Title,Listings.Price,Listings.Userid,Listings.sellerListingNo from FLIP_GATE_SCHEMA.Cart 
join FLIP_GATE_SCHEMA.Listings on Listings.Userid=Cart.SellerID AND Listings.sellerListingNo=Cart.SellerListingNo
where Cart.UserID=@BuyerID 
end
go

--add listing in cart

create procedure CartTotalPrice
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
go

--output total cost of the listings available in buyer's cart

create procedure DeleteFromCart
@Email varchar(50),
@sellerListingNo int,
@Sellerid int
as
begin
delete from FLIP_GATE_SCHEMA.Cart
where Cart.SellerID=@SellerID and Cart.SellerListingNo=@sellerListingNo
end
go

--delete item from cart

CREATE TABLE FLIP_GATE_SCHEMA.Deal
(
Deal_id int Primary Key Identity(1,1),
Seller_id int,
Buyer_id int,
date_of_deal date,
sellerListingNo int,
FOREIGN KEY (Seller_id) REFERENCES FLIP_GATE_SCHEMA.User_(Userid),
FOREIGN KEY (Buyer_id) REFERENCES FLIP_GATE_SCHEMA.User_(Userid)
);

create procedure checkoutCart
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

--checkout from cart (delete from cart and add in deals also set listing status and disable the listing)

create procedure addToCart
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
--add item in cart

create procedure EditPrevListing
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

--edit previous listing

create procedure ListingDetailsfromSellerEmail
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

--input listing details and edit listing

create procedure Listings_View_Keyword_Buyer
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

--out listing overview on buyer home based on keyword search


create procedure Listing_View_Keyword
@keyword varchar(50)
as
begin
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where ListingDescription like '%' + @keyword + '%' OR Listing_Title like '%'+@keyword+'%'
AND Listings.ListingStatus=1
end
go

--out listing overview on home based on keyword search

create procedure Listings_View_Category_Buyer
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
--out listing overview on buyer home based on selected category

create procedure Listing_View_Category
@category varchar(50)
as
begin
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where ListingType=@category AND Listings.ListingStatus=1
end
--out listing overview on home based on selected category


create procedure Listings_View_Simple_Price_Asc_Buyer
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

--out listing overview on buyer home based on price un ascending order

create procedure Listings_View_Simple_Price_DSC_Buyer
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

--out listing overview on buyer home based on price un ascending order

create procedure Listings_View_Simple_Price_Asc
as
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where Listings.ListingStatus=1
order by Listings.Price ASC
go

--out listing overview on home based on price un ascending order


create procedure Listings_View_Simple_Price_DSC
as
select Listings.Listing_Title,Listings.Userid,Listings.sellerListingNo, Price,User_.Ratings from FLIP_GATE_SCHEMA.Listings
join FLIP_GATE_SCHEMA.User_ on [User_].Userid=Listings.Userid
where Listings.ListingStatus=1
order by Listings.Price DESC
go

--out listing overview on home based on price un descending order
exec Listings_View_Simple_Buyer @Email='basit@gmail.com'
go


create procedure SignUp
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

--take profile, check and validates input and creates profile 

Create procedure signin
@Email varchar(50),
@password varchar(16),
@flag int Output
as
Begin
if exists (select *
from FLIP_GATE_SCHEMA.User_
where Email=@Email and Passsword=@password)
begin
set @flag=1
end
else
begin
set @flag=0
end
END
go

--input email and password and validates them in user_ table



create procedure usertype
@Email varchar(50),
@utype int output
as Begin
declare @user bit
set @user=(select UserType
from FLIP_GATE_SCHEMA.User_
where Email=@Email
)
if(@user=1)
begin
set @utype=1
end
else
begin
set @utype=0
end
End

--output usertype 1 for seller 0 for buyer

create procedure ListingPrice
@SellerID int,
@SellerListingNo int,
@Price int output
as 
begin

	set @Price = (select FLIP_GATE_SCHEMA.Listings.Price from FLIP_GATE_SCHEMA.Listings
	where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID AND FLIP_GATE_SCHEMA.Listings.sellerListingNo=@SellerListingNo
	)

End

--output listing price

create procedure NoOfListingsOfASeller
@SellerID int,
@NoOfListings int output
as
begin
set @NoOfListings= (
select COUNT(FLIP_GATE_SCHEMA.Listings.sellerListingNo) from FLIP_GATE_SCHEMA.Listings
where FLIP_GATE_SCHEMA.Listings.Userid=@SellerID
)
end
go
--output total no of listings of a seller



--basit@gmail.com buyer Apple#123
--mabdulali@gmail.com seller
