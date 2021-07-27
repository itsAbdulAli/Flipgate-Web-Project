<%@ Page Title="" Language="C#" MasterPageFile="~/sellerMasterPage.Master" AutoEventWireup="true" CodeBehind="sellerEditListing.aspx.cs" Inherits="DB_PROJ.sellerEditListing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    <asp:Label ID="DisplayEmail" runat="server" Text="UserName" ></asp:Label>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="body_" runat="server">
    
                               <h1>EDIT LISTING</h1>
                               <div class="row">
                                    <div class="col-md-6">
                                         <asp:Label ID="Label1" Font-Size="Large"  Text ="Listing Title" runat="server"></asp:Label>
                                        <asp:TextBox ID="ListingTitle" MaxLength="30" CssClass="form-control" Text="Listing Title" runat ="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                       <asp:Label ID="Label2" Font-Size="Large" Text ="Product Details" runat="server"></asp:Label>
                                        <asp:TextBox ID="ProductDetails" MaxLength="250" CssClass="form-control" Text ="Add Details Here" runat="server"></asp:TextBox>
                                       
                                    </div>
                                    <div class="col-md-6">
                                         <asp:Label ID="Price_Label" Font-Size="Large" Text ="Price" runat="server"></asp:Label>
                                        <asp:TextBox ID="Price" TextMode="Number" CssClass="form-control" Text="Add Price here" runat ="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="CategoryLabel" Font-Size="Large" Text ="Venture Category" runat="server"></asp:Label>
                                        <asp:DropDownList ID="Category" runat="server">
                                        <asp:ListItem Text="WebSite"></asp:ListItem>
                                        <asp:ListItem Text="FreeLance"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                 <h4>Monthly Revenue</h4>
                                  <div class="row"> 
                                        <div class="col-md-6">
                                            <label> Month 1 </label>
                                        <asp:TextBox ID="rm1" CssClass="form-control" TextMode="Number" Text ="Month 1" runat="server"></asp:TextBox>
                                        </div>
                                      <div class="col-md-6">
                                          <label> Month 2 </label>
                                        <asp:TextBox ID="rm2" CssClass="form-control" TextMode="Number" Text ="Month 2" runat="server"></asp:TextBox>
                                        </div>
                                      <div class="col-md-6">
                                          <label> Month 3 </label>
                                        <asp:TextBox ID="rm3" CssClass="form-control" TextMode="Number" Text ="Month 3" runat="server"></asp:TextBox>
                                        </div>
                                      <div class="col-md-6">
                                          <label> Month 4 </label>
                                        <asp:TextBox ID="rm4" CssClass="form-control" TextMode="Number" Text ="Month 4" runat="server"></asp:TextBox>
                                        </div>
                                      <div class="col-md-6">
                                          <label> Month 5 </label>
                                        <asp:TextBox ID="rm5" CssClass="form-control" TextMode="Number" Text ="Month 5" runat="server"></asp:TextBox>
                                        </div>
                                      <div class="col-md-6">
                                          <label> Month 6 </label>
                                        <asp:TextBox ID="rm6" CssClass="form-control" TextMode="Number" Text ="Month 6" runat="server"></asp:TextBox>
                                        </div>
                                  </div>

                                   <h4>Monthly Profits</h4>
                                  <div class="row"> 
                                        <div class="col-md-6">
                                            <label> Month 1 </label>
                                        <asp:TextBox ID="Pm1" CssClass="form-control" TextMode="Number" Text ="Month 1" runat="server"></asp:TextBox>
                                        </div>
                                      <div class="col-md-6">
                                          <label> Month 2 </label>
                                        <asp:TextBox ID="Pm2" CssClass="form-control" TextMode="Number" Text ="Month 2" runat="server"></asp:TextBox>
                                        </div>
                                      <div class="col-md-6">
                                          <label> Month 3 </label>
                                        <asp:TextBox ID="Pm3" CssClass="form-control" TextMode="Number" Text ="Month 3" runat="server"></asp:TextBox>
                                        </div>
                                      <div class="col-md-6">
                                          <label> Month 4 </label>
                                        <asp:TextBox ID="Pm4" CssClass="form-control" TextMode="Number" Text ="Month 4" runat="server"></asp:TextBox>
                                        </div>
                                      <div class="col-md-6">
                                          <label> Month 5 </label>
                                        <asp:TextBox ID="Pm5" CssClass="form-control" TextMode="Number" Text ="Month 5" runat="server"></asp:TextBox>
                                        </div>
                                      <div class="col-md-6">
                                          <label> Month 6 </label>
                                        <asp:TextBox ID="Pm6" CssClass="form-control" TextMode="Number" Text ="Month 6" runat="server"></asp:TextBox>
                                        </div>
                                  </div>

                                  <div class="col-md-12">
                                        <asp:Button ID="EditListingButton" ValidationGroup="ListingDetails"  CssClass="btn" Text="Edit Listing" OnClick="EditPrevListing" runat="server" formnovalidate/>
                                        <br><br>
                                  </div>
</asp:Content>
