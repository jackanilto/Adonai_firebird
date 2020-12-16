{**
*  TEvAppProtect
*
*  Copyright Sebastião Elivaldo Ribeiro
*  http://www.elivaldo.com.br
*  e-mail: falecom@elivaldo.com.br
*}

unit EAppProt;

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Registry, NB30, IniFiles;

type
  TEvSaveType = (stRegistry, stFile);

  TEvProtectType = (ptHardDisk, ptNetcard);
  TEvProtectTypes = set of TEvProtectType;

  TEvRootKeys = (HKeyClassesRoot, HKeyCurrentUser, HKeyLocalMachine,
    HKeyUsers, HKeyPerformanceData, HKeyCurrentConfig, HKeyDynData);

  { TEvAppProtect }
  TEvAppProtect = class(TComponent)
  private
    FActive: Boolean;
    FEvalDays: Word;
    FEvalLoads: Word;
    FFileName: string;
    FIdApplication: Longint;
    FRegKey: string;
    FRootKey: TEvRootKeys;
    FSaveType: TEvSaveType; 
    FOnLoadError: TNotifyEvent;
    FOnNeedCodLib: TNotifyEvent;
    // outras variáveis
    FAppName: TFileName;
    FCurrentLoad: Word;
    FDateStart: TDate;
    FDateEnd: TDate;
    FDecodeInfo: Boolean;
    FMaxLoad: Word;
    FOwner: TComponent;
    FSetup: Word;
    FProtectType: TEvProtectTypes;
    procedure SetActive(Value: Boolean);
    procedure SetRegKey(Value: string);
    procedure SetProtectTypes(const Value: TEvProtectTypes);
    procedure CheckLockInfo;
    procedure DecodeLockInfo(S: string);
    procedure InitializeRegistry;
    procedure IncrementCounter;
    procedure ValidateLockInfo(S: string);
    procedure WriteRegistry(S: string);
    function Criptografe(S, K: string): string;
    function EncodeLockInfo: string;
    function GetSystemDrive: string;
    function GetIdentNumber: string;
    function GetKey(S: string): string;
    function GetMACAdress: string;
    function IsLockApplication: Boolean;
    function IsHexa(S: string): Boolean;
    function ReadRegistry: string;
    function StrShuffle(A, B: string; Size: Integer): string;
    function Uncriptografe(S, K: string): string;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ResetLockApplication;
    procedure SetNewCodLib(CodLib: string);
    procedure SetNewParamsLib(dStart, dEnd: TDate; wMaxLoad: Word);
    procedure LoadLibParams;
    function GetSerialNumber: string;
    function GetHDNumber: string;
    property DateStart: TDate read FDateStart;
    property DateEnd:  TDate read FDateEnd;
    property MaxLoad: Word read FMaxLoad;
    property CurrentLoad: Word read FCurrentLoad;
  published
    property Active: Boolean read FActive write SetActive default True;
    property EvalDays: Word read FEvalDays write FEvalDays default 0;
    property EvalLoads: Word read FEvalLoads write FEvalLoads default 0;
    property FileName: string read FFileName write FFileName;
    property IdApplication: Longint read FIdApplication write FIdApplication default 0;
    property ProtectType: TEvProtectTypes read FProtectType write SetProtectTypes default [ptHardDisk];
    property RegKey: string read FRegKey write SetRegKey;
    property RootKey: TEvRootKeys read FRootKey write FRootKey default HKeyCurrentUser;
    property SaveType: TEvSaveType read FSaveType write FSaveType default stRegistry;
    property OnLoadError: TNotifyEvent read FOnLoadError write FOnLoadError;
    property OnNeedCodLib: TNotifyEvent read FOnNeedCodLib write FOnNeedCodLib;
  end;

  
  { TFrmAppCodLib }
  TFrmAppCodLib = class(TForm)
    PanFundo: TPanel;
    LabInfo: TLabel;
    LabNumSerie: TLabel;
    LabCodLiberacao: TLabel;
    BevSup: TBevel;
    BevInf: TBevel;
    ImgChaves: TImage;
    Label1: TLabel;
    EdtNumSerie: TEdit;
    EdtCodLiberacao: TEdit;
    BtnOK: TButton;
    BtnCancelar: TButton;
  private
  public
  end;

var
  FrmAppCodLib: TFrmAppCodLib;

procedure Register;

implementation

{$R *.DFM}

uses UPrincipal;
{$J+}

resourcestring
  SCodErro      = 'O código de liberação informando não é válido ou foi digitado incorretamente.';

const
  FORM_INDENT     = 14;
  REGKEY_LENGTH   = 24;
  CODLIB_LENGTH   = 18;
  REGKEY_PATH     = '\SOFTWARE\TCF Software\AppProtect\';


// Create
constructor TEvAppProtect.Create(AOwner: TComponent);
const
  bShareware: AnsiString = ':tcf:';
begin
  inherited Create(AOwner);
  FActive := True;
  FAppName := Application.Title;
  FIdApplication := 0;
  FProtectType := [ptHardDisk];
  FRegKey := REGKEY_PATH;
  FRootKey := HKeyCurrentUser;
  FSaveType := stRegistry;
  FOwner := AOwner;
  FEvalDays := 0;
  FEvalLoads := 0;
  Randomize;

  // mensagem shareware
  if (Trim(string(bShareware)) = '') and not (csDesigning in ComponentState) then
    begin
      MessageBeep(MB_ICONASTERISK);
      MessageDlg('O componente ' + ClassName + ' é shareware, e para ' +
        'utiliza-lo livremente você deve adquiri-lo.' + #13#13 +
        'www.elivaldo.com.br' + #13 +
        'falecom@elivaldo.com.br', mtInformation, [mbOk], 0);
      bShareware := '';
    end;
end;


// SetActive
procedure TEvAppProtect.SetActive(Value: Boolean);
begin
  if FActive <> Value then
    begin
      FActive := Value;
      if not (csDesigning in ComponentState) and
        not (csLoading in ComponentState) and FActive then
        CheckLockInfo;
    end;
end;


// SetRegKey
procedure TEvAppProtect.SetRegKey(Value: string);
begin
  if Value = '' then
    Value := REGKEY_PATH;
  if Copy(Value, Length(Value), 1) <> '\' then
    Value := Value + '\';
  FRegKey := Value;
end;


// SetProtectTypes
procedure TEvAppProtect.SetProtectTypes(const Value: TEvProtectTypes);
begin
  if Value = [] then
    FProtectType := [ptHardDisk]
  else
    FProtectType := Value;
end;


// Loaded
procedure TEvAppProtect.Loaded;
begin
  inherited Loaded;
  if not (csDesigning in ComponentState) and FActive then
    begin
      if (FFileName = '') and (FSaveType = stFile) then
        FFileName := ChangeFileExt(Application.ExeName, '.lck');
      CheckLockInfo;
    end;
end;


// ReadRegistry
function TEvAppProtect.ReadRegistry: string;
var
  Reg: TRegistry;
  Ini: TIniFile;
begin
  Result := '';
  if FSaveType = stRegistry then
    begin
      Reg := TRegistry.Create;
      try
        Reg.RootKey := DWORD($80000000) + DWORD(FRootKey);
        if Reg.OpenKey(FRegKey + FAppName, False) then
          Result := Reg.ReadString('LockInfo');
      finally
        Reg.CloseKey;
        Reg.Free;
      end;
    end
  else
    begin
      Ini := TIniFile.Create(FFileName);
      try
        Result := Ini.ReadString('TEvAppProtect', 'LockInfo', '');
      finally
        Ini.Free;
      end;
    end;
end;


// WriteRegistry
procedure TEvAppProtect.WriteRegistry(S: string);
var
  Reg: TRegistry;
  Ini: TIniFile;
begin
  if FSaveType = stRegistry then
    begin
      Reg := TRegistry.Create;
      try
        Reg.RootKey := DWORD($80000000) + DWORD(FRootKey);
        if Reg.OpenKey(FRegKey + FAppName, True) then
          Reg.WriteString('LockInfo', S);
      finally
        Reg.CloseKey;
        Reg.Free;
      end;
    end
  else
    begin
      Ini := TIniFile.Create(FFileName);
      try
        Ini.WriteString('TEvAppProtect', 'LockInfo', S);
      finally
        Ini.Free;
      end;
      SetFileAttributes(PChar(FFileName), FILE_ATTRIBUTE_HIDDEN);
    end;
end;


// InitializeRegistry
procedure TEvAppProtect.InitializeRegistry;
var
  S: string;
begin
  S := ReadRegistry;
  // se não existe informações sobre bloqueio, verifica se
  // deve liberar para avaliação por limite de data ou execuções
  if (S = '') and ((FEvalDays > 0) or (FEvalLoads > 0)) then
    begin
      if FEvalDays = 0 then
        begin
          FDateStart := Random(1000);
          FDateEnd := $FFFF - Random(1000);
        end
      else
        begin
          FDateStart := Date;
          FDateEnd := FDateStart + FEvalDays - 1;
        end;
      if FEvalLoads = 0 then
        FMaxLoad := $FFFF
      else
        FMaxLoad := FEvalLoads;
      FCurrentLoad := 0;
      FSetup := Random(High(Word));
      WriteRegistry(EncodeLockInfo);
    end
  else if (Length(S) <> REGKEY_LENGTH) or not IsHexa(S) then
    begin
      FDateStart := Random(1000);
      FDateEnd := $FFFF - Random(1000);
      FMaxLoad := 0;
      FCurrentLoad := 1;
      FSetup := Random(High(Word));
      WriteRegistry(EncodeLockInfo);
    end;
end;


// EncodeLockInfo
function TEvAppProtect.EncodeLockInfo: string;
var
  S: string;
begin
  S := Format('%.4x', [Trunc(FDateStart)]) +
    Format('%.4x', [Trunc(FDateEnd)]) + Format('%.4x', [FMaxLoad]) +
    Format('%.4x', [FCurrentLoad]) + Format('%.4x', [FSetup]) +
    GetKey(GetIdentNumber);
  Result := Criptografe(S, Format('%.x', [FIdApplication])) + GetKey(S);
end;


// DecodeLockInfo
procedure TEvAppProtect.DecodeLockInfo(S: string);
var
  Info: string;
begin
  FDecodeInfo := False;
  if (Length(S) = REGKEY_LENGTH) and IsHexa(S) then
    begin
      Info := Uncriptografe(Copy(S, 1, 22), Format('%.x', [FIdApplication]));
      if (GetKey(Info) = Copy(S, 23, 2)) and
        (GetKey(GetIdentNumber) = Copy(Info, 21, 2)) then
        begin
          FDateStart := StrToInt( '$' + Copy(Info, 1, 4));
          FDateEnd := StrToInt( '$' + Copy(Info, 5, 4));
          FMaxLoad := StrToInt( '$' + Copy(Info, 9, 4));
          FCurrentLoad := StrToInt( '$' + Copy(Info, 13, 4));
          FSetup := StrToInt( '$' + Copy(Info, 17, 4));
          FDecodeInfo := True;
        end;
    end;
end;


// CheckLockInfo
procedure TEvAppProtect.CheckLockInfo;
begin
  InitializeRegistry;
  DecodeLockInfo(ReadRegistry);
  if IsLockApplication then
    begin
      // se o motivo do bloqueio foi expiração de data então define
      // um novo valor para Setup
      if (Date > FDateEnd) or (Date < FDateStart) then
        begin
          WriteRegistry('x');
          InitializeRegistry;
        end;

      // tenta obter novo código de liberação
      if Assigned(FOnNeedCodLib) then
        FOnNeedCodLib(Self)
      else
        ResetLockApplication;
        
      if IsLockApplication then  // verifica novamente
        begin
          if Assigned(FOnLoadError) then
            FOnLoadError(Self)
          else
            Application.Terminate;
        end
      else
        IncrementCounter;   // salva incremento do contador
    end
  else
    IncrementCounter;       // salva incremento do contador
end;


// IsLockApplication
function TEvAppProtect.IsLockApplication: Boolean;
begin
  Result := not (FDecodeInfo and (FMaxLoad > FCurrentLoad) and
    (Date >= FDateStart) and (Date <= FDateEnd));
end;


// IncrementCounter
procedure TEvAppProtect.IncrementCounter;
begin
  Inc(FCurrentLoad);
  if FMaxLoad <= FCurrentLoad then
    FSetup := Random(High(Word));
  WriteRegistry(EncodeLockInfo);
end;


// GetMACAdress
function TEvAppProtect.GetMACAdress: string;
var
  I: Integer;
  NCB: PNCB;
  Adapter: PAdapterStatus;
  LanEnum: PLanaEnum;
begin
  Result := '';
  New(NCB);
  New(Adapter);
  New(LanEnum);
  try
    FillChar(NCB^, SizeOf(TNCB), 0);
    FillChar(LanEnum^, SizeOf(TLanaEnum), 0);
    NCB.ncb_command := Chr(NCBENUM);
    NCB.ncb_buffer := Pointer(LanEnum);
    NCB.ncb_length := SizeOf(LanEnum);
    if (Ord(NetBios(NCB)) = NRC_GOODRET) and (Ord(LanEnum.Length) > 0) then
      begin
        FillChar(NCB^, SizeOf(TNCB), 0);
        NCB.ncb_command := Chr(NCBRESET);
        NCB.ncb_lana_num := LanEnum.lana[0]; // primeiro adaptador
        if (Ord(NetBios(NCB)) = NRC_GOODRET) then
          begin
            FillChar(NCB^, SizeOf(TNCB), 0);
            FillChar(Adapter^, SizeOf(TAdapterStatus), 0);
            NCB.ncb_command := Chr(NCBASTAT);
            NCB.ncb_lana_num := LanEnum.lana[0]; // primeiro adaptador
            NCB.ncb_callname := '*';
            NCB.ncb_buffer := Pointer(Adapter);
            NCB.ncb_length := SizeOf(TAdapterStatus);
            if NetBios(NCB) in [Chr(NRC_GOODRET), Chr(NRC_INCOMP)] then
              for I := 0 to 5 do
                Result := Result + Format('%2.2x', [Integer(Adapter^.adapter_address[I])]);
          end;
      end;
  finally
    Dispose(NCB);
    Dispose(Adapter);
    Dispose(LanEnum);
  end;
end;


// GetSystemDrive
function TEvAppProtect.GetSystemDrive: string;
begin
  SetLength(Result, MAX_PATH);
  if GetWindowsDirectory(PChar(Result), MAX_PATH) > 0 then
    begin
      SetLength(Result, StrLen(PChar(Result)));
      Result := ExtractFileDrive(Result) + '\';
    end
  else
    Result := '';
end;


// GetHDNumber
function TEvAppProtect.GetHDNumber: string;
var
  LabName: array[0..199] of Char;
  FileSys: array[0..19] of Char;
  SerNumber, CompLen, SysFlags: DWORD;
begin
  if GetVolumeInformation(PChar(GetSystemDrive), @LabName, 200, @SerNumber, CompLen, SysFlags, @FileSys, 20) then
    Result := Format('%.8x', [SerNumber]);
end;


// GetIdentNumber
function TEvAppProtect.GetIdentNumber: string;
begin
  Result := '';
  // últimos 4 char do serial do HD
  if ptHardDisk in FProtectType then
    Result := GetHDNumber;
  // adiciona os últimos 4 char do MAC da placa de rede
  if ptNetcard in FProtectType then
    Result := StrShuffle(Result, GetMACAdress, 8);
  while Length(Result) < 8 do
    Result := '0' + Result;
end;


// StrShuffle
function TEvAppProtect.StrShuffle(A, B: string; Size: Integer): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Size do
    begin
      if Odd(I) and (I <= Length(A)) then
        Result := Result + A[I]
      else if (I <= Length(B)) then
        Result := Result + B[I]
      else
        Result := Result + '0';
    end;
end;


// GetKey
function TEvAppProtect.GetKey(S: string): string;
var
  I, T: Integer;
begin
  T := 0;
  for I := 1 to Length(S) do
    T := T + (StrToInt('$' + S[I]) * I);
  Result := Format('%.2x', [T mod 256]);
end;


// Uncriptografe
function TEvAppProtect.Uncriptografe(S, K: string): string;
var
  I, JK, JS: Byte;
begin
  Result := '';
  for I := 1 to Length(S) do
    begin
      JK := StrToInt('$' + K[I mod Length(K) + 1]);
      JS := StrToInt('$' + S[I]);
      Result := Result + Format('%.1x', [JK xor JS]);
    end;
end;


// Criptografe
function TEvAppProtect.Criptografe(S, K: string): string;
begin
  Result := Uncriptografe(S, K);
end;


// IsHexa
function TEvAppProtect.IsHexa(S: string): Boolean;
var
  I: Byte;
begin
  Result := True;
  for I := 1 to Length(S) do
    Result := Result and CharInSet(S[I], ['0'..'9', 'A'..'F']);
end;


// ResetLockApplication
procedure TEvAppProtect.ResetLockApplication;
var
  Body, SerNumber: string;
begin
  // calcula o número de série
  Body := Format('%.4x', [FSetup]) + GetIdentNumber;
  SerNumber := Criptografe(Body, Format('%.x', [FIdApplication])) +
    GetKey(Body);

  // cria o formulário de entrada do código de liberação
  Application.CreateForm(TFrmAppCodLib, FrmAppCodLib);
  FrmAppCodLib.EdtNumSerie.Text := SerNumber;
  if FrmAppCodLib.ShowModal = mrOK then
    begin
      ValidateLockInfo(FrmAppCodLib.EdtCodLiberacao.Text);
      DecodeLockInfo(ReadRegistry);
    end;
  FrmAppCodLib.Free;
  FrmAppCodLib := nil;
end;


// GetSerialNumber
function TEvAppProtect.GetSerialNumber: string;
var
  Body: string;
begin
  // número de série
  Body := Format('%.4x', [FSetup]) + GetIdentNumber;
  Result := Criptografe(Body, Format('%.x', [FIdApplication])) + GetKey(Body);
end;


// SetNewCodLib
procedure TEvAppProtect.SetNewCodLib(CodLib: string);
begin
  ValidateLockInfo(CodLib);
  DecodeLockInfo(ReadRegistry);
end;


// SetNewParamsLib
procedure TEvAppProtect.SetNewParamsLib(dStart, dEnd: TDate; wMaxLoad: Word);
begin
  FDateStart := dStart;
  FDateEnd := dEnd;
  if wMaxLoad = 0 then
    FMaxLoad := $FFFF
  else
    FMaxLoad := wMaxLoad;
  FCurrentLoad := 0;
  FSetup := Random(High(Word));
  WriteRegistry(EncodeLockInfo);
end;


// ValidateLockInfo
procedure TEvAppProtect.ValidateLockInfo(S: string);
var
  Body: string;
  Valid: Boolean;
begin
  Valid := False;
  // verifica a validade no Código de Liberação
  if (Length(S) = CODLIB_LENGTH) and IsHexa(S) then
    begin
      Body := Uncriptografe(Copy(S, 1, 16), GetIdentNumber);
      if (GetKey(Body) = Copy(S, 17, 2)) and
        (FSetup = StrToInt( '$' + Copy(Body, 13, 4))) then
        begin
          FDateStart := StrToInt('$' + Copy(Body, 1, 4));
          FDateEnd := StrToInt('$' + Copy(Body, 5, 4));
          FMaxLoad := StrToInt( '$' + Copy(Body, 9, 4));
          FCurrentLoad := 0;
          Valid := True;
          WriteRegistry(EncodeLockInfo);
        end;
    end;
  // validade do número
  if not Valid then
    ShowMessage(SCodErro);
end;


// LoadLibParams
procedure TEvAppProtect.LoadLibParams;
begin
  InitializeRegistry;
  DecodeLockInfo(ReadRegistry);
end;


{***************************************************************
*                                                              *
*   RegInfo - criptografado por IdApplication                  *
*   0000------------------------------> data inicial           *
*       0000--------------------------> data final             *
*           0000----------------------> máximo de execuções    *
*               0000------------------> carga atual            *
*                   0000--------------> setup                  *
*                       00------------> key ho hd              *
*                         00----------> key do RegInfo         *
*                                                              *
*   SerialNumber - criptografado por IdApplication             *
*   0000------------------------------> setup                  *
*       00000000----------------------> hd                     *
*               00--------------------> key do SerNum          *
*                                                              *
*   CodLib - criptografado por hd/mac                          *
*   0000------------------------------> data inicial           *
*       0000--------------------------> data final             *
*           0000----------------------> máximo de execuções    *
*               0000------------------> setup                  *
*                   00----------------> key do CodLib          *
*                                                              *
***************************************************************}


// Register
procedure Register;
begin
  {$IFDEF VER330}
  RegisterComponents('TCF Add', [TEvAppProtect]);
  {$ENDIF}
end;

end.
