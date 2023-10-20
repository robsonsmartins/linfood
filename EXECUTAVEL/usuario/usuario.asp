<%
Dim login
login = session("login")
If login <> "GERENTE" Then
  Response.Redirect("../loginerrado.asp")
End If
Dim factory
Set factory = session("conexao")
Dim usuarios 
Set usuarios = factory.New("LinFOOD.Usuario")
Set session("usuarios") = usuarios
Dim lista
Set lista = usuarios.Listar() 
Dim usuarioc
%>

<script language = "JavaScript">
function confirmaApagar(id, nome)
{
  if (window.confirm("Confirma a exclusão do Usuario: " + nome + " ?"))
  {
    document.location.href="deleteusuario.asp?id=" + id;
  }
}
</script>

<!-- #include file="header_usuario.asp" -->

<a name="home"></a>

<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" width="400">
    <tr>
      <td width="396" colspan="3" bgcolor="#000080">
        <p align="center"><font color="#FFFFFF" size="2" face="Arial"><b>&nbsp;Usuários</b></font></p>
      </td>
    </tr>
    <tr>
      <td width="396" colspan="3" bgcolor="#FFFFFF"><p align="center">

<font color="#000000"><b><a href="editusuario.asp?id=0"><img border="0" src="../imagens/novo.gif" align="absmiddle"></a>
</b></font><a href="editusuario.asp?id=0"><font color="#000000"><b><u>Novo
        Usuário</u></b></font></a></p>
      </td>
    </tr>
    <tr>
      <td width="233" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Nome</font></b></td>
      <td width="108" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Tipo de acesso</font></b></td>
      <td width="51" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Excluir</font></b></td>
    </tr>
<%     
  For i = 1 to lista.Count()
    Set usuarioc = lista.GetAt(i)
%>
    <tr>
      <td width="233" bgcolor="#DADADA">
        
        <a href="editusuario.asp?id=<%=usuarioc.id%>">
          <font color="#000000">
          <%=usuarioc.Nome%>
          </font>
        </a>
        
      </td>
      <td width="108" bgcolor="#DADADA">
        
        <a href="editusuario.asp?id=<%=usuarioc.id%>">
          <font color="#000000">
          <%=usuarioc.TipoAcesso%>
          </font>
        </a>
        
      </td>
      <td width="51" bgcolor="#DADADA">
        <p align="center"><a href="javascript:confirmaApagar(<%=usuarioc.id%>,'<%=usuarioc.nome%>');"><font color="#000000"><img border="0" src="../imagens/lixo.gif" alt="Excluir Usuário"></font></a></p>
      </td>
    </tr>
<%
Next
%>  
    <tr>
      <td width="396" colspan="3" bgcolor="#FFFFFF">
        <p align="center">&nbsp;<font color="#000000"><b><a href="editusuario.asp?id=0"><img border="0" src="../imagens/novo.gif" align="absmiddle"></a>
</b></font><a href="editusuario.asp?id=0"><font color="#000000"><b><u>Novo
        Usuário</u></b></font></a></p>
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

