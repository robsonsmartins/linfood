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
Dim relatorioprodutos
Set relatorioprodutos = factory.New("LinFOOD.RelatorioProdutos")
Dim lista
Set lista = relatorioprodutos.EmitirRelatorio(iniciomda,fimmda)
Dim rel
%>

<!-- #include file="header_relprodutos.asp" -->
<a name="home"></a>


<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" width="300">
    <tr>
      <td colspan="2" width="296" bgcolor="#000080" align="center"><b><font color="#FFFFFF" size="2" face="Arial">Produtos
        Mais Vendidos por Período</font></b></td>
    </tr>
    <tr>
      <td colspan="2" width="296" bgcolor="#FFFFFF"><font size="2" face="Arial">Período:
        de <%=inicio%> a <%=fim%></font></td>
    </tr>
    <tr>
      <td width="84" bgcolor="#C0C0C0" align="center"><b><font face="Arial" size="2">Quantidade</font></b></td>
      <td width="210" bgcolor="#C0C0C0"><b><font face="Arial" size="2">Produto</font></b></td>
    </tr>
<%
Dim i
For i = 1 to lista.Count()
  Set rel = lista.GetAt(i)
%>
    <tr>
      <td width="84" bgcolor="#E4E4E4" align="center"><%=rel.Quantidade%></td>
      <td width="210" bgcolor="#E4E4E4"><%=rel.Descricao%></td>
    </tr>
<%
Next
%>
  </table>
  </center>
</div>

<p align="center">

<font face="Arial" size="2"><u>
<a href="#home"><img border="0" src="../imagens/topo.gif" align="absmiddle">Voltar ao Topo</a>
 </u></font>

<!-- #include file="../footer.asp" -->
