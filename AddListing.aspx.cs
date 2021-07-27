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
    public partial class AddListing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayEmail.Text = Request.Cookies["Email"].Value;
            if (!IsPostBack)
            {
                Category_Load();
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
        protected void Create_Listing(object sender, EventArgs e)
        {
            SignInDAL objMyDal = new SignInDAL();
            string Email_ = Request.Cookies["Email"].Value;
            string ListingTitle_ = ListingTitle.Text;
            string ListingDescription_= ProductDetails.Text;
            int Price_=Convert.ToInt32(Price.Text);
            string listingCategory_ = Category.SelectedValue;
            double Mpm1_ = Convert.ToDouble(Pm1.Text);
            double Mpm2_ = Convert.ToDouble(Pm2.Text);
            double Mpm3_ = Convert.ToDouble(Pm3.Text);
            double Mpm4_ = Convert.ToDouble(Pm4.Text);
            double Mpm5_ = Convert.ToDouble(Pm5.Text);
            double Mpm6_ = Convert.ToDouble(Pm6.Text);
            double Rm1_ = Convert.ToDouble(Rm1.Text);
            double Rm2_ = Convert.ToDouble(Rm2.Text);
            double Rm3_ = Convert.ToDouble(Rm3.Text);
            double Rm4_ = Convert.ToDouble(Rm4.Text);
            double Rm5_ = Convert.ToDouble(Rm5.Text);
            double Rm6_ = Convert.ToDouble(Rm6.Text);
            objMyDal.AddListing(Email_,Price_,listingCategory_,ListingDescription_,ListingTitle_,Mpm1_, Mpm2_,Mpm3_,Mpm4_,Mpm5_,Mpm6_,Rm1_,Rm2_,Rm3_,Rm4_,Rm5_,Rm6_);
            Response.Redirect("SellerListings.aspx");
        }
    }
}