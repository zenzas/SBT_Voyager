﻿<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    Sub Page_Load(Sender As Object, E As EventArgs)
    
        Dim ConnectionString As String = "server=(local);database=dane2;uid=" & Session("user").ToString & ";password = " & Session("password").ToString
        Dim CommandText As String = "exec mojeimp " & Session("id")
    
        Dim myConnection As New SqlConnection(ConnectionString)
        Dim myCommand As New SqlCommand(CommandText, myConnection)
    
        myConnection.Open()
    
        DataGrid1.DataSource = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        DataGrid1.DataBind()
    
    End Sub
    
    Sub Button1_Click(sender As Object, e As EventArgs)
    Response.Redirect("Default.aspx")
    End Sub

</script>
<html>
<head>
</head>
<body style="FONT-FAMILY: arial">
    <h2>Odbyte imprezy 
    </h2>
    <hr size="1" />
    <form runat="server">
        <p>
            <asp:datagrid id="DataGrid1" runat="server" EnableViewState="False" ForeColor="Black" BackColor="White" CellPadding="3" GridLines="None" CellSpacing="1">
                <HeaderStyle font-bold="True" forecolor="white" backcolor="#4A3C8C"></HeaderStyle>
                <ItemStyle backcolor="#DEDFDE"></ItemStyle>
            </asp:datagrid>
        </p>
        <p>
        </p>
        <p>
            <asp:Button id="Button1" onclick="Button1_Click" runat="server" Width="200px" Text="Powrót"></asp:Button>
        </p>
    </form>
</body>
</html>
