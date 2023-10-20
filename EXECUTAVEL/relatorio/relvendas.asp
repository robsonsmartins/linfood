<%
Dim login
login = session("login")
Dim inicio
Dim fim
inicio = Request.QueryString("inicio")
fim = Request.QueryString("fim")
If (login <> "GERENTE") Or (Len(inicio) < 10) Or (Len(fim) < 10) Then
  Response.Redirect("../loginerrado.asp")
End If
Dim iniciomda
Dim fimmda
iniciomda = Mid(inicio,4,2) & "/" & Mid(inicio,1,2) & "/" & Mid(inicio,7,4)
fimmda = Mid(fim,4,2) & "/" & Mid(fim,1,2) & "/" & Mid(fim,7,4)
Dim factory
Set factory = session("conexao")
Dim relatoriovendas
Set relatoriovendas = factory.New("LinFOOD.RelatorioVendas")
Dim lista
Set lista = relatoriovendas.EmitirRelatorio(iniciomda,fimmda)
Dim rel
%>

<!-- #include file="header_relvendas.asp" -->
<a name="home"></a>

<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" width="400" height="94">
    <tr>
      <td width="396" colspan="5" height="16" bgcolor="#000080">
        <p align="center"><b><font size="2" face="Arial" color="#FFFFFF">Vendas por Período</font></b></td>
    </tr>
    <tr>
      <td width="396" colspan="5" height="16" bgcolor="#FFFFFF"><font face="Arial" size="2">Período: de <%=inicio%> a <%=fim%> </font></td>
    </tr>
  </center>
    <tr>
      <td width="95" align="left" height="14" bgcolor="#C0C0C0">
        <p align="left"><b><font face="Arial" size="2">Data</font></b></p>
      </td>
  <center>
      <td width="70" align="right" height="14" bgcolor="#C0C0C0"><b><font face="Arial" size="2">Venda</font></b></td>
      <td width="74" align="right" height="14" bgcolor="#C0C0C0"><b><font face="Arial" size="2">Serviço</font></b></td>
      <td width="72" align="right" height="14" bgcolor="#C0C0C0"><b><font face="Arial" size="2">Desconto</font></b></td>
      <td width="77" align="right" height="14" bgcolor="#C0C0C0"><b><font face="Arial" size="2">TOTAL</font></b></td>
    </tr>

<%
Dim i
Dim vt
Dim st
Dim dt
Dim tt
vt = 0
st = 0
dt = 0
tt = 0
For i = 1 to lista.Count()
  Set rel = lista.GetAt(i)
%>
    <tr>
      <td width="95" align="left" height="19" bgcolor="#E4E4E4"><%=Mid(rel.Data,4,2) & "/" & Mid(rel.Data,1,2) & "/" & Mid(rel.Data,7,4)%></td>
      <td width="70" align="right" height="19" bgcolor="#E4E4E4"><%=FormatNumber(rel.Venda,2)%></td>
      <td width="74" align="right" height="19" bgcolor="#E4E4E4"><%=FormatNumber(rel.TxServico,2)%></td>
      <td width="72" align="right" height="19" bgcolor="#E4E4E4"><%=FormatNumber(rel.Desconto,2)%></td>
      <td width="77" align="right" height="19" bgcolor="#E4E4E4"><%=FormatNumber(rel.Total,2)%></td>
    </tr>
<%
  vt = vt + rel.Venda
  st = st + rel.TxServico
  dt = dt + rel.Desconto
  tt = tt + rel.Total
Next
%>
    <tr>
      <td width="95" align="left" height="19" bgcolor="#C0C0C0"><b><font face="Arial" size="2">TOTAL GERAL</font></b></td>
      <td width="70" align="right" height="19" bgcolor="#C0C0C0"><b><font face="Arial" size="2"><%=FormatNumber(vt,2)%></font></b></td>
      <td width="74" align="right" height="19" bgcolor="#C0C0C0"><b><font face="Arial" size="2"><%=FormatNumber(st,2)%></font></b></td>
      <td width="72" align="right" height="19" bgcolor="#C0C0C0"><b><font face="Arial" size="2"><%=FormatNumber(dt,2)%></font></b></td>
      <td width="77" align="right" height="19" bgcolor="#C0C0C0"><b><font face="Arial" size="2"><%=FormatNumber(tt,2)%></font></b></td>
    </tr>
  </table>
  </center>
</div>
<p align="center">

<font face="Arial" size="2"><u>
<a href="#home"><img border="0" src="../imagens/topo.gif" align="absmiddle">Voltar ao Topo</a>
 </u></font>

<!-- #include file="../footer.asp" -->

