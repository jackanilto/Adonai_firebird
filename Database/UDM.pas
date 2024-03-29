unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.Actions,
  Vcl.ActnList, frxClass, frxDBSet, Datasnap.DBClient, jpeg, Datasnap.Provider, MidasLib;

type
  TDM = class(TDataModule)
    FDConn: TFDConnection;
    WaitCursor: TFDGUIxWaitCursor;
    FBDriver: TFDPhysFBDriverLink;
    TblAcesso: TFDTable;
    DSAcesso: TDataSource;
    TblAcessoCODIGO: TIntegerField;
    TblAcessoUSUARIO: TStringField;
    TblAcessoSENHA: TStringField;
    TblAcessoMEMBROS: TStringField;
    TblAcessoTRATAMENTOS: TStringField;
    TblAcessoGRUPOS: TStringField;
    TblAcessoCADUSERS: TStringField;
    TblAcessoENTRADA: TStringField;
    TblAcessoSAIDA: TStringField;
    TblAcessoSO_CONSULTA: TStringField;
    TBL_MEMBROS: TFDTable;
    DSMembro: TDataSource;
    QueryMembro: TFDQuery;
    TBL_PROFISSOES: TFDTable;
    DSProfissoes: TDataSource;
    TBL_PROFISSOESID: TIntegerField;
    TBL_PROFISSOESPROFISSAO: TStringField;
    QueryProfissoes: TFDQuery;
    TBL_GRUPOS: TFDTable;
    DSGrupos: TDataSource;
    QueryGupos: TFDQuery;
    TBL_GRUPOSID: TIntegerField;
    TBL_GRUPOSNOME_GRUPO: TStringField;
    TBL_TRATAMENTOS: TFDTable;
    DSTratamentos: TDataSource;
    QueryTratamentos: TFDQuery;
    TBL_TRATAMENTOSID: TIntegerField;
    TBL_TRATAMENTOSTRATAMENTO: TStringField;
    QueryProfissoesID: TIntegerField;
    QueryProfissoesPROFISSAO: TStringField;
    QueryAcesso: TFDQuery;
    TBL_MEMBROSID: TIntegerField;
    TBL_MEMBROSNOME: TStringField;
    TBL_MEMBROSENDERECO: TStringField;
    TBL_MEMBROSNUMERO: TStringField;
    TBL_MEMBROSBAIRRO: TStringField;
    TBL_MEMBROSCIDADE: TStringField;
    TBL_MEMBROSESTADO: TStringField;
    TBL_MEMBROSCEP: TStringField;
    TBL_MEMBROSCOMPLEMENTO: TStringField;
    TBL_MEMBROSTELPESSOAL: TStringField;
    TBL_MEMBROSCONTATO1: TStringField;
    TBL_MEMBROSCONTATO2: TStringField;
    TBL_MEMBROSEMAIL: TStringField;
    TBL_MEMBROSDIZIMISTA: TStringField;
    TBL_MEMBROSGRUPO: TStringField;
    TBL_MEMBROSTRATAMENTO: TStringField;
    TBL_MEMBROSOBS: TStringField;
    TBL_MEMBROSSEXO: TStringField;
    TBL_MEMBROSESTADO_CIVIL: TStringField;
    TBL_MEMBROSMINISTERIO: TStringField;
    TBL_MEMBROSGRAU_ESCOLARIDADE: TStringField;
    TBL_MEMBROSBATIZADO: TStringField;
    TBL_MEMBROSRG: TStringField;
    TBL_MEMBROSCPF: TStringField;
    TBL_MEMBROSNOME_PAI: TStringField;
    TBL_MEMBROSNOME_MAE: TStringField;
    TBL_MEMBROSPAIS_ORIGEM: TStringField;
    TBL_MEMBROSTELEFONE_PAIS_ORIGEM: TStringField;
    TBL_MEMBROSATIVO: TStringField;
    TBL_MEMBROSNATURALIDADE: TStringField;
    TBL_MEMBROSTITULO_ELEITOR: TStringField;
    TBL_MEMBROSFILHOS: TStringField;
    TBL_MEMBROSCONJUGE: TStringField;
    TBL_MEMBROSCAMPO13: TStringField;
    TBL_MEMBROSTIPO_MORADIA: TStringField;
    TBL_MEMBROSCAMPO15: TStringField;
    TBL_MEMBROSHISTORICO: TStringField;
    TBL_MEMBROSPROFISSAO: TStringField;
    TBL_MEMBROSCIDADE_BATISMO: TStringField;
    TBL_MEMBROSOBSERVACAO: TStringField;
    TBL_MEMBROSVALOR: TStringField;
    TBL_MEMBROSROLL: TIntegerField;
    DSAniverMes: TDataSource;
    QueryAniverMes: TFDQuery;
    TBL_MEMBROSIGREJA_BATISMO: TStringField;
    TBL_MEMBROSDATA_NASC: TDateField;
    TBL_MEMBROSDATEBATISMO: TDateField;
    TBL_MEMBROSDATEVALCARTEIRA: TDateField;
    TBL_MEMBROSDATEADMISSAO: TDateField;
    TBL_MEMBROSDATECONSAGRA: TDateField;
    TBL_MEMBROSDATECASAMENTO: TDateField;
    TBL_MEMBROSDATENASCCONJUGE: TDateField;
    TBL_MEMBROSIMAGEM: TStringField;
    TBL_IGREJAS: TFDTable;
    DSIgrejas: TDataSource;
    QueryIgrejas: TFDQuery;
    TBL_IGREJASID: TIntegerField;
    TBL_IGREJASNOME_IGREJA: TStringField;
    TBL_IGREJASPASTA_IMG: TStringField;
    frxReportCarteira: TfrxReport;
    TBL_DIZIMOS: TFDTable;
    DSDIZIMOS: TDataSource;
    QueryDIZIMOS: TFDQuery;
    TBL_DIZIMOSID_DIZIMO: TIntegerField;
    TBL_DIZIMOSID: TIntegerField;
    TBL_DIZIMOSNOME: TStringField;
    TBL_DIZIMOSDATA: TStringField;
    TBL_DIZIMOSFORMA: TStringField;
    TBL_DIZIMOSOBS: TStringField;
    TBL_DIZIMOSTIPO: TStringField;
    TBL_DIZIMOSVALOR: TStringField;
    TBL_DIZIMOSROLL: TIntegerField;
    TBL_ANIVERSARIANTES: TFDTable;
    frxDBDSCarteira: TfrxDBDataset;
    DSCarteira2: TDataSource;
    CDSTempCarteira: TClientDataSet;
    CDSTempCarteiraID: TIntegerField;
    CDSTempCarteiraNOME: TStringField;
    CDSTempCarteiraTRATAMENTO: TStringField;
    CDSTempCarteiraNOME_PAI: TStringField;
    CDSTempCarteiraNOME_MAE: TStringField;
    CDSTempCarteiraTELPESSOAL: TStringField;
    CDSTempCarteiraCONJUGE: TStringField;
    CDSTempCarteiraDATA_NASC: TDateField;
    CDSTempCarteiraIMAGEM: TStringField;
    CDSTempCarteiraROLL: TIntegerField;
    DSCarteira: TDataSource;
    CDSCarteira: TClientDataSet;
    CDSCarteiraID: TIntegerField;
    CDSCarteiraNOME: TStringField;
    CDSCarteiraTELPESSOAL: TStringField;
    CDSCarteiraNOME_PAI: TStringField;
    CDSCarteiraNOME_MAE: TStringField;
    CDSCarteiraDATA_NASC: TStringField;
    CDSCarteiraTRATAMENTO: TStringField;
    CDSCarteiraCONJUGE: TStringField;
    CDSCarteiraROLL: TStringField;
    CDSCarteiraIMAGEM: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure QueryAniverMesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;
  MesFiltrado:string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ULogin, UProfissoes, UCadMembro;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
FDConn.Connected := true;
TBL_DIZIMOS.Active := true;
QueryDIZIMOS.Active := true;
//QueryAniverMes.Active := true;
end;

procedure TDM.QueryAniverMesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
  var
  dia, mes, ano : Word;
begin
  if QueryAniverMes.RecordCount = 0 then
  Abort else
  Accept := false;
  DecodeDate(QueryAniverMes.FieldByName('DATA_NASC').AsDateTime, dia, mes, ano);
  if mes = StrToInt (MesFiltrado) then
  Accept := true;
end;


end.
