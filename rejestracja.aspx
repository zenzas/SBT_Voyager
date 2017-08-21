<%@ Page Language="VB" runat="server" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    Sub Page_Load(sender As Object, e As EventArgs)
    
    Label1.text=""
    if not Page.IsPostBack then
    
      Dim ConnectionString As String = "server =(local);database=dane2;uid=sa"
      Dim CommandText As String = "select id_uczelini,nazwa_uczelni from uczelnia"
      Dim myConnection As New SqlConnection(ConnectionString)
      Dim myCommand As New SqlDataAdapter(CommandText, myConnection)
    
      dim i as integer = 0
      dim objds as new dataset()
    
    
      mycommand.Fill(objDS, "Main")
      DropDownList1.DatavalueField="id_uczelini"
      DropDownList1.DatatextField="nazwa_uczelni"
      DropDownList1.DataSource = objds
      DropDownList1.DataBind()
    
    end if
    
      End Sub
    
    Sub Button2_Click(sender As Object, e As EventArgs)
    response.redirect("newfile.aspx")
    End Sub
    
    Sub Button1_Click(sender As Object, e As EventArgs)
    
     dim i as integer
     Label1.Text = ""
     IF ((textbox14.text = textbox15.text) and (textbox14.text <> "")) then
    
    
     Dim ConnectionString As String = "server =(local);database=dane2;uid=sa"
     dim rob as String = "exec czy_jest_login '" & TextBox13.Text & "'"
     Dim myConnection As New SqlConnection(ConnectionString)
     Dim myrob As New SqlDataAdapter(rob, myConnection)
    
     dim robobj as new dataset()
    
     myrob.Fill(robobj,"main")
    
    
    
     i = robobj.tables("main").rows(0).Item("ile")
    
     if i = 0 then
    
     if textBox5.Text ="" then
     i =0
     end if
     Dim CommandText As String = "exec dodaj_user "
     commandtext = commandtext & "'" & TextBox1.Text & "' , "
     commandtext = commandtext & "'" & TextBox2.Text & "' , "
     commandtext = commandtext & "'" & TextBox3.Text & "' , "
     commandtext = commandtext & TextBox4.Text & " , "
     commandtext = commandtext & i & " , "
     commandtext = commandtext & "'" & TextBox6.Text & "' , "
     commandtext = commandtext & "'" & TextBox7.Text & "' , "
     commandtext = commandtext & "'" & TextBox8.Text & "' , "
     commandtext = commandtext & "'" & TextBox9.Text & "' , "
     commandtext = commandtext & DropDownList1.SelectedValue & ", "
     commandtext = commandtext & TextBox10.Text & " , "
     commandtext = commandtext & "'" & TextBox13.Text & "' , "
     commandtext = commandtext & "'" & TextBox14.Text & "'"
    
     Dim myConnection2 As New SqlConnection(ConnectionString)
     Dim myCommand As New SqlDataAdapter(CommandText, myConnection2)
    
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
      Response.redirect("newfile.aspx")
     end if
    
    else
      Label1.text = "Login juz istnieje"
    end if
    else
    Label1.text = "Podaj poprawnie hasło"
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
                            Imię</td>
                        <td>
                            <asp:TextBox id="TextBox1" runat="server"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nazwisko</td>
                        <td>
                            <asp:TextBox id="TextBox2" runat="server"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Ulica</td>
                        <td>
                            <asp:TextBox id="TextBox3" runat="server"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nr domu</td>
                        <td>
                            <asp:TextBox id="TextBox4" runat="server"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nr mieszkana</td>
                        <td>
                            <asp:TextBox id="TextBox5" runat="server"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Kod pocztowy</td>
                        <td>
                            <asp:TextBox id="TextBox6" runat="server"></asp:TextBox>
                        </td>
                        <td style="COLOR: red">
                            NN-NNN (example 12-345)&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Miejscowość</td>
                        <td>
                            <asp:TextBox id="TextBox7" runat="server"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Numer telefonu</td>
                        <td>
                            <asp:TextBox id="TextBox8" runat="server"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            e-mail</td>
                        <td>
                            <asp:TextBox id="TextBox9" runat="server"></asp:TextBox>
                        </td>
                        <td style="COLOR: red">
                            *@*.* (example <a href="mailto:name@domain.com">name@domain.com</a>)</td>
                    </tr>
                    <tr>
                        <td>
                            Uczelnia</td>
                        <td>
                            <asp:DropDownList id="DropDownList1" runat="server" AutoPostBack="True" Width="147px"></asp:DropDownList>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Rok rozpoczecia studiów</td>
                        <td>
                            <asp:TextBox id="TextBox10" runat="server"></asp:TextBox>
                        </td>
                        <td style="COLOR: red">
                            YYYY (min 2000)</td>
                    </tr>
                </tbody>
            </table>
        </p>
        <!-- Insert content here -->
        <p>
            <table>
                <tbody>
                    <tr>
                        <td>
                            Login</td>
                        <td>
                            <asp:TextBox id="TextBox13" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hasło</td>
                        <td>
                            <asp:TextBox id="TextBox14" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Powtórz hasło&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        </td>
                        <td>
                            <asp:TextBox id="TextBox15" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
            </table>
        </p>
        <p>
            <asp:Button id="Button1" onclick="Button1_Click" runat="server" Width="137px" Text="Zarejestruj Się"></asp:Button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Button id="Button2" onclick="Button2_Click" runat="server" Width="142px" Text="Powrót"></asp:Button>
        </p>
        <p>
            <asp:Label id="Label1" runat="server" forecolor="Red" backcolor="White"></asp:Label>
        </p>
    </form>
</body>
</html>
