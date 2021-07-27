<%@ Page Title="" Language="C#" MasterPageFile="~/buyerMasterPage.Master" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="DB_PROJ.Listing" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_" runat="server">
         <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
        <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.3.2/chart.min.js"></script>



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    <asp:Label ID="DisplayEmail" runat="server" Text="UserName" ></asp:Label>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="body_" runat="server">

     
   
    <!-- Product Detail Start -->
        <div class="product-detail">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        

                                <div class="col-md-7">
                                    <div class="product-content">                
                                        <div class="section-header">
                                        <h1> <asp:Label ID="Label" runat="server" Text="  " ></asp:Label></h1>
                                        </div>
                                       
                                        <div class="alert-heading">
                                            <h4>Price:</h4>
                                            <h2><asp:Label ID="Price" runat="server" Text="  " ></asp:Label></h2>
                                        </div>
                                      
                                        <div class="action">
                                            <asp:LinkButton ID="addtocart_btn" cssClass="btn"  Text="Add to Cart" OnClick="addtocart" runat="server"><i class="fa fa-shopping-cart"></i><span>Add To Cart</span> </asp:LinkButton>
                                             </div>
                                    </div>
                                </div>
                    </div>
                        <div class="col-lg-8">
                            <div class="col-4">
                         <h4>Product description</h4>
                            <p>
                                <asp:Label ID="Description" runat="server" Text="  " ></asp:label>
                            </p>
                                </div>
                            </div>
                                               
                    </div>
              </div>
         </div>
    </div>
        <div class="wishlist-page">
            <div class="container-fluid">
                <div class="wishlist-page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <h2>Monthly Profits</h2>
                                <table class="table table-bordered">     
                                     
                                        <thead class="thead-dark">
                                            
                                            <tr>
                                                <th>Month 1</th>
                                                <th>Month 2</th>
                                                <th>Month 3</th>
                                                <th>Month 4</th>
                                                <th>Month 5</th>
                                                <th>Month 6</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>

                                                <tr>
                                                <td><asp:Label ID="Mpm2" runat="server" Text="Label" Visible="true"></asp:Label></td>
                                                <td><asp:Label ID="Mpm3" runat="server" Text="Label" Visible="true"></asp:Label></td>
                                                <td><asp:Label ID="Mpm4" runat="server" Text="Label" Visible="true"></asp:Label></td>
                                                <td><asp:Label ID="Mpm5" runat="server" Text="Label" Visible="true"></asp:Label></td>
                                                <td><asp:Label ID="Mpm6" runat="server" Text="Label" Visible="true"></asp:Label></td>
                                                <td><asp:Label ID="Mpm1" runat="server" Text="Label" Visible="true"></asp:Label></td>
                                                </tr>
                                          
                                        </tbody>
                                   </table>
                                <h2>Monthly Revenue</h2>
                                   <table class="table table-bordered">     
                            
                                        <thead class="thead-dark">
                                            
                                            <tr>
                                                <th>Month 1</th>
                                                <th>Month 2</th>
                                                <th>Month 3</th>
                                                <th>Month 4</th>
                                                <th>Month 5</th>
                                                <th>Month 6</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>

                                                <tr>
                                                <td><asp:Label ID="rm1" runat="server" Text="Label" Visible="true"></asp:Label></td>
                                                <td><asp:Label ID="rm2" runat="server" Text="Label" Visible="true"></asp:Label></td>
                                                <td><asp:Label ID="rm3" runat="server" Text="Label" Visible="true"></asp:Label></td>
                                                <td><asp:Label ID="rm4" runat="server" Text="Label" Visible="true"></asp:Label></td>
                                                <td><asp:Label ID="rm5" runat="server" Text="Label" Visible="true"></asp:Label></td>
                                                <td><asp:Label ID="rm6" runat="server" Text="Label" Visible="true"></asp:Label></td>
                                                </tr>
                                          
                                        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


                        
      
</asp:Content>
