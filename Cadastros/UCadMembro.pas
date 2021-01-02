unit UCadMembro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtDlgs, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.AppEvnts, JvExMask, JvToolEdit,
  JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, JvAVICapture, Vcl.Imaging.jpeg;

type
  TFrmCadMembro = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnNovo: TBitBtn;
    BtnSalvar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    Label1: TLabel;
    EditNOME: TEdit;
    grid: TDBGrid;
    EditID: TEdit;
    dialog: TOpenPictureDialog;
    imgProfile: TImage;
    Label2: TLabel;
    edtBuscar: TEdit;
    ImageList1: TImageList;
    EditENDERECO: TEdit;
    EditNUMERO: TEdit;
    EditBAIRRO: TEdit;
    EditCIDADE: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditESTADO: TEdit;
    EditCOMPLEMENTO: TEdit;
    EditTELPESSOAL: TEdit;
    EditCONTATO1: TEdit;
    EditCONTATO2: TEdit;
    Estado: TLabel;
    Label8: TLabel;
    MaskCEP: TMaskEdit;
    LabelCOMPLENENTO: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EditEMAIL: TEdit;
    Email: TLabel;
    Label11: TLabel;
    cbSEXO: TComboBox;
    cbESTCIVIL: TComboBox;
    EstaCivil: TLabel;
    cbPROFISSAO: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    cbESCOLARIDADE: TComboBox;
    Escolaridade: TLabel;
    MaskRG: TMaskEdit;
    Label14: TLabel;
    MaskCPF: TMaskEdit;
    CPF: TLabel;
    EditMAE: TEdit;
    Label15: TLabel;
    EditPAI: TEdit;
    Label16: TLabel;
    EditTITULO: TEdit;
    Label17: TLabel;
    EditPAIS: TEdit;
    Label18: TLabel;
    EditNATURAL: TEdit;
    Naturalidade: TLabel;
    EditCONJUGE: TEdit;
    Label19: TLabel;
    DataCasCONJUGE: TLabel;
    EditFILHOS: TEdit;
    Label20: TLabel;
    DIZIMISTA: TLabel;
    cbDIZIMISTA: TComboBox;
    EditVALOR: TEdit;
    Label21: TLabel;
    cbTRATAMENTO: TComboBox;
    Tratamento: TLabel;
    cbGRUPO: TComboBox;
    Grupo: TLabel;
    cbMINISTERIO: TComboBox;
    Ministerio: TLabel;
    cbBATIZADO: TComboBox;
    Label22: TLabel;
    dataBatismo: TLabel;
    EditIGREJA_BATISMO: TEdit;
    Label23: TLabel;
    DataCONSAGRAÇAO: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    EditCIDADEBATISMO: TEdit;
    CidadeBatismo: TLabel;
    MemoOBSERVACAO: TMemo;
    OBS: TLabel;
    MemoHistórico: TMemo;
    Label26: TLabel;
    ValCarteira: TLabel;
    EditROLL: TEdit;
    ROLL: TLabel;
    Label27: TLabel;
    EditPAISORIG: TEdit;
    Label28: TLabel;
    EditTELPAISORIG: TEdit;
    CheckATIVO: TCheckBox;
    Label29: TLabel;
    EditCAMPO13: TEdit;
    EditCAMPO15: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    btnTakePhoto: TSpeedButton;
    btnAdd: TSpeedButton;
    ApplicationEvents1: TApplicationEvents;
    cbMORADIA: TComboBox;
    DateNASC: TJvDatePickerEdit;
    DateBATISMO: TJvDatePickerEdit;
    DateVALCARTEIRA: TJvDatePickerEdit;
    DateADMISSAO: TJvDatePickerEdit;
    DateCONSAGRA: TJvDatePickerEdit;
    DateCASAMENTO: TJvDatePickerEdit;
    DateNASCCONJUGE: TJvDatePickerEdit;
    btnSave: TSpeedButton;
    btnCarteirinha: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridCellClick(Column: TColumn);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure EditVALORKeyPress(Sender: TObject; var Key: Char);
    procedure EditVALORChange(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure btnTakePhotoClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCarteirinhaClick(Sender: TObject);

  private
    { Private declarations }
  public
   { Public declarations }
   procedure limparCampos();
   procedure habilitarCampos();
   procedure desabilitarCampos();
   procedure buscarTudo();
   procedure buscarNome();
   procedure associarCampos();
   procedure carregarcbPROFISSAO();
//   procedure carregarComboboxMatriz();
//   procedure carregarComboboxFuncoes();
   procedure carregarImagemPadrao();
   procedure salvarFoto();
//   procedure carregarComboboxIgrejas();
  end;

var
  FrmCadMembro: TFrmCadMembro;
  caminhoImg: string;
  imgPessoa: TPicture;
  alterou: boolean;
// VAR PARA PROCEDURE FORMATA MOEDAS
   s : string;
   v : double;
   I : integer;


implementation

{$R *.dfm}

uses UDM, uWebCam;



// INICIO DO TRATAMENTO DE ERROS
procedure TFrmCadMembro.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var

 mensagem: string;

 Pos1, Pos2: integer;

begin

if Pos(UpperCase('is not a valid date'), UpperCase(E.Message)) <> 0 then

  mensagem:='Data inválida, proceda a correção.'

 else if Pos(UpperCase('must have a value'), UpperCase(E.Message)) <> 0 then

 begin

  Pos1:=Pos('''', E.Message);

  mensagem:=E.Message;

  Delete(mensagem, Pos1, 1);

  Pos2:=Pos('''', mensagem);

  mensagem:=copy(E.Message, Pos1 + 1, Pos2 - Pos1);

  mensagem := 'É obrigatório o preenchimento do campo '+ mensagem + '.';

 end

 else if Pos(UpperCase('key violation'), UpperCase(E.Message)) <> 0 then

  mensagem := 'Houve violação de Chave. Registro já incluido.'

 else if Pos(UpperCase('is not a valid time'), UpperCase(E.Message)) <> 0 then

  mensagem := 'Hora inválida, proceda a correção.'

 else if Pos(UpperCase('is not a valid float'), UpperCase(E.Message)) <> 0 then

 begin

  Pos1 :=Pos('''', E.Message);

  mensagem :=E.Message;

  Delete(mensagem, Pos1, 1);

  Pos2 := Pos('''', mensagem);

  mensagem :=copy(E.Message, Pos1 + 1, Pos2 - Pos1);

  mensagem := 'O valor '+ mensagem + ' não é válido.';

 end

 else if Pos(UpperCase('field value required'), UpperCase(E.Message)) <> 0 then

 begin

  Pos1 :=Pos('column ', E.Message) + 7;

  Pos2 :=Pos(',', E.Message);

  mensagem :=copy(E.Message, Pos1, Pos2 - Pos1);

  mensagem := 'Campo ' + mensagem + ' deve ser preenchido.';

 end

 else if Pos(UpperCase('ATTEMPT TO STORE DUPLICATE VALUE'), UpperCase(E.Message)) <> 0

 then

  mensagem := 'Não é permitido valor duplicado. '

 else if Pos(UpperCase('FOREIGN KEY'), UpperCase(E.Message)) <> 0 then

  mensagem := 'Operação não permitida, registro vinculado em outra tabela está faltando.'

// else if Pos('VIOLATION OF PRIMARY OR UNIQUE KEY CONSTRAINT', UpperCase(E.Message)) <> 0
//
// then
//
//  mensagem := 'Registro Duplicado'+#13#10+Copy(UpperCase(E.Message),Pos('VIOLATION OF PRIMARY OR UNIQUE KEY CONSTRAINT',UpperCase(E.Message))+47,100)

 else if (Pos(UpperCase('MUST APPLY UPDATES BEFORE REFRESHING DATA'),

 UpperCase(E.Message)) <> 0) then

  mensagem := 'É necessário aplicara as alterações antes de atualizar os dados.'

 else if (Pos(UpperCase('INVALID INPUT VALUE'), UpperCase(E.Message)) <> 0) then

  mensagem := 'Valor digitado não é valido conforme a máscara.'

 else

  mensagem := 'Ocorreu o seguinte erro: ' + #13 +UpperCase(E.Message);

 MessageDlg(mensagem, mtError, [mbOk], 0);

 ABORT;
end;
// FIM DO TRATAMENTO DE ERROS

procedure TFrmCadMembro.associarCampos;
begin
   DM.TBL_MEMBROS.FieldByName('NOME').Value := EditNOME.Text;
   DM.TBL_MEMBROS.FieldByName('ENDERECO').Value := EditENDERECO.Text;
   DM.TBL_MEMBROS.FieldByName('NUMERO').Value := EditNUMERO.Text;
   DM.TBL_MEMBROS.FieldByName('BAIRRO').Value := EditBAIRRO.Text;
   DM.TBL_MEMBROS.FieldByName('CIDADE').Value := EditCIDADE.Text;
   DM.TBL_MEMBROS.FieldByName('ESTADO').Value := EditESTADO.Text;
   DM.TBL_MEMBROS.FieldByName('CEP').Value := MaskCEP.Text;
   DM.TBL_MEMBROS.FieldByName('COMPLEMENTO').Value := EditCOMPLEMENTO.Text;
   DM.TBL_MEMBROS.FieldByName('TELPESSOAL')  .Value   := EditTELPESSOAL.Text;
   DM.TBL_MEMBROS.FieldByName('CONTATO1')  .Value   := EditCONTATO1.Text;
   DM.TBL_MEMBROS.FieldByName('CONTATO2')  .Value   := EditCONTATO2             .Text;
   DM.TBL_MEMBROS.FieldByName('EMAIL')  .Value   := EditEMAIL                .Text;
   DM.TBL_MEMBROS.FieldByName('DIZIMISTA')  .Value   := cbDIZIMISTA              .Text;
   DM.TBL_MEMBROS.FieldByName('VALOR')  .Value   := EditVALOR                .Text;
   DM.TBL_MEMBROS.FieldByName('GRUPO')  .Value   := cbGRUPO                  .Text;
   DM.TBL_MEMBROS.FieldByName('TRATAMENTO')  .Value   := cbTRATAMENTO.Text;
   DM.TBL_MEMBROS.FieldByName('OBSERVACAO')  .Value   := MemoOBSERVACAO.Text;
   DM.TBL_MEMBROS.FieldByName('SEXO')  .Value   := cbSEXO.Text;
   DM.TBL_MEMBROS.FieldByName('ESTADO_CIVIL')  .Value   := cbESTCIVIL               .Text;
   DM.TBL_MEMBROS.FieldByName('MINISTERIO')  .Value   := cbMINISTERIO             .Text;
   DM.TBL_MEMBROS.FieldByName('GRAU_ESCOLARIDADE')  .Value   := cbESCOLARIDADE           .Text;
   DM.TBL_MEMBROS.FieldByName('BATIZADO')  .Value   := cbBATIZADO               .Text;
   DM.TBL_MEMBROS.FieldByName('RG')  .Value   := MaskRG                   .Text;
   DM.TBL_MEMBROS.FieldByName('CPF')  .Value   := MaskCPF                  .Text;
   DM.TBL_MEMBROS.FieldByName('NOME_PAI')  .Value   := EditPAI                  .Text;
   DM.TBL_MEMBROS.FieldByName('NOME_MAE')  .Value   := EditMAE                  .Text;
   DM.TBL_MEMBROS.FieldByName('DateBATISMO')  .Value   := DateBATISMO.Date;
   DM.TBL_MEMBROS.FieldByName('DATEADMISSAO')  .Value   := DateADMISSAO             .Date;
   DM.TBL_MEMBROS.FieldByName('PAIS_ORIGEM')  .Value   := EditPAISORIG             .Text;
   DM.TBL_MEMBROS.FieldByName('TELEFONE_PAIS_ORIGEM')  .Value   := EditTELPAISORIG          .Text;
   DM.TBL_MEMBROS.FieldByName('DateCASAMENTO')  .Value   := DateCASAMENTO            .Date;
   DM.TBL_MEMBROS.FieldByName('IGREJA_BATISMO')  .Value   := EditIGREJA_BATISMO       .Text;
   DM.TBL_MEMBROS.FieldByName('DATECONSAGRA')  .Value   := DateCONSAGRA.Date;
   DM.TBL_MEMBROS.FieldByName('NATURALIDADE')  .Value   := EditNATURAL              .Text;
   DM.TBL_MEMBROS.FieldByName('TITULO_ELEITOR')  .Value   := EditTITULO               .Text;
   DM.TBL_MEMBROS.FieldByName('FILHOS')  .Value   := EditFILHOS               .Text;
   DM.TBL_MEMBROS.FieldByName('DateVALCARTEIRA').Value   := DateVALCARTEIRA.Date;
   DM.TBL_MEMBROS.FieldByName('ROLL')  .Value   := EditROLL                 .Text;
   DM.TBL_MEMBROS.FieldByName('CONJUGE')  .Value   := EditCONJUGE              .Text;
   DM.TBL_MEMBROS.FieldByName('CAMPO13')  .Value   := EditCAMPO13              .Text;
   DM.TBL_MEMBROS.FieldByName('TIPO_MORADIA')  .Value   := cbMORADIA              .Text;
   DM.TBL_MEMBROS.FieldByName('CAMPO15')  .Value   := EditCAMPO15              .Text;
   DM.TBL_MEMBROS.FieldByName('HISTORICO')  .Value   := MemoHistórico            .Text;
   DM.TBL_MEMBROS.FieldByName('PROFISSAO')  .Value   := cbPROFISSAO              .Text;
   DM.TBL_MEMBROS.FieldByName('DateNASCCONJUGE')  .Value   := DateNASCCONJUGE          .Date;
   DM.TBL_MEMBROS.FieldByName('CIDADE_BATISMO')  .Value   := EditCIDADEBATISMO        .Text;
   DM.TBL_MEMBROS.FieldByName('DATA_NASC')  .Value   := DateNASC.Date;
end;

procedure TFrmCadMembro.btnAddClick(Sender: TObject);
begin
dialog.Execute();
imgProfile.Picture.LoadFromFile(dialog.filename);
alterou := true;
end;

procedure TFrmCadMembro.btnDeletarClick(Sender: TObject);
begin
if Messagedlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   associarCampos;
    DM.QueryMembro.Close;
    DM.QueryMembro.SQL.Clear;
    DM.QueryMembro.SQL.Add('delete from TBL_MEMBROS where ID = :ID');

    DM.QueryMembro.ParamByName('ID').Value := editID.Text;
    DM.QueryMembro.ExecSql;
    buscarTudo;
    MessageDlg('Excluido com Sucesso!!', mtInformation, mbOKCancel, 0);
    // destativa a table (solução para atualiza grid em tempo de execução)
    //reativa a table
    DM.TBL_MEMBROS.Active := false;
    DM.TBL_MEMBROS.Active := true;

    EditNOME.Enabled := false;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnCarteirinha.Enabled := false;
    btnNovo.Enabled := true;
  end;
end;

procedure TFrmCadMembro.btnEditarClick(Sender: TObject);
begin
if (editNOME.Text <> '') then
    begin
    associarCampos;
    DM.TBL_MEMBROS.Edit;

    DM.QueryMembro.Close;
    DM.QueryMembro.SQL.Clear;

    if alterou = false then
    begin
    DM.QueryMembro.SQL.Add('update TBL_MEMBROS set   NOME = :NOME, NOME_PAI = :NOME_PAI, '+
   ' ENDERECO          =  :ENDERECO             , NOME_MAE             = :NOME_MAE             , '+
   ' NUMERO            =  :NUMERO               , DATEBATISMO          = :DATEBATISMO          , '+
   ' BAIRRO            =  :BAIRRO               , DATEADMISSAO         = :DATEADMISSAO         , '+
   ' CIDADE            =  :CIDADE               , PAIS_ORIGEM          = :PAIS_ORIGEM          , '+
   ' ESTADO            =  :ESTADO               , TELEFONE_PAIS_ORIGEM = :TELEFONE_PAIS_ORIGEM , '+
   ' CEP               =  :CEP                  , DATECASAMENTO        = :DATECASAMENTO        , '+
   ' COMPLEMENTO       =  :COMPLEMENTO          , ATIVO                = :ATIVO                , '+
   ' TELPESSOAL        =  :TELPESSOAL           , IGREJA_BATISMO       = :IGREJA_BATISMO       , '+
   ' CONTATO1          =  :CONTATO1             , DATECONSAGRA         = :DATECONSAGRA         , '+
   ' CONTATO2          =  :CONTATO2             , NATURALIDADE         = :NATURALIDADE         , '+
   ' EMAIL             =  :EMAIL                , TITULO_ELEITOR       = :TITULO_ELEITOR       , '+
   ' DIZIMISTA         =  :DIZIMISTA            , FILHOS               = :FILHOS               , '+
   ' VALOR             =  :VALOR                , DATEVALCARTEIRA      = :DATEVALCARTEIRA      , '+
   ' GRUPO             =  :GRUPO                , ROLL                 = :ROLL                 , '+
   ' TRATAMENTO        =  :TRATAMENTO           , CONJUGE              = :CONJUGE              , '+
   ' CAMPO13           =  :CAMPO13              , PROFISSAO            = :PROFISSAO            , '+
   ' SEXO              =  :SEXO                 , TIPO_MORADIA         = :TIPO_MORADIA         , '+
   ' ESTADO_CIVIL      =  :ESTADO_CIVIL         , CAMPO15              = :CAMPO15              , '+
   ' MINISTERIO        =  :MINISTERIO           , HISTORICO            = :HISTORICO            , '+
   ' GRAU_ESCOLARIDADE =  :GRAU_ESCOLARIDADE    , DATENASCCONJUGE      = :DATENASCCONJUGE      , '+
   ' BATIZADO          =  :BATIZADO             , CIDADE_BATISMO       = :CIDADE_BATISMO       , '+
   ' RG                =  :RG                   , DATA_NASC            = :DATA_NASC            , '+
   ' CPF               =  :CPF                  , OBSERVACAO           = :OBSERVACAO where id  = :id');

    end
    else
    begin
    DM.QueryMembro.SQL.Add('update TBL_MEMBROS set NOME = :NOME, NOME_PAI = :NOME_PAI, '+
   ' ENDERECO          =  :ENDERECO             , NOME_MAE             = :NOME_MAE             , '+
   ' NUMERO            =  :NUMERO               , DateBATISMO          = :DateBATISMO          , '+
   ' BAIRRO            =  :BAIRRO               , DATEADMISSAO         = :DATEADMISSAO         , '+
   ' CIDADE            =  :CIDADE               , PAIS_ORIGEM          = :PAIS_ORIGEM          , '+
   ' ESTADO            =  :ESTADO               , TELEFONE_PAIS_ORIGEM = :TELEFONE_PAIS_ORIGEM , '+
   ' CEP               =  :CEP                  , DateCASAMENTO        = :DateCASAMENTO        , '+
   ' COMPLEMENTO       =  :COMPLEMENTO          , ATIVO                = :ATIVO                , '+
   ' TELPESSOAL        =  :TELPESSOAL           , IGREJA_BATISMO       = :IGREJA_BATISMO       , '+
   ' CONTATO1          =  :CONTATO1             , DATECONSAGRA         = :DATECONSAGRA         , '+
   ' CONTATO2          =  :CONTATO2             , NATURALIDADE         = :NATURALIDADE         , '+
   ' EMAIL             =  :EMAIL                , TITULO_ELEITOR       = :TITULO_ELEITOR       , '+
   ' DIZIMISTA         =  :DIZIMISTA            , FILHOS               = :FILHOS               , '+
   ' VALOR             =  :VALOR                , DateVALCARTEIRA      = :DateVALCARTEIRA      , '+
   ' GRUPO             =  :GRUPO                , ROLL                 = :ROLL                 , '+
   ' TRATAMENTO        =  :TRATAMENTO           , CONJUGE              = :CONJUGE              , '+
   ' CAMPO13           =  :CAMPO13              , PROFISSAO            = :PROFISSAO            , '+
   ' SEXO              =  :SEXO                 , TIPO_MORADIA         = :TIPO_MORADIA         , '+
   ' ESTADO_CIVIL      =  :ESTADO_CIVIL         , CAMPO15              = :CAMPO15              , '+
   ' MINISTERIO        =  :MINISTERIO           , HISTORICO            = :HISTORICO            , '+
   ' GRAU_ESCOLARIDADE =  :GRAU_ESCOLARIDADE    , DateNASCCONJUGE      = :DateNASCCONJUGE      , '+
   ' BATIZADO          =  :BATIZADO             , CIDADE_BATISMO       = :CIDADE_BATISMO       , '+
   ' RG                =  :RG                   , DATA_NASC            = :DATA_NASC            , '+
   ' CPF               =  :CPF                  , OBSERVACAO           = :OBSERVACAO           , '+
   'imagem             =  :imagem                where id             = :id                     ');

    imgPessoa := TPicture.Create;
    imgPessoa.LoadFromFile(dialog.FileName);
    DM.QueryMembro.ParamByName('imagem').Assign(imgPessoa);
    imgPessoa.Free;
    alterou := false;
    end;


    DM.QueryMembro.ParamByName('NOME').Value := editNome.Text;
    DM.QueryMembro.ParamByName('ENDERECO').Value := EditENDERECO.Text;
    DM.QueryMembro.ParamByName('NUMERO').Value := editNUMERO.Text;
    DM.QueryMembro.ParamByName('BAIRRO').Value := editBAIRRO.Text;
    DM.QueryMembro.ParamByName('CIDADE').Value := editCIDADE.Text;
    DM.QueryMembro.ParamByName('ESTADO').Value := editESTADO.Text;
    DM.QueryMembro.ParamByName('CEP').Value := MaskCEP.Text;
    DM.QueryMembro.ParamByName('COMPLEMENTO').Value := editCOMPLEMENTO.Text;
    DM.QueryMembro.ParamByName('TELPESSOAL').Value := editTELPESSOAL.Text;
    DM.QueryMembro.ParamByName('CONTATO1').Value := editCONTATO1.Text;
    DM.QueryMembro.ParamByName('CONTATO2').Value := editCONTATO2.Text;
    DM.QueryMembro.ParamByName('EMAIL').Value := editEMAIL.Text;
    DM.QueryMembro.ParamByName('DIZIMISTA').Value := cbDIZIMISTA.Text;
    DM.QueryMembro.ParamByName('VALOR').Value := editVALOR.Text;
    DM.QueryMembro.ParamByName('GRUPO').Value := cbGRUPO.Text;
    DM.QueryMembro.ParamByName('TRATAMENTO').Value := cbTRATAMENTO.Text;
    DM.QueryMembro.ParamByName('SEXO').Value := cbSEXO.Text;
    DM.QueryMembro.ParamByName('ESTADO_CIVIL').Value := cbESTCIVIL.Text;
    DM.QueryMembro.ParamByName('MINISTERIO').Value := cbMINISTERIO.Text;
    DM.QueryMembro.ParamByName('PROFISSAO').Value := cbPROFISSAO.Text;
    DM.QueryMembro.ParamByName('GRAU_ESCOLARIDADE').Value := cbESCOLARIDADE.Text;
    DM.QueryMembro.ParamByName('BATIZADO').Value := cbBATIZADO.Text;
    DM.QueryMembro.ParamByName('RG').Value := MaskRG.Text;
    DM.QueryMembro.ParamByName('CPF').Value := MaskCPF.Text;
    DM.QueryMembro.ParamByName('NOME_PAI').Value := editPAI.Text;
    DM.QueryMembro.ParamByName('NOME_MAE').Value := editMAE.Text;
    DM.QueryMembro.ParamByName('DateBATISMO').Value := DateBATISMO.Date;
    DM.QueryMembro.ParamByName('DATEADMISSAO').Value := DateADMISSAO.Date;
    DM.QueryMembro.ParamByName('PAIS_ORIGEM').Value := editPAISORIG.Text;
    DM.QueryMembro.ParamByName('TELEFONE_PAIS_ORIGEM').Value := editTELPAISORIG.Text;
    DM.QueryMembro.ParamByName('DateCASAMENTO').Value := DateCASAMENTO.Date;
//  DM.QueryMembro.ParamByName('ATIVO').Value := editATIVO.Text;
    DM.QueryMembro.ParamByName('IGREJA_BATISMO').Value := editIGREJA_BATISMO.Text;
    DM.QueryMembro.ParamByName('DATECONSAGRA').Value := DateCONSAGRA.Date;
    DM.QueryMembro.ParamByName('NATURALIDADE').Value := editNATURAL.Text;
    DM.QueryMembro.ParamByName('TITULO_ELEITOR').Value := editTITULO.Text;
    DM.QueryMembro.ParamByName('FILHOS').Value := editFILHOS.Text;
    DM.QueryMembro.ParamByName('DateVALCARTEIRA').Value := DateVALCARTEIRA.Date;
    DM.QueryMembro.ParamByName('ROLL').Value := editROLL.Text;
    DM.QueryMembro.ParamByName('CONJUGE').Value := editCONJUGE.Text;
    DM.QueryMembro.ParamByName('CAMPO13').Value := editCAMPO13.Text;
    DM.QueryMembro.ParamByName('TIPO_MORADIA').Value := cbMORADIA.Text;
    DM.QueryMembro.ParamByName('CAMPO15').Value := editCAMPO15.Text;
    DM.QueryMembro.ParamByName('HISTORICO').Value := MemoHistórico.Text;
    DM.QueryMembro.ParamByName('DateNASCCONJUGE').Value := DateNASCCONJUGE.Date;
    DM.QueryMembro.ParamByName('CIDADE_BATISMO').Value := EditCIDADEBATISMO.Text;
    DM.QueryMembro.ParamByName('DATA_NASC').Value := DateNASC.Date;
    DM.QueryMembro.ParamByName('OBSERVACAO').Value := MemoOBSERVACAO.Text;
    DM.QueryMembro.ParamByName('id').Value := editID.Text;
    DM.QueryMembro.ExecSql;

    MessageDlg('Editado com Sucesso!!', mtInformation, mbOKCancel, 0);
    buscarTudo;
    desabilitarCampos;
    limparCampos;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnCarteirinha.Enabled := false;
    btnNovo.Enabled := true;
    end
    else
    begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
    end;
end;

procedure TFrmCadMembro.btnNovoClick(Sender: TObject);
begin
//apos editar um dado esta desbilitando o Edit
EditNOME.Enabled := true; // Reabilita Edit
EditNOME.Text := '';
EditNOME.SetFocus;
EditNOME.Enabled := true;
DM.TBL_MEMBROS.Insert;
carregarcbPROFISSAO;
BtnSalvar.Enabled := true;
btnNovo.Enabled := true;

btnEditar.Enabled := true;
btnDeletar.Enabled := false;
end;

procedure TFrmCadMembro.BtnSalvarClick(Sender: TObject);
begin
if (EditNOME.Text <> '') then
  begin
  associarCampos;
  salvarFoto;
  DM.TBL_MEMBROS.Post;
  MessageDlg('Salvo com Sucesso!!', mtInformation, mbOKCancel, 0);
  buscarTudo;
  desabilitarCampos;
  btnSalvar.Enabled := false;
  btnNovo.Enabled := true;
  btnEditar.Enabled := false;
  btnDeletar.Enabled := false;
  btnCarteirinha.Enabled := false;
  grid.Enabled := true;
  end
  else
  begin
  MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
  end;
end;

procedure TFrmCadMembro.btnTakePhotoClick(Sender: TObject);
begin
frmWebCam := TfrmWebCam.Create(Application);
//    frmWebCam.ShowModal;
  with frmWebCam do
  begin
    ShowModal;
    if ModalResult = mrOk then
      imgProfile.Picture.Assign(imgSnapshot.Picture);
      begin
      //dialog.Execute();
      //img.Picture.LoadFromFile(dialog.filename);
      alterou := true;
end;
  end;
end;

procedure TFrmCadMembro.buscarNome;
begin
dm.QueryMembro.Close;
dm.QueryMembro.SQL.Clear;                                 //add collate win_ptbr para busca CASE INSESITIVE
dm.QueryMembro.SQL.Add('select * from TBL_MEMBROS where nome collate win_ptbr LIKE :nome order by nome asc');
dm.QueryMembro.ParamByName('nome').Value := edtBuscar.Text + '%';
dm.QueryMembro.Open;
end;

procedure TFrmCadMembro.buscarTudo;
begin
DM.QueryMembro.Close;
DM.QueryMembro.SQL.Clear;
DM.QueryMembro.SQL.Add('select * from TBL_MEMBROS order by nome asc');
DM.QueryMembro.Open();
end;

//procedure TFrmCadMembro.carregarComboboxFuncoes;
//begin
//
//end;
//
//procedure TFrmCadMembro.carregarComboboxIgrejas;
//begin
//
//end;
//
//procedure TFrmCadMembro.carregarComboboxMatriz;
//begin
//
//end;


procedure TFrmCadMembro.carregarcbPROFISSAO;
begin
if not DM.TBL_PROFISSOES.IsEmpty then
  begin

    while not DM.TBL_PROFISSOES.Eof do
    begin

       cbPROFISSAO.Items.Add(DM.TBL_PROFISSOES.FieldByName('PROFISSAO').AsString);
       DM.TBL_PROFISSOES.next;
    end;
  end;
end;

procedure TFrmCadMembro.carregarImagemPadrao;
begin
    caminhoImg  := GetCurrentDir + '\img\sem-foto.jpg';
    imgProfile.Picture.LoadFromFile(caminhoImg);
end;

procedure TFrmCadMembro.desabilitarCampos;
begin
limparcampos();
EditNOME.Enabled := false;

end;
// trabalhando com valor de moeda
procedure TFrmCadMembro.EditVALORChange(Sender: TObject);

begin
   //1º Passo : se o edit estiver vazio, nada pode ser feito.
   If (Editvalor.Text = emptystr) then
      Editvalor.Text := '0,00';

   //2º Passo : obter o texto do edit, SEM a virgula e SEM o ponto decimal:
   s := '';
   for I := 1 to length(Editvalor.Text) do
   if (Editvalor.text[I] in ['0'..'9']) then
      s := s + Editvalor.text[I];

   //3º Passo : fazer com que o conteúdo do edit apresente 2 casas decimais:
   v := strtofloat(s);
   v := (v /100); // para criar 2 casa decimais

   //4º Passo : Formata o valor de (V) para aceitar valores do tipo 0,10.
   Editvalor.text := FormatFloat('###,##0.00',v);
   Editvalor.SelStart := Length(Editvalor.text);
end;
// trabalhando com valor de moeda
procedure TFrmCadMembro.EditVALORKeyPress(Sender: TObject; var Key: Char);
begin
     if NOT (Key in ['0'..'9', #8, #9]) then
     key := #0;
     //Função posiciona o cursor sempre a direita como nos Caixas Eletronicos
     Editvalor.selstart := Length(Editvalor.text);
end;

procedure TFrmCadMembro.edtBuscarChange(Sender: TObject);
begin
buscarNome;
end;

procedure TFrmCadMembro.FormShow(Sender: TObject);
begin
DM.TBL_MEMBROS.Active := false;
DM.TBL_MEMBROS.Active := true;

DM.TBL_PROFISSOES.Active := false;
DM.TBL_PROFISSOES.Active := true;

buscarTudo;
carregarcbPROFISSAO;
btnSalvar.Enabled := false;
btnEditar.Enabled := false;
btnDeletar.Enabled := false;
btnCarteirinha.Enabled := false;

carregarImagemPadrao();
end;

procedure ExibeFoto(DataSet : TDataSet; BlobFieldName : String; ImageExibicao :
TImage);

 var MemoryStream:TMemoryStream; jpg : TPicture;
 const
  OffsetMemoryStream : Int64 = 0;

begin
  if not(DataSet.IsEmpty) and
  not((DataSet.FieldByName(BlobFieldName) as TBlobField).IsNull) then
    try
      MemoryStream := TMemoryStream.Create;
      Jpg := TPicture.Create;
      (DataSet.FieldByName(BlobFieldName) as
TBlobField).SaveToStream(MemoryStream);
      MemoryStream.Position := OffsetMemoryStream;
      Jpg.LoadFromStream(MemoryStream);
      ImageExibicao.Picture.Assign(Jpg);
    finally
     // Jpg.Free;
      MemoryStream.Free;
    end
  else
    ImageExibicao.Picture := Nil;
end;


procedure TFrmCadMembro.gridCellClick(Column: TColumn);
begin
DM.TBL_MEMBROS.Edit;
btnEditar.Enabled := true;
btnDeletar.Enabled := true;
btnAdd.Enabled := true;
btnCarteirinha.Enabled := true;
habilitarCampos;

if DM.QueryMembro.FieldByName('NOME').Value <> null then
EditNOME.Text := DM.QueryMembro.FieldByName('NOME').Value;

if DM.QueryMembro.FieldByName('ENDERECO').Value <> null then
EditENDERECO.Text := DM.QueryMembro.FieldByName('ENDERECO').Value;

if DM.QueryMembro.FieldByName('NUMERO').Value <> null then
EditNUMERO.Text  := DM.QueryMembro.FieldByName('NUMERO').Value;

if DM.QueryMembro.FieldByName('BAIRRO').Value <> null then
EditBAIRRO.Text  := DM.QueryMembro.FieldByName('BAIRRO').Value;

if DM.QueryMembro.FieldByName('CIDADE').Value <> null then
EditCIDADE.Text  := DM.QueryMembro.FieldByName('CIDADE').Value;

if DM.QueryMembro.FieldByName('ESTADO').Value <> null then
EditESTADO.Text  := DM.QueryMembro.FieldByName('ESTADO').Value;

if DM.QueryMembro.FieldByName('CEP').Value <> null then
MaskCEP.Text  := DM.QueryMembro.FieldByName('CEP').Value;

if DM.QueryMembro.FieldByName('COMPLEMENTO').Value <> null then
EditCOMPLEMENTO.Text  := DM.QueryMembro.FieldByName('COMPLEMENTO').Value;

if DM.QueryMembro.FieldByName('TELPESSOAL').Value <> null then
EditTELPESSOAL.Text  := DM.QueryMembro.FieldByName('TELPESSOAL').Value;

if DM.QueryMembro.FieldByName('CONTATO1').Value <> null then
EditCONTATO1.Text  := DM.QueryMembro.FieldByName('CONTATO1').Value;

if DM.QueryMembro.FieldByName('CONTATO2').Value <> null then
EditCONTATO2.Text  := DM.QueryMembro.FieldByName('CONTATO2').Value;

if DM.QueryMembro.FieldByName('EMAIL').Value <> null then
EditEMAIL.Text  := DM.QueryMembro.FieldByName('EMAIL').Value;

if DM.QueryMembro.FieldByName('DIZIMISTA').Value <> null then
cbDIZIMISTA.Text  := DM.QueryMembro.FieldByName('DIZIMISTA').Value;

if DM.QueryMembro.FieldByName('VALOR').Value <> null then
EditVALOR.Text  := DM.QueryMembro.FieldByName('VALOR').Value;

if DM.QueryMembro.FieldByName('GRUPO').Value <> null then
cbGRUPO.Text  := DM.QueryMembro.FieldByName('GRUPO').Value;

if DM.QueryMembro.FieldByName('TRATAMENTO').Value <> null then
cbTRATAMENTO.Text  := DM.QueryMembro.FieldByName('TRATAMENTO').Value;

if DM.QueryMembro.FieldByName('SEXO').Value <> null then
cbSEXO.Text  := DM.QueryMembro.FieldByName('SEXO').Value;

if DM.QueryMembro.FieldByName('ESTADO_CIVIL').Value <> null then
cbESTCIVIL.Text  := DM.QueryMembro.FieldByName('ESTADO_CIVIL').Value;

if DM.QueryMembro.FieldByName('MINISTERIO').Value <> null then
cbMINISTERIO.Text  := DM.QueryMembro.FieldByName('MINISTERIO').Value;

if DM.QueryMembro.FieldByName('PROFISSAO').Value <> null then
cbPROFISSAO.Text  := DM.QueryMembro.FieldByName('PROFISSAO').Value;

if DM.QueryMembro.FieldByName('GRAU_ESCOLARIDADE').Value <> null then
cbESCOLARIDADE.Text  := DM.QueryMembro.FieldByName('GRAU_ESCOLARIDADE').Value;

if DM.QueryMembro.FieldByName('BATIZADO').Value <> null then
cbBATIZADO.Text  := DM.QueryMembro.FieldByName('BATIZADO').Value;

if DM.QueryMembro.FieldByName('RG').Value <> null then
MaskRG.Text  := DM.QueryMembro.FieldByName('RG').Value;

if DM.QueryMembro.FieldByName('CPF').Value <> null then
MaskCPF.Text  := DM.QueryMembro.FieldByName('CPF').Value;

if DM.QueryMembro.FieldByName('NOME_PAI').Value <> null then
EditPAI.Text  := DM.QueryMembro.FieldByName('NOME_PAI').Value;

if DM.QueryMembro.FieldByName('NOME_MAE').Value <> null then
EditMAE.Text  := DM.QueryMembro.FieldByName('NOME_MAE').Value;

if DM.QueryMembro.FieldByName('DATEBATISMO').Value <> null then
DateBATISMO.Date  := DM.QueryMembro.FieldByName('DATEBATISMO').Value;

if DM.QueryMembro.FieldByName('DATEADMISSAO').Value <> null then
DateADMISSAO.Date  := DM.QueryMembro.FieldByName('DATEADMISSAO').Value;

if DM.QueryMembro.FieldByName('PAIS_ORIGEM').Value <> null then
EditPAISORIG.Text  := DM.QueryMembro.FieldByName('PAIS_ORIGEM').Value;

if DM.QueryMembro.FieldByName('TELEFONE_PAIS_ORIGEM').Value <> null then
EditTELPAISORIG.Text  := DM.QueryMembro.FieldByName('TELEFONE_PAIS_ORIGEM').Value;

if DM.QueryMembro.FieldByName('DATECASAMENTO').Value <> null then
DateCASAMENTO.Date  := DM.QueryMembro.FieldByName('DATECASAMENTO').Value;

//if DM.QueryMembro.FieldByName('ATIVO').Value <> null then
//CheckATIVO.Text  := DM.QueryMembro.FieldByName('ATIVO').Value;

if DM.QueryMembro.FieldByName('IGREJA_BATISMO').Value <> null then
EditIGREJA_BATISMO.Text  := DM.QueryMembro.FieldByName('IGREJA_BATISMO').Value;

if DM.QueryMembro.FieldByName('DATECONSAGRA').Value <> null then
DateCONSAGRA.Date  := DM.QueryMembro.FieldByName('DATECONSAGRA').Value;

if DM.QueryMembro.FieldByName('NATURALIDADE').Value <> null then
EditNATURAL.Text  := DM.QueryMembro.FieldByName('NATURALIDADE').Value;

if DM.QueryMembro.FieldByName('TITULO_ELEITOR').Value <> null then
EditTITULO.Text  := DM.QueryMembro.FieldByName('TITULO_ELEITOR').Value;

if DM.QueryMembro.FieldByName('FILHOS').Value <> null then
EditFILHOS.Text  := DM.QueryMembro.FieldByName('FILHOS').Value;

if DM.QueryMembro.FieldByName('DateVALCARTEIRA').Value <> null then
DateVALCARTEIRA.Date  := DM.QueryMembro.FieldByName('DateVALCARTEIRA').Value;

if DM.QueryMembro.FieldByName('ROLL').Value <> null then
EditROLL.Text  := DM.QueryMembro.FieldByName('ROLL').Value;

if DM.QueryMembro.FieldByName('CONJUGE').Value <> null then
EditCONJUGE.Text  := DM.QueryMembro.FieldByName('CONJUGE').Value;

if DM.QueryMembro.FieldByName('CAMPO13').Value <> null then
EditCAMPO13.Text  := DM.QueryMembro.FieldByName('CAMPO13').Value;

if DM.QueryMembro.FieldByName('TIPO_MORADIA').Value <> null then
cbMORADIA.Text  := DM.QueryMembro.FieldByName('TIPO_MORADIA').Value;

if DM.QueryMembro.FieldByName('CAMPO15').Value <> null then
EditCAMPO15.Text  := DM.QueryMembro.FieldByName('CAMPO15').Value;

if DM.QueryMembro.FieldByName('HISTORICO').Value <> null then
MemoHistórico.Text  := DM.QueryMembro.FieldByName('HISTORICO').Value;

if DM.QueryMembro.FieldByName('DateNASCCONJUGE').Value <> null then
DateNASCCONJUGE.Date  := DM.QueryMembro.FieldByName('DateNASCCONJUGE').Value;

if DM.QueryMembro.FieldByName('CIDADE_BATISMO').Value <> null then
EditCIDADEBATISMO.Text  := DM.QueryMembro.FieldByName('CIDADE_BATISMO').Value;

if DM.QueryMembro.FieldByName('DATA_NASC').Value <> null then
DateNASC .Date  := DM.QueryMembro.FieldByName('DATA_NASC').Value;

if DM.QueryMembro.FieldByName('OBSERVACAO').Value <> null then
MemoOBSERVACAO.Text  := DM.QueryMembro.FieldByName('OBSERVACAO').Value;

if DM.QueryMembro.FieldByName('id').Value <> null then
editID.Text := DM.QueryMembro.FieldByName('ID').Value;

 if DM.QueryMembro.FieldByName('imagem').Value <> null then
 ExibeFoto(dm.querymembro, 'imagem', imgProfile);

end;

procedure TFrmCadMembro.habilitarCampos;
begin
limparCampos;
EditNOME        .Enabled := True;
EditENDERECO    .Enabled := True;
EditNUMERO      .Enabled := True;
EditBAIRRO      .Enabled := True;
EditCIDADE      .Enabled := True;
EditESTADO      .Enabled := True;
MaskCEP         .Enabled := True;
EditCOMPLEMENTO .Enabled := True;
EditTELPESSOAL  .Enabled := True;
EditCONTATO1    .Enabled := True;
EditCONTATO2    .Enabled := True;
EditEMAIL       .Enabled := True;
cbDIZIMISTA     .Enabled := True;
EditVALOR       .Enabled := True;
cbGRUPO         .Enabled := True;
cbTRATAMENTO    .Enabled := True;
cbSEXO          .Enabled := True;
cbESTCIVIL      .Enabled := True;
cbMINISTERIO    .Enabled := True;
cbESCOLARIDADE  .Enabled := True;
cbBATIZADO      .Enabled := True;
MaskRG          .Enabled := True;
MaskCPF         .Enabled := True;
EditPAI         .Enabled := True;
EditMAE         .Enabled := True;
DateBATISMO     .Enabled := True;
DateADMISSAO    .Enabled := True;
EditPAISORIG    .Enabled := True;
EditTELPAISORIG .Enabled := True;
DateCASAMENTO   .Enabled := True;
CheckATIVO      .Enabled := True;
EditIGREJA_BATISMO.Enabled := True;
DateCONSAGRA    .Enabled := True;
EditNATURAL     .Enabled := True;
EditTITULO      .Enabled := True;
EditFILHOS      .Enabled := True;
DateVALCARTEIRA .Enabled := True;
EditROLL        .Enabled := True;
EditCONJUGE     .Enabled := True;
EditCAMPO13     .Enabled := True;
cbMORADIA     .Enabled := True;
EditCAMPO15     .Enabled := True;
MemoHistórico   .Enabled := True;
cbPROFISSAO     .Enabled := True;
DateNASCCONJUGE .Enabled := True;
EditCIDADEBATISMO.Enabled := True;
DateNASC        .Enabled := True;
MemoOBSERVACAO      .Enabled := True;

end;

procedure TFrmCadMembro.limparCampos;
begin
EditNOME         .Text  := '';
EditENDERECO     .Text  := '';
EditNUMERO       .Text  := '';
EditBAIRRO       .Text  := '';
EditCIDADE       .Text  := '';
EditESTADO       .Text  := '';
MaskCEP          .Text  := '';
EditCOMPLEMENTO  .Text  := '';
EditTELPESSOAL   .Text  := '';
EditCONTATO1     .Text  := '';
EditCONTATO2     .Text  := '';
EditEMAIL        .Text  := '';
cbDIZIMISTA      .Text  := '';
EditVALOR        .Text  := '';
cbGRUPO          .Text  := '';
cbTRATAMENTO     .Text  := '';
cbSEXO           .Text  := '';
cbESTCIVIL       .Text  := '';
cbMINISTERIO     .Text  := '';
cbPROFISSAO      .Text  := '';
cbESCOLARIDADE   .Text  := '';
cbBATIZADO       .Text  := '';
MaskRG           .Text  := '';
MaskCPF          .Text  := '';
EditPAI          .Text  := '';
EditMAE          .Text  := '';
//DateBATISMO      .DateTime  := '';
//DateADMISSAO     .DateTime  := '';
EditPAISORIG     .Text  := '';
EditTELPAISORIG  .Text  := '';
//DateCASAMENTO    .DateTime  := '';
EditIGREJA_BATISMO .Text := '';
//DateCONSAGRA     .DateTime := '';
EditNATURAL      .Text := '';
EditTITULO       .Text := '';
EditFILHOS       .Text := '';
//DateVALCARTEIRA  .DateTime := '';
EditROLL         .Text := '';
EditCONJUGE      .Text := '';
EditCAMPO13      .Text := '';
cbMORADIA      .Text := '';
EditCAMPO15      .Text := '';
MemoHistórico    .Text := '';
//DateNASCCONJUGE  .Date := '';
EditCIDADEBATISMO .Text := '';
//DateNASC         .DateTime := '';
MemoOBSERVACAO       .Text := '';
end;

procedure TFrmCadMembro.salvarFoto;
begin
 if dialog.FileName <> '' then
  begin
  imgPessoa := TPicture.Create;
  imgPessoa.LoadFromFile(dialog.FileName);
  DM.TBL_MEMBROS.FieldByName('imagem').Assign(imgPessoa);
  imgPessoa.Free;
  dialog.FileName := GetCurrentDir + '\img\sem-foto.jpg';
  alterou := false;
  end
  else
    begin
  DM.TBL_MEMBROS.FieldByName('imagem').Value := GetCurrentDir + '\img\sem-foto.jpg';

  end;
end;

procedure TFrmCadMembro.btnCarteirinhaClick(Sender: TObject);
begin
// Faz a consulta do membro para enviar para o relatorio
DM.QueryMembro.Close;
DM.QueryMembro.SQL.Clear;
DM.QueryMembro.SQL.Add('select * from TBL_MEMBROS where id = :id'); // passa o parametro ID
DM.QueryMembro.ParamByName('ID').Value := editID.Text;       // Recupera o parametro ID para o Edit
DM.QueryMembro.Open();


DM.frxCarteirinha.LoadFromFile(GetCurrentDir + '\Relatorio\modelo_01.fr3');
DM.frxCarteirinha.ShowReport();
btnCarteirinha.Enabled := false;
buscarTudo; // Após chamar o relatorio, executa a procedure BuscarTudo
end;

end.
