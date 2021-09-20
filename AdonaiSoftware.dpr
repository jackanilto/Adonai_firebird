program AdonaiSoftware;

uses
  Vcl.Forms,
  ULogin in 'ULogin.pas' {FrmLogin},
  UDM in 'Database\UDM.pas' {DM: TDataModule},
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UCadMembro in 'Cadastros\UCadMembro.pas' {FrmCadMembro},
  UProfissoes in 'Cadastros\UProfissoes.pas' {FrmCadProfissoes},
  UGrupos in 'Cadastros\UGrupos.pas' {FrmGRUPOS},
  UTratamentos in 'Cadastros\UTratamentos.pas' {FrmTRATAMENTOS},
  UEntraSaida in 'Movimentacoes\UEntraSaida.pas' {FormEntraSaida},
  USobre in 'USobre.pas' {FrmSobre},
  USplash in 'USplash.pas' {FrmSplash},
  VFrames in 'Win32\WebcamFiles\VFrames.pas',
  VSample in 'Win32\WebcamFiles\VSample.pas',
  Direct3D9 in 'Win32\WebcamFiles\DirectX\Direct3D9.pas',
  DirectDraw in 'Win32\WebcamFiles\DirectX\DirectDraw.pas',
  DirectShow9 in 'Win32\WebcamFiles\DirectX\DirectShow9.pas',
  DirectSound in 'Win32\WebcamFiles\DirectX\DirectSound.pas',
  DXTypes in 'Win32\WebcamFiles\DirectX\DXTypes.pas',
  uWebCam in 'Cadastros\uWebCam.pas' {frmWebCam},
  UCarteirinhas in 'Relatorios\UCarteirinhas.pas' {FrmCarteirinha},
  UDizimos in 'Movimentacoes\UDizimos.pas' {FrmDIZIMOOFERTA},
  UBuscarMembro in 'Movimentacoes\UBuscarMembro.pas' {FrmBUSCARMEMBRO},
  UAniversariantes in 'Movimentacoes\UAniversariantes.pas' {FrmAniversariantes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmCadMembro, FrmCadMembro);
  Application.CreateForm(TFrmCadProfissoes, FrmCadProfissoes);
  Application.CreateForm(TFrmGRUPOS, FrmGRUPOS);
  Application.CreateForm(TFrmTRATAMENTOS, FrmTRATAMENTOS);
  Application.CreateForm(TFormEntraSaida, FormEntraSaida);
  Application.CreateForm(TFrmSobre, FrmSobre);
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(TFrmCarteirinha, FrmCarteirinha);
  Application.CreateForm(TFrmDIZIMOOFERTA, FrmDIZIMOOFERTA);
  Application.CreateForm(TFrmBUSCARMEMBRO, FrmBUSCARMEMBRO);
  Application.CreateForm(TFrmAniversariantes, FrmAniversariantes);
  //Application.CreateForm(TfrmWebCam, frmWebCam);
  Application.Run;
end.
