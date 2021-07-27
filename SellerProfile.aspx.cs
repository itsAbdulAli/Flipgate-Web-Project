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
    public partial class SellerProfile1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["Email"].Value == " ")
            {
                HttpContext.Current.Session.Clear();
                HttpContext.Current.Session.Abandon();
            }
            DisplayEmail.Text = Request.Cookies["Email"].Value;
            if (!IsPostBack)
            {
                GetProfileInfo();
                get_deals();
            }
        }
        protected void logoutClick(object sender, EventArgs e)
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            Request.Cookies["Email"].Value=" ";
            Request.Cookies["Email"].Expires = DateTime.Now.AddYears(-1);
            Session.Abandon();
            Response.Redirect("Home.aspx");

        }
        protected void GetProfileInfo()
        {

            SignInDAL objMyDal = new SignInDAL();
            string EmailID = Request.Cookies["Email"].Value;
            string FName = " ";
            string LName = " ";
            string Password = " ";
            string DOB = " ";
            string Bank_Acc_Title = " ";
            string Bank_Name = " ";
            string Bank_Acc_ID = " ";
            string Contact_No = " ";
            string Region = " ";
            double Ratings = 0;
            bool UserType = false;

            objMyDal.GetProfileInfo(EmailID, ref FName, ref LName, ref Password, ref DOB, ref Bank_Acc_Title, ref Bank_Name, ref Bank_Acc_ID, ref Contact_No, ref Region, ref Ratings, ref UserType);
            BankAccTitle.Text = Bank_Acc_Title;
            BankName.Text = Bank_Name;
            BankAccNo.Text = Bank_Acc_ID;
            AccFirstName.Text = FName;
            AccLastName.Text = LName;
            AccDOB.Text = DOB;
            AccContact.Text = Contact_No;
            AccEmail.Text = EmailID;
            PrevPassword.Text = Password;


        }
        protected void EditProfileBasicInfo(object sender, EventArgs e)
        {

            SignInDAL objMyDal = new SignInDAL();

            string EmailID = Request.Cookies["Email"].Value;
            string FName = " ";
            string LName = " ";
            string Password = " ";
            string DOB = " ";
            string Bank_Acc_Title = " ";
            string Bank_Name = " ";
            string Bank_Acc_ID = " ";
            string Contact_No = " ";
            string Region = " ";
            double Ratings = 0;
            bool UserType = false;

            objMyDal.GetProfileInfo(EmailID, ref FName, ref LName, ref Password, ref DOB, ref Bank_Acc_Title, ref Bank_Name, ref Bank_Acc_ID, ref Contact_No, ref Region, ref Ratings, ref UserType);


            EmailID = Request.Cookies["Email"].Value;
            FName = AccFirstName.Text;
            LName = AccLastName.Text;
            DOB = AccDOB.Text;
            Contact_No = AccContact.Text;

            objMyDal.editProfileInfo(EmailID, FName, LName, Password, DOB, Bank_Acc_Title, Bank_Name, Bank_Acc_ID, Contact_No);



        }
        protected void EditProfilePassword(object sender, EventArgs e)
        {

            SignInDAL objMyDal = new SignInDAL();

            if (NewPassword.Text == ConfirmPassword.Text)
            {

                string EmailID = Request.Cookies["Email"].Value;
                string FName = " ";
                string LName = " ";
                string Password = " ";
                string DOB = " ";
                string Bank_Acc_Title = " ";
                string Bank_Name = " ";
                string Bank_Acc_ID = " ";
                string Contact_No = " ";
                string Region = " ";
                double Ratings = 0;
                bool UserType = false;

                objMyDal.GetProfileInfo(EmailID, ref FName, ref LName, ref Password, ref DOB, ref Bank_Acc_Title, ref Bank_Name, ref Bank_Acc_ID, ref Contact_No, ref Region, ref Ratings, ref UserType);

                Password = NewPassword.Text;
                
                objMyDal.editProfileInfo(EmailID, FName, LName, Password, DOB, Bank_Acc_Title, Bank_Name, Bank_Acc_ID, Contact_No);
            }
            else
            {
                NewPassword.Text = "Password not same";
                ConfirmPassword.Text = "Password not same";
            }


        }
        protected void EditProfileBank(object sender, EventArgs e)
        {

            SignInDAL objMyDal = new SignInDAL();
            string EmailID = Request.Cookies["Email"].Value;
            string FName = " ";
            string LName = " ";
            string Password = " ";
            string DOB = " ";
            string Bank_Acc_Title = " ";
            string Bank_Name = " ";
            string Bank_Acc_ID = " ";
            string Contact_No = " ";
            string Region = " ";
            double Ratings = 0;
            bool UserType = false;

            objMyDal.GetProfileInfo(EmailID, ref FName, ref LName, ref Password, ref DOB, ref Bank_Acc_Title, ref Bank_Name, ref Bank_Acc_ID, ref Contact_No, ref Region, ref Ratings, ref UserType);
          
             Bank_Acc_Title = BankAccTitle.Text;
             Bank_Name = BankName.Text;
             Bank_Acc_ID = BankAccNo.Text;

            objMyDal.editProfileInfo(EmailID, FName, LName, Password, DOB, Bank_Acc_Title, Bank_Name, Bank_Acc_ID, Contact_No);



        }

        public static string converttodate(string str)
        {
            string var_ = Convert.ToString((Convert.ToDateTime(str).ToShortDateString()));
            return var_;

        }
        protected void get_deals()
        {

            SignInDAL objMyDal = new SignInDAL();
            DataTable DT = new DataTable();

            string EmailID = Request.Cookies["Email"].Value;
            objMyDal.DealsFetch(EmailID, ref DT);

            RepeaterDeal.DataSource = DT;
            RepeaterDeal.DataBind();



        }

    }
}