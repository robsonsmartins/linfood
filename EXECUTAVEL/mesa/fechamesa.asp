<%
Dim login
Dim mesa
login = session("login")
Set mesa = session("mesa")
If (login = "") Or (mesa Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim usuario
Set usuario = session("usuario")
If mesa.FecharConta(usuario.Nome) Then
Else
End If
%>

<!-- #include file="header_fechamesa.asp" -->


<div align="center">
  <center>
  <table border="1" cellspacing="0" width="500" bgcolor="#FFFFFF">
    <tr>
      <td width="100%" colspan="3" bgcolor="#000080">
        <p align="center"><b><font face="Arial" size="3" color="#FFFFFF">Ticket de Venda</font></b></td>
    </tr>
    <tr>
      <td width="100%" colspan="3"><b><font size="2" face="Arial">Mesa: <%=mesa.NoMesa%> | Garçom: <%=usuario.Nome%> | Comanda: <%=mesa.NoComanda%></font></b></td>
    </tr>
    <tr>
      <td width="9%" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Qtd.</font></b></td>
      <td width="72%" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Produto</font></b></td>
      <td width="19%" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Preço</font></b></td>
    </tr>
    <% For i = 1 To mesa.Itens.Count() %>
    <tr>
      <td width="9%" bgcolor="#E9E9E9"><%=mesa.Itens.GetAt(i).Quantidade%></td>
      <td width="72%" bgcolor="#E9E9E9"><%=mesa.Itens.GetAt(i).Produto.Descricao%></td>
  </center>
      <td width="19%" bgcolor="#E9E9E9">
        <p align="right"><%=FormatNumber(mesa.Itens.GetAt(i).CalcularTotal(),2)%></td>
    </tr>
  <center>
    <% Next %> 
    <tr>
      <td width="81%" colspan="2" bgcolor="#C0C0C0"><b><font size="2" face="Arial">SUBTOTAL</font></b></td>
  </center>
      <td width="19%" bgcolor="#C0C0C0"><b>
        <p align="right"><font size="2" face="Arial"><%=FormatNumber(mesa.Subtotal,2)%></font></b></td>
    </tr>
  <center>
    <tr>
      <td width="81%" colspan="2" bgcolor="#C0C0C0"><b><font size="2" face="Arial">DESCONTO</font></b></td>
  </center>
      <td width="19%" bgcolor="#C0C0C0"><b>
        <p align="right"><font size="2" face="Arial"><%=FormatNumber(mesa.Desconto,2)%></font></b></td>
    </tr>
  <center>
    <tr>
      <td width="81%" colspan="2" bgcolor="#C0C0C0"><b><font size="2" face="Arial">TAXA SERVIÇO</font></b></td>
  </center>
      <td width="19%" bgcolor="#C0C0C0"><b>
        <p align="right"><font size="2" face="Arial"><%=FormatNumber(mesa.CalcularServico(),2)%></font></b></td>
    </tr>
  <center>
    <tr>
      <td width="100%" colspan="3" bgcolor="#E9E9E9">&nbsp;</td>
    </tr>
    <tr>
      <td width="81%" colspan="2"><b><font size="3" face="Arial">TOTAL</font></b></td>
  </center>
      <td width="19%"><b>
        <p align="right"><font size="3" face="Arial"><%=FormatNumber(mesa.CalcularTotal(),2)%></font></b></td>
    </tr>
  </table>
</div>
<p align="center">

<a href="mesa.asp"><b><font size="2" face="Arial"><img border="0" src="../imagens/voltar.gif" width="16" height="16" align="absmiddle">
Voltar ao Mapa de Mesas</font></b></a>
<p>

<!-- #include file="../footer.asp" -->