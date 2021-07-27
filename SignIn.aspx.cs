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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SignUPClick(object sender, EventArgs e)
        {

            String FName = First_Name.Text;
            String LName = Last_Name.Text;
            String Password = Password_reg.Text;
            String Email = Email_reg.Text;
            String MobileNo = Mobile_No.Text;
            String AccountNo = BAID.Text;
            String AccountTitle = BAT.Text;
            String BankName = BN.Text;
            string DOB = Calendar1.SelectedDate.ToShortDateString();
            int AccountType = AccountTypeDropDown.SelectedIndex;

            //if (FName == "" ||LName ==""||Password==""||Email==""||MobileNo=="")
            //{
            //    signinMessage.Visible = true;
            //    signinMessage.Text = Convert.ToString("Some or All fields are empty!!");
            //}
            //else if (Password.)


            DataTable DT = new DataTable();

            SignInDAL objMyDal = new SignInDAL();

            int valid;
            valid = -1;
            valid = objMyDal.SignUp(FName,LName,MobileNo,Email, Password,AccountType,AccountNo,BankName,AccountTitle,DOB, ref DT);

            if (valid > 0)
            {
                signinMessage.Visible = true;
                signinMessage.Text = Convert.ToString("Account has been succesfully registered !!");
            }
            else if (valid == 0)
            {
                signinMessage.Visible = true;
                signinMessage.Text = Convert.ToString("Invalid Input");
            }
            else
            {
                signinMessage.Visible = true;
                signinMessage.Text = Convert.ToString("Server Error");
            }

        }
        protected void SignInClick(object sender, EventArgs e)
        {

            String Name = UserN_Email_SignIn.Text;
            String Password = Password_SignIn.Text;
            DataTable DT = new DataTable();

            SignInDAL objMyDal = new SignInDAL();

            int found;
            found = -1;
            found = objMyDal.checkSignInDetails(Name, Password, ref DT);

            if (found > 0)
            {
                int user_type = objMyDal.UserType(Name, ref DT);
                HttpCookie Email = new HttpCookie("Email");
                Email.Value = Name;
                Email.Expires = DateTime.Now.AddHours(2);
                Response.SetCookie(Email);
                if (user_type == 0)
                {
                    Response.Redirect("BuyerHome.aspx");
                }
                else if (user_type == 1)
                {
                    Response.Redirect("SellerListings.aspx");
                }
            }
            else if (found == 0)
            {
                signinMessage.Visible = true;
                signinMessage.Text = Convert.ToString("User does not exists");
            }
            else
            {
                signinMessage.Visible = true;
                signinMessage.Text = Convert.ToString("Invalid Input");
            }

        }
    }
}