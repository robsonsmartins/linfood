<%
Dim login
login = session("login")
If login <> "GERENTE" Then
  Response.Redirect("../loginerrado.asp")
End If
Dim factory
Set factory = session("conexao")
Dim produtos 
Set produtos = factory.New("LinFOOD.Produto")
Set session("produtos") = produtos
Dim lista
Set lista = produtos.Listar() 
Dim produto
%>

<script language = "JavaScript">
function confirmaApagar(id, descricao)
{
  if (window.confirm("Confirma a exclusão do Produto: " + descricao + " ?"))
  {
    document.location.href="deleteproduto.asp?id=" + id;
  }
}
</script>

<!-- #include file="header_produto.asp" -->
<a name="home"></a>

<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" width="600">
    <tr>
      <td width="592" colspan="5" bgcolor="#000080">
        <p align="center"><font color="#FFFFFF" size="2" face="Arial"><b>Produtos</b></font></p>
      </td>
    </tr>
    <tr>
      <td width="592" colspan="5" bgcolor="#FFFFFF">
        <p align="center">

<font color="#000000"><b><a href="editproduto.asp?id=0"><img border="0" src="../imagens/novo.gif" align="absmiddle"></a>
</b></font><a href="editproduto.asp?id=0"><font color="#000000"><b><u>Novo Produto</u></b></font></a></p>
      </td>
    </tr>
    <tr>
      <td width="65" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Código</font></b></td>
      <td width="253" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Descrição</font></b></td>
      <td width="75" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Preço</font></b></td>
      <td width="128" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Classe</font></b></td>
      <td width="55" bgcolor="#C0C0C0">
        <p align="center"><b><font size="2" face="Arial">Excluir</font></b></p>
      </td>
    </tr>
<%     
  For i = 1 to lista.Count()
    Set produto = lista.GetAt(i)
%>
    <tr>
      <td width="65" bgcolor="#D8D8D8">
        
        <a href="editproduto.asp?id=<%=produto.id%>">
          <font color="#000000">
          <%=produto.codproduto%>
          </font>
        </a>
        
      </td>
      <td width="253" bgcolor="#D8D8D8">
        
        <a href="editproduto.asp?id=<%=produto.id%>">
          <font color="#000000">
          <%=produto.descricao%>
          </font>
        </a>
        
      </td>
      <td width="75" bgcolor="#D8D8D8">
        
        <a href="editproduto.asp?id=<%=produto.id%>">
          <font color="#000000">
          <%=FormatNumber(produto.preco,2)%>
          </font>
        </a>
        
      </td>
      <td width="128" bgcolor="#D8D8D8">
        
        <a href="editproduto.asp?id=<%=produto.id%>">
          <font color="#000000">
          <%=produto.classe.descricao%>
          </font>
        </a>
        
      </td>
      <td width="55" bgcolor="#D8D8D8">
        <p align="center"><a href="javascript:confirmaApagar(<%=produto.id%>,'<%=produto.descricao%>');"><font color="#000000"><img border="0" src="../imagens/lixo.gif" alt="Excluir Produto"></font></a></p>
      </td>
    </tr>
<%
Next
%>  
    <tr>
      <td width="592" colspan="5" bgcolor="#FFFFFF">
        <p align="center">&nbsp;<font color="#000000"><b><a href="editproduto.asp?id=0"><img border="0" src="../imagens/novo.gif" align="absmiddle"></a>
</b></font><a href="editproduto.asp?id=0"><font color="#000000"><b><u>Novo Produto</u></b></font></a></p>
      </td>
    </tr>
  </table>
  </center>
</div>
<p align="center">
<font face="Arial" size="2"><u>
<a href="#home"><img border="0" src="../imagens/topo.gif" align="absmiddle">Voltar ao Topo</a>
 </u></font>
<p align="center">
&nbsp;
<!-- #include file="../footer.asp" -->
