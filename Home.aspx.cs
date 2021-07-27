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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
        //    objMyDal.ListingOverview(type, ref ds);
        //    RepterDetails.DataSource = ds.Tables[0];
        //    RepterDetails.DataBind();
        //}
        public void Repeter2() //Available Listings
        {
            DataSet ds = new DataSet();
            SignInDAL objMyDal = new SignInDAL();
            int type = 0;
            objMyDal.ListingOverview(type, ref ds);
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
        protected void SearchThis(object sender, EventArgs e)
        {

            string text_input = search_input.Text;
            DataSet ds = new DataSet();
            SignInDAL objMyDal = new SignInDAL();
            objMyDal.ListingOverviewKeywordH(text_input, ref ds);
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
            objMyDal.ListingOverviewbyCategoryH(Category, ref ds);
            Repeater2.DataSource = ds.Tables[0];
            Repeater2.DataBind();
        }

        protected void PriceOrder(Object sender, EventArgs e)
        {
            if (PriceRange.SelectedValue != "Select")
            {
                DataSet ds = new DataSet();
                SignInDAL objMyDal = new SignInDAL();
                if (PriceRange.SelectedValue == "L")
                {
                    objMyDal.ListingOverviewPriceASCH( ref ds);
                    Repeater2.DataSource = ds.Tables[0];
                    Repeater2.DataBind();
                    PriceRange.SelectedValue = "L";
                }
                else if (PriceRange.SelectedValue == "H")
                {
                    objMyDal.ListingOverviewPriceDESCH( ref ds);
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