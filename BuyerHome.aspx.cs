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
    public partial class BuyerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayEmail.Text= Request.Cookies["Email"].Value;

            if (!IsPostBack)
            {
                //RepeterData();
                Repeter2();
                RepeterCategories();
            }
            
        }
        //public void RepeterData() // Featured Listings
        //{
        //    DataSet ds = new DataSet();
        //    SignInDAL objMyDal = new SignInDAL();
        //    int type = 0;
        //    string Email = Request.Cookies["Email"].Value;
        //    objMyDal.ListingOverviewBuyer(Email, type, ref ds);
        //    RepterDetails.DataSource = ds.Tables[0];
        //    RepterDetails.DataBind();
        //}
        public void Repeter2() //Available Listings
        {
            DataSet ds = new DataSet();
            SignInDAL objMyDal = new SignInDAL();
            int type = 0;
            string Email = Request.Cookies["Email"].Value;
            objMyDal.ListingOverviewBuyer(Email,type, ref ds);
            Repeater2.DataSource = ds.Tables[0];
            Repeater2.DataBind();
        }

        public void RepeterCategories() //Available Listings
        {
            DataSet ds = new DataSet();
            SignInDAL objMyDal = new SignInDAL();
            objMyDal.CategoriesFetch(ref ds);
            Repeater3.DataSource = ds.Tables[0];
            Repeater3.DataBind();
        }
        protected void ListingOpen(object sender, EventArgs e)
        {
            var btn = (Button)sender;
            //Get the repeater selected row
            var item = (RepeaterItem)btn.NamingContainer;
            //FInd the control from row
            var IdValue = ((Label)item.FindControl("SellerID_")).Text;
            var NoValue = ((Label)item.FindControl("SellerListingNo_")).Text;
            var Title= ((Label)item.FindControl("AProd")).Text;


            HttpCookie sellerID = new HttpCookie("sellerID");
            HttpCookie sellerListingNumber = new HttpCookie("sellerListingNumber");
            HttpCookie ListingTitle_ = new HttpCookie("ListingTitle_");
            sellerID.Value = IdValue;
            sellerListingNumber.Value = NoValue;
            ListingTitle_.Value = Title ;
            sellerID.Expires = DateTime.Now.AddHours(2);
            sellerListingNumber.Expires = DateTime.Now.AddHours(2);
            ListingTitle_.Expires = DateTime.Now.AddHours(2);
            Response.SetCookie(sellerID);
            Response.SetCookie(sellerListingNumber);
            Response.SetCookie(ListingTitle_);
            Response.Redirect("Listing.aspx");
        }

        protected void SearchThis(object sender, EventArgs e)
        {
            
            string text_input = search_input.Text;
            DataSet ds = new DataSet();
            SignInDAL objMyDal = new SignInDAL();
            string Email= Request.Cookies["Email"].Value;
            objMyDal.ListingOverviewKeyword(text_input,Email ,ref ds);
            Repeater2.DataSource = ds.Tables[0];
            Repeater2.DataBind();
        }
        protected void CategoryIn(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            var item = (RepeaterItem)btn.NamingContainer;
            //FInd the control from row
            var Category = ((Label)item.FindControl("idtext")).Text;
            DataSet ds = new DataSet();
            SignInDAL objMyDal = new SignInDAL();
            string Email = Request.Cookies["Email"].Value;
            objMyDal.ListingOverviewbyCategory(Category, Email, ref ds);
            Repeater2.DataSource = ds.Tables[0];
            Repeater2.DataBind();
        }

        protected void PriceOrder(Object sender, EventArgs e)
        {
            if (PriceRange.SelectedValue != "Select")
            {
                DataSet ds = new DataSet();
                SignInDAL objMyDal = new SignInDAL();
                string Email = Request.Cookies["Email"].Value;
                if (PriceRange.SelectedValue == "L")
                {
                    objMyDal.ListingOverviewPriceASC(Email, ref ds);
                    Repeater2.DataSource = ds.Tables[0];
                    Repeater2.DataBind();
                    PriceRange.SelectedValue = "L";
                }
                else if (PriceRange.SelectedValue == "H")
                {
                    objMyDal.ListingOverviewPriceDESC(Email, ref ds);
                    Repeater2.DataSource = ds.Tables[0];
                    Repeater2.DataBind();
                    PriceRange.SelectedValue = "H";
                }
            }
            else
            {
                DataSet ds = new DataSet();
                SignInDAL objMyDal = new SignInDAL();
                int type = 0;
                objMyDal.ListingOverview(type, ref ds);
                Repeater2.DataSource = ds.Tables[0];
                Repeater2.DataBind();
            }
        }

    }
}