<%
  Dim login
  login = session("login")
  If login <> "GERENTE" Then
    Response.Redirect("loginerrado.asp") 
  End If
%>
<html>
<!-- #include file="header_admmenu.asp" -->
<div align="center">
  <center>
  <table border="0" cellpadding="2" cellspacing="0" width="450" bordercolor="#000000">
    <tr>
      <td width="438" colspan="2" bgcolor="#000080">
        <p align="center"><font color="#FFFFFF"><b>Menu Principal - Módulo
        Administrativo</b></font></td>
    </tr>
    <tr>
      <td width="42" bgcolor="#C0C0C0" align="center">&nbsp;<a href="usuario/usuario.asp"><img border="0" src="imagens/usuario.gif"></a></td>
      <td width="384" bgcolor="#C0C0C0">
  <a href="usuario/usuario.asp"><font face="Arial" size="3" color="#000000"><b>Cadastro de Usuários</b></font></a></td>
    </tr>
    <tr>
      <td width="42" bgcolor="#C0C0C0" align="center">&nbsp;<a href="classe/classe.asp"><img border="0" src="imagens/classe.gif"></a></td>
      <td width="384" bgcolor="#C0C0C0"><a href="classe/classe.asp"><font face="Arial" size="3" color="#000000"><b>Cadastro de
        Categorias de Produtos</b></font></a></td>
    </tr>
    <tr>
      <td width="42" bgcolor="#C0C0C0" align="center">&nbsp;<a href="produto/produto.asp"><img border="0" src="imagens/produto.gif"></a></td>
      <td width="384" bgcolor="#C0C0C0"><a href="produto/produto.asp"><font face="Arial" size="3" color="#000000"><b>Cadastro de Produtos</b></font></a></td>
    </tr>
    <tr>
      <td width="42" bgcolor="#C0C0C0" align="center">&nbsp;<a href="observacao/observacao.asp"><img border="0" src="imagens/observacao.gif"></a></td>
      <td width="384" bgcolor="#C0C0C0"><a href="observacao/observacao.asp"><font face="Arial" size="3" color="#000000"><b>Cadastro de Observações</b></font></a></td>
    </tr>
    <tr>
      <td width="42" bgcolor="#C0C0C0" align="center">&nbsp;<a href="configuracao/configuracao.asp"><img border="0" src="imagens/configuracao.gif"></a></td>
      <td width="384" bgcolor="#C0C0C0"><a href="configuracao/configuracao.asp"><font face="Arial" size="3" color="#000000"><b>Configuração
        do Sistema</b></font></a></td>
    </tr>
    <tr>
      <td width="42" bgcolor="#C0C0C0" align="center">&nbsp;<a href="relatorio/relvendasform.asp"><img border="0" src="imagens/relatoriov.gif"></a></td>
      <td width="384" bgcolor="#C0C0C0"><a href="relatorio/relvendasform.asp"><font face="Arial" size="3" color="#000000"><b>Relatório de Vendas por Período</b></font></a></td>
    </tr>
    <tr>
      <td width="42" bgcolor="#C0C0C0" align="center">&nbsp;<a href="relatorio/relprodutosform.asp"><img border="0" src="imagens/relatoriop.gif"></a></td>
      <td width="384" bgcolor="#C0C0C0"><a href="relatorio/relprodutosform.asp"><font face="Arial" size="3" color="#000000"><b>Relatório de Produtos Mais Vendidos por Período</b></font></a></td>
    </tr>
  </table>
  </center>
</div>

<!-- #include file="footer.asp" -->


</html>
