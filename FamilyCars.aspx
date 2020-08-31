<%@ Page Title="FamilyCars" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FamilyCars.aspx.cs" Inherits="test3.FamilyCars" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <head>
        <title>CSS Template</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                font-family: Arial, Helvetica, sans-serif;
            }

            /* Style the header */
            header {
                background-color: #666;
                padding: 30px;
                text-align: center;
                font-size: 35px;
                color: white;
            }

            /* Create two columns/boxes that floats next to each other */
            nav {
                float: left;
                width: 20%;
                height: 300px; /* only for demonstration, should be removed */
                padding: 20px;
            }

            article {
                float: right;
                padding: 10px;
                height: 300px; /* only for demonstration, should be removed */
                width: 50%;
                background-color: ##ffffff;
            }

            /* Clear floats after the columns */
            section:after {
                content: "";
                display: table;
                clear: both;
            }

            /* Style the footer */
            /*footer {
    background-color: #777;
    padding: 10px;
    text-align: center;
    color: white;
}*/

            /* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
            @media (max-width: 600px) {
                nav, article {
                    width: auto;
                    height: auto;
                }
            }
        </style>
    </head>
    <body>
        <div>
            <h2>family cars</h2>
            <p>here you can find the best family cars .</p>


            <header>
                <%--<h2>Dodge challenger SRT 8</h2>--%>
                <asp:TextBox ID="tbname" runat="server" ReadOnly="true" BackColor="Gray"></asp:TextBox>
            </header>

            <section>
                <nav>
                    <ul>
                        <%--<img class="mySlides w3-animate-fading" src="pho/40.jpg" style="width: 250%">--%>
                        <img id="imgg" runat="server" style="width:250%" />
                    </ul>
                </nav>

                <article>
                    <%--<h1>Dodge Challenger</h1>--%>
                    <h1><asp:TextBox ID="tbpname" runat="server" ReadOnly="true" ></asp:TextBox> </h1>
                    
                    <p>
                        <%--Since its introduction in 2008, the Dodge Challenger has represented one of the most raw expressions of muscle car performance
       available in an auto industry that has been steadily moving toward more sophisticated and environmentally sensitive ways of getting places quickly.--%>
                        <asp:TextBox ID="tbcarders" runat="server" ReadOnly="true" ></asp:TextBox>
                    </p>

                    <%--<h2>price : 18,000$</h2>--%>
                    <h2><asp:TextBox ID="tbprice" runat="server" ReadOnly="true"></asp:TextBox></h2>
                    <dx:ASPxButton ID="btnmore" runat="server" Text="More photos" OnClick="btnmore_Click">
                    </dx:ASPxButton>
                    <p>&nbsp;</p>
                    <p>
                        <dx:ASPxButton ID="btnadd" runat="server" Text="Add to your cart" OnClick="btnadd_Click" Theme="Youthful" Height="16px">
                        </dx:ASPxButton>
                    </p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                </article>
            
        </div>

        <%--<div>
            <header>
                <h2>Dodge challenger SRT 8</h2>
            </header>

            <section>
                <nav>
                    <ul>
                        <img class="mySlides w3-animate-fading" src="pho/30.jpg" style="width: 250%">
                    </ul>
                </nav>

                <article>
                    <h1>Dodge Challenger</h1>
                    <p>
                        Since its introduction in 2008, the Dodge Challenger has represented one of the most raw expressions of muscle car performance
       available in an auto industry that has been steadily moving toward more sophisticated and environmentally sensitive ways of getting places quickly.
                    </p>

                    <h2>price : 25,000$</h2>
                <dx:ASPxButton ID="btnmore1" runat="server" Text="More photos" OnClick="btnmore_Click">
                    </dx:ASPxButton>
                    <p>&nbsp;</p>
                    <p>
                        <dx:ASPxButton ID="btnadd1" runat="server" Text="Add to your cart" OnClick="btnadd_Click" Theme="Youthful">
                        </dx:ASPxButton>
                    </p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                </article>
            </section>
        </div>--%>

    </body>



  


</asp:Content>
