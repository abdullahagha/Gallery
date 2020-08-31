<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="test3.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />--%>
    <div class="w3-container">
    </div>
    

    <div class="w3-content w3-section" style="max-width: 500px">



        <img class="mySlides w3-animate-fading" src="pho/1.jpg" style="width: 250%">
        <img class="mySlides w3-animate-fading" src="pho/20.jpg" style="width: 250%">
        <img class="mySlides w3-animate-fading" src="pho/30.jpg" style="width: 250%">
        <img class="mySlides w3-animate-fading" src="pho/40.jpg" style="width: 250%">
    </div>

    <script>
        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) { myIndex = 1 }
            x[myIndex - 1].style.display = "block";
            setTimeout(carousel, 2500);
        }
    </script>


</asp:Content>
