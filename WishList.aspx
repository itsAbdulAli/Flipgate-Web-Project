<%@ Page Title="" Language="C#" MasterPageFile="~/buyerMasterPage.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="DB_PROJ.WishList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    <asp:Label ID="DisplayEmail" runat="server" Text="UserName" ></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body_" runat="server">
    <div class="section-header">
                                        <h1>WISHLIST</h1>
                                        </div>
    <!-- Wishlist Start -->
        <div class="wishlist-page">
            <div class="container-fluid">
                <div class="wishlist-page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Product</th>
                                            <th>Price</th>
                                            <th>View Details</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">
                                        <tr>
                                            <td>
                                                <div class="img">
                                                  <p> <asp:Label ID="P1" runat="server" Text="Listing Name"></asp:Label> </p> 
                                                  
                                                </div>
                                            </td>
                                            <td><p> <asp:Label ID="C1" runat="server" Text="Cost"></asp:Label> </p></td>
                                            <td><button class="btn-cart">Visit Listing</button></td>
                                            <td><button class="fa fa-trash"></button></td>
                                        </tr>
                                      
                                      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Wishlist End -->
</asp:Content>
