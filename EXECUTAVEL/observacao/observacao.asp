<%
Dim login
login = session("login")
If login <> "GERENTE" Then
  Response.Redirect("../loginerrado.asp")
End If
Dim factory
Set factory = session("conexao")
Dim observacoes 
Set observacoes = factory.New("LinFOOD.Observacao")
Set session("observacoes") = observacoes
Dim lista
Set lista = observacoes.Listar() 
Dim observacao
%>

<script language = "JavaScript">
function confirmaApagar(id, descricao)
{
  if (window.confirm("Confirma a exclusão da Observação: " + descricao + " ?"))
  {
    document.location.href="deleteobservacao.asp?id=" + id;
  }
}
</script>

<!-- #include file="header_observacao.asp" -->

<a name="home"></a>

<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" width="400">
    <tr>
      <td width="396" colspan="2" bgcolor="#000080">
        <p align="center"><font color="#FFFFFF" size="2" face="Arial"><b>&nbsp;Observações</b></font></p>
      </td>
    </tr>
    <tr>
      <td width="396" colspan="2" bgcolor="#FFFFFF">
        <p align="center">

<font color="#000000"><b><a href="editobservacao.asp?id=0"><img border="0" src="../imagens/novo.gif" align="absmiddle"></a>
</b></font><a href="editobservacao.asp?id=0"><font color="#000000"><b><u>Nova Observação</u></b></font></a></td>
    </tr>
    <tr>
      <td width="343" bgcolor="#C0C0C0">
        <p align="left"><b><font size="2" face="Arial">Descrição</font></b></p>
      </td>
      <td width="51" bgcolor="#C0C0C0">
        <p align="center"><b><font size="2" face="Arial">Excluir</font></b></p>
      </td>
    </tr>
<%     
  For i = 1 to lista.Count()
    Set observacao = lista.GetAt(i)
%>
    <tr>
      <td width="343" bgcolor="#D4D4D4">
        
        <a href="editobservacao.asp?id=<%=observacao.id%>">
          <font color="#000000">
          <%=observacao.descricao%>
          </font>
        </a>
        
      </td>
      <td width="51" bgcolor="#D4D4D4">
        <p align="center"><a href="javascript:confirmaApagar(<%=observacao.id%>,'<%=observacao.descricao%>');"><font color="#000000"><img border="0" src="../imagens/lixo.gif" alt="Excluir Observação"></font></a></p>
      </td>
    </tr>
<%
Next
%>  
    <tr>
      <td width="396" colspan="2" bgcolor="#FFFFFF">
        <p align="center">&nbsp;<font color="#000000"><b><a href="editobservacao.asp?id=0"><img border="0" src="../imagens/novo.gif" align="absmiddle"></a>
</b></font><a href="editobservacao.asp?id=0"><font color="#000000"><b><u>Nova Observação</u></b></font></a></p>
      </td>
    </tr>
  </table>
  </center>
</div>
<p align="center">
<font face="Arial" size="2"><u>
<a href="#home"><img border="0" src="../imagens/topo.gif" align="absmiddle">Voltar ao Topo</a>
 </u></font>
<!-- #include file="../footer.asp" -->
