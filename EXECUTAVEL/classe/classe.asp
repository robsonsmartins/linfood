<%
Dim login
login = session("login")
If login <> "GERENTE" Then
  Response.Redirect("../loginerrado.asp")
End If
Dim factory
Set factory = session("conexao")
Dim classes 
Set classes = factory.New("LinFOOD.Classe")
Set session("classes") = classes
Dim lista
Set lista = classes.Listar() 
Dim classe
%>

<script language = "JavaScript">
function confirmaApagar(id, descricao)
{
  if (window.confirm("Confirma a exclusão da Categoria de Produto: " + descricao + " ?"))
  {
    document.location.href="deleteclasse.asp?id=" + id;
  }
}
</script>

<a name="home"></a>
<!-- #include file="header_classe.asp" -->

<p>
<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" width="400">
    <tr>
      <td width="492" colspan="2" bgcolor="#000080" bordercolor="#000080" bordercolorlight="#000080" bordercolordark="#000080">
        <p align="center"><b><font color="#FFFFFF" size="2">Categorias de
        Produtos</font></b></td>
    </tr>
    <tr>
      <td width="492" colspan="2" bgcolor="#FFFFFF">
        <p align="center">

<font color="#000000"><b><a href="editclasse.asp?id=0"><img border="0" src="../imagens/novo.gif" align="absmiddle"></a>
</b></font><a href="editclasse.asp?id=0"><font color="#000000"><b><u>Nova
Categoria de Produto</u></b></font></a></td>
    </tr>
  </center>
    <tr>
      <td width="436" bgcolor="#A4A4A4">
        <p align="left"><b><font face="Arial" size="2">Descrição</font></b></p>
      </td>
  <center>
      <td width="52" bgcolor="#A4A4A4">
        <p align="center"><b><font face="Arial" size="2">Excluir</font></b></p>
  </td>
    </tr>
<%     
  For i = 1 to lista.Count()
    Set classe = lista.GetAt(i)
%>
    <tr>
      <td width="436" bgcolor="#C0C0C0">
        
        <a href="editclasse.asp?id=<%=classe.id%>">
          <font color="#000000"><u>
          <%=classe.descricao%>
          </u></font>
        </a>
        
      </td>
      <td width="52" bgcolor="#C0C0C0">
        <p align="center"><a href="javascript:confirmaApagar(<%=classe.id%>,'<%=classe.descricao%>');"><font color="#000000"><u><img border="0" src="../imagens/lixo.gif" alt="Excluir Categoria de Produto"></u></font></a></p>
      </td>
    </tr>
<%
Next
%>  
    <tr>
      <td width="492" colspan="2" bgcolor="#FFFFFF">
        <p align="center">
         <font color="#000000"><b><a href="editclasse.asp?id=0"><img border="0" src="../imagens/novo.gif" align="absmiddle"></a>
         </b></font><a href="editclasse.asp?id=0"><font color="#000000"><b><u>Nova
         Categoria de Produto</u></b></font></a></td>
    </tr>
  </table>
  </center>
</div>
<p align="center">
<font face="Arial" size="2"><u>
<a href="#home"><img border="0" src="../imagens/topo.gif" align="absmiddle">Voltar ao Topo</a>
 </u></font>
<!-- #include file="../footer.asp" -->
