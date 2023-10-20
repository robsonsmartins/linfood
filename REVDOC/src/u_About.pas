unit u_about;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Buttons, jpeg;

type
  TForm_About = class(TForm)
    pnl_About: TPanel;
    lbl_Revdoc: TLabel;
    lbl_Versao: TLabel;
    lbl_CaptDes: TLabel;
    lbl_Desenvolvido: TLabel;
    lbl_Projeto: TLabel;
    btn_Fechar: TBitBtn;
    img_Logo: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_About: TForm_About;

implementation

{$R *.DFM}

end.
