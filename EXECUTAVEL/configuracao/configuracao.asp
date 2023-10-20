<%
Dim login
login = session("login")
If login <> "GERENTE" Then
  Response.Redirect("../loginerrado.asp")
End If
Dim factory
Set factory = session("conexao")
Dim configuracoes 
Set configuracoes = factory.New("LinFOOD.Configuracao")
Set session("configuracoes") = configuracoes
Dim configuracao
set configuracao = configuracoes.RetornarConfig()
%>

<script language="JavaScript">
function validaNumero(inteiro,texto) 
//inteiro = true -> número inteiro, false -> real
//texto = texto a ser validado
{
  strNumero = true;
  for (i = 0; i < texto.length; i++)
  {
    s = texto.substr(i,1); 
    naonumero = ((s != "0") && (s != "1") && (s != "2") && (s != "3") && 
                 (s != "4") && (s != "5") && (s != "6") && (s != "7") && 
                 (s != "8") && (s != "9"));
    naovirgula = (s != ",");
    if (naonumero && inteiro || naonumero && !inteiro && naovirgula)
    {
      strNumero = false;
      break;   
    }
  }
  return(strNumero);
}

function enviar()
{
  qtdmesas = document.formconfiguracao.qtdmesas.value;
  txservico = document.formconfiguracao.txservico.value;
   if (qtdmesas == "" || !validaNumero(true,qtdmesas))
  {
    window.alert("O campo Quantidade de Mesas deve ser preenchido com um número inteiro!");
    document.formconfiguracao.qtdmesas.focus();
    return;
  }
  else if (txservico == "" || !validaNumero(false,txservico))
    {
    window.alert("O campo Taxa de Serviço deve ser preenchido com um número real!");
    document.formconfiguracao.txservico.focus();
    return;
  }
    else
  {
    document.formconfiguracao.submit();
  }
}
</script>

<!-- #include file="header_configuracao.asp" -->

<p>&nbsp</p>
<p>&nbsp</p>

<form method="GET" action="operacaoconfiguracao.asp" name="formconfiguracao">
  <div align="center">
    <center>
  <table border="0" width="300" cellspacing="0" cellpadding="4">
    <tr>
      <td width="284" align="left" colspan="2" bgcolor="#000080">
        <p align="center"><font color="#FFFFFF" size="2" face="Arial"><b>Configuração
        do Sistema</b></font></td>
    </tr>
    <tr>
      <td width="163" align="left" bgcolor="#C0C0C0">
        <p align="left"><b><font size="2" face="Arial">Quantidade de Mesas</font></b></p>
      </td>
      <td width="121" align="left" bgcolor="#C0C0C0"><input type="text" name="qtdmesas" size="7" value = "<%=configuracao.qtdmesas%>"></td>
    </tr>
    <tr>
      <td width="163" align="left" bgcolor="#C0C0C0"><font size="2" face="Arial"><b>Taxa de Serviço (%)</b></font></td>
      <td width="121" align="left" bgcolor="#C0C0C0"><input type="text" name="txservico" size="7"value = "<%=configuracao.txservico*100%>"></td>
    </tr>
    <tr>
      <td width="290" colspan="2" align="left" bgcolor="#C0C0C0">
        <p align="center"><input type="button" value="  Salvar  " name="Btnsalvar" onClick = "javascript:enviar()">&nbsp;&nbsp;
        <input type="button" value="Cancelar" name="btnCancelar" onClick="javascript:document.location.href('../admmenu.asp')"></td>
    </tr>
  </table>
    </center>
  </div>
</form>
<script language="JavaScript">document.formconfiguracao.qtdmesas.focus();</script>

<p>&nbsp</p>
<p>&nbsp</p>

<!-- #include file="../footer.asp" -->

