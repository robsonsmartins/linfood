<%
Dim login
login = session("login")
Dim mesa 
Set mesa = session("mesa")
Dim idx
idx = Request.QueryString("idx")
If (login = "") Or (mesa Is Nothing) Or (idx = "") Then
  Response.Redirect("../loginerrado.asp")
End If
Dim quantidade
Dim descricao
Dim item
Set item = mesa.Itens.GetAt(CInt(idx))
descricao = item.produto.descricao
quantidade = item.quantidade
Set item = Nothing
If mesa.CancelarItem(CInt(idx)) Then
Else
  Response.Redirect("cancelaitemerror.asp")
End If
Dim usuario
Set usuario = session("usuario")
%>

<!-- #include file="header_cancelaitem.asp" -->

<div align="center">
  <center>
  <table border="1" cellspacing="0" width="450">
    <tr>
      <td width="450" colspan="4" bgcolor="#000080">
        <p align="center"><font color="#FFFFFF" size="2" face="Arial"><b>Cancelamento
        de Itens</b></font></td>
    </tr>
    <tr>
      <td width="19" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Mesa</font></b></td>
      <td width="98" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Garçom</font></b></td>
      <td width="9" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Qtd.</font></b></td>
      <td width="164" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Produto</font></b></td>
    </tr>
    <tr>
      <td width="19" bgcolor="#E9E9E9"><%=mesa.NoMesa%></td>
      <td width="98" bgcolor="#E9E9E9"><%=usuario.Nome%></td>
      <td width="9" bgcolor="#E9E9E9"><%=quantidade%></td>
      <td width="164" bgcolor="#E9E9E9"><%=descricao%></td>
    </tr>
  </table>
  </center>
</div>
<p align="center">
<b><img border="0" src="../imagens/voltar.gif" width="16" height="16" align="absmiddle">
<a href="editmesa.asp?nomesa=<%=mesa.NoMesa%>">Voltar para Mesa <%=mesa.NoMesa%></a></b><p>
<p>
<!-- #include file="../footer.asp" -->

