<%
Dim usuario
Set usuario = session("usuario")
%>

<head>
<title>Sistema LinFOOD - Módulo Administrativo</title>
<style type="text/css"><!--
table {font-size: 10.7px; color: black; font-family: Arial, Helvetica, sans-serif; text-decoration: none; }
soldig {font-size: 10.7px; color: black; font-family: Arial, Helvetica, sans-serif; text-decoration: none; }
body { color: black; font-size=12px; font-family: Arial; } 
  a:link { color: blue; text-decoration: none; } 
  a:hover {  color: blue; text-decoration: none;} 
  a:visited { color: blue;  text-decoration: none;}
-->
</style>
</head>

<body topmargin="0" background="imagens/backgrnd.gif">

<font face="Arial" size="2">
<div align="center">
  <center>
  <table border="0" cellspacing="0" width="100%" cellpadding="0">
    <tr>
      <td width="16%" bgcolor="#008000"><img border="0" src="imagens/logo.gif" width="57" height="51"></td>
    </font>
      <td width="37%" bgcolor="#008000"><b><font face="Arial" size="5" color="#FFFFFF">Sistema LinFOOD</font></b></td>
      <td width="47%" bgcolor="#008000">
        <p align="center"><b><font face="Arial" size="3" color="#C0C0C0">Módulo Administrativo</font></b></p>
    </td>
    </tr>
    <tr>
      <td width="100%" colspan="3">
        <div align="center">
          <table border="0" cellpadding="2" cellspacing="0" width="100%" bgcolor="#DADADA">
            <tr>
              <td width="2%">
                <p align="center"><a href="admlogoff.asp"><img border="0" src="imagens/logoff.gif" alt="Efetuar Logoff" width="25" height="25"></a></p>
              </td>
  </center>
              <td width="1%"><a href="usuario/usuario.asp"><img border="0" src="imagens/usuario.gif" alt="Cadastro de Usuários" width="25" height="25"></a></td>
              <td width="1%"><a href="classe/classe.asp"><img border="0" src="imagens/classe.gif" alt="Cadastro de Categorias de Produtos" width="25" height="25"></a></td>
              <td width="0%"><a href="produto/produto.asp"><img border="0" src="imagens/produto.gif" alt="Cadastro de Produtos" width="25" height="25"></a></td>
              <td width="0%"><a href="observacao/observacao.asp"><img border="0" src="imagens/observacao.gif" alt="Cadastro de Observações" width="25" height="25"></a></td>
              <td width="0%"><a href="configuracao/configuracao.asp"><img border="0" src="imagens/configuracao.gif" alt="Configuração do Sistema" width="25" height="25"></a></td>
              <td width="0%"><a href="relatorio/relvendasform.asp"><img border="0" src="imagens/relatorio.gif" alt="Relatório de Vendas por Período" width="25" height="25"></a></td>
              <td width="0%"><a href="relatorio/relprodutosform.asp"><img border="0" src="imagens/relatorio.gif" alt="Relatório de Produtos Mais Vendidos por Período" width="25" height="25"></a></td>
              <td width="96%">
                <p align="right">&nbsp;<font color="#000000"><b>Usuário: </b> </font> <%=usuario.Nome%></p>
            </td>
            </tr>
          </table>
        </div>

</td>
    </tr>
  </table>
  </div>
  <p>
