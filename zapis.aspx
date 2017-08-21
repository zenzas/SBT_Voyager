<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    Sub Page_Load(Sender As Object, E As EventArgs)
    
        Dim ConnectionString As String = "server=(local);database=dane2;uid=" & Session("user").ToString & ";password = " & Session("password").ToString
        Dim CommandText As String = "exec wybr " & Session("klucz")
        Dim myConnection As New SqlConnection(ConnectionString)
        Dim myCommand As New SqlDataAdapter(CommandText, myConnection)
    
        dim dat as new dataset()
    
        myCommand.Fill(dat,"main")
    
        Label1.Text = dat.Tables("main").rows(0).item("miejsce")
        Label2.Text = dat.Tables("main").rows(0).item("czas_trwania_imprezy")
        Label3.Text = dat.Tables("main").rows(0).item("cena_imprezy")
        Label4.Text = dat.Tables("main").rows(0).item("ilosc_miejsc")
        Label5.Text = dat.Tables("main").rows(0).item("ilosc_zgloszen")
        Label6.Text = dat.Tables("main").rows(0).item("imie")
        Label7.Text = dat.Tables("main").rows(0).item("nazwisko")
        Label8.Text = dat.Tables("main").rows(0).item("nazwa_kategorii")
        Label9.Text = dat.Tables("main").rows(0).item("data_otwarcia")
    
    End Sub
    
    Sub Button2_Click(sender As Object, e As EventArgs)
    Response.Redirect("default.aspx")
    End Sub
    
    Sub Button1_Click(sender As Object, e As EventArgs)
        Dim ConnectionString As String = "server=(local);database=dane2;uid=" & Session("user").ToString & ";password = " & Session("password").ToString
        Dim CommandText As String = "exec zapis " & Session("id") & ", " & Session("klucz")
        Dim myConnection As New SqlConnection(ConnectionString)
        Dim myCommand As New SqlDataAdapter(CommandText, myConnection)
        dim dat as new dataset()
        myCommand.Fill(dat,"main")
        Response.Redirect("default.aspx")
    End Sub

</script>
<html>
<head>
</head>
<body style="FONT-FAMILY: arial">
    <h2>Szczegóły Wyjazdu 
    </h2>
    <hr size="1" />
    <form runat="server">
        <p>
            Miejsce pobutu :<asp:Label id="Label1" runat="server">Label</asp:Label> 
        </p>
        <p>
            Data rozpoczęcia: <asp:Label id="Label9" runat="server">Label</asp:Label>
        </p>
        <p>
            Czas pobytu: <asp:Label id="Label2" runat="server">Label</asp:Label>
        </p>
        <p>
            Cena wyjazdu: <asp:Label id="Label3" runat="server">Label</asp:Label>
        </p>
        <p>
            Ilośc miejsc: <asp:Label id="Label4" runat="server">Label</asp:Label>
        </p>
        <p>
            Ilośc miejsc zarezerwowanych: <asp:Label id="Label5" runat="server">Label</asp:Label>
        </p>
        <p>
            &nbsp;Imię organizatora: <asp:Label id="Label6" runat="server">Label</asp:Label>
        </p>
        <p>
            Nazwisko organizatora:<asp:Label id="Label7" runat="server">Label</asp:Label> 
        </p>
        <p>
            Rodzaj wyjazdu: <asp:Label id="Label8" runat="server">Label</asp:Label>
        </p>
        <p>
            <asp:Button id="Button1" onclick="Button1_Click" runat="server" Width="200px" Text="Zapisz się "></asp:Button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Button id="Button2" onclick="Button2_Click" runat="server" Width="200px" Text="Powrót"></asp:Button>
        </p>
    </form>
</body>
</html>
