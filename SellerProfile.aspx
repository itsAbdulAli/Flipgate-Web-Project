<%@ Page Title="" Language="C#" MasterPageFile="~/sellerMasterPage.Master" AutoEventWireup="true" CodeBehind="SellerProfile.aspx.cs" Inherits="DB_PROJ.SellerProfile1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_" runat="server">
    
    <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
           
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    <asp:Label ID="DisplayEmail" runat="server" Text="UserName" ></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body_" runat="server">
       
    <div>
    <div class="section-header">
                                        <h1>PROFILE</h1>
                                        </div>

    
    <!-- My Account Start -->
        <div class="my-account">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                            <a class="nav-link active" id="account-nav" data-toggle="pill" href="#account-tab" role="tab"><i class="fa fa-user"></i>Account Details</a>
                            <a class="nav-link" id="orders-nav" data-toggle="pill" href="#orders-tab" role="tab"><i class="fa fa-shopping-bag"></i>Deals</a>
                            <a class="nav-link" id="payment-nav" data-toggle="pill" href="#payment-tab" role="tab"><i class="fa fa-credit-card"></i>Payment Settings</a>
                            <%--<a class="nav-link" href="Home.aspx"><i class="fa fa-sign-out-alt"></i>Logout</a>--%>
                            <asp:Button ID="logoutButton"  class="nav-link" runat="server" OnClick="logoutClick" Text="Logout" /></div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="tab-content">
                          <div class="tab-pane fade" id="orders-tab" role="tabpanel" aria-labelledby="orders-nav">
                              <h4>Your Deals</h4>
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead class="thead-dark">
                                            
                                            <tr>
                                                <th>Product</th>
                                                <th>Date</th>
                                                <th>Price</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                             <asp:Repeater ID="RepeaterDeal" runat="server">  
                                             <HeaderTemplate>   
                                                 
                                             </HeaderTemplate>  
                                             <ItemTemplate>  
                                                <tr>
                                                 <td><asp:Label ID="Listing_Name" runat="server" Text='<%#Eval("Listing_Title") %>'></asp:Label></td>
                                                <td><asp:Label ID="Date_of_Sale" runat="server" Text='<%#converttodate(Convert.ToString(Eval("date_of_deal")))  %>'></asp:Label></td>
                                                <td><asp:Label ID="Cost" runat="server" Text='<%#Eval("Price") %>'></asp:Label></td>
                                                <td><asp:Label ID="Status" runat="server" Text="Sold"></asp:Label></td>
                                                </tr>
                                             </ItemTemplate>  
                                             <FooterTemplate> 
                                                 
                                             </FooterTemplate>  
                                             </asp:Repeater>
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="payment-tab" role="tabpanel" aria-labelledby="payment-nav">
                                <h4>Payment Method</h4>
                               <div class="row">
                                    <div class="col-md-6">
                                        <label>Bank Account Title</label>
                                        <asp:TextBox ID="BankAccTitle" CssClass="form-control" Text ="Bank Account Title" runat="server"></asp:TextBox>
                                        
                                    </div>
                                    <div class="col-md-6">
                                        <label>Bank Name</label>
                                        <asp:TextBox ID="BankName" CssClass="form-control" Text ="Bank Name" runat="server"></asp:TextBox>
                                       
                                    </div>
                                    <div class="col-md-6">
                                        <label>Bank Account No</label>
                                        <asp:TextBox ID="BankAccNo" CssClass="form-control" Text ="Bank Account No" runat="server"></asp:TextBox>
                                       
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Button ID="AccButton" ValidationGroup="AccPart"  CssClass="btn" Text="Update Account" OnClick="EditProfileBank" runat="server" formnovalidate/>
                                        <br><br>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="tab-pane fade show active" id="account-tab" role="tabpanel" aria-labelledby="account-nav">
                               <h4>Account Details</h4>
                                <div class="row">
                                    <div class="col-md-6">
                                       <label>First Name</label>
                                         <asp:TextBox ID="AccFirstName" CssClass="form-control" Text ="First Name" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Last Name</label>
                                         <asp:TextBox ID="AccLastName" CssClass="form-control" Text ="Last Name" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                         <label>Contact No</label>
                                         <asp:TextBox ID="AccContact" CssClass="form-control" Text ="Contact No" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                         <label>Email ID</label>
                                         <asp:TextBox ID="AccEmail" CssClass="form-control" Text ="EmailId" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                         <label>Date of Birth</label>
                                         <asp:TextBox ID="AccDOB" CssClass="form-control" Text ="Date Of Birth" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">

                                        <asp:Button ID="BasicAccInfo" ValidationGroup="InfoPart"  CssClass="btn" Text="Update Account" OnClick="EditProfileBasicInfo" runat="server" formnovalidate/>
                                        <br><br>
                                    </div>
                                </div>
                                <h4>Password change</h4>
                                <div class="row">
                                    <div class="col-md-6">
                                         <label>Current Password</label>
                                         <asp:TextBox ID="PrevPassword" CssClass="form-control" Text ="Password" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6"> 
                                         <label>New Password</label>
                                         <asp:TextBox ID="NewPassword" CssClass="form-control" Text ="New Password" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Confirm Password</label>
                                         <asp:TextBox ID="ConfirmPassword" CssClass="form-control" Text ="Confirm Password" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Button ID="Password" ValidationGroup="PasswordPart"  CssClass="btn" Text="Update Account" OnClick="EditProfilePassword" runat="server" formnovalidate/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- My Account End -->

           
     
</asp:Content>
