unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TFrmLogin = class(TForm)
    ImageLogoLogin: TImage;
    GrpBxLogin: TGroupBox;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    BtnLogin: TButton;
    BtnSair: TButton;
    EdtUser: TEdit;
    EdtSenha: TEdit;
    AdonaiSoftware: TLabel;
    LabelVersao: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtUserKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;
    function VersaoExe: String;

implementation

{$R *.dfm}

uses UDM, UPrincipal;

 //inicio do login
procedure TFrmLogin.BtnLoginClick(Sender: TObject);
//Verifica o dados na tabela Acesso
begin
 DM.TblAcesso.Open();
    if (DM.TblAcesso.Locate('USUARIO', EdtUser.Text, [])) and (DM.TblAcesso.Locate('SENHA',EdtSenha.Text,[])) then
    Begin
      FrmPrincipal.Show;
      FrmLogin.Hide;
    End
// Verifica se foram preencidos os campos Login e Senha e exibe o alerta
   else
   if (EdtUser.Text ='') and (EdtSenha.Text = '')then
   ShowMessage ('Preencha os campos Login e Senha') // Caso esteja vazio

   else
   MessageDlg('Login ou senha inválidos', mtError, [mbOk], 0); // Caso de digitação errada
end;
  //Fim do codigo login
procedure TFrmLogin.BtnSairClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFrmLogin.Button2Click(Sender: TObject);
begin
   ShowMessage(VersaoExe);
end;

function VersaoExe: String;
type
   PFFI = ^vs_FixedFileInfo;
var
   F       : PFFI;
   Handle  : Dword;
   Len     : Longint;
   Data    : Pchar;
   Buffer  : Pointer;
   Tamanho : Dword;
   Parquivo: Pchar;
   Arquivo : String;
begin
   Arquivo  := Application.ExeName;
   Parquivo := StrAlloc(Length(Arquivo) + 1);
   StrPcopy(Parquivo, Arquivo);
   Len := GetFileVersionInfoSize(Parquivo, Handle);
   Result := '';
   if Len > 0 then
   begin
      Data:=StrAlloc(Len+1);
      if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
      begin
         VerQueryValue(Data, '',Buffer,Tamanho);
         F := PFFI(Buffer);
         Result := Format('%d.%d.%d.%d',
                          [HiWord(F^.dwFileVersionMs),
                           LoWord(F^.dwFileVersionMs),
                           HiWord(F^.dwFileVersionLs),
                           Loword(F^.dwFileVersionLs)]
                         );
      end;
      StrDispose(Data);
   end;
   StrDispose(Parquivo);
end;


procedure TFrmLogin.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then            // Define o comando enter
    BtnLoginClick(Sender);     // Atribui a função do boatao entrar ao enter
end;

procedure TFrmLogin.EdtUserKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// define tab on press enter para navegar entre dbedit´s (Login)
if key = vk_return then SelectNext(ActiveControl,True,True);
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
// Mostrar a versao do software na tela de login
 LabelVersao.Caption:= VersaoExe;
end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// define tab on press enter para navegar entre dbedit´s  (Senha)
if key = vk_return then SelectNext(ActiveControl,True,True);
end;


//Procedure para pegar a versao do programa

end.
