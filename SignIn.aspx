<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="DB_PROJ.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="LoginValidation.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
            <!-- Login Start -->
        <div class="login">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">    
                        <div class="register-form">
                            <div class="row">
                                <div class="section-header">
                                        <h1>REGISTER</h1>
                                        </div>

                                <div class="col-md-6">
                                    <label>First Name</label>
                                    <asp:TextBox ID="First_Name" CssClass="form-control" ValidationGroup="signUpPart" MaxLength="50"  ValidateRequestMode="Enabled" Text="" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator  Display="Dynamic" ValidationGroup="signUpPart" id="RequiredFieldValidator1" runat="server" ControlToValidate="First_Name" ErrorMessage="First name is a required field." ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="signUpPart" id="RegularExpressionValidator3"  runat="server" ControlToValidate="First_Name" ErrorMessage="First Name Invalid" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-6">
                                    <label>Last Name</label>
                                   
                                    <asp:TextBox ID="Last_Name" CssClass="form-control" ValidationGroup="signUpPart" Text="" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="signUpPart" id="RegularExpressionValidator2"  runat="server" ControlToValidate="Last_Name" ErrorMessage="Last Name Invalid" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
                                       <asp:RequiredFieldValidator  Display="Dynamic" ValidationGroup="signUpPart" id="RequiredFieldValidator2" runat="server" ControlToValidate="Last_Name" ErrorMessage="Last name is a required field." ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-6">
                                    <label>Date of Birth</label>
                                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                                </div>
                                <div class="col-md-6">
                                    <label>E-mail
                                    </label>
                                   
                                    &nbsp;<asp:TextBox ID="Email_reg" ValidationGroup="signUpPart" CssClass="form-control" Text="" runat="server"></asp:TextBox>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationGroup="signUpPart" runat="server" ControlToValidate="Email_reg" Display="Dynamic" ErrorMessage="Invalid Email" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                     <asp:RequiredFieldValidator  Display="Dynamic" ValidationGroup="signUpPart"  id="RequiredFieldValidator3" runat="server" ControlToValidate="Email_reg" ErrorMessage="Email is a required field." ForeColor="Red">  </asp:RequiredFieldValidator>

                                </div>
                                <div class="col-md-6">
                                    <label>Mobile No</label>
                                   
                                    <asp:TextBox ID="Mobile_No" ValidationGroup="signUpPart" CssClass="form-control" Text="" runat="server"></asp:TextBox>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="signUpPart" runat="server" ControlToValidate="Mobile_No" Display="Dynamic" ErrorMessage="Invalid Mobile No" SetFocusOnError="True" ValidationExpression="\d{9}">invalid Number</asp:RegularExpressionValidator>
                                     <asp:RequiredFieldValidator  Display="Dynamic"  id="RequiredFieldValidator4" ValidationGroup="signUpPart" runat="server" ControlToValidate="Mobile_No" ErrorMessage="Mobile No is a required Field" ForeColor="Red">
                                    </asp:RequiredFieldValidator>

                                </div>
                                <div class="col-md-6">
                                    <label>Bank Account ID</label>
                                   
                                    <asp:TextBox ID="BAID" ValidationGroup="signUpPart" CssClass="form-control" Text="" runat="server"></asp:TextBox>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ValidationGroup="signUpPart" runat="server" ControlToValidate="BAID" Display="Dynamic" ErrorMessage="Invalid Bank Account No" SetFocusOnError="True" ValidationExpression="^[a-zA-Z0-9]{11}$|^[a-zA-Z0-9]{13}$">Invalid Bank Account No</asp:RegularExpressionValidator>
                                     <asp:RequiredFieldValidator  Display="Dynamic"  id="RequiredFieldValidator6" ValidationGroup="signUpPart" runat="server" ControlToValidate="BAID" ErrorMessage="Bank Accounr Numebr is a required field" ForeColor="Red">
                                    </asp:RequiredFieldValidator>

                                </div>
                                <div class="col-md-6">
                                    <label>Bank Name</label>
                                   
                                    <asp:TextBox ID="BN" ValidationGroup="signUpPart" MaxLength="30" CssClass="form-control" Text="" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator  Display="Dynamic"  id="RequiredFieldValidator7" ValidationGroup="signUpPart" runat="server" ControlToValidate="BN" ErrorMessage="Bank Name is a required Field" ForeColor="Red">
                                    </asp:RequiredFieldValidator>

                                </div>
                                <div class="col-md-6">
                                    <label>Bank Account Title</label>
                                   
                                    <asp:TextBox ID="BAT" ValidationGroup="signUpPart" CssClass="form-control" MaxLength="50" Text="" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator  Display="Dynamic"  id="RequiredFieldValidator8" ValidationGroup="signUpPart" runat="server" ControlToValidate="BAT" ErrorMessage="Bank Account Title is a required Field" ForeColor="Red">
                                    </asp:RequiredFieldValidator>

                                </div>
                                <div class="col-md-6">
                                    <label>Password</label>
                                    
                                    <asp:TextBox ID="Password_reg" ValidationGroup="signUpPart" CssClass="form-control" Text="" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator  Display="Dynamic" ValidationGroup="signUpPart"  id="RequiredFieldValidator5" runat="server" ControlToValidate="Password_reg" ErrorMessage="Password is a required field." ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator  Display="Dynamic" ValidationGroup="signUpPart"  id="RegularExpressionValidator7" runat="server" ControlToValidate="Password_reg" ErrorMessage="Invalid Password" ForeColor="Red" ValidationExpression="(?=^.{8,10}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;*()_+}{:;'?/&gt;.&lt;,])(?!.*\s).*$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-6">
                                    <label>Account Type</label>
                                    <asp:DropDownList ID="AccountTypeDropDown" CssClass="form-control" runat="server">
                                     <asp:ListItem Selected="True" Value="0"> Buyer </asp:ListItem>
                                     <asp:ListItem Selected="False" Value="1"> Seller </asp:ListItem>
                                     </asp:DropDownList>
                                    
                                </div>
                                <div class="col-md-6">
                                    <asp:Button ID="SignUpButton" ValidationGroup="signUpPart"  CssClass="btn" Text="REGISTER NOW" OnClick="SignUPClick" runat="server" formnovalidate/>
                                </div>
                            </div>
                        </div>
                   <div class="col-lg-6">
                        <div class="login-form">
                            <div class="row">
                                <div class="col-md-8">
                                <div class="section-header">
                                        <h1>SIGN IN</h1>
                                        </div>
                                </div>
                                 <div class="col-md-8">
                                    <label>E-mail / Username</label>
                                    
                                     <asp:TextBox ID="UserN_Email_SignIn" ValidationGroup="signInPart" CssClass="form-control" Text="Username" runat="server"></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationGroup="signInPart" runat="server" ControlToValidate="UserN_Email_SignIn" Display="Dynamic" ErrorMessage="Invalid Email" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                 </div>
                                <div class="col-md-8">
                                    <label>Password</label>
                                    
                                    <asp:TextBox ID="Password_SignIn"  CssClass="form-control" ValidationGroup="signInPart" TextMode="Password" Text="Password" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator  Display="Dynamic" ValidationGroup="signInPart"  id="RegularExpressionValidator6" runat="server" ControlToValidate="Password_SignIn" ErrorMessage="Invalid Password" ForeColor="Red" ValidationExpression="(?=^.{8,10}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;*()_+}{:;'?/&gt;.&lt;,])(?!.*\s).*$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                    </div>
                               
                                <div class="col-md-8">
                                    <asp:Button ID="SignINButton" ValidationGroup="signInPart"  CssClass="btn" Text="SIGN IN" OnClick="SignInClick" runat="server" formnovalidate/>
                                </div>
                                <div>
                                <%--<asp:LinkButton ID="LinkButton1" CssClass="btn" PostBackUrl="~/BuyerHome.aspx" runat="server">Demo Buyer Sign In</asp:LinkButton>
                                     <asp:LinkButton ID="LinkButton2" CssClass="btn" PostBackUrl="~/SellerListings.aspx" runat="server">Demo Seller Sign In</asp:LinkButton>--%>
                                <asp:TextBox ID="signinMessage" CausesValidation="false" CssClass="form-control" Text=" " ReadOnly="true" Visible="false"  runat="server"></asp:TextBox>
                               </div>
                            </div>
                        </div>
                        </div>
                    </div>
             </div>
                </div>
            </div>
        
        <!-- Login End -->
</asp:Content>
