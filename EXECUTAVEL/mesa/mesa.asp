<%
Dim login
login = session("login")
If login = "" Then
  Response.Redirect("../loginerrado.asp")
End If
Dim factory

'Set session("conexao") = Nothing
'Set factory = CreateObject("CacheObject.Factory")
'If Not factory.IsConnected() Then
'  Dim connectstring
'  connectstring = "cn_iptcp:127.0.0.1[1972]:LINFOOD" 'local
'  Dim success
'  success = factory.Connect(connectstring)
'Else
'  success = True
'End If
'em caso de erro na conexão
'If Not success Then
'  Response.Redirect("connecterror.asp?cs=" & connectstring)
'End If
'objeto de conexão
'Set session("conexao") = factory


Set factory = session("conexao")
Dim mesas 
Set mesas = Nothing
Set mesas = factory.New("LinFOOD.Mesa")
mesas.CriarMesas()
Dim lista
Set lista = Nothing
Set lista = mesas.Listar()
Set session("mesas") = Nothing
Set session("mesas") = mesas
Dim mesa
Dim figura
%>

<!-- #include file="header_mesa.asp" -->

<table border="0" width="100%" cellspacing="0">
  <%
  i = 1
  For lin = 1 To Int(lista.Count() / 10) + 1
  %>
  <tr>
    <%
    For col = 1 To 10
    %>
      <td width="10%">
      <center>
      <font size="3" face="Arial"><b>
      <%
      If i <= lista.Count() Then
        Set mesa = lista.GetAt(i)      
        If mesa.Status = "A" Then
          figura = "mesaa.gif"
        ElseIf mesa.Status = "F" Then
          figura = "mesaf.gif"
        Else
          figura = "mesal.gif"
        End If
        Response.Write("<a href='editmesa.asp?nomesa=" & mesa.NoMesa & "'><img border='0' src='../imagens/" & figura & "'></a><br>" & mesa.NoMesa)
      Else
        Response.write("&nbsp;")
      End If
      i = i + 1    
      %>
      </b></font>
      </center>
      </td>
    <%
    Next
    %>
  </tr>
  <%
  Next
  %>
</table>

<script language="JavaScript">
setTimeout("location.reload(false)",10000);
</script>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<!-- #include file="../footer.asp" -->

