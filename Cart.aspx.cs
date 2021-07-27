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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayEmail.Text = Request.Cookies["Email"].Value;
            if (!IsPostBack)
            {
                loadCart();
            }
        }
        protected void loadCart()
        {

            SignInDAL objMyDal = new SignInDAL();
            DataTable DT = new DataTable();

            string EmailID = Request.Cookies["Email"].Value;
            objMyDal.BuyerCartFetch(EmailID, ref DT);

            RepeaterListings.DataSource = DT;
            RepeaterListings.DataBind();

            int Price = 0;
            objMyDal.CartTotalPrice(EmailID, ref Price);
            TC.Text = Convert.ToString(Price);

        }

        protected void DeleteFromCart(object sender, EventArgs e)
        {
            SignInDAL objMyDal = new SignInDAL();
            var btn = (LinkButton)sender;
            //Get the repeater selected row
            var item = (RepeaterItem)btn.NamingContainer;
            //FInd the control from row
            string EmailID = Request.Cookies["Email"].Value;
            int sellerListingNo = Convert.ToInt32(((Label)item.FindControl("SellerListingNo")).Text);
            int SellerID = Convert.ToInt32(((Label)item.FindControl("SellerID")).Text);
            objMyDal.DeleteFromCart(EmailID,SellerID, sellerListingNo);

            Response.Redirect("Cart.aspx");

        }
        protected void CheckoutCart(object sender, EventArgs e)
        {
          
            string EmailID = Request.Cookies["Email"].Value;
            SignInDAL objMyDal = new SignInDAL();
            objMyDal.CheckoutCart(EmailID);

           
            Response.Redirect("Cart.aspx");

        }
    }
}