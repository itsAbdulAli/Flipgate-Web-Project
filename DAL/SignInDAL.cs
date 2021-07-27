using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DB_PROJ.DAL
{
    public class SignInDAL
    {
        private static readonly string connStringSignIn =
        System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;

        public int checkSignInDetails(String Username, String Password, ref DataTable DT)
        {

            int Valid = 0;
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("SignIn", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 16);
                cmd.Parameters.Add("@Valid", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values
                cmd.Parameters["@Email"].Value = Username;
                cmd.Parameters["@Password"].Value = Password;

                cmd.ExecuteNonQuery();

                // read output value 
                Valid = Convert.ToInt32(cmd.Parameters["@Valid"].Value); //convert to output parameter to interger format

                //if (Valid == 1)
                //{
                //    using (SqlDataAdapter da = new SqlDataAdapter(cmd))

                //    {
                //        da.Fill(ds);

                //    }

                //    DT = ds.Tables[0];

                //}


                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL SIGN IN Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }

            return Valid;

        }

        public int SignUp(String FName, String LName, String MobileNo, String Email, String Password, int AccountType,string AcountNo,string BankName,string AccountTitle, string DOB,ref DataTable DT)
        {

            int Valid = 0;
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("SignUp", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 16);
                cmd.Parameters.Add("@FNAME", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@LNAME", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@phone", SqlDbType.VarChar, 10);
                cmd.Parameters.Add("@AccountType", SqlDbType.Int);
                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@AccountNo", SqlDbType.VarChar, 13);
                cmd.Parameters.Add("@AccountTitle", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@BankName", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@DOB", SqlDbType.Date);
                // set parameter values
                cmd.Parameters["@Email"].Value = Email;
                cmd.Parameters["@Password"].Value = Password;
                cmd.Parameters["@FNAME"].Value = FName;
                cmd.Parameters["@LNAME"].Value = LName;
                cmd.Parameters["@phone"].Value = MobileNo;
                cmd.Parameters["@AccountNo"].Value = AcountNo;
                cmd.Parameters["@AccountTitle"].Value = AccountTitle;
                cmd.Parameters["@BankName"].Value = BankName;
                cmd.Parameters["@AccountType"].Value = AccountType;
                cmd.Parameters["@DOB"].Value = DOB;
                cmd.ExecuteNonQuery();

                // read output value 
                Valid = Convert.ToInt32(cmd.Parameters["@flag"].Value); //convert to output parameter to interger format

                if (Valid == 1)
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))

                    {
                        da.Fill(ds);

                    }

                    DT = ds.Tables[0];

                }


                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL SIGN UP Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }

            return Valid;

        }

        public int UserType(String Username, ref DataTable DT)
        {

            int usertype = -1; /*0 if buyer 1 if seller*/
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("UserType", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@type", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values
                cmd.Parameters["@Email"].Value = Username;

                cmd.ExecuteNonQuery();

                // read output value 
                usertype = Convert.ToInt32(cmd.Parameters["@type"].Value); //convert to output parameter to interger format

                //if (Valid == 1)
                //{
                //    using (SqlDataAdapter da = new SqlDataAdapter(cmd))

                //    {
                //        da.Fill(ds);

                //    }

                //    DT = ds.Tables[0];

                //}


                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL SIGN IN Usertype Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }

            return usertype;

        }


        public void ListingOverview(int order_in,ref DataSet DT)
        {
           

            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Select * from Listings_View_Simple", con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(DT);
                }
                //DT = ds.Tables[0];

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying Listings" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        public void ListingOverviewBuyer(string Email, int order_in, ref DataSet DT)
        {


            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("exec Listings_View_Simple_Buyer @Email='" + Email + "'",con);
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(DT);
                }
                //DT = ds.Tables[0];

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying Listings" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        public void CategoriesFetch(ref DataSet DT)
        {


            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Select * from listings_categories", con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(DT);
                }
                //DT = ds.Tables[0];

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying Categories" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        public void Listing_details_Fetch(int sellerID, int SellerListingNo, ref int price, ref string ListingType, ref string ListingDescription, ref bool ListingStatus, ref string ListingPostedDate, ref int Wishlists, ref double mpm1, ref double mpm2, ref double mpm3, ref double mpm4, ref double mpm5, ref double mpm6, ref double Rm1, ref double Rm2, ref double Rm3, ref double Rm4, ref double Rm5, ref double Rm6)
        {

            SqlConnection con_ = new SqlConnection(connStringSignIn);
            con_.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("ListingDetails", con_); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@SellerID", SqlDbType.Int);
                cmd.Parameters.Add("@SellerListingNo", SqlDbType.Int);
                cmd.Parameters.Add("@Price", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@ListingType", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@ListingDescription", SqlDbType.VarChar, 250).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@ListingStatus", SqlDbType.Bit).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@ListingPostingDate", SqlDbType.Date).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@ListingWishlists", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MPm1", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MPm2", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MPm3", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MPm4", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MPm5", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MPm6", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Rm1", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Rm2", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Rm3", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Rm4", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Rm5", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Rm6", SqlDbType.Float).Direction = ParameterDirection.Output;
                // set parameter values
                cmd.Parameters["@SellerID"].Value = sellerID;
                cmd.Parameters["@SellerListingNo"].Value = SellerListingNo;
                cmd.ExecuteNonQuery();

                // read output value 
                int price_ = Convert.ToInt32(cmd.Parameters["@Price"].Value); //convert to output parameter to interger format
                string ListingType_ = Convert.ToString(cmd.Parameters["@ListingType"].Value);
                string ListingDescription_ = Convert.ToString(cmd.Parameters["@ListingDescription"].Value);
                bool ListingStatus_ = Convert.ToBoolean(cmd.Parameters["@ListingStatus"].Value);
                string ListingPostedDate_ = Convert.ToString(cmd.Parameters["@ListingPostingDate"].Value);
                int Wishlists_ = Convert.ToInt32(cmd.Parameters["@ListingWishlists"].Value);
                double mpm1_ = Convert.ToDouble(cmd.Parameters["@MPm1"].Value);
                double mpm2_ = Convert.ToDouble(cmd.Parameters["@MPm2"].Value);
                double mpm3_ = Convert.ToDouble(cmd.Parameters["@MPm3"].Value);
                double mpm4_ = Convert.ToDouble(cmd.Parameters["@MPm4"].Value);
                double mpm5_ = Convert.ToDouble(cmd.Parameters["@MPm5"].Value);
                double mpm6_ = Convert.ToDouble(cmd.Parameters["@MPm6"].Value);
                double Rm1_ = Convert.ToDouble(cmd.Parameters["@Rm1"].Value);
                double Rm2_ = Convert.ToDouble(cmd.Parameters["@Rm2"].Value);
                double Rm3_ = Convert.ToDouble(cmd.Parameters["@Rm3"].Value);
                double Rm4_ = Convert.ToDouble(cmd.Parameters["@Rm4"].Value);
                double Rm5_ = Convert.ToDouble(cmd.Parameters["@Rm5"].Value);
                double Rm6_ = Convert.ToDouble(cmd.Parameters["@Rm6"].Value);


                price = price_; //= Convert.ToInt32(cmd.Parameters["@Price"].Value); //convert to output parameter to interger format
                ListingType = ListingType_;// = Convert.ToString(cmd.Parameters["@ListingType"].Value);
                ListingDescription = ListingDescription_;// = Convert.ToString(cmd.Parameters["@ListingDescription"].Value);
                ListingStatus = ListingStatus_;// = Convert.ToBoolean(cmd.Parameters["@ListingType"].Value);
                ListingPostedDate = ListingPostedDate_;// = Convert.ToString(cmd.Parameters["@ListingPostingDate"].Value);
                Wishlists = Wishlists_;// = Convert.ToInt32(cmd.Parameters["@ListingWishlists"].Value);
                mpm1 = mpm1_;//= Convert.ToDouble(cmd.Parameters["@MPm1"].Value);
                mpm2 = mpm2_;//= Convert.ToDouble(cmd.Parameters["@MPm2"].Value);
                mpm3 = mpm3_;//= Convert.ToDouble(cmd.Parameters["@MPm3"].Value);
                mpm4 = mpm4_;//= Convert.ToDouble(cmd.Parameters["@MPm4"].Value);
                mpm5 = mpm5_;//= Convert.ToDouble(cmd.Parameters["@MPm5"].Value);
                mpm6 = mpm6_;//= Convert.ToDouble(cmd.Parameters["@MPm6"].Value);
                Rm1 = Rm1_;//= Convert.ToDouble(cmd.Parameters["@Rm1"].Value);
                Rm2 = Rm2_;//= Convert.ToDouble(cmd.Parameters["@Rm2"].Value);
                Rm3 = Rm3_;//= Convert.ToDouble(cmd.Parameters["@Rm3"].Value);
                Rm4 = Rm4_;//= Convert.ToDouble(cmd.Parameters["@Rm4"].Value);
                Rm5 = Rm5_;//= Convert.ToDouble(cmd.Parameters["@Rm5"].Value);
                Rm6 = Rm6_;//= Convert.ToDouble(cmd.Parameters["@Rm6"].Value);
                con_.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Listing Details Error" + ex.Message.ToString());

            }
            finally
            {
                con_.Close();
            }

        }

        public void GetProfileInfo(string ID, ref string FName, ref string LName, ref string Password, ref string DOB, ref string Bank_Acc_Title, ref string Bank_Name, ref string Bank_Acc_ID, ref string Contact_No, ref string Region, ref double Ratings, ref bool UserType)
        {

            SqlConnection con_ = new SqlConnection(connStringSignIn);
            con_.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("get_profile_info", con_); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email_ID", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@FName", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@LName", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 16).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@DOB", SqlDbType.Date).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Bank_Acc_Title", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Bank_Name", SqlDbType.VarChar, 30).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Bank_Acc_ID", SqlDbType.VarChar, 13).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Contact_No", SqlDbType.VarChar, 10).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Region", SqlDbType.VarChar, 30).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Ratings", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@UserType", SqlDbType.Bit).Direction = ParameterDirection.Output;
                // set parameter values
                cmd.Parameters["@Email_ID"].Value = ID;
                cmd.ExecuteNonQuery();

                // read output value 
                FName = Convert.ToString(cmd.Parameters["@FName"].Value); //convert to output parameter to interger format
                LName = Convert.ToString(cmd.Parameters["@Lname"].Value);
                Password = Convert.ToString(cmd.Parameters["@Password"].Value);
                DOB = Convert.ToString((Convert.ToDateTime(cmd.Parameters["@DOB"].Value).ToShortDateString()));

                Bank_Acc_Title = Convert.ToString(cmd.Parameters["@Bank_Acc_Title"].Value);
                Bank_Name = Convert.ToString(cmd.Parameters["@Bank_Name"].Value);
                Bank_Acc_ID = Convert.ToString(cmd.Parameters["@Bank_Acc_ID"].Value);
                Contact_No = Convert.ToString(cmd.Parameters["@Contact_No"].Value);
                Region = Convert.ToString(cmd.Parameters["@Region"].Value);
                Ratings = Convert.ToDouble(cmd.Parameters["@Ratings"].Value);
                UserType = Convert.ToBoolean(cmd.Parameters["@UserType"].Value);

                con_.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Get Profile Error" + ex.Message.ToString());

            }
            finally
            {
                con_.Close();
            }

        }

        public void editProfileInfo(string ID, string FName, string LName, string Password, string DOB, string Bank_Acc_Title, string Bank_Name, string Bank_Acc_ID, string Contact_No)
        {

            SqlConnection con_ = new SqlConnection(connStringSignIn);
            con_.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("edit_profile_info", con_); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email_ID", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@FName", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@LName", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 16);
                cmd.Parameters.Add("@Bank_Acc_Title", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@Bank_Name", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@Bank_Acc_ID", SqlDbType.VarChar, 13);
                cmd.Parameters.Add("@Contact_No", SqlDbType.VarChar, 10);
                // set parameter values
                cmd.Parameters["@Email_ID"].Value = ID;
                cmd.Parameters["@FName"].Value = FName;
                cmd.Parameters["@LName"].Value = LName;
                cmd.Parameters["@Password"].Value = Password;
                cmd.Parameters["@Bank_Acc_Title"].Value = Bank_Acc_Title;
                cmd.Parameters["@Bank_Name"].Value = Bank_Name;
                cmd.Parameters["@Bank_Acc_ID"].Value = Bank_Acc_ID;
                cmd.Parameters["@Contact_No"].Value = Contact_No;
                cmd.ExecuteNonQuery();

                // read output value 
                con_.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Edit Profile Error" + ex.Message.ToString());

            }
            finally
            {
                con_.Close();
            }

        }
        public void AddListing(string Email, int Price, string ListingType,string ListingDescription, string ListingTitle, double MPm1, double MPm2, double MPm3, double MPm4, double MPm5, double MPm6, double Rm1, double Rm2, double Rm3, double Rm4, double Rm5, double Rm6)
        {
            SqlConnection con_ = new SqlConnection(connStringSignIn);
            con_.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("AddListing", con_); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@Price", SqlDbType.Int);
                cmd.Parameters.Add("@ListingType", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@ListingDescription", SqlDbType.VarChar, 250);
                cmd.Parameters.Add("@ListingTitle", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@MPm1", SqlDbType.Float);
                cmd.Parameters.Add("@MPm2", SqlDbType.Float);
                cmd.Parameters.Add("@MPm3", SqlDbType.Float);
                cmd.Parameters.Add("@MPm4", SqlDbType.Float);
                cmd.Parameters.Add("@MPm5", SqlDbType.Float);
                cmd.Parameters.Add("@MPm6", SqlDbType.Float);
                cmd.Parameters.Add("@Rm1", SqlDbType.Float);
                cmd.Parameters.Add("@Rm2", SqlDbType.Float);
                cmd.Parameters.Add("@Rm3", SqlDbType.Float);
                cmd.Parameters.Add("@Rm4", SqlDbType.Float);
                cmd.Parameters.Add("@Rm5", SqlDbType.Float);
                cmd.Parameters.Add("@Rm6", SqlDbType.Float);

                // set parameter values
                cmd.Parameters["@Email"].Value = Email;
                cmd.Parameters["@Price"].Value = Price;
                cmd.Parameters["@ListingType"].Value = ListingType;
                cmd.Parameters["@ListingDescription"].Value = ListingDescription;
                cmd.Parameters["@ListingTitle"].Value = ListingTitle;
                cmd.Parameters["@Mpm1"].Value = MPm1;
                cmd.Parameters["@Mpm2"].Value = MPm2;
                cmd.Parameters["@Mpm3"].Value = MPm3;
                cmd.Parameters["@Mpm4"].Value = MPm4;
                cmd.Parameters["@Mpm5"].Value = MPm5;
                cmd.Parameters["@Mpm6"].Value = MPm6;
                cmd.Parameters["@Rm1"].Value = Rm1;
                cmd.Parameters["@Rm2"].Value = Rm2;
                cmd.Parameters["@Rm3"].Value = Rm3;
                cmd.Parameters["@Rm4"].Value = Rm4;
                cmd.Parameters["@Rm5"].Value = Rm5;
                cmd.Parameters["@Rm6"].Value = Rm6;

                cmd.ExecuteNonQuery();

                // read output value 
                con_.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Add Listing Error" + ex.Message.ToString());

            }
            finally
            {
                con_.Close();
            }


        }
        public void DealsFetch(string Email, ref DataTable DT)
        {


            DataSet ds = new DataSet();
            string command = "exec get_deals_info_Buyer_Side @Email_ID = '" + Email + "'";


            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand(command, con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                    DT = ds.Tables[0];
                }

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying Categories" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }


        }

        public void SellerListingsFetch(string Email, ref DataTable DT)
        {


            DataSet ds = new DataSet();
            string command = "exec Listings_ofASeller_Overview @Email = '" + Email + "'";


            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand(command, con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                    DT = ds.Tables[0];
                }

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying SellerListingOverview" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }


        }

        public void DeleteSellerListing(string Email,int sellerListingNo)
        {

            SqlConnection con_ = new SqlConnection(connStringSignIn);
            con_.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("DeleteSellerListing", con_); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@sellerListingNo", SqlDbType.Int);
               

                // set parameter values
                cmd.Parameters["@Email"].Value = Email;
                cmd.Parameters["@sellerListingNo"].Value = sellerListingNo;

                cmd.ExecuteNonQuery();

                // read output value 
                con_.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("DeleteSellerListing Listing Error" + ex.Message.ToString());

            }
            finally
            {
                con_.Close();
            }


        }

        public void BuyerCartFetch(string Email, ref DataTable DT)
        {


            DataSet ds = new DataSet();
            string command = "exec ItemsInCart @Email = '" + Email + "'";


            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand(command, con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                    DT = ds.Tables[0];
                }

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying Cart Items" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }


        }
        public void CartTotalPrice(String Email,ref int price)
        {

            
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("CartTotalPrice", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@Cost", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values
                cmd.Parameters["@Email"].Value = Email;
                cmd.ExecuteNonQuery();

                // read output value 

                price = Convert.ToInt32(cmd.Parameters["@Cost"].Value); //convert to output parameter to interger format


                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Cart Total cost  Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }

        }

        public void DeleteFromCart(string Email, int sellerid, int sellerListingNo)
        {

            SqlConnection con_ = new SqlConnection(connStringSignIn);
            con_.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("DeleteFromCart", con_); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@Sellerid", SqlDbType.Int);
                cmd.Parameters.Add("@sellerListingNo", SqlDbType.Int);


                // set parameter values
                cmd.Parameters["@Email"].Value = Email;
                cmd.Parameters["@Sellerid"].Value = sellerid;
                cmd.Parameters["@sellerListingNo"].Value = sellerListingNo;

                cmd.ExecuteNonQuery();

                // read output value 
                con_.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Delete from cart Error" + ex.Message.ToString());

            }
            finally
            {
                con_.Close();
            }


        }
        public void CheckoutCart(string Email)
        {

            SqlConnection con_ = new SqlConnection(connStringSignIn);
            con_.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("checkoutCart", con_); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
               


                // set parameter values
                cmd.Parameters["@Email"].Value = Email;
                
                cmd.ExecuteNonQuery();

                // read output value 
                con_.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Checkout cart Error" + ex.Message.ToString());

            }
            finally
            {
                con_.Close();
            }


        }
        public void AddToCart(string Email, int sellerid, int sellerListingNo, int price)
        {

            SqlConnection con_ = new SqlConnection(connStringSignIn);
            con_.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("addToCart", con_); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@SellerID", SqlDbType.Int);
                cmd.Parameters.Add("@sellerListingNo", SqlDbType.Int);
                cmd.Parameters.Add("@Price", SqlDbType.Int);

                // set parameter values
                cmd.Parameters["@Email"].Value = Email;
                cmd.Parameters["@SellerID"].Value = sellerid;
                cmd.Parameters["@sellerListingNo"].Value = sellerListingNo;
                cmd.Parameters["@Price"].Value = price;
                cmd.ExecuteNonQuery();

                // read output value 
                con_.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Add to cart Error" + ex.Message.ToString());

            }
            finally
            {
                con_.Close();
            }


        }
        public void editListing(string Email, int sellerListingNo, int Price, string ListingType, string ListingDescription, string ListingTitle, double MPm1, double MPm2, double MPm3, double MPm4, double MPm5, double MPm6, double Rm1, double Rm2, double Rm3, double Rm4, double Rm5, double Rm6)
        {
            SqlConnection con_ = new SqlConnection(connStringSignIn);
            con_.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("EditPrevListing", con_); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@SellerListingNo", SqlDbType.Int);
                cmd.Parameters.Add("@Price", SqlDbType.Int);
                cmd.Parameters.Add("@ListingType", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@ListingDescription", SqlDbType.VarChar, 250);
                cmd.Parameters.Add("@ListingTitle", SqlDbType.VarChar, 30);
                cmd.Parameters.Add("@MPm1", SqlDbType.Float);
                cmd.Parameters.Add("@MPm2", SqlDbType.Float);
                cmd.Parameters.Add("@MPm3", SqlDbType.Float);
                cmd.Parameters.Add("@MPm4", SqlDbType.Float);
                cmd.Parameters.Add("@MPm5", SqlDbType.Float);
                cmd.Parameters.Add("@MPm6", SqlDbType.Float);
                cmd.Parameters.Add("@Rm1", SqlDbType.Float);
                cmd.Parameters.Add("@Rm2", SqlDbType.Float);
                cmd.Parameters.Add("@Rm3", SqlDbType.Float);
                cmd.Parameters.Add("@Rm4", SqlDbType.Float);
                cmd.Parameters.Add("@Rm5", SqlDbType.Float);
                cmd.Parameters.Add("@Rm6", SqlDbType.Float);

                // set parameter values
                cmd.Parameters["@Email"].Value = Email;
                cmd.Parameters["@SellerListingNo"].Value = sellerListingNo;
                cmd.Parameters["@Price"].Value = Price;
                cmd.Parameters["@ListingType"].Value = ListingType;
                cmd.Parameters["@ListingDescription"].Value = ListingDescription;
                cmd.Parameters["@ListingTitle"].Value = ListingTitle;
                cmd.Parameters["@Mpm1"].Value = MPm1;
                cmd.Parameters["@Mpm2"].Value = MPm2;
                cmd.Parameters["@Mpm3"].Value = MPm3;
                cmd.Parameters["@Mpm4"].Value = MPm4;
                cmd.Parameters["@Mpm5"].Value = MPm5;
                cmd.Parameters["@Mpm6"].Value = MPm6;
                cmd.Parameters["@Rm1"].Value = Rm1;
                cmd.Parameters["@Rm2"].Value = Rm2;
                cmd.Parameters["@Rm3"].Value = Rm3;
                cmd.Parameters["@Rm4"].Value = Rm4;
                cmd.Parameters["@Rm5"].Value = Rm5;
                cmd.Parameters["@Rm6"].Value = Rm6;

                cmd.ExecuteNonQuery();

                // read output value 
                con_.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Edit Listing Error" + ex.Message.ToString());

            }
            finally
            {
                con_.Close();
            }

        }

        public void Listing_details_Fetch_from_email(string Email, int SellerListingNo, ref string ListingTitle, ref int price, ref string ListingType, ref string ListingDescription, ref bool ListingStatus, ref string ListingPostedDate, ref int Wishlists, ref double mpm1, ref double mpm2, ref double mpm3, ref double mpm4, ref double mpm5, ref double mpm6, ref double Rm1, ref double Rm2, ref double Rm3, ref double Rm4, ref double Rm5, ref double Rm6)
        {

            SqlConnection con_ = new SqlConnection(connStringSignIn);
            con_.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("ListingDetailsfromSellerEmail", con_); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Email", SqlDbType.VarChar,30);
                cmd.Parameters.Add("@SellerListingNo", SqlDbType.Int);
                cmd.Parameters.Add("@Price", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@ListingType", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@ListingDescription", SqlDbType.VarChar, 250).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@ListingStatus", SqlDbType.Bit).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@ListingPostingDate", SqlDbType.Date).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@ListingWishlists", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@ListingTitle", SqlDbType.VarChar,30).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MPm1", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MPm2", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MPm3", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MPm4", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MPm5", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@MPm6", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Rm1", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Rm2", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Rm3", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Rm4", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Rm5", SqlDbType.Float).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Rm6", SqlDbType.Float).Direction = ParameterDirection.Output;
                // set parameter values
                cmd.Parameters["@Email"].Value = Email;
                cmd.Parameters["@SellerListingNo"].Value = SellerListingNo;
                cmd.ExecuteNonQuery();

                // read output value 
                int price_ = Convert.ToInt32(cmd.Parameters["@Price"].Value); //convert to output parameter to interger format
                string ListingType_ = Convert.ToString(cmd.Parameters["@ListingType"].Value);
                string ListingDescription_ = Convert.ToString(cmd.Parameters["@ListingDescription"].Value);
                bool ListingStatus_ = Convert.ToBoolean(cmd.Parameters["@ListingStatus"].Value);
                string ListingPostedDate_ = Convert.ToString(cmd.Parameters["@ListingPostingDate"].Value);
                int Wishlists_ = Convert.ToInt32(cmd.Parameters["@ListingWishlists"].Value);
                string ListingTitle_ = Convert.ToString(cmd.Parameters["@ListingTitle"].Value);

                double mpm1_ = Convert.ToDouble(cmd.Parameters["@MPm1"].Value);
                double mpm2_ = Convert.ToDouble(cmd.Parameters["@MPm2"].Value);
                double mpm3_ = Convert.ToDouble(cmd.Parameters["@MPm3"].Value);
                double mpm4_ = Convert.ToDouble(cmd.Parameters["@MPm4"].Value);
                double mpm5_ = Convert.ToDouble(cmd.Parameters["@MPm5"].Value);
                double mpm6_ = Convert.ToDouble(cmd.Parameters["@MPm6"].Value);
                double Rm1_ = Convert.ToDouble(cmd.Parameters["@Rm1"].Value);
                double Rm2_ = Convert.ToDouble(cmd.Parameters["@Rm2"].Value);
                double Rm3_ = Convert.ToDouble(cmd.Parameters["@Rm3"].Value);
                double Rm4_ = Convert.ToDouble(cmd.Parameters["@Rm4"].Value);
                double Rm5_ = Convert.ToDouble(cmd.Parameters["@Rm5"].Value);
                double Rm6_ = Convert.ToDouble(cmd.Parameters["@Rm6"].Value);


                price = price_; //= Convert.ToInt32(cmd.Parameters["@Price"].Value); //convert to output parameter to interger format
                ListingType = ListingType_;// = Convert.ToString(cmd.Parameters["@ListingType"].Value);
                ListingDescription = ListingDescription_;// = Convert.ToString(cmd.Parameters["@ListingDescription"].Value);
                ListingStatus = ListingStatus_;// = Convert.ToBoolean(cmd.Parameters["@ListingType"].Value);
                ListingPostedDate = ListingPostedDate_;// = Convert.ToString(cmd.Parameters["@ListingPostingDate"].Value);
                Wishlists = Wishlists_;// = Convert.ToInt32(cmd.Parameters["@ListingWishlists"].Value);
                ListingTitle = ListingTitle_;
                mpm1 = mpm1_;//= Convert.ToDouble(cmd.Parameters["@MPm1"].Value);
                mpm2 = mpm2_;//= Convert.ToDouble(cmd.Parameters["@MPm2"].Value);
                mpm3 = mpm3_;//= Convert.ToDouble(cmd.Parameters["@MPm3"].Value);
                mpm4 = mpm4_;//= Convert.ToDouble(cmd.Parameters["@MPm4"].Value);
                mpm5 = mpm5_;//= Convert.ToDouble(cmd.Parameters["@MPm5"].Value);
                mpm6 = mpm6_;//= Convert.ToDouble(cmd.Parameters["@MPm6"].Value);
                Rm1 = Rm1_;//= Convert.ToDouble(cmd.Parameters["@Rm1"].Value);
                Rm2 = Rm2_;//= Convert.ToDouble(cmd.Parameters["@Rm2"].Value);
                Rm3 = Rm3_;//= Convert.ToDouble(cmd.Parameters["@Rm3"].Value);
                Rm4 = Rm4_;//= Convert.ToDouble(cmd.Parameters["@Rm4"].Value);
                Rm5 = Rm5_;//= Convert.ToDouble(cmd.Parameters["@Rm5"].Value);
                Rm6 = Rm6_;//= Convert.ToDouble(cmd.Parameters["@Rm6"].Value);
                con_.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Listing Details Error" + ex.Message.ToString());

            }
            finally
            {
                con_.Close();
            }

        }
        public void ListingOverviewKeyword(string keyword, string Eemail, ref DataSet DT)
        {


            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                string command_ = "exec Listings_View_Keyword_Buyer @Email= '" + Eemail + "' ,  @keyword= '" + keyword + "' "; ;
                cmd = new SqlCommand(command_, con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(DT);
                }
                //DT = ds.Tables[0];

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying searched Listings" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        public void ListingOverviewKeywordH(string keyword,ref DataSet DT)
        {


            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                string command_ = "exec Listing_View_Keyword  @keyword= '" + keyword + "' "; ;
                cmd = new SqlCommand(command_, con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(DT);
                }
                //DT = ds.Tables[0];

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying searched Listings" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }
        public void ListingOverviewbyCategory(string category, string Eemail, ref DataSet DT)
        {


            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                string command_ = "exec Listings_View_Category_Buyer @Email= '"+Eemail+"' ,  @category= '" + category + "' ";
                cmd = new SqlCommand(command_, con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(DT);
                }
                //DT = ds.Tables[0];

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying category Listings" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        public void ListingOverviewbyCategoryH(string category, ref DataSet DT)
        {


            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                string command_ = "exec Listing_View_Category @category= '" + category + "' ";
                cmd = new SqlCommand(command_, con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(DT);
                }
                //DT = ds.Tables[0];

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying category Listings" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        public void ListingOverviewPriceASC(string Eemail, ref DataSet DT)
        {


            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                string command_ = "exec Listings_View_Simple_Price_Asc_Buyer @Email='" + Eemail + "'";
                cmd = new SqlCommand(command_, con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(DT);
                }
                //DT = ds.Tables[0];

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying Listings Overview Price ASC" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        public void ListingOverviewPriceASCH(ref DataSet DT)
        {


            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                string command_ = "exec Listings_View_Simple_Price_Asc";
                cmd = new SqlCommand(command_, con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(DT);
                }
                //DT = ds.Tables[0];

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying Listings Overview Price ASC" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        public void ListingOverviewPriceDESC(string Eemail, ref DataSet DT)
        {


            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                string command_ = "exec Listings_View_Simple_Price_DSC_Buyer @Email='"+Eemail+"'";
                cmd = new SqlCommand(command_, con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(DT);
                }
                //DT = ds.Tables[0];

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying Listings Overview Price ASC" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }

        public void ListingOverviewPriceDESCH(ref DataSet DT)
        {


            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connStringSignIn);
            con.Open();
            SqlCommand cmd;
            try
            {
                string command_ = "exec Listings_View_Simple_Price_DSC";
                cmd = new SqlCommand(command_, con); //name of your procedure
                cmd.CommandType = CommandType.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(DT);
                }
                //DT = ds.Tables[0];

                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("Error Displaying Listings Overview Price DSC" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
        }
    }
}

