<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    Sub Page_Load(Sender As Object, E As EventArgs)

        If Not Page.IsPostBack Then

            ' Databind the master grid on the first request only
            ' (viewstate will restore these values on subsequent postbacks).

            MasterGrid.SelectedIndex = 0
            BindMasterGrid()

        End If

    End Sub

    Sub MasterGrid_Select(Sender As Object, E As EventArgs)
        Session("klucz") =MasterGrid.SelectedIndex
        Response.Redirect("zapis.aspx")
        'BindDetailGrid()
    End Sub

    Sub MasterGrid_Page(Sender As Object, E As DataGridPageChangedEventArgs)

        If MasterGrid.SelectedIndex <> -1 Then

            ' unset the selection, details view
            MasterGrid.SelectedIndex = -1

        End If

        MasterGrid.CurrentPageIndex = e.NewPageIndex

        BindMasterGrid()

    End Sub

    Sub BindMasterGrid()

        ' TODO: Update the ConnectionString and CommandText values for your application
        Dim ConnectionString As String = "server=(local);database=sbp_Voyager;uid= sa"
        Dim CommandText As String = "select * from Propozycja_imperezy_turystycznej"

        Dim myConnection As New SqlConnection(ConnectionString)
        Dim myCommand As New SqlDataAdapter(CommandText, myConnection)

        Dim ds As New DataSet()
        myCommand.Fill(ds)

        MasterGrid.DataSource = ds
        MasterGrid.DataBind()

    End Sub

</script>
<html>
<head>
</head>
<body style="FONT-FAMILY: arial">
    <h2>Master - Detail Grids
    </h2>
    <hr size="1" />
    <form runat="server">
        <p>
            <asp:datagrid id="MasterGrid" runat="server" width="80%" CellSpacing="1" GridLines="None" CellPadding="3" BackColor="White" ForeColor="Black" OnPageIndexChanged="MasterGrid_Page" PageSize="6" AllowPaging="true" OnSelectedIndexChanged="MasterGrid_Select" DataKeyField="id_kategorii">
                <HeaderStyle font-bold="True" forecolor="white" backcolor="#4A3C8C"></HeaderStyle>
                <SelectedItemStyle forecolor="White" backcolor="#9471DE"></SelectedItemStyle>
                <PagerStyle horizontalalign="Right" backcolor="#C6C3C6" mode="NumericPages"></PagerStyle>
                <ItemStyle backcolor="#DEDFDE"></ItemStyle>
                <Columns>
                    <asp:buttoncolumn text="Show details" commandname="Select" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="smaller"></asp:buttoncolumn>
                </Columns>
            </asp:datagrid>

        </p>
    </form>
</body>
</html>
