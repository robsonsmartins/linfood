{-----------------------------------------------------------------------------
 Unit Name: u_Principal
 Author:    Robson Martins
 Purpose:   Tela principal do RevDoc
 History:   04/03/2003
-----------------------------------------------------------------------------}

unit u_Principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ToolWin, ExtCtrls, IniFiles, ShellApi, StdCtrls, Menus,
  AppEvnts;

type
  Tfrm_Principal = class(TForm)
    tv_DocList: TTreeView;
    imgl_DocList: TImageList;
    bar_Status: TStatusBar;
    Panel1: TPanel;
    Splitter1: TSplitter;
    pnl_DescrVersion: TPanel;
    lv_Files: TListView;
    pnl_DescrDoc: TPanel;
    Splitter2: TSplitter;
    lv_VersionList: TListView;
    imgl_VersionFilesList: TImageList;
    txt_Alteracoes: TMemo;
    lbl_Alteracoes: TLabel;
    pm_Opcoes: TPopupMenu;
    mi_Abrir: TMenuItem;
    mi_CopiarPara: TMenuItem;
    sd_CopiarPara: TSaveDialog;
    app_Events: TApplicationEvents;
    mnu_Principal: TMainMenu;
    Arquivo1: TMenuItem;
    mi_PrincipalAbrir: TMenuItem;
    mi_PrincipalCopiarPara: TMenuItem;
    mi_PrincipalSeparator: TMenuItem;
    mi_PrincipalSair: TMenuItem;
    mi_PrincipalSobre: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tv_DocListChange(Sender: TObject; Node: TTreeNode);
    procedure lv_VersionListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure mi_AbrirClick(Sender: TObject);
    procedure mi_CopiarParaClick(Sender: TObject);
    procedure app_EventsHint(Sender: TObject);
    procedure mi_PrincipalSairClick(Sender: TObject);
    procedure mi_PrincipalSobreClick(Sender: TObject);
  private
    { Private declarations }
    procedure MontaDOCList;
    procedure MontaVersionList(DOCDirectory: String);
    procedure MontaFileList(DOCDirectory, VersionDirectory: String);
    procedure LeDOCIni(DOCDirectory: String);
    procedure LeVersionIni(DOCDirectory, VersionDirectory: String);
    procedure ExecutaArquivo(DOCDirectory, VersionDirectory, FileName: String);
    procedure CopiaArquivo(DOCDirectory, VersionDirectory, FileName: String);
  public
    { Public declarations }
  end;

var
  frm_Principal: Tfrm_Principal;

implementation

uses u_about;

{$R *.DFM}

const
  {diretório do projeto RevDoc}
  CRevDocProjectDir = 'REVDOC3.0';
  {nome e versão do projeto RevDoc}
  CRevDocName = 'RevDoc 3.0';
  {nome do projeto gerenciado por essa compilação do RevDoc}
  CProjectName = 'LinFOOD';

{ TForm1 }

procedure Tfrm_Principal.FormCreate(Sender: TObject);
begin
  Caption := CRevDocName + ' - Projeto ' + CProjectName;
  MontaDOCList;
end;

procedure Tfrm_Principal.tv_DocListChange(Sender: TObject; Node: TTreeNode);
begin
  MontaVersionList(Node.Text);
  LeDOCIni(Node.Text);
end;

procedure Tfrm_Principal.lv_VersionListSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected and (tv_DocList.Selected <> nil) then
  begin
    MontaFileList(tv_DocList.Selected.Text,Item.Caption);
    LeVersionIni(tv_DocList.Selected.Text,Item.Caption);
  end
  else
  begin
    lv_Files.Items.Clear;
    txt_Alteracoes.Lines.Text := '';
    lbl_Alteracoes.Caption := 'Alterações:';
  end;
end;

procedure Tfrm_Principal.mi_AbrirClick(Sender: TObject);
begin
  if (tv_DocList.Selected <> nil) and (lv_VersionList.Selected <> nil) and
     (lv_Files.Selected <> nil) then
    ExecutaArquivo(tv_DocList.Selected.Text,lv_VersionList.Selected.Caption,
                   lv_Files.Selected.Caption);
end;

procedure Tfrm_Principal.mi_CopiarParaClick(Sender: TObject);
begin
  if (tv_DocList.Selected <> nil) and (lv_VersionList.Selected <> nil) and
     (lv_Files.Selected <> nil) then
    CopiaArquivo(tv_DocList.Selected.Text,lv_VersionList.Selected.Caption,
                   lv_Files.Selected.Caption);
end;

procedure Tfrm_Principal.app_EventsHint(Sender: TObject);
begin
  bar_Status.SimpleText := Application.Hint; 
end;

procedure Tfrm_Principal.MontaDOCList;
var VRoot: TTreeNode;
    VSearch: TSearchRec;
begin
  with tv_DocList do
  begin
    Items.Clear;
    VRoot := Items.Add(nil,CProjectName);
    with VRoot do
    begin
      ImageIndex := 0;
      SelectedIndex := 0;
      Selected := True;
    end;
    if FindFirst(ExtractFilePath(Application.ExeName) + '*.*',faDirectory,VSearch) = 0 then
    begin
      repeat
        with VSearch do
        begin
          if (Attr and faDirectory = faDirectory) and (Name[1] <> '.') and
             (UpperCase(Name) <> CRevDocProjectDir) then
          begin
            with Items.AddChild(VRoot,Name) do
            begin
              ImageIndex := 1;
              SelectedIndex := 2;
            end;
          end;
        end;
      until FindNext(VSearch) <> 0;
      FindClose(VSearch);
      FullExpand;
      SortType := stText;
    end;
  end;
end;

procedure Tfrm_Principal.MontaVersionList(DOCDirectory: String);
var VSearch: TSearchRec;
begin
  with lv_VersionList do
  begin
    Items.Clear;
    if FindFirst(ExtractFilePath(Application.ExeName) + DocDirectory + '\*.*',faDirectory,VSearch) = 0 then
    begin
      repeat
        with VSearch do
        begin
          if (Attr and faDirectory = faDirectory) and (Name[1] <> '.') then
          begin
            with Items.Add do
            begin
              ImageIndex := 0;
              Caption := VSearch.Name;
            end;
          end;
        end;
      until FindNext(VSearch) <> 0;
      FindClose(VSearch);
    end;
  end;
  lv_Files.Items.Clear;
  txt_Alteracoes.Lines.Text := '';
  lbl_Alteracoes.Caption := 'Alterações:';
end;

procedure Tfrm_Principal.MontaFileList(DOCDirectory, VersionDirectory: String);
var VSearch: TSearchRec;
begin
  with lv_Files do
  begin
    Items.Clear;
    if FindFirst(ExtractFilePath(Application.ExeName) +
       DocDirectory + '\' + VersionDirectory + '\*.*',faAnyFile,VSearch) = 0 then
    begin
      repeat
        with VSearch do
        begin
          if (Attr and faDirectory <> faDirectory) and (Name[1] <> '.') and
             (UpperCase(Name) <> 'REVDOC.INI') then
          begin
            with Items.Add do
            begin
              ImageIndex := 1;
              Caption := VSearch.Name;
            end;
          end;
        end;
      until FindNext(VSearch) <> 0;
      FindClose(VSearch);
    end;
  end;
end;

procedure Tfrm_Principal.LeVersionIni(DOCDirectory, VersionDirectory: String);
var VIni: TIniFile;
    VIniFileName: String;
    VIdents: TStrings;
    VIdx: Integer;
begin
  VIniFileName :=
    ExtractFilePath(Application.ExeName) + DOCDirectory + '\' + VersionDirectory + '\revdoc.ini';
  if FileExists(VIniFileName) then
  begin
    VIni := TIniFile.Create(VIniFileName);
    VIdents := TStringList.Create;
    VIni.ReadSection('REVISAO',VIdents);
    lbl_Alteracoes.Caption := 'Versão: ' + VersionDirectory + ' - Alterações:';
    txt_Alteracoes.Lines.Text := '';
    for VIdx := 0 to VIdents.Count - 1 do
      txt_Alteracoes.Lines.Text :=
      txt_Alteracoes.Lines.Text + VIni.ReadString('REVISAO',VIdents[VIdx],'') + #13#10;
    VIdents.Free;
    VIni.Free;
  end
  else
    txt_Alteracoes.Lines.Text := '';
end;

procedure Tfrm_Principal.LeDOCIni(DOCDirectory: String);
var VIni: TIniFile;
    VIniFileName: String;
begin
  VIniFileName := ExtractFilePath(Application.ExeName) + DOCDirectory + '\revdoc.ini';
  if FileExists(VIniFileName) then
  begin
    VIni := TIniFile.Create(VIniFileName);
    pnl_DescrDoc.Caption :=
      '  ' + DOCDirectory + ' - ' + VIni.ReadString('DOCUMENTO','NOME','Documento não identificado');
    VIni.Free;
  end
  else
    pnl_DescrDoc.Caption := '';
end;

procedure Tfrm_Principal.ExecutaArquivo(DOCDirectory, VersionDirectory, FileName: String);
var VArquivo: String;
begin
  VArquivo :=
    ExtractFilePath(Application.ExeName) + DOCDirectory + '\' + VersionDirectory + '\' + FileName;
  if FileExists(VArquivo) then
  begin
    Screen.Cursor := crHourGlass;
    ShellExecute(0,'open',PChar(VArquivo),'','',SW_SHOWNORMAL);
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Principal.CopiaArquivo(DOCDirectory, VersionDirectory,FileName: String);
var VArquivo: String;
begin
  VArquivo :=
    ExtractFilePath(Application.ExeName) + DOCDirectory + '\' +  VersionDirectory + '\' + FileName;
  sd_CopiarPara.FileName := ExtractFileName(VArquivo);
  if sd_CopiarPara.Execute then
  begin
    if FileExists(sd_CopiarPara.FileName) and
      (Application.MessageBox(PChar('O arquivo ' + sd_CopiarPara.FileName + ' já existe.' + #13#10 +
                             'Deseja sobrescrever ?'),'Arquivo já existe',
                             MB_YESNO + MB_ICONQUESTION + MB_SYSTEMMODAL + MB_DEFBUTTON2) = IDNO) then
      exit;
    CopyFile(PChar(VArquivo),PChar(sd_CopiarPara.FileName),False);
  end;
end;

procedure Tfrm_Principal.mi_PrincipalSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Principal.mi_PrincipalSobreClick(Sender: TObject);
begin
  Form_About := TForm_About.Create(Application);
  Form_About.ShowModal;
  Form_About.Free;
end;

end.
