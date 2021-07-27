using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DB_PROJ.DAL;

namespace DB_PROJ
{
    public partial class Listing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayEmail.Text = Request.Cookies["Email"].Value;
            loadListing();
           
        }
        protected void loadListing()
        {
           
            var sellerID = Convert.ToInt32( Request.Cookies["sellerID"].Value);
            var sellerListingNumber = Convert.ToInt32( Request.Cookies["sellerListingNumber"].Value);
            var ListingTitle_ = Request.Cookies["ListingTitle_"].Value;
            int price=0;
            string ListingType=null;// = Convert.ToString(cmd.Parameters["@ListingType"].Value);
            string ListingDescription = null;// = Convert.ToString(cmd.Parameters["@ListingDescription"].Value);
            bool ListingStatus = false;//.ToBoolean(cmd.Parameters["@ListingType"].Value);
            string ListingPostedDate = null;// = Convert.ToString(cmd.Parameters["@ListingPostingDate"].Value);
            int Wishlists = 0;// = Convert.ToInt32(cmd.Parameters["@ListingWishlists"].Value);
            double mpm1 = 0;// = Convert.ToDouble(cmd.Parameters["@MPm1"].Value);
            double mpm2 = 0;// = Convert.ToDouble(cmd.Parameters["@MPm2"].Value);
            double mpm3 = 0;//= Convert.ToDouble(cmd.Parameters["@MPm3"].Value);
            double mpm4 = 0;//= Convert.ToDouble(cmd.Parameters["@MPm4"].Value);
            double mpm5 = 0;//= Convert.ToDouble(cmd.Parameters["@MPm5"].Value);
            double mpm6 = 0;//= Convert.ToDouble(cmd.Parameters["@MPm6"].Value);
            double Rm1 = 0;//= Convert.ToDouble(cmd.Parameters["@Rm1"].Value);
            double Rm2 = 0;// Convert.ToDouble(cmd.Parameters["@Rm2"].Value);
            double Rm3 = 0;// Convert.ToDouble(cmd.Parameters["@Rm3"].Value);
            double Rm4 = 0;//= Convert.ToDouble(cmd.Parameters["@Rm4"].Value);
            double Rm5 = 0;//= Convert.ToDouble(cmd.Parameters["@Rm5"].Value);
            double Rm6 = 0;//= Convert.ToDouble(cmd.Parameters["@Rm6"].Value);

            SignInDAL objMyDal = new SignInDAL();
            objMyDal.Listing_details_Fetch(sellerID, sellerListingNumber, ref price, ref ListingType, ref ListingDescription, ref ListingStatus, ref ListingPostedDate, ref  Wishlists, ref mpm1, ref mpm2, ref mpm3, ref mpm4, ref mpm5, ref mpm6, ref Rm1, ref Rm2, ref Rm3, ref Rm4, ref Rm5,ref Rm6);
            Label.Text = ListingTitle_;
            Description.Text = ListingDescription;
            Price.Text = Convert.ToString(price);

            rm1.Text = Convert.ToString(Rm1);
            rm2.Text = Convert.ToString(Rm2);
            rm3.Text = Convert.ToString(Rm3);
            rm4.Text = Convert.ToString(Rm4);
            rm5.Text = Convert.ToString(Rm5);
            rm6.Text = Convert.ToString(Rm6);

            Mpm1.Text = Convert.ToString(mpm1);
            Mpm2.Text = Convert.ToString(mpm2);
            Mpm3.Text = Convert.ToString(mpm3);
            Mpm4.Text = Convert.ToString(mpm4);
            Mpm5.Text = Convert.ToString(mpm5);
            Mpm6.Text = Convert.ToString(mpm6);
        }
        protected void addtocart(object sender, EventArgs e)
        {
            int sellerID = Convert.ToInt32(Request.Cookies["sellerID"].Value);
            int sellerListingNumber = Convert.ToInt32(Request.Cookies["sellerListingNumber"].Value);
            var Email =  Request.Cookies["Email"].Value;
            int price_ = Convert.ToInt32(Price.Text);
            SignInDAL objMyDal = new SignInDAL();
            objMyDal.AddToCart(Email, sellerID, sellerListingNumber, price_);
            Response.Redirect("Cart.aspx");
        }
    }
}