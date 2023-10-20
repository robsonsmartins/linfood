<%
Dim login
Dim classes
login = session("login")
Set classes = session("classes")
If (login <> "GERENTE") Or (classes Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim classeid
classeid = CInt(Request.QueryString("id"))
Dim classedescricao
If classeid > 0 Then
  Dim classe
  Set classe = classes.Consultar(classeid)
  classedescricao = classe.Descricao
Else
  classedescricao = ""
End If
%>

<script language="JavaScript">
function enviar()
{
  if (document.formclasse.descricao.value == "")
  {
    window.alert("O campo Descrição não pode estar em branco!");
    document.formclasse.descricao.focus();
    return;
  }
  else
  {
    document.formclasse.submit();
  }
}

</script>

<!-- #include file="header_editclasse.asp" -->

<p>&nbsp;</p>
<p>&nbsp;</p>


<form method="GET" action="operacaoclasse.asp" name="formclasse">
<div align="center">
  <center>
  <table border="0" cellpadding="4" cellspacing="0" width="350">
    <tr>
      <td width="100%" colspan="2" bgcolor="#000080">
        <p align="center"><font color="#FFFFFF" size="2"><b>Categoria de Produto</b></font></p>
      </td>
    </tr>
    <tr>
      <td width="14%" bgcolor="#C0C0C0"><b><font size="3" face="Arial">Descrição</font></b></td>
      <td width="86%" bgcolor="#C0C0C0">
        <input type="text" name="descricao" size="41" value="<%=classedescricao%>">
        <input type="hidden" name="id" size="20" value="<%=classeid%>"></td>
    </tr>
    <tr>
      <td width="100%" colspan="2" bgcolor="#C0C0C0">
        <p align="center">&nbsp;<input type="button" value="  Salvar  " name="btnSalvar" onclick="javascript:enviar()">&nbsp;
        <input type="button" value="Cancelar" name="btnCancelar" onClick="javascript:document.location.href('classe.asp')"></p>
      </td>
    </tr>
  </table>
  </center>
</div>
&nbsp;
</form>
<script language="JavaScript">document.formclasse.descricao.focus();</script>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<!-- #include file="../footer.asp" -->
