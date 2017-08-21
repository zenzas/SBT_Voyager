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
             Dim ConnectionString As String = "server=(local);database=dane2;uid= sa"
             Dim CommandText As String = "exec odbyte  "  &  Session("id")
    
             Dim myConnection As New SqlConnection(ConnectionString)
             Dim myCommand As New SqlDataAdapter(CommandText, myConnection)
    
             dim i as integer = MasterGrid.SelectedIndex + MasterGrid.PageSize*(MasterGrid.CurrentPageIndex)
    
             myCommand.Fill(ds,"main")
    
             Session("klucz_odbytej") = ds.Tables("main").rows(i).Item("Numer imprezy")
    
             Response.Redirect("ocena2.aspx")
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
             Dim CommandText As String = "exec odbyte  "  &  Session("id")
    
             Dim myConnection As New SqlConnection(ConnectionString)
             Dim myCommand As New SqlDataAdapter(CommandText, myConnection)
    
    
             myCommand.Fill(ds)
    
             MasterGrid.DataSource = ds
             MasterGrid.DataBind()
    
         End Sub
    
    Sub Button1_Click(sender As Object, e As EventArgs)
    Response.Redirect("default.aspx")
    End Sub

</script>
<html>
<head>
</head>
<body style="FONT-FAMILY: arial">
    <h2>Ocena
    </h2>
    <hr size="1" />
    <form runat="server">
        <p>
            <asp:datagrid id="MasterGrid" runat="server" width="80%" CellSpacing="1" GridLines="None" CellPadding="3" BackColor="White" ForeColor="Black" OnPageIndexChanged="MasterGrid_Page" PageSize="6" AllowPaging="true" OnSelectedIndexChanged="MasterGrid_Select" DataKeyField="miejsce">
                <HeaderStyle font-bold="True" forecolor="white" backcolor="#4A3C8C"></HeaderStyle>
                <SelectedItemStyle forecolor="White" backcolor="#9471DE"></SelectedItemStyle>
                <PagerStyle horizontalalign="Right" backcolor="#C6C3C6" mode="NumericPages"></PagerStyle>
                <ItemStyle backcolor="#DEDFDE"></ItemStyle>
                <Columns>
                    <asp:buttoncolumn text="Show details" commandname="Select" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="smaller"></asp:buttoncolumn>
                </Columns>
            </asp:datagrid>
        </p>
        <p>
            <asp:Button id="Button1" onclick="Button1_Click" runat="server" Text="Powrót" Width="191px"></asp:Button>
        </p>
    </form>
</body>
</html>
