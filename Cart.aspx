<%@ Page Title="" Language="C#" MasterPageFile="~/buyerMasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="DB_PROJ.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_" runat="server">
       <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    <asp:Label ID="DisplayEmail" runat="server" Text="UserName" ></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body_" runat="server">
            <!-- Cart Start -->
     
    <div class="section-header">
                                        <h1>YOUR CART</h1>
                                        </div>   
    <div class="cart-page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="cart-page-inner">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Product</th>
                                            <th>Price</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">
                                        <%--<tr>
                                            <td>
                                                <div class="img">
                                                    <p> <asp:Label ID="P1" Text ="Listing Name" runat="server"></asp:Label> </p>
                                                  
                                                </div>
                                            </td>
                                            <td><asp:Label ID="C1" Text ="Cost" runat="server"></asp:Label></td>
                                            
                                            <td><button><i class="fa fa-trash"></i></button></td>
                                        </tr>--%>
                                    <asp:Repeater ID="RepeaterListings" runat="server">  
                                             <HeaderTemplate>   
                                                 
                                             </HeaderTemplate>  
                                             <ItemTemplate>
                                                 <tr>
                                                <td> <div class="img"><asp:Label ID="ListingName"   runat="server" Text='<%#Eval("Listing_Title") %>'></asp:Label></div> </td>
                                                <td> <asp:Label ID="Cost" CssClass="btn" runat="server" Text='<%#Eval("Price") %>'></asp:Label> </td>
                                                <td> <asp:LinkButton ID="Button"   OnClick="DeleteFromCart" runat="server"><i class="fa fa-trash"></i></asp:LinkButton></td>
                                                <asp:Label ID="SellerID" CssClass="btn" runat="server" Visible="false" Text='<%#Eval("Userid") %>'></asp:Label>
                                                <asp:Label ID="SellerListingNo" CssClass="btn" runat="server" Visible="false" Text='<%#Eval("sellerListingNo") %>'></asp:Label>
                                            <%--<td><asp:Label ID="Label1" CssClass="btn" runat="server" Text="Label"></asp:Label></td>--%>
                                              </tr>
                                                     </ItemTemplate>  
                                             <FooterTemplate> 
                                                
                                             </FooterTemplate>  
                                             </asp:Repeater>                     
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart-page-inner">
                            <div class="row">
                               <div class="col-md-12">
                                    <div class="cart-summary">
                                        <div class="cart-content">
                                            <h1>Cart Summary</h1>
                                            <h2>Grand Total: <span> <asp:Label ID="TC" Text ="Total Cost" runat="server"></asp:Label></span></h2>
                                            <h1><asp:Button ID="Checkout" CssClass="btn" Text="Checkout" OnClick="CheckoutCart" runat="server"/></h1>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->
</asp:Content>
