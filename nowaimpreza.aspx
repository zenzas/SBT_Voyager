<%@ Page Language="VB" runat="server" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    Sub Page_Load(sender As Object, e As EventArgs)
    
    Label1.text=""
    if not Page.IsPostBack then
    
      Dim ConnectionString As String = "server =(local);database=dane2; uid=" & Session("user").ToString & " ;password = " & Session("password").ToString
      Dim CommandText As String = "select id_kategorii,nazwa_kategorii from kategoria"
      Dim myConnection As New SqlConnection(ConnectionString)
      Dim myCommand As New SqlDataAdapter(CommandText, myConnection)
    
      dim i as integer = 0
      dim objds as new dataset()
    
    
      mycommand.Fill(objDS, "Main")
      DropDownList1.DatavalueField="id_kategorii"
      DropDownList1.DatatextField="nazwa_kategorii"
      DropDownList1.DataSource = objds
      DropDownList1.DataBind()
    
    end if
    
      End Sub
    
    Sub Button2_Click(sender As Object, e As EventArgs)
    response.redirect("default.aspx")
    End Sub
    
    Sub Button1_Click(sender As Object, e As EventArgs)
    
      Dim ConnectionString As String = "server =(local);database=dane2; uid=sa"
     dim i as integer
     Label1.Text = ""
    
     Dim CommandText As String = "exec dodaj_impreze "
     commandtext = commandtext & Session("id") & " ,"
     commandtext = commandtext & "'" & TextBox1.Text & "' , "
     commandtext = commandtext & TextBox2.Text & " , "
     commandtext = commandtext & TextBox3.Text & " , "
     commandtext = commandtext & TextBox4.Text & " , "
     commandtext = commandtext & DropDownList1.SelectedValue & ", "
     commandtext = commandtext & "'" & TextBox5.Text & "' , "
     commandtext = commandtext & "'" & Session("user").ToString & "'"
    
    
     Dim myConnection As New SqlConnection(ConnectionString)
     Dim myCommand As New SqlDataAdapter(CommandText, myConnection)
    
    
     dim obj as new dataset()
    
     i=1
    
     try
    
     mycommand.Fill(obj)
     i=0
    
     catch ex as Exception
    
    
     end try
    
     if i=1 then
       Label1.Text = "Niepoprawne dane"
     end if
    
     if i=0 then
     Session("org") =true
      Response.redirect("default.aspx")
     end if
    
    
    End Sub

</script>
<html>
<head>
</head>
<body>
    <form runat="server">
        <p>
            Wypełnij formularz 
        </p>
        <hr size="1" />
        <p>
            <table>
                <tbody>
                    <tr>
                        <td>
                            Miejsce</td>
                        <td>
                            <asp:TextBox id="TextBox1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Czas trwania</td>
                        <td>
                            <asp:TextBox id="TextBox2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Cena</td>
                        <td>
                            <asp:TextBox id="TextBox3" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Ilość miejsc</td>
                        <td>
                            <asp:TextBox id="TextBox4" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Kategoria</td>
                        <td>
                            <asp:DropDownList id="DropDownList1" runat="server" AutoPostBack="True" Width="147px"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Data rozpoczęcia</td>
                        <td>
                            <asp:TextBox id="TextBox5" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
            </table>
        </p>
        <p>
            <asp:Button id="Button1" onclick="Button1_Click" runat="server" Width="137px" Text="Złóż propozycję"></asp:Button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Button id="Button2" onclick="Button2_Click" runat="server" Width="142px" Text="Powrót"></asp:Button>
        </p>
        <p>
            <asp:Label id="Label1" runat="server" forecolor="Red" backcolor="White"></asp:Label>
        </p>
        <p>
        </p>
        <p>
        </p>
    </form>
</body>
</html>
