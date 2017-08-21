<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    ' Insert page code here
    '
    
    Sub Button1_Click(sender As Object, e As EventArgs)
    
        Dim ConnectionString As String = "server =(local);database=dane2;uid=" & Session("user").ToString & ";password = " & Session("password").ToString
        Dim CommandText As String = "exec ocena " & Session("klucz_odbytej") & ", " & DropDownList1.SelectedValue & ", " & Session("id")
        Dim myConnection As New SqlConnection(ConnectionString)
        Dim myCommand As New SqlDataAdapter(CommandText, myConnection)
    
        dim dat as new dataset()
        myCommand.Fill(dat,"main")
        Response.redirect("default.aspx")
    
    End Sub

</script>
<html>
<head>
</head>
<body>
    <form runat="server">
        <p>
            <asp:DropDownList id="DropDownList1" runat="server" Width="109px">
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
                <asp:ListItem Value="6">6</asp:ListItem>
                <asp:ListItem Value="7">7</asp:ListItem>
                <asp:ListItem Value="8">8</asp:ListItem>
                <asp:ListItem Value="9">9</asp:ListItem>
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            <asp:Button id="Button1" onclick="Button1_Click" runat="server" Text="Oceń"></asp:Button>
        </p>
        <!-- Insert content here -->
    </form>
</body>
</html>
