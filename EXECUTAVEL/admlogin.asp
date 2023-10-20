<%
'conexão com o cache
Dim factory
Set factory = CreateObject("CacheObject.Factory")
If Not factory.IsConnected() Then
  Dim connectstring
  connectstring = "cn_iptcp:127.0.0.1[1972]:LINFOOD" 'local
  Dim success
  success = factory.Connect(connectstring)
Else
  success = True
End If
'em caso de erro na conexão
If Not success Then
  Response.Redirect("connecterror.asp?cs=" & connectstring)
End If
'objeto de conexão
Set session("conexao") = factory
%>

<script language="JavaScript">
function enviar()
{
  if (document.formlogin.nome.value == "")
  {
    window.alert("O campo Nome não pode estar em branco!");
    document.formlogin.nome.focus();
    return;
  }
  else if (document.formlogin.senha.value == "")
  {
    window.alert("O campo Senha não pode estar em branco!");
    document.formlogin.senha.focus();
    return;
  }
  else
  {
    document.formlogin.submit();
  }
}

</script>
<!-- #include file="header_admlogin.asp" -->
<P>&nbsp;</P>
<P>&nbsp;</P>

<form method="get" action="operacaologin.asp" name="formlogin">
  <div align="center">
    <center>
    <table border="0" width="300" cellspacing="0" bordercolorlight="#000000" bordercolordark="#000000" bordercolor="#000000" cellpadding="7" bgcolor="#c0c0c0">
      <tr>
        <td width="284" colspan="2" bgcolor="#000080">
          <p align="center"><font color="#ffffff"><b>Login do Sistema LinFOOD</b></font></p></td>
      </tr>
      <tr>
        <td width="55"><b><font size="3" face="Arial">Nome</font></b></td>
        <td width="229">
        <input name="nome" size="31" >
        <input type="hidden" name="adm" size="31" value="adm">
        </td>
      </tr>
      <tr>
        <td width="55"><b><font size="3" face="Arial">Senha</font></b></td>
        <td width="229"><input type="password" name="senha" size="31"></td>
      </tr>
      <tr>
        <td colspan="2" width="290">
          <p align="center"><input type="button" value="Efetuar Login" name="btnEnviar" onclick="JavaScript:enviar();"></p></td>
      </tr>
    </table>
    </center>
  </div></FORM>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>
<script language="JavaScript">
  document.formlogin.nome.focus();
</script>
<!-- #include file="footer.asp" --></P>
