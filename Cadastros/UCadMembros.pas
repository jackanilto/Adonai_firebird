unit UCadMembros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmCadMembros = class(TForm)
    PageContMembro: TPageControl;
    TabDadosPessoais: TTabSheet;
    TabSheet2: TTabSheet;
    DBGMEMBRO: TDBGrid;
    EditNOME: TEdit;
    editCod: TEdit;
    Label3: TLabel;
    EditENDERECO: TEdit;
    Label4: TLabel;
    EditNUMERO: TEdit;
    EditBAIRRO: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    EditCIDADE: TEdit;
    Label7: TLabel;
    EditESTADO: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    EditCOMPLEMENTO: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EditEMAIL: TEdit;
    Label15: TLabel;
    EditSEXO: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label28: TLabel;
    EditESCOLARIDADE: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    EditTITULO_ELEITOR: TEdit;
    Label23: TLabel;
    EditNATURALIDADE: TEdit;
    Label46: TLabel;
    Label20: TLabel;
    EditNOMEPAI: TEdit;
    Label21: TLabel;
    EditNOMEMAE: TEdit;
    Label24: TLabel;
    Label26: TLabel;
    EditCONJUGE: TEdit;
    Label27: TLabel;
    Label25: TLabel;
    EditFILHOS: TEdit;
    Label1: TLabel;
    MemoHISTORICO: TMemo;
    Label52: TLabel;
    EditTIPOMORADA: TEdit;
    Label50: TLabel;
    EditIGREJABATISMO: TEdit;
    Label43: TLabel;
    EditMINISTERIO: TEdit;
    Label35: TLabel;
    EditDIZIMISTA: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label36: TLabel;
    EditBATIZADO: TEdit;
    Label44: TLabel;
    EditCIDADEBATISMO: TEdit;
    Label51: TLabel;
    editCAMPO15: TEdit;
    EditDATACONSAGRACAO: TEdit;
    Label45: TLabel;
    EditDATABATISMO: TEdit;
    Label37: TLabel;
    EditGRUPO: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    EditTRATAMENTO: TEdit;
    Label38: TLabel;
    EditDATAADMISSAO: TEdit;
    EditTAG: TEdit;
    Label47: TLabel;
    EditVALIDADECARTEIRA: TEdit;
    Label39: TLabel;
    Label40: TLabel;
    EditPAISORIGEM: TEdit;
    Label48: TLabel;
    Label49: TLabel;
    editCAMPO13: TEdit;
    Edit41: TEdit;
    EditTELPAISORIG: TEdit;
    Label41: TLabel;
    EditOBSERVACAO: TEdit;
    Label34: TLabel;
    img: TImage;
    AddFoto: TBitBtn;
    EdtBuscar: TEdit;
    EditCEP: TMaskEdit;
    EditRG: TMaskEdit;
    EditCPF: TMaskEdit;
    EditDATACASAMENTO: TMaskEdit;
    EditNASC_CONJUGE: TMaskEdit;
    EditTELPESSOAL: TMaskEdit;
    EditCONTATO1: TMaskEdit;
    EditCONTATO2: TMaskEdit;
    Label14: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    cbEstCivil: TComboBox;
    EditATIVO: TEdit;
    EditVALOR: TMaskEdit;
    cbPROFISSOES: TComboBox;
    EditNASCMEMBRO: TDateTimePicker;
    BitBtn1: TBitBtn;
    dialog: TOpenDialog;
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridMembrosCellClick(Column: TColumn);
    procedure AddFotoClick(Sender: TObject);
    procedure EdtBuscarChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ImgSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
 //   function ProximoID(GENERATOR: string): integer;
  private
    { Private declarations }
    procedure limparCampos();
    procedure habilitarCampos();
    procedure desabilitarCampos();
    procedure buscarTudo();
    procedure buscarNome();
    procedure associarCampos();
    procedure CarregaComboBoxProfissoes();
    procedure carregarImagemPadrao();
    procedure salvarFoto();


  public
    { Public declarations }
  end;

var
  FrmCadMembros: TFrmCadMembros;
  caminhoImg: string;
  imgMembro: TPicture;
  alterou: boolean;
  nomeAntigo: string;

implementation

{$R *.dfm}

uses UDM, ULogin, UPrincipal, UProfissoes;

{ TFrmCadastroMembros }


{ TFrmCadastroMembros }

procedure TFrmCadMembros.associarCampos;
begin
DM.Tbl_Membros.FieldByName('NOME').Value := EditNOME.Text;
DM.Tbl_Membros.FieldByName('ENDERECO').Value := EditENDERECO.Text;
DM.Tbl_Membros.FieldByName('NUMERO').Value := EditNUMERO.Text;
DM.Tbl_Membros.FieldByName('BAIRRO').Value := EditBAIRRO.Text;
DM.Tbl_Membros.FieldByName('CIDADE').Value := EditCIDADE.Text;
DM.Tbl_Membros.FieldByName('ESTADO').Value := EditESTADO.Text;
DM.Tbl_Membros.FieldByName('CEP').Value := EditCEP.Text;
DM.Tbl_Membros.FieldByName('COMPLEMENTO').Value := EditCOMPLEMENTO.Text;
DM.Tbl_Membros.FieldByName('TELPESSOAL').Value := EditTELPESSOAL.Text;
DM.Tbl_Membros.FieldByName('CONTATO1').Value := EditCONTATO1.Text;
DM.Tbl_Membros.FieldByName('CONTATO2').Value := EditCONTATO2.Text;
DM.Tbl_Membros.FieldByName('EMAIL').Value := EditEMAIL.Text;
DM.Tbl_Membros.FieldByName('SEXO').Value := EditSEXO.Text;
DM.Tbl_Membros.FieldByName('ESTADO_CIVIL').Value := cbEstCivil.Text;
DM.Tbl_Membros.FieldByName('PROFISSAO').Value := cbPROFISSOES.Text;
DM.Tbl_Membros.FieldByName('RG').Value := EditRG.Text;
DM.Tbl_Membros.FieldByName('CPF').Value := EditCPF.Text;
DM.Tbl_Membros.FieldByName('TITULO_ELEITOR').Value := EditTITULO_ELEITOR.Text;
DM.Tbl_Membros.FieldByName('NOME_PAI').Value := EditNOMEPAI.Text;
DM.Tbl_Membros.FieldByName('NOME_MAE').Value := EditNOMEMAE.Text;
DM.Tbl_Membros.FieldByName('TITULO_ELEITOR').Value := EditTITULO_ELEITOR.Text;
DM.Tbl_Membros.FieldByName('NATURALIDADE').Value := EditNATURALIDADE.Text;
DM.Tbl_Membros.FieldByName('DATA_CASAMENTO').Value := EditDATACASAMENTO.Text;
DM.Tbl_Membros.FieldByName('FILHOS').Value := EditFILHOS.Text;
DM.Tbl_Membros.FieldByName('CONJUGE').Value := EditCONJUGE.Text;
DM.Tbl_Membros.FieldByName('NASC_CONJUGE').Value := EditNASC_CONJUGE.Text;
DM.Tbl_Membros.FieldByName('GRAU_ESCOLARIDADE').Value := EditESCOLARIDADE.Text;
DM.Tbl_Membros.FieldByName('DIZIMISTA').Value := EditDIZIMISTA.Text;
DM.Tbl_Membros.FieldByName('VALOR').Value := EditVALOR.Text;
DM.Tbl_Membros.FieldByName('GRUPO').Value := EditGRUPO.Text;
DM.Tbl_Membros.FieldByName('TRATAMENTO').Value := EditTRATAMENTO.Text;
DM.Tbl_Membros.FieldByName('DATA_NASC').Value := EditNASCMEMBRO.Date;     //
DM.Tbl_Membros.FieldByName('OBS').Value := EditOBSERVACAO.Text;
DM.Tbl_Membros.FieldByName('MINISTERIO').Value := EditMINISTERIO.Text;
DM.Tbl_Membros.FieldByName('BATIZADO').Value := EditBATIZADO.Text;
DM.Tbl_Membros.FieldByName('DATA_BATISMO').Value := EditDATABATISMO.Text;
DM.Tbl_Membros.FieldByName('DATA_ADMISSAO').Value := EditDATAADMISSAO.Text;
DM.Tbl_Membros.FieldByName('VALIDADE_CARTEIRA').Value := EditVALIDADECARTEIRA.Text;
DM.Tbl_Membros.FieldByName('TELEFONE_PAIS_ORIGEM').Value := EditTELPAISORIG.Text;
DM.Tbl_Membros.FieldByName('PAIS_ORIGEM').Value := EditPAISORIGEM.Text;
DM.Tbl_Membros.FieldByName('IGREJA_BATISMO').Value := EditIGREJABATISMO.Text;
DM.Tbl_Membros.FieldByName('CIDADE_BATISMO').Value := EditCIDADEBATISMO.Text;
DM.Tbl_Membros.FieldByName('DATA_CONSAGRACAO').Value := EditDATACONSAGRACAO.Text;
DM.Tbl_Membros.FieldByName('TIPO_MORADIA').Value := EditTIPOMORADA.Text;
end;

procedure TFrmCadMembros.BitBtn1Click(Sender: TObject);
begin
 FrmCadProfissoes.ShowModal;
end;

procedure TFrmCadMembros.AddFotoClick(Sender: TObject);
begin
dialog.Execute();
img.Picture.LoadFromFile(dialog.filename);
alterou := true;  //Verifica se a imagem foi alterada
end;


procedure TFrmCadMembros.btnDeletarClick(Sender: TObject);
begin
if Messagedlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   associarCampos;
    DM.QueryMembro.Close;
    DM.QueryMembro.SQL.Clear;
    DM.QueryMembro.SQL.Add('delete from TBL_MEMBROS where ID = :ID');

    DM.QueryMembro.ParamByName('ID').Value := editCod.Text;
    DM.QueryMembro.ExecSql;
    buscarTudo;
    MessageDlg('Excluido com Sucesso!!', mtInformation, mbOKCancel, 0);

    DM.TBL_MEMBROS.Active := false;// destativa a table (solução para atualiza grid em tempo de execução)
    DM.TBL_MEMBROS.Active := true; //reativa a table

    EditNOME.Enabled := false;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnNovo.Enabled := true;
  end;
end;

procedure TFrmCadMembros.btnEditarClick(Sender: TObject);
begin
if (editNome.Text <> '') then
    begin
    associarCampos;
    dm.TBL_MEMBROS.Edit;

    DM.QueryMembro.Close;
    dm.QueryMembro.SQL.Clear;

    if alterou = false then
    begin
    dm.QueryMembro.SQL.Add('update TBL_MEMBROS set NOME = :NOME, ENDERECO = :ENDERECO, numero = :numero, bairro = :bairro, cidade = :cidade, estado = :estado, cep = :cep,'+
    'complemento = :complemento, telpessoal = :telpessoal, contato1 = :contato1,'+
    'contato2 = :contato2, email = :email, dizimista = :dizimista, valor = :valor, grupo = :grupo,'+
    'sexo = :sexo, estado_civil = :estado_civil, ministerio = :ministerio,'+
    'profissao = :profissao, grau_escolaridade = :grau_escolaridade, batizado = :batizado,'+
    'rg = :rg, cpf = :cpf, nome_pai = :nome_pai, nome_mae = :nome_mae, data_batismo = :data_batismo,'+
    'data_admissao = :data_admissao, pais_origem = :pais_origem,'+
    'telefone_pais_origem = :telefone_pais_origem, data_casamento = :data_casamento,'+
    'ativo = :ativo, igreja_batismo = :igreja_batismo, data_consagracao = :data_consagracao,'+
    'naturalidade = :naturalidade, titulo_eleitor = :titulo_eleitor,'+
    'filhos = :filhos, validade_carteira = :validade_carteira, tag = :tag, conjuge = :conjuge,'+
    'tipo_moradia = :tipo_moradia, historico = :historico, tratamento = :tratamento,'+
    'nasc_conjuge = :nasc_conjuge, cidade_batismo = :cidade_batismo, data_nasc = :data_nasc,'+
    'campo13 = :campo13, campo15 = :campo15, obs = :obs where id = :id');
    end
    else
    begin
    dm.QueryMembro.SQL.Add('update TBL_MEMBROS set NOME = :NOME, ENDERECO = :ENDERECO, numero = :numero, bairro = :bairro, cidade = :cidade, estado = :estado, cep = :cep,'+
    'complemento = :complemento, telpessoal = :telpessoal, contato1 = :contato1,'+
    'contato2 = :contato2, email = :email, dizimista = :dizimista, valor = :valor, grupo = :grupo,'+
    'sexo = :sexo, estado_civil = :estado_civil, ministerio = :ministerio,'+
    'profissao = :profissao, grau_escolaridade = :grau_escolaridade, batizado = :batizado,'+
    'rg = :rg, cpf = :cpf, nome_pai = :nome_pai, nome_mae = :nome_mae, data_batismo = :data_batismo,'+
    'data_admissao = :data_admissao, pais_origem = :pais_origem,'+
    'telefone_pais_origem = :telefone_pais_origem, data_casamento = :data_casamento,'+
    'ativo = :ativo, igreja_batismo = :igreja_batismo, data_consagracao = :data_consagracao,'+
    'naturalidade = :naturalidade, titulo_eleitor = :titulo_eleitor,'+
    'filhos = :filhos, validade_carteira = :validade_carteira, tag = :tag, conjuge = :conjuge,'+
    'tipo_moradia = :tipo_moradia, historico = :historico, tratamento = :tratamento,'+
    'nasc_conjuge = :nasc_conjuge, cidade_batismo = :cidade_batismo, data_nasc = :data_nasc,'+
    'campo13 = :campo13, campo15 = :campo15, obs = :obs , imagem = :imagem  where id = :id');

    imgMembro := TPicture.Create;
    imgMembro.LoadFromFile(dialog.FileName);
    dm.QueryMembro.ParamByName('imagem').Assign(imgMembro);
    imgMembro.Free;
    alterou := false;
    end;

    dm.QueryMembro.ParamByName('NOME').Value := EditNOME.Text;
    dm.QueryMembro.ParamByName('ENDERECO').Value := EditENDERECO.Text;
    dm.QueryMembro.ParamByName('NUMERO').Value := EditNUMERO.Text;
    dm.QueryMembro.ParamByName('BAIRRO').Value := EditBAIRRO.Text;
    dm.QueryMembro.ParamByName('CIDADE').Value := EditCIDADE.Text;
    dm.QueryMembro.ParamByName('ESTADO').Value := EditESTADO.Text;
    dm.QueryMembro.ParamByName('CEP').Value := EditCEP.Text;
    dm.QueryMembro.ParamByName('COMPLEMENTO').Value := EditCOMPLEMENTO.Text;
    dm.QueryMembro.ParamByName('TELPESSOAL').Value := EditTELPESSOAL.Text;
    dm.QueryMembro.ParamByName('CONTATO1').Value := EditCONTATO1.Text;
    dm.QueryMembro.ParamByName('CONTATO2').Value := EditCONTATO2.Text;
    dm.QueryMembro.ParamByName('EMAIL').Value := EditEMAIL.Text;
    dm.QueryMembro.ParamByName('SEXO').Value := EditSEXO.Text;
    dm.QueryMembro.ParamByName('ESTADO_CIVIL').Value := cbEstCivil.Text;
    dm.QueryMembro.ParamByName('PROFISSAO').Value := cbPROFISSOES.Text;
    dm.QueryMembro.ParamByName('RG').Value := EditRG.Text;
    dm.QueryMembro.ParamByName('CPF').Value := EditCPF.Text;
    dm.QueryMembro.ParamByName('TITULO_ELEITOR').Value := EditTITULO_ELEITOR.Text;
    dm.QueryMembro.ParamByName('NOME_PAI').Value := EditNOMEPAI.Text;
    dm.QueryMembro.ParamByName('NOME_MAE').Value := EditNOMEMAE.Text;
    dm.QueryMembro.ParamByName('TITULO_ELEITOR').Value := EditTITULO_ELEITOR.Text;
    dm.QueryMembro.ParamByName('NATURALIDADE').Value := EditNATURALIDADE.Text;
    dm.QueryMembro.ParamByName('DATA_CASAMENTO').Value := Date;                      //Data
    dm.QueryMembro.ParamByName('FILHOS').Value := EditFILHOS.Text;
    dm.QueryMembro.ParamByName('CONJUGE').Value := EditCONJUGE.Text;
    dm.QueryMembro.ParamByName('NASC_CONJUGE').Value := Date;                        //Data
    dm.QueryMembro.ParamByName('GRAU_ESCOLARIDADE').Value := EditESCOLARIDADE.Text;
    dm.QueryMembro.ParamByName('DIZIMISTA').Value := EditDIZIMISTA.Text;
    dm.QueryMembro.ParamByName('VALOR').Value := EditVALOR.Text;
    dm.QueryMembro.ParamByName('GRUPO').Value := EditGRUPO.Text;
    dm.QueryMembro.ParamByName('TRATAMENTO').Value := EditTRATAMENTO.Text;
    //Formatando data para inserir no DB
    dm.QueryMembro.ParamByName('DATA_NASC').Value:= StrToDateTime('08/11/2020');
    dm.QueryMembro.ParamByName('OBS').Value := EditOBSERVACAO.Text;
    dm.QueryMembro.ParamByName('MINISTERIO').Value := EditMINISTERIO.Text;
    dm.QueryMembro.ParamByName('BATIZADO').Value := EditBATIZADO.Text;
    dm.QueryMembro.ParamByName('DATA_BATISMO').Value := EditDATABATISMO.Text;
    dm.QueryMembro.ParamByName('DATA_ADMISSAO').Value := EditDATAADMISSAO.Text;
    dm.QueryMembro.ParamByName('VALIDADE_CARTEIRA').Value := EditVALIDADECARTEIRA.Text;
    dm.QueryMembro.ParamByName('TELEFONE_PAIS_ORIGEM').Value := EditTELPAISORIG.Text;
    dm.QueryMembro.ParamByName('PAIS_ORIGEM').Value := EditPAISORIGEM.Text;
    dm.QueryMembro.ParamByName('IGREJA_BATISMO').Value := EditIGREJABATISMO.Text;
    dm.QueryMembro.ParamByName('CIDADE_BATISMO').Value := EditCIDADEBATISMO.Text;
    dm.QueryMembro.ParamByName('DATA_CONSAGRACAO').Value := Date;                    //Data
    dm.QueryMembro.ParamByName('TIPO_MORADIA').Value := EditTIPOMORADA.Text;

    dm.QueryMembro.ParamByName('id').Value := editCod.Text;
    dm.QueryMembro.ExecSql;

    MessageDlg('Editado com Sucesso!!', mtInformation, mbOKCancel, 0);
    buscarTudo;
    desabilitarCampos;
    limparCampos;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnNovo.Enabled := true;
    end
    else
    begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
    end;
end;

procedure TFrmCadMembros.btnNovoClick(Sender: TObject);
begin
//limparCampos;
habilitarCampos;
EditNOME.SetFocus;    //Coloca o foco no EditNome após Habilita campos
DM.Tbl_Membros.Insert;
BtnSalvar.Enabled := true;
//BtnAdd.Enabled := true;
btnNovo.Enabled := false;
btnEditar.Enabled := false;
btnDeletar.Enabled := false;
DBGMEMBRO.Enabled := false;
end;

procedure TFrmCadMembros.BtnSalvarClick(Sender: TObject);
begin
if (EditNOME.Text <> '') then
  begin
  associarCampos;
  salvarFoto;
  DM.TBL_MEMBROS.Post;
  MessageDlg('Salvo com Sucesso!!', mtInformation, mbOKCancel, 0);
  buscarTudo;
  limparCampos;
  desabilitarCampos;
  btnSalvar.Enabled := false;
  btnNovo.Enabled := true;
  btnEditar.Enabled := false;
  btnDeletar.Enabled := false;
  DBGMEMBRO.Enabled := true;
  end
  else
  begin
  MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
  end;
end;

procedure TFrmCadMembros.buscarNome;
begin
dm.QueryMembro.Close;
dm.QueryMembro.SQL.Clear;
dm.QueryMembro.SQL.Add('select * from TBL_MEMBROS where nome LIKE :nome order by nome asc');
dm.QueryMembro.ParamByName('nome').Value := edtBuscar.Text + '%';
dm.QueryMembro.Open;
end;

procedure TFrmCadMembros.buscarTudo;
begin
DM.QueryMembro.Close;
DM.QueryMembro.SQL.Clear;
DM.QueryMembro.SQL.Add('select * from TBL_MEMBROS order by nome asc');
DM.QueryMembro.Open();
end;


procedure TFrmCadMembros.CarregaComboBoxProfissoes;
begin
if not dm.TBL_PROFISSOES.IsEmpty then
begin
  while not dm.TBL_PROFISSOES.Eof do
  begin
    cbPROFISSOES.Items.Add(dm.TBL_PROFISSOES.FieldByName('PROFISSAO').AsString);
    DM.TBL_PROFISSOES.Next;
  end;

end;

end;

procedure TFrmCadMembros.desabilitarCampos;
begin
EditCod.Enabled := false;
EditNOME.Enabled := false;
EditENDERECO.Enabled := false;
EditNUMERO.Enabled := false;
EditBAIRRO.Enabled := false;
EditCIDADE.Enabled := false;
EditESTADO.Enabled := false;
EditCEP.Enabled := false;
EditCOMPLEMENTO.Enabled := false;
EditTELPESSOAL.Enabled := false;
EditCONTATO1.Enabled := false;
EditCONTATO2.Enabled := false;
EditEMAIL.Enabled := false;
EditSEXO.Enabled := false;
cbEstCivil.Enabled := false;
cbPROFISSOES.Enabled := false;
EditRG.Enabled := false;
EditCPF.Enabled := false;
EditNOMEPAI.Enabled := false;
EditNOMEMAE.Enabled := false;
EditTITULO_ELEITOR.Enabled := false;
EditNATURALIDADE.Enabled := false;
EditDATACASAMENTO.Enabled := false;
EditFILHOS.Enabled := false;
EditCONJUGE.Enabled := false;
EditNASC_CONJUGE.Enabled := false;
EditESCOLARIDADE.Enabled := false;
EditDIZIMISTA.Enabled := false;
EditVALOR.Enabled := false;
EditGRUPO.Enabled := false;
EditTRATAMENTO.Enabled := false;
EditNASCMEMBRO.Enabled := false;
EditOBSERVACAO.Enabled := false;
EditMINISTERIO.Enabled := false;
EditBATIZADO.Enabled := false;
EditDATABATISMO.Enabled := false;
EditDATAADMISSAO.Enabled := false;
EditVALIDADECARTEIRA.Enabled := false;
EditTELPAISORIG.Enabled := false;
EditPAISORIGEM.Enabled := false;
EditIGREJABATISMO.Enabled := false;
EditCIDADEBATISMO.Enabled := false;
EditDATACONSAGRACAO.Enabled := false;
EditTIPOMORADA.Enabled := false;
end;

 procedure TFrmCadMembros.EdtBuscarChange(Sender: TObject);
begin
buscarNome;
end;

procedure TFrmCadMembros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
limparCampos;
desabilitarCampos;

Close;
end;

procedure TFrmCadMembros.FormShow(Sender: TObject);
begin
DM.TBL_MEMBROS.Active := false;
DM.TBL_MEMBROS.Active := true;

DM.TBL_PROFISSOES.Active := false;
DM.TBL_PROFISSOES.Active := true;

buscarTudo;
CarregaComboBoxProfissoes;

btnSalvar.Enabled := false;
btnEditar.Enabled := false;
btnDeletar.Enabled := false;
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

procedure TFrmCadMembros.GridMembrosCellClick(Column: TColumn);
begin
DM.TBL_MEMBROS.Edit;
btnEditar.Enabled := true;
btnDeletar.Enabled := true;
habilitarCampos;


 if DM.TBL_MEMBROS.FieldByName('NOME').Value <> null then
EditNOME.Text := DM.TBL_MEMBROS.FieldByName('NOME').Value;

 if dm.TBL_MEMBROS.FieldByName('endereco').Value <> null then
EditENDERECO.Text := dm.TBL_MEMBROS.FieldByName('endereco').Value;

 if dm.TBL_MEMBROS.FieldByName('bairro').Value <> null then
editBAIRRO.Text := dm.TBL_MEMBROS.FieldByName('bairro').Value;

 if dm.TBL_MEMBROS.FieldByName('cidade').Value <> null then
editCIDADE.Text := dm.TBL_MEMBROS.FieldByName('cidade').Value;

 if dm.TBL_MEMBROS.FieldByName('estado').Value <> null then
editESTADO.Text := dm.TBL_MEMBROS.FieldByName('estado').Value;

 if dm.TBL_MEMBROS.FieldByName('cep').Value <> null then
editCEP.Text := dm.TBL_MEMBROS.FieldByName('cep').Value;

 if dm.TBL_MEMBROS.FieldByName('complemento').Value <> null then
editCOMPLEMENTO.Text := dm.TBL_MEMBROS.FieldByName('complemento').Value;

if dm.TBL_MEMBROS.FieldByName('telpessoal').Value <> null then
EditTELPESSOAL.Text := dm.TBL_MEMBROS.FieldByName('telpessoal').Value;

 if dm.TBL_MEMBROS.FieldByName('contato1').Value <> null then
editCONTATO1.Text := dm.TBL_MEMBROS.FieldByName('contato1').Value;

 if dm.TBL_MEMBROS.FieldByName('contato2').Value <> null then
editCONTATO2.Text := dm.TBL_MEMBROS.FieldByName('contato2').Value;

 if dm.TBL_MEMBROS.FieldByName('email').Value <> null then
editEMAIL.Text := dm.TBL_MEMBROS.FieldByName('email').Value;

 if dm.TBL_MEMBROS.FieldByName('dizimista').Value <> null then
editDIZIMISTA.Text := dm.TBL_MEMBROS.FieldByName('dizimista').Value;

 if dm.TBL_MEMBROS.FieldByName('valor').Value <> null then
editVALOR.Text := dm.TBL_MEMBROS.FieldByName('valor').Value;

 if dm.TBL_MEMBROS.FieldByName('grupo').Value <> null then
editGRUPO.Text := dm.TBL_MEMBROS.FieldByName('grupo').Value;

 if dm.TBL_MEMBROS.FieldByName('tratamento').Value <> null then
editTRATAMENTO.Text := dm.TBL_MEMBROS.FieldByName('tratamento').Value;

 if dm.TBL_MEMBROS.FieldByName('obs').Value <> null then
editOBSERVACAO.Text := dm.TBL_MEMBROS.FieldByName('obs').Value;

 if dm.TBL_MEMBROS.FieldByName('sexo').Value <> null then
editSEXO.Text := dm.TBL_MEMBROS.FieldByName('sexo').Value;

 if dm.TBL_MEMBROS.FieldByName('estado_civil').Value <> null then
cbEstCivil.Text := dm.TBL_MEMBROS.FieldByName('estado_civil').Value;

 if dm.TBL_MEMBROS.FieldByName('ministerio').Value <> null then
editMINISTERIO.Text := dm.TBL_MEMBROS.FieldByName('ministerio').Value;

 if dm.TBL_MEMBROS.FieldByName('profissao').Value <> null then
cbPROFISSOES.Text := dm.TBL_MEMBROS.FieldByName('profissao').Value;

 if dm.TBL_MEMBROS.FieldByName('grau_escolaridade').Value <> null then
editESCOLARIDADE.Text := dm.TBL_MEMBROS.FieldByName('grau_escolaridade').Value;

 if dm.TBL_MEMBROS.FieldByName('batizado').Value <> null then
editBATIZADO.Text := dm.TBL_MEMBROS.FieldByName('batizado').Value;

 if dm.TBL_MEMBROS.FieldByName('rg').Value <> null then
editRG.Text := dm.TBL_MEMBROS.FieldByName('rg').Value;

 if dm.TBL_MEMBROS.FieldByName('cpf').Value <> null then
editCPF.Text := dm.TBL_MEMBROS.FieldByName('cpf').Value;

 if dm.TBL_MEMBROS.FieldByName('nome_pai').Value <> null then
editNOMEPAI.Text := dm.TBL_MEMBROS.FieldByName('nome_pai').Value;

 if dm.TBL_MEMBROS.FieldByName('nome_mae').Value <> null then
editNOMEMAE.Text := dm.TBL_MEMBROS.FieldByName('nome_mae').Value;

 if dm.TBL_MEMBROS.FieldByName('data_batismo').Value <> null then
EditDATABATISMO.Text := dm.TBL_MEMBROS.FieldByName('data_batismo').Value;

 if dm.TBL_MEMBROS.FieldByName('data_admissao').Value <> null then
EditDATAADMISSAO.Text := dm.TBL_MEMBROS.FieldByName('data_admissao').Value;

 if dm.TBL_MEMBROS.FieldByName('validade_carteira').Value <> null then
EditVALIDADECARTEIRA.Text := dm.TBL_MEMBROS.FieldByName('validade_carteira').Value;

 if dm.TBL_MEMBROS.FieldByName('pais_origem').Value <> null then
EditPAISORIGEM.Text := dm.TBL_MEMBROS.FieldByName('pais_origem').Value;

 if dm.TBL_MEMBROS.FieldByName('telefone_pais_origem').Value <> null then
EditTELPAISORIG.Text := dm.TBL_MEMBROS.FieldByName('telefone_pais_origem').Value;

 if dm.TBL_MEMBROS.FieldByName('data_casamento').Value <> null then
EditDATACASAMENTO.Text := dm.TBL_MEMBROS.FieldByName('data_casamento').Value;

 if dm.TBL_MEMBROS.FieldByName('ativo').Value <> null then
editATIVO.Text := dm.TBL_MEMBROS.FieldByName('ativo').Value;

 if dm.TBL_MEMBROS.FieldByName('igreja_batismo').Value <> null then
EditIGREJABATISMO.Text := dm.TBL_MEMBROS.FieldByName('igreja_batismo').Value;

 if dm.TBL_MEMBROS.FieldByName('data_consagracao').Value <> null then
EditDATACONSAGRACAO.Text := dm.TBL_MEMBROS.FieldByName('data_consagracao').Value;

 if dm.TBL_MEMBROS.FieldByName('naturalidade').Value <> null then
EditNATURALIDADE.Text := dm.TBL_MEMBROS.FieldByName('naturalidade').Value;

 if dm.TBL_MEMBROS.FieldByName('titulo_eleitor').Value <> null then
EditTITULO_ELEITOR.Text := dm.TBL_MEMBROS.FieldByName('titulo_eleitor').Value;

 if dm.TBL_MEMBROS.FieldByName('filhos').Value <> null then
EditFILHOS.Text := dm.TBL_MEMBROS.FieldByName('filhos').Value;

 if dm.TBL_MEMBROS.FieldByName('tag').Value <> null then
editTAG.Text := dm.TBL_MEMBROS.FieldByName('tag').Value;

 if dm.TBL_MEMBROS.FieldByName('conjuge').Value <> null then
editCONJUGE.Text := dm.TBL_MEMBROS.FieldByName('conjuge').Value;

 if dm.TBL_MEMBROS.FieldByName('cidade_batismo').Value <> null then
EditCIDADEBATISMO.Text := dm.TBL_MEMBROS.FieldByName('cidade_batismo').Value;

 if dm.TBL_MEMBROS.FieldByName('campo13').Value <> null then
editCAMPO13.Text := dm.TBL_MEMBROS.FieldByName('campo13').Value;

 if dm.TBL_MEMBROS.FieldByName('tipo_moradia').Value <> null then
EditTIPOMORADA.Text := dm.TBL_MEMBROS.FieldByName('tipo_moradia').Value;

 if dm.TBL_MEMBROS.FieldByName('campo15').Value <> null then
editCAMPO15.Text := dm.TBL_MEMBROS.FieldByName('campo15').Value;

 if dm.TBL_MEMBROS.FieldByName('historico').Value <> null then
MemoHISTORICO.Text := dm.TBL_MEMBROS.FieldByName('historico').Value;

 if dm.TBL_MEMBROS.FieldByName('nasc_conjuge').Value <> null then
EditNASC_CONJUGE.Text := dm.TBL_MEMBROS.FieldByName('nasc_conjuge').Value;

 if dm.TBL_MEMBROS.FieldByName('data_nasc').Value <> null then
EditNASCMEMBRO.Date := dm.TBL_MEMBROS.FieldByName('data_nasc').Value;

 if dm.TBL_MEMBROS.FieldByName('ID').Value <> null then
editCod.Text := DM.TBL_MEMBROS.FieldByName('ID').Value;

if dm.TBL_MEMBROS.FieldByName('imagem').Value <> null then
ExibeFoto(DM.TBL_MEMBROS, 'imagem', img);

end;

procedure TFrmCadMembros.habilitarCampos;
begin
editCod.Enabled := true;
EditNOME.Enabled := true;
EditENDERECO.Enabled := true;
EditNUMERO.Enabled := true;
EditBAIRRO.Enabled := true;
EditCIDADE.Enabled := true;
EditESTADO.Enabled := true;
EditCEP.Enabled := true;
EditCOMPLEMENTO.Enabled := true;
EditTELPESSOAL.Enabled := true;
EditCONTATO1.Enabled := true;
EditCONTATO2.Enabled := true;
EditEMAIL.Enabled := true;
EditSEXO.Enabled := true;
cbEstCivil.Enabled := true;
cbPROFISSOES.Enabled := true;
EditRG.Enabled := true;
EditCPF.Enabled := true;
EditNOMEPAI.Enabled := true;
EditNOMEMAE.Enabled := true;
EditTITULO_ELEITOR.Enabled := true;
EditNATURALIDADE.Enabled := true;
EditDATACASAMENTO.Enabled := true;
EditFILHOS.Enabled := true;
EditCONJUGE.Enabled := true;
EditNASC_CONJUGE.Enabled := true;
EditESCOLARIDADE.Enabled := true;
EditDIZIMISTA.Enabled := true;
EditVALOR.Enabled := true;
EditGRUPO.Enabled := true;
EditTRATAMENTO.Enabled := true;
EditNASCMEMBRO.Enabled := true;
EditOBSERVACAO.Enabled := true;
EditMINISTERIO.Enabled := true;
EditBATIZADO.Enabled := true;
EditDATABATISMO.Enabled := true;
EditDATAADMISSAO.Enabled := true;
EditVALIDADECARTEIRA.Enabled := true;
EditTELPAISORIG.Enabled := true;
EditPAISORIGEM.Enabled := true;
EditIGREJABATISMO.Enabled := true;
EditCIDADEBATISMO.Enabled := true;
EditDATACONSAGRACAO.Enabled := true;
EditTIPOMORADA.Enabled := true;
EditNOME.SetFocus; // Coloca o foco no edit nome Obs: o SetFocus precisa ser depois de habilitado o campo
// se adicionar antes vai dar erro devido ao delphi seguir linha a linha os paramentros

end;

procedure TFrmCadMembros.ImgSairClick(Sender: TObject);
begin
limparCampos;
desabilitarCampos;

Close;
end;

procedure TFrmCadMembros.limparCampos;
begin
EditCod.Text := '';
EditNOME.Text := '';
EditENDERECO.Text := '';
EditNUMERO.Text := '';
EditBAIRRO.Text := '';
EditCIDADE.Text := '';
EditESTADO.Text := '';           // <<<
EditCEP.Text := '';
EditCOMPLEMENTO.Text := '';
EditTELPESSOAL.Text := '';
EditCONTATO1.Text := '';
EditCONTATO2.Text :='';
EditEMAIL.Text := '';
EditSEXO.Text := '';           // <<<
cbEstCivil.Text := '';            // <<<
cbPROFISSOES.Text := '';       // <<<
EditRG.Text := '';
EditCPF.Text := '';
EditNOMEPAI.Text := '';
EditNOMEMAE.Text := '';
EditTITULO_ELEITOR.Text := '';
EditNATURALIDADE.Text := '';
EditDATACASAMENTO.Text := '';
EditFILHOS.Text := '';
EditCONJUGE.Text := '';
EditNASC_CONJUGE.Text := '';
EditESCOLARIDADE.Text := '';    // <<<
EditDIZIMISTA.Text := '';
EditVALOR.Text := '';
EditGRUPO.Text := '';           // <<<
EditTRATAMENTO.Text := '';      // <<<
//EditNASCMEMBRO.Date := '';
EditOBSERVACAO.Text := '';
EditMINISTERIO.Text := '';      // <<<
EditBATIZADO.Text := '';
EditDATABATISMO.Text := '';
EditDATAADMISSAO.Text := '';
EditVALIDADECARTEIRA.Text := '';
EditTELPAISORIG.Text := '';
EditPAISORIGEM.Text := '';
EditIGREJABATISMO.Text := '';
EditCIDADEBATISMO.Text := '';
EditDATACONSAGRACAO.Text := '';
EditTIPOMORADA.Text := '';
carregarImagemPadrao();

end;

procedure TFrmCadMembros.salvarFoto;
begin
 if dialog.FileName <> '' then
  begin
  imgMembro := TPicture.Create;
  imgMembro.LoadFromFile(dialog.FileName);
  DM.Tbl_Membros.FieldByName('imagem').Assign(imgMembro);
  imgMembro.Free;
  dialog.FileName := GetCurrentDir + '\img\sem-foto.jpg';
  alterou := false;
  end
  else
    begin
  dm.Tbl_Membros.FieldByName('imagem').Value := GetCurrentDir + '\img\sem-foto.jpg';

  end;
end;


procedure TFrmCadMembros.SpeedButton1Click(Sender: TObject);
begin
limparCampos;
desabilitarCampos;

Close;
end;

procedure TFrmCadMembros.carregarImagemPadrao;
begin
    caminhoImg  := GetCurrentDir + '\img\sem-foto.jpg';
    img.Picture.LoadFromFile(caminhoImg);
end;
end.
