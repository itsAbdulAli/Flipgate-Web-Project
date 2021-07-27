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
    public partial class SellerListings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayEmail.Text = Request.Cookies["Email"].Value;
            if (!IsPostBack)
            {
                LoadSellerListings();
            }
        }
        protected void LoadSellerListings()
        {
            SignInDAL objMyDal = new SignInDAL();
            DataTable DT = new DataTable();

            string EmailID = Request.Cookies["Email"].Value;
            objMyDal.SellerListingsFetch(EmailID, ref DT);

            RepeaterListings.DataSource = DT;
            RepeaterListings.DataBind();

        }

        protected void DeleteSellerListing(object sender, EventArgs e)
        {
            SignInDAL objMyDal = new SignInDAL();
            var btn = (LinkButton)sender;
            //Get the repeater selected row
            var item = (RepeaterItem)btn.NamingContainer;
            //FInd the control from row
            string EmailID = Request.Cookies["Email"].Value;
            int sellerListingNo = Convert.ToInt32(((Label)item.FindControl("SellerListingNo")).Text);
            objMyDal.DeleteSellerListing(EmailID, sellerListingNo);

            Response.Redirect("SellerListings.aspx");

        }
        protected void GotoEditListing(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            //Get the repeater selected row
            var item = (RepeaterItem)btn.NamingContainer;
            //FInd the control from row
            int sellerListingNo = Convert.ToInt32(((Label)item.FindControl("SellerListingNo")).Text);
            HttpCookie SellerListingNo_ = new HttpCookie("SellerListingNo_");
            SellerListingNo_.Value = Convert.ToString(sellerListingNo);
            SellerListingNo_.Expires = DateTime.Now.AddHours(2);
            Response.SetCookie(SellerListingNo_);
            Response.Redirect("sellerEditListing.aspx");
        }
    }
}