<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    Sub Page_Load(Sender As Object, E As EventArgs)
    
        Dim ConnectionString As String = "server =(local);database=dane2; uid=" & Session("user").ToString & " ;password = " & Session("password").ToString
        Dim CommandText As String = "select * from Uczelnia"
    
        Dim myConnection As New SqlConnection(ConnectionString)
        Dim myCommand As New SqlCommand(CommandText, myConnection)
    
        myConnection.Open()
    
        if Session("org") = true  then
    
         Hyperlink5.Visible = true
    
        end if
    
    End Sub

</script>
<html>
<head>
</head>
<body style="FONT-FAMILY: arial">
    <form runat="server">
        <p align="center">
            Strona Główna 
        </p>
        <p align="center">
            <img src="polska.jpg" /> 
        </p>
        <p>
            <asp:HyperLink id="HyperLink1" runat="server" NavigateUrl="oferta.aspx" Target="_parent">Aktualna oferta</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink id="HyperLink2" runat="server" NavigateUrl="wczesniejsze.aspx" Target="_parent">Wcześniejsze imprezy</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink id="HyperLink3" runat="server" NavigateUrl="Ocena.aspx">Przyznawanie ocen</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink id="HyperLink4" runat="server" NavigateUrl="Nowaimpreza.aspx">Zgłoś imprezę</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink id="HyperLink5" runat="server" NavigateUrl="mojeimp.aspx" Visible="False" Width="130px">Moje imprezy</asp:HyperLink>
        </p>
        <p>
        </p>
    </form>
</body>
</html>
