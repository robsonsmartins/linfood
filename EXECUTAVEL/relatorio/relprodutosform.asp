<%
Dim login
login = session("login")
If login <> "GERENTE" Then
  Response.Redirect("../loginerrado.asp")
End If
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

function validaData(texto) 
{
  if ((texto.length != 10) ||   
     (!validaNumero(true,texto.substr(0,2))) || (!validaNumero(true,texto.substr(3,2))) ||
     (!validaNumero(true,texto.substr(6,4))) || (texto.substr(2,1) != "/") || (texto.substr(5,1) != "/"))
  {
    return(false);
  }
  dia = parseInt(texto.substr(0,2),10);
  mes = parseInt(texto.substr(3,2),10);
  ano = parseInt(texto.substr(6,4),10);
  if ((mes > 12) || (mes < 1) || (dia < 1) || ((mes == 1) && (dia > 31)) || ((mes == 3) && (dia > 31)) ||
     ((mes == 4) && (dia > 30)) || ((mes == 5) && (dia > 31)) || ((mes == 6) && (dia > 30)) || ((mes == 7) && (dia > 31)) ||
     ((mes == 8) && (dia > 31)) || ((mes == 9) && (dia > 30)) || ((mes == 10) && (dia > 31)) || ((mes == 11) && (dia > 30)) ||
     ((mes == 12) && (dia > 31)) || ((mes == 2) && (dia > 29) && ((ano % 4) == 0)) || ((mes == 2) && (dia > 28) && ((ano % 4) != 0)))
  {
    return(false);
  }
  return(true);
}


function enviar()
{
  inicio = document.formrel.inicio.value;
  fim = document.formrel.fim.value;
  if (inicio == "" || !validaData(inicio))
  {
    window.alert("O campo Início deve ser preenchido com uma data válida no formato dd/mm/aaaa!");
    document.formrel.inicio.focus();
    return;
  }
  else if (fim == "" || !validaData(fim))
  {
    window.alert("O campo Fim deve ser preenchido com uma data válida no formato dd/mm/aaaa!");
    document.formrel.fim.focus();
    return;
  }
  else
  {
    document.formrel.submit();
  }
}
</script>

<!-- #include file="header_relprodutosform.asp" -->

<p>&nbsp;</p>
<p>&nbsp;</p>
<form method="GET" action="relprodutos.asp" name="formrel">
  <div align="center">
    <center>
    <table border="0" cellspacing="0" width="500" cellpadding="5">
      <tr>
        <td width="100%" colspan="2" bgcolor="#000080">
          <p align="center"><font color="#FFFFFF" size="2" face="Arial"><b>Produtos
          Mais Vendidos por Período</b></font></td>
      </tr>
      <tr>
        <td width="50%" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Início: <input type="text" name="inicio" size="14">
          </font><font face="Arial" size="1">(dd/mm/aaaa)</font></b></td>
        <td width="50%" bgcolor="#C0C0C0"><b><font size="2" face="Arial">Fim: <input type="text" name="fim" size="15"> 
          </font><font face="Arial" size="1">(dd/mm/aaaa)</font></b></td>
      </tr>
      <tr>
        <td width="100%" colspan="2" bgcolor="#C0C0C0">
          <p align="center"><input type="button" value="Emitir Relatório" name="btnEnviar" onclick="javascript:enviar();"></td>
      </tr>
    </table>
    </center>
  </div>
</form>
<script language="JavaScript">document.formrel.inicio.focus();</script>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<!-- #include file="../footer.asp" -->


