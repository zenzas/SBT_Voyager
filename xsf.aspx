<%@ Page Language="VB" %>
<%@ outputcache duration="10" varybyparam="none" %>
<script runat="server">

    Sub Page_Load(Sender As Object, E As EventArgs)
    
        TimestampCreated.Text = DateTime.Now.ToString("r")
        TimestampExpires.Text = DateTime.Now.AddSeconds(10).ToString("r")
    
    End Sub

</script>
<html>
<head>
</head>
<body style="FONT-FAMILY: arial">
    <h2>Output caching for 10 seconds... 
    </h2>
    <hr size="1" />
    <p>
        Output Cache created: <asp:Label id="TimestampCreated" runat="server" font-bold="true" forecolor="red"></asp:Label>
        <br />
        Output Cache expires: <asp:Label id="TimestampExpires" runat="server" font-bold="true" forecolor="red"></asp:Label>
    </p>
</body>
</html>