<%
Dim login
Dim mesa
login = session("login")
Set mesa = session("mesa")
If ((login <> "GERENTE") And (login <> "OPERADOR")) Or (mesa Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim usuario
Set usuario = session("usuario")
Dim factory
Set factory = session("conexao")
Dim txservico
Dim dinheiro
Dim desconto
txservico = CSng(Request.QueryString("txservico")) / 100
dinheiro = CSng(Request.QueryString("dinheiro"))
desconto = CSng(Request.QueryString("desconto"))
Dim troco
troco = mesa.ReceberConta(usuario.nome, dinheiro, desconto, txservico)
%>

<!-- #include file="header_operacaoreceber.asp" -->

<div align="center">
  <center>
  <table border="1" cellspacing="0" width="400">
    <tr>
      <td colspan="2" bgcolor="#000080" width="394">
        <p align="center"><b><font size="2" face="Arial" color="#FFFFFF">Receber
        Mesa <%=mesa.nomesa%></font></b></td>
    </tr>
    <tr>
      <td bgcolor="#DDDDDD" width="269"><font size="3" face="Arial"><b>Valor do
        Troco</b></font></td>
    </center>
    <td bgcolor="#DDDDDD" width="121">
      <p align="right"><font size="3" face="Arial"><b><%=FormatNumber(troco,2)%></b></font></td>
  </tr>
  </table>
</div>

<p align="center">
  <b><font size="2" face="Arial"><img border="0" src="../imagens/voltar.gif" width="16" height="16">
  </font></b>
  <a href="mesa.asp"><b><font size="2" face="Arial">Voltar ao Mapa de Mesas</font></b></a>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<!-- #include file="../footer.asp" -->

