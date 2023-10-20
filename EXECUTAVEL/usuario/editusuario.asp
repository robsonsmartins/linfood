<%
Dim login
Dim usuarios
login = session("login")
Set usuarios = session("usuarios")
If (login <> "GERENTE") Or (usuarios Is Nothing) Then
  Response.Redirect("../loginerrado.asp")
End If
'Dim factory
'Set factory = session("conexao")
'Set usuarios = factory.New("LinFOOD.Usuario")
'Dim lista
'Set lista = usuarios.Listar()
Dim usuarioc
Dim usuarioid
usuarioid = CInt(Request.QueryString("id"))
Dim usuarionome
Dim usuariosenha
Dim usuariotipoacesso
If usuarioid > 0 Then
  Set usuarioc = usuarios.Consultar(usuarioid)
  usuariosenha = usuarioc.Senha
  usuarionome = usuarioc.Nome
  usuariotipoacesso = usuarioc.tipoacesso
Else
  usuarionome= ""
  usuariosenha = ""
End If
%>

<script language="JavaScript">
function enviar()
{
  senha = document.formusuario.senha.value;
  nome = document.formusuario.nome.value;
  tipoacesso = document.formusuario.tipodeacesso.value;
  if (senha == "")
  {
    window.alert("O campo Senha não pode estar em branco!");
    document.formusuario.senha.focus();
    return;
  }
  else if (nome == "" )
  {
    window.alert("O campo Nome não pode estar em branco!");
    document.formusuario.nome.focus();
    return;
  }
  else if (tipoacesso == "0")
  {
    window.alert("Deve-se escolher o Tipo de Acesso!");
    document.formusuario.tipodeacesso.focus();
    return;
  }
  else
  {
    document.formusuario.submit();
  }
}

</script>

<!-- #include file="header_editusuario.asp" -->

<p>&nbsp;</p>

<form method="GET" action="operacaousuario.asp" name="formusuario">
<div align="center">
  <center>
  <table border="0" cellpadding="4" cellspacing="0" width="350">
    <tr>
      <td width="337" colspan="2" bgcolor="#000080">
        <p align="center"><font color="#FFFFFF" size="2" face="Arial"><b>Usuário</b></font></p>
      </td>
    </tr>
    <tr>
      <td width="112" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Nome</font></b></td>
      <td width="225" bgcolor="#C0C0C0">
        <input type="text" name="nome" size="26" value="<%=usuarionome%>">
        <input type="hidden" name="id" size="20" value="<%=usuarioid%>">
      </td>
    </tr>
    <tr>
      <td width="112" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Senha</font></b></td>
      <td width="225" bgcolor="#C0C0C0">
        <input type="password" name="senha" size="26" value="<%=usuariosenha%>">
      </td>
    </tr>
    <tr>
      <td width="112" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Tipo de Acesso</font></b></td>
      <td width="225" bgcolor="#C0C0C0">
        <select size="1" name="tipodeacesso">
          <option
          value="0" <% 
                  If usuarioid = 0 Then 
                    Response.write("selected") 
                  End If 
                %>>Escolha o tipo de acesso</option>
          <option value="GERENTE"<% 
                  If usuariotipoacesso = "GERENTE" Then 
                    Response.write("selected") 
                  End If 
                %>>GERENTE</option>
          <option value="GARCOM" <% 
                  If usuariotipoacesso = "GARCOM" Then 
                    Response.write("selected") 
                  End If 
                %>>GARÇOM</option>
          <option value="OPERADOR"<% 
                  If usuariotipoacesso = "OPERADOR" Then 
                    Response.write("selected") 
                  End If 
                %>>OPERADOR DE CAIXA</option>
        </select>
      </td>
    </tr>
  </center>
    <tr>
      <td width="337" colspan="2" bgcolor="#C0C0C0">
        <p align="center"><input type="button" value="  Salvar  " name="btnSalvar" onclick="javascript:enviar()">&nbsp;
        <input type="button" value="Cancelar" name="btnCancelar" onClick="javascript:document.location.href('usuario.asp')"></p>
      </td>
    </tr>
  </table>
</div>
&nbsp;
</form>
<script language="JavaScript">document.formusuario.nome.focus();</script>
<p>&nbsp;</p>

<p>&nbsp;</p>


<!-- #include file="../footer.asp" -->

