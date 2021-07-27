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
    public partial class sellerEditListing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayEmail.Text = Request.Cookies["Email"].Value;
            if (!IsPostBack)
            {
                Category_Load();
                Values_Load();
            }
        }
        protected void Category_Load()
        {
            DataSet DT = new DataSet();
            SignInDAL objMyDal = new SignInDAL();
            objMyDal.CategoriesFetch(ref DT);
            Category.DataSource = DT;
            Category.DataBind();
            Category.DataTextField = "Category_Name";
            Category.DataValueField = "Category_Name";
            Category.DataBind();

        }
        protected void Values_Load()
        {
            var Email_= Request.Cookies["Email"].Value;
            int sellerListingNumber = Convert.ToInt32(Request.Cookies["SellerListingNo_"].Value);
            string ListingTitle_ = null;
            int price = 0;
            string ListingType = null;// = Convert.ToString(cmd.Parameters["@ListingType"].Value);
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
            objMyDal.Listing_details_Fetch_from_email(Email_, sellerListingNumber, ref ListingTitle_,ref price, ref ListingType, ref ListingDescription, ref ListingStatus, ref ListingPostedDate, ref Wishlists, ref mpm1, ref mpm2, ref mpm3, ref mpm4, ref mpm5, ref mpm6, ref Rm1, ref Rm2, ref Rm3, ref Rm4, ref Rm5, ref Rm6);
            ListingTitle.Text = ListingTitle_;
            ProductDetails.Text = ListingDescription;
            Price.Text = Convert.ToString(price);
            Category.SelectedValue = ListingType;

            rm1.Text = Convert.ToString(Rm1);
            rm2.Text = Convert.ToString(Rm2);
            rm3.Text = Convert.ToString(Rm3);
            rm4.Text = Convert.ToString(Rm4);
            rm5.Text = Convert.ToString(Rm5);
            rm6.Text = Convert.ToString(Rm6);

            Pm1.Text = Convert.ToString(mpm1);
            Pm2.Text = Convert.ToString(mpm2);
            Pm3.Text = Convert.ToString(mpm3);
            Pm4.Text = Convert.ToString(mpm4);
            Pm5.Text = Convert.ToString(mpm5);
            Pm6.Text = Convert.ToString(mpm6);

        }
        protected void EditPrevListing(object sender, EventArgs e)
        {
            SignInDAL objMyDal = new SignInDAL();
            string Email_ = Request.Cookies["Email"].Value;
            int sellerListingNo = Convert.ToInt32(Request.Cookies["SellerListingNo_"].Value);
            string ListingTitle_ = ListingTitle.Text;
            string ListingDescription_ = ProductDetails.Text;
            int Price_ = Convert.ToInt32(Price.Text);
            string listingCategory_ = Category.SelectedValue;
            double Mpm1_ = Convert.ToDouble(Pm1.Text);
            double Mpm2_ = Convert.ToDouble(Pm2.Text);
            double Mpm3_ = Convert.ToDouble(Pm3.Text);
            double Mpm4_ = Convert.ToDouble(Pm4.Text);
            double Mpm5_ = Convert.ToDouble(Pm5.Text);
            double Mpm6_ = Convert.ToDouble(Pm6.Text);
            double Rm1_ = Convert.ToDouble(rm1.Text);
            double Rm2_ = Convert.ToDouble(rm2.Text);
            double Rm3_ = Convert.ToDouble(rm3.Text);
            double Rm4_ = Convert.ToDouble(rm4.Text);
            double Rm5_ = Convert.ToDouble(rm5.Text);
            double Rm6_ = Convert.ToDouble(rm6.Text);
            objMyDal.editListing(Email_,sellerListingNo, Price_, listingCategory_, ListingDescription_, ListingTitle_, Mpm1_, Mpm2_, Mpm3_, Mpm4_, Mpm5_, Mpm6_, Rm1_, Rm2_, Rm3_, Rm4_, Rm5_, Rm6_);
            Response.Redirect("SellerListings.aspx");
        }
    }
}