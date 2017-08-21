<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    Sub LoginBtn_Click(Sender As Object, E As EventArgs)
    
        Msg.text =""
        Dim ConnectionString As String = "server=(local);database=dane2;uid=" & UserName.Text & ";password = " & Userpass.text
        Dim myConnection As New SqlConnection(ConnectionString)
    
    
        try
    
        myConnection.Open()
    
        catch ex as Exception
    
        end try
    
        if (myConnection.State <> System.Data.ConnectionState.Open) Then
        msg.Text = "Niepoprawne dane"
        Else
        Session("user") = Username.text
        Session("password") = userpass.text
        Dim CommandText As String = "select id_czlonka_klubu,czy_organizator from czlonkowie_klubu where login = '" & Username.text & "'"
        Dim myCommand As New SqlDataAdapter(CommandText, myConnection)
    
    
        dim dat as new dataset()
    
        myCommand.Fill(dat,"main")
    
        Session("id") = dat.Tables("main").rows(0).item("id_czlonka_klubu")
        Session("org") = dat.Tables("main").rows(0).item("czy_organizator")
        response.redirect("default.aspx")
    
        end if
    
    
    End Sub

</script>
<html>
<head>
</head>
<body style="FONT-FAMILY: arial">
    <form style="FONT-SIZE: medium; COLOR: black; FONT-STYLE: normal; BACKGROUND-COLOR: white" runat="server">
        <h2>
            <table>
                <tbody>
                </tbody>
            </table>
            <asp:Label id="Label1" runat="server" width="231px">Zaloguj się</asp:Label> 
            <hr size="1" />
            <table>
                <tbody>
                    <tr>
                        <td>
                            Użytkownik:</td>
                        <td>
                            <asp:TextBox id="UserName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator id="Requiredfieldvalidator1" runat="server" ControlToValidate="UserName" Display="Static" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hasło:</td>
                        <td>
                            <asp:TextBox id="UserPass" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator id="Requiredfieldvalidator2" runat="server" ControlToValidate="UserPass" Display="Static" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </tbody>
            </table>
            <asp:button id="LoginBtn" onclick="LoginBtn_Click" runat="server" text="Login"></asp:button>
        </h2>
        <p>
            <asp:Label id="Msg" runat="server" forecolor="Red"></asp:Label> 
            <hr size="1" />
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
            <asp:HyperLink id="HyperLink1" runat="server" NavigateUrl="rejestracja.aspx">Rejestracja</asp:HyperLink>
        </p>
        <hr size="1" />
        <p>
        </p>
    </form>
</body>
</html>
