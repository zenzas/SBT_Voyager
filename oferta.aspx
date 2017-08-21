<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    Dim ds As New DataSet()
    
    Sub Page_Load(Sender As Object, E As EventArgs)
    
        If Not Page.IsPostBack Then
    
            MasterGrid.SelectedIndex = 0
            BindMasterGrid()
    
    
        End If
    
    End Sub
    
    Sub MasterGrid_Select(Sender As Object, E As EventArgs)
        dim i as integer
            Dim ConnectionString As String = "server=(local);database=dane2;uid= sa"
            Dim CommandText As String = "exec aktywne  "  &  Session("id")
    
            Dim myConnection As New SqlConnection(ConnectionString)
            Dim myCommand As New SqlDataAdapter(CommandText, myConnection)
    
            Dim ds As New DataSet()
            myCommand.Fill(ds,"main")
        i = MasterGrid.SelectedIndex + Mastergrid.PageSize*(MasterGrid.CurrentPageIndex)
        Session("klucz") = ds.Tables("main").rows(i).Item("Numer imprezy")
        Response.Redirect("zapis.aspx")
    End Sub
    
    Sub MasterGrid_Page(Sender As Object, E As DataGridPageChangedEventArgs)
    
        If MasterGrid.SelectedIndex <> -1 Then
            MasterGrid.SelectedIndex = -1
    
        End If
    
        MasterGrid.CurrentPageIndex = e.NewPageIndex
    
        BindMasterGrid()
    
    End Sub
    
    Sub BindMasterGrid()
    
        Dim ConnectionString As String = "server=(local);database=dane2;uid= sa"
        Dim CommandText As String = "exec aktywne  "  &  Session("id")
    
        Dim myConnection As New SqlConnection(ConnectionString)
        Dim myCommand As New SqlDataAdapter(CommandText, myConnection)
    
        Dim ds As New DataSet()
        myCommand.Fill(ds,"main")
    
        MasterGrid.DataSource = ds
        MasterGrid.DataBind()
    
    End Sub
    
    Sub Button1_Click(sender As Object, e As EventArgs)
    Response.redirect("default.aspx")
    End Sub

</script>
<html>
<head>
</head>
<body style="FONT-FAMILY: arial">
    <h2>Aktualna oferta 
    </h2>
    <hr size="1" />
    <form runat="server">
        <p>
            <asp:datagrid id="MasterGrid" runat="server" width="80%" CellSpacing="1" GridLines="None" CellPadding="3" BackColor="White" ForeColor="Black" OnPageIndexChanged="MasterGrid_Page" PageSize="20" AllowPaging="true" OnSelectedIndexChanged="MasterGrid_Select" DataKeyField="miejsce">
                <SelectedItemStyle forecolor="White" backcolor="#9471DE"></SelectedItemStyle>
                <ItemStyle backcolor="#DEDFDE"></ItemStyle>
                <HeaderStyle font-bold="True" forecolor="White" backcolor="#4A3C8C"></HeaderStyle>
                <Columns>
                    <asp:ButtonColumn Text="Szczegóły" CommandName="Select">
                        <ItemStyle font-size="Smaller" font-bold="True"></ItemStyle>
                    </asp:ButtonColumn>
                </Columns>
                <PagerStyle horizontalalign="Right" backcolor="#C6C3C6" mode="NumericPages"></PagerStyle>
            </asp:datagrid>
        </p>
        <p>
            <asp:Button id="Button1" onclick="Button1_Click" runat="server" Text="Powót" Width="130px"></asp:Button>
        </p>
    </form>
</body>
</html>
