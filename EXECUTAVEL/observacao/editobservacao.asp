<%
Dim login
Dim observacoes
login = session("login")
Set observacoes = session("observacoes")
If (login <> "GERENTE") Or (observacoes Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim observacaoid
observacaoid = CInt(Request.QueryString("id"))
Dim observacaodescricao
If observacaoid > 0 Then
  Dim observacao
  Set observacao= observacoes.Consultar(observacaoid)
  observacaodescricao = observacao.Descricao
Else
  observacaodescricao = ""
End If
%>

<script language="JavaScript">
function enviar()
{
  if (document.formobservacao.descricao.value == "")
  {
    window.alert("O campo Descrição não pode estar em branco!");
    document.formobservacao.descricao.focus();
    return;
  }
  else
  {
    document.formobservacao.submit();
  }
}

</script>

<!-- #include file="header_editobservacao.asp" -->

<p>&nbsp;</p>
<p>&nbsp;</p>


<form method="GET" action="operacaoobservacao.asp" name="formobservacao">
<div align="center">
  <center>
  <table border="0" cellpadding="4" cellspacing="0" width="350">
    <tr>
      <td width="100%" colspan="2" bgcolor="#000080">
        <p align="center"><b><font color="#FFFFFF" size="2">&nbsp;Observação</font></b></p>
      </td>
    </tr>
    <tr>
      <td width="14%" bgcolor="#C0C0C0"><b><font face="Arial" size="3">Descrição</font></b></td>
      <td width="86%" bgcolor="#C0C0C0">
        <input type="text" name="descricao" size="40" value="<%=observacaodescricao%>">
        <input type="hidden" name="id" size="20" value="<%=observacaoid%>"></td>
    </tr>
    <tr>
      <td width="100%" colspan="2" bgcolor="#C0C0C0">
        <p align="center">&nbsp;<input type="button" value="  Salvar  " name="btnSalvar" onclick="javascript:enviar()">&nbsp;
        <input type="button" value="Cancelar" name="btnCancelar" onClick="javascript:document.location.href('observacao.asp')"></p>
      </td>
    </tr>
  </table>
  </center>
</div>
&nbsp;
</form>

<script language="JavaScript">document.formobservacao.descricao.focus();</script>

<p>&nbsp;</p>
<p>&nbsp;</p>



<!-- #include file="../footer.asp" -->

