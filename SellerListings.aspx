<%@ Page Title="" Language="C#" MasterPageFile="~/sellerMasterPage.Master" AutoEventWireup="true" CodeBehind="SellerListings.aspx.cs" Inherits="DB_PROJ.SellerListings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_" runat="server">
    <link href="Style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    <asp:Label ID="DisplayEmail" runat="server" Text="UserName" ></asp:Label>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="body_" runat="server">
    <div class="section-header">
                                        <h1>DASHBOARD</h1>
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
                                            <th>Listing</th>
                                            <th>Price</th>
                                            <th>Edit Details</th>
                                           
                                            <%--<th>Wishlist Count</th>--%>
                                            <th>Delete Listing</th>
                                        </tr>
                                    </thead>
                                     <tbody class="align-middle">
                                         <asp:Repeater ID="RepeaterListings" runat="server">  
                                             <HeaderTemplate>   
                                                 
                                             </HeaderTemplate>  
                                             <ItemTemplate>
                                                 <tr>
                                                <td> <asp:Label ID="Visit" CssClass="btn"  runat="server" Text='<%#Eval("Listing_Title") %>'></asp:Label> </td>
                                                <td> <asp:Label ID="Cost" CssClass="btn" runat="server" Text='<%#Eval("Price") %>'></asp:Label> </td>
                                                <td> <asp:LinkButton ID="Edit" CssClass="btn" OnClick="GotoEditListing" runat="server">Edit Listing</asp:LinkButton> </td>
                                                <%--<td> <asp:Label ID="Count" CssClass="btn" runat="server" Text='<%#Eval("ListingWishlists") %>'></asp:Label> </td>--%>
                                                <td><asp:LinkButton ID="Button"   OnClick="DeleteSellerListing" runat="server"><i class="fa fa-trash"></i></asp:LinkButton></td>
                                                
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
                </div>
            </div>
        </div>

</asp:Content>
