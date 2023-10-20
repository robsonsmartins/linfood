<%
Dim usuario
Set usuario = session("usuario")
%>

<head>
<title>Sistema LinFOOD - Mesa <%=nomesa%></title>
<style type="text/css"><!--
table {font-size: 10.7px; color: black; font-family: Arial, Helvetica, sans-serif; text-decoration: none; }
soldig {font-size: 10.7px; color: black; font-family: Arial, Helvetica, sans-serif; text-decoration: none; }
body { color: black; font-size=12px; font-family: Arial; } 
  a:link { color: blue; } 
  a:hover {  color: blue;} 
  a:visited { color: blue;}
-->
</style>
</head>

<body topmargin="0" background="../imagens/backgrnd.gif">

<font face="Arial" size="2">
<div align="center">
  <center>
  <table border="0" cellspacing="0" width="100%" cellpadding="0">
    <tr>
      <td width="16%" bgcolor="#008000"><img border="0" src="../imagens/logo.gif" width="57" height="51"></td>
    </font>
      <td width="37%" bgcolor="#008000"><b><font face="Arial" size="5" color="#FFFFFF">Sistema LinFOOD</font></b></td>
      <td width="47%" bgcolor="#008000">
        <p align="center"><b><font face="Arial" size="3" color="#C0C0C0">Mesa <%=nomesa%></font></b></p>
    </td>
    </tr>
    <tr>
      <td width="100%" colspan="3">
        <div align="center">
          <table border="0" cellpadding="2" cellspacing="0" width="100%" bgcolor="#DADADA">
            <tr>
              <td width="2%">
                <p align="center"><a href="../logoff.asp"><img border="0" src="../imagens/logoff.gif" alt="Efetuar Logoff" width="25" height="25"></a></p>
              </td>
  </center>
              <td width="1%"><a href="mesa.asp"><img border="0" src="../imagens/voltar.gif" alt="Voltar ao Mapa de Mesas" width="25" height="25"></a></td>
                <td width="0%" align="center"><p align="center">
                <font face="Arial" size="2">
                <%
                If mesa.NoComanda <> 0 Then
                  Response.Write("Comanda: <b>" & mesa.NoComanda & "</b>")
                Else
                  Response.Write("&nbsp;")
                End If
                %>
                </font>
                </p></td>
                <td width="0%">
                <%
                If (mesa.Status = "A") And ((login = "GARCOM") Or (login = "GERENTE"))Then 
                %>
                  <a href="fechamesa.asp"><img border="0" src="../imagens/fechar.gif" alt="Fechar Conta" width="25" height="25"></a>
                <%
                Else  
                  Response.Write("&nbsp;")
                End If
                %>
                </td>
                <td width="0%">
                <% 
                If (mesa.Status = "F") And ((login = "OPERADOR") Or (login = "GERENTE"))Then 
                %>
                  <a href="recebemesa.asp"><img border="0" src="../imagens/receber.gif" width="25" height="25" alt="Receber Conta"></a>
                <%
                Else  
                  Response.Write("&nbsp;")
                End If
                %>
                </td>
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
