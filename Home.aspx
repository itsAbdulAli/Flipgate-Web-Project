

<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DB_PROJ.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- JavaScript Libraries -->


     <%--<asp:Repeater ID="RepterDetails" runat="server">  
    <HeaderTemplate>   
         <h1><asp:Label ID="Head" runat="server" Text="Featured Listings"></asp:Label></h1>
        <div class="product-view">
              <div class="container-fluid">
                <div class="row">
    </HeaderTemplate>  
        <ItemTemplate>  
           
                            <div class="col-md-4">
                                <div class="product-item">
                                    <div class="product-title">
                                        <h2><asp:Label ID="FProd1" runat="server" CssClass="product-title" Text='<%#Eval("Listing_Title") %>' href="#"></asp:Label></h2>
                                        <div class="ratting">
                                           <h3><span>Stars:</span><asp:Label ID="Stars" runat="server" Text='<%#Eval("Ratings") %>'></asp:Label></h3>
                                        </div>
                                    </div>
                               
                                    <div class="product-price">
                                        <h3><span>$</span><asp:Label ID="FC1" runat="server" Text='<%#Eval("Price") %>' href="#"></asp:Label></h3>
                                        <a class="btn" href="SignIn.aspx"><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                    </div>
                                </div>
                            </div>
           
        </ItemTemplate>  
    <FooterTemplate>  
                 </div>
                </div>
            </div>
    </FooterTemplate>  
    </asp:Repeater>  --%>     



    <div class="product-view">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                             <h1><asp:Label ID="Label2" runat="server" Text="Available Listings"></asp:Label></h1>
                            <div class="col-md-12">
                                <div class="product-view-top">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="product-search">
                                                <asp:Textbox ID="search_input" runat="server" Text="Search" />
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Linkbutton ID="SearchButton" runat="server" OnClick="SearchThis"><i class="fa fa-search"></i></asp:Linkbutton>
                                            </div>
                                       
                                        <div class="col-md-4">
                                            <div class="product-price-range">
                                                <div class="dropdown">
                                                    <asp:DropDownList ID="PriceRange" OnSelectedIndexChanged="PriceOrder" AutoPostBack = "true" CssClass="dropdown-toggle" runat="server">
                                                     <%--<div class="dropdown-menu dropdown-menu-right">--%>
                                                       <asp:ListItem Text="Price Order" Value="Select" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Lowest" Value="L"></asp:ListItem>
                                                       <asp:ListItem Text="Highest" Value="H"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                           <asp:Repeater ID="Repeater2" runat="server">  
                           <HeaderTemplate>   
                                            <div class="product-view">
                                            <div class="container-fluid">
                                            <div class="row">
                           </HeaderTemplate>  
                           <ItemTemplate>  
           
                            <div class="col-md-4">
                                <div class="product-item">
                                    <div class="product-title">
                                        <asp:Label ID="AProd" runat="server" CssClass="product-title" Text='<%#Eval("Listing_Title") %>' href="#"></asp:Label>
                                       <%-- <div class="ratting">
                                           <h3><span>Stars:</span><asp:Label ID="AStars" runat="server" Text='<%#Eval("Ratings") %>'></asp:Label></h3>
                                        </div>--%>
                                    </div>
                               
                                    <div class="product-price">
                                        <h3><span>$</span><asp:Label ID="AFC1" runat="server" Text='<%#Eval("Price") %>' href="#"></asp:Label></h3>
                                        <a class="btn" href="SignIn.aspx"><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                    </div>
                                </div>
                            </div>
           
                             </ItemTemplate>  
                             <FooterTemplate>  
                                            </div>
                                            </div>
                                            </div>
                             </FooterTemplate>  
                             </asp:Repeater>    
                        
                               </div>
                           
                        </div>

                     <!-- Side Bar Start -->
              <div class="col-lg-4 sidebar">
                        
                            
                          
                                
                                   <asp:Repeater ID="Repeater3" runat="server">  
                                         <HeaderTemplate>   
                                             <div class="sidebar-widget category">
                                             <h2 class="title">Category</h2>
                                               <nav class="navbar bg-light">
                                               <ul class="navbar-nav">
                                         </HeaderTemplate>  
                                         <ItemTemplate>  
                                                <li class="nav-item">
                                                          <asp:LinkButton ID="CategoryButton" OnClick="CategoryIn" runat="server"><i class="fa fa-newspaper"></i></asp:LinkButton><asp:label ID="idtext" runat="server" Text='<%#Eval("Category_Name")%>'></asp:label></a>
                                                </li>
                                         </ItemTemplate>  
                                         <FooterTemplate> 
                                                 </ul>
                                                  </nav>
                                                  </div>
                       
                                         </FooterTemplate>  
                                         </asp:Repeater>     
                                    
                                
                            
                    </div>
                    <!-- Side Bar End -->
                </div>
            </div>
         </div>                                
                        
       
</asp:Content>
