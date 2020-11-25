unit UCadMembro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtDlgs, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadMembro = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PageContImg: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    EditID: TEdit;
    EditNOME: TEdit;
    btnSalvar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnDeletar: TSpeedButton;
    img: TImage;
    dialog: TOpenPictureDialog;
    btnAdd: TButton;
    grid: TDBGrid;
    editBuscar: TEdit;
    LabelBuscar: TLabel;
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure gridCellClick(Column: TColumn);
    procedure editBuscarChange(Sender: TObject);
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
    procedure carregarComboboxFilial();
    procedure carregarComboboxMatriz();
    procedure carregarComboboxFuncoes();
    procedure carregarImagemPadrao();
    procedure salvarFoto();
    procedure carregarComboboxIgrejas();
  end;

var
  FrmCadMembro: TFrmCadMembro;
  caminhoImg: string;
  imgPessoa: TPicture;
  alterou: boolean;


implementation

{$R *.dfm}

uses UDM;

{ TFrmCadMembro }

procedure TFrmCadMembro.associarCampos;
begin
 DM.TBL_MEMBROS.FieldByName('NOME').Value := EditNOME.Text;
end;

procedure TFrmCadMembro.btnAddClick(Sender: TObject);
begin
dialog.Execute();
img.Picture.LoadFromFile(dialog.filename);
alterou := true;
end;

procedure TFrmCadMembro.btnDeletarClick(Sender: TObject);
begin
if Messagedlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
   associarCampos;
    DM.QueryMembro.Close;
    DM.QueryMembro.SQL.Clear;
    dm.QueryMembro.SQL.Add('delete from TBL_MEMBROS where id = :id');

    dm.QueryMembro.ParamByName('id').Value := editID.Text;
    dm.QueryMembro.ExecSql;
     MessageDlg('Excluido com Sucesso!!', mtInformation, mbOKCancel, 0);
    buscarTudo;
    desabilitarCampos;
    btnSalvar.Enabled := false;
    btnEditar.Enabled := false;
    btnDeletar.Enabled := false;
    btnNovo.Enabled := true;
  end;
end;

procedure TFrmCadMembro.btnEditarClick(Sender: TObject);
begin
if (EditNOME.Text <> '')  then
    begin
    associarCampos;
    DM.TBL_MEMBROS.Edit;

    dm.QueryMembro.Close;
    dm.QueryMembro.SQL.Clear;

    if alterou = false then
    begin
    dm.QueryMembro.SQL.Add('update TBL_MEMBROS set nome = :nome where id = :id');
    end
    else
    begin
    dm.QueryMembro.SQL.Add('update TBL_MEMBROS set nome = :nome imagem = :imagem where id = :id');
    imgPessoa := TPicture.Create;
    imgPessoa.LoadFromFile(dialog.FileName);
    dm.QueryMembro.ParamByName('imagem').Assign(imgPessoa);
    imgPessoa.Free;
    alterou := false;
    end;


    dm.QueryMembro.ParamByName('nome').Value := EditNOME.Text;

    dm.QueryMembro.ParamByName('id').Value := EditID.Text;
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

procedure TFrmCadMembro.btnNovoClick(Sender: TObject);
begin
limparCampos;
habilitarCampos;
DM.TBL_MEMBROS.Insert;
BtnSalvar.Enabled := true;
btnNovo.Enabled := false;
btnAdd.Enabled := true;
btnEditar.Enabled := false;
btnDeletar.Enabled := false;
grid.Enabled := false;
end;

procedure TFrmCadMembro.btnSalvarClick(Sender: TObject);
begin
if (editNome.Text <> '') then
  begin
  associarCampos;
  salvarFoto;
  dm.TBL_MEMBROS.Post;
  MessageDlg('Salvo com Sucesso!!', mtInformation, mbOKCancel, 0);
  buscarTudo;
  desabilitarCampos;
  btnSalvar.Enabled := false;
  btnNovo.Enabled := true;
  btnEditar.Enabled := false;
  btnDeletar.Enabled := false;
  grid.Enabled := true;
  end
  else
  begin
  MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
  end;
end;

procedure TFrmCadMembro.buscarNome;
begin
dm.QueryMembro.Close;
dm.QueryMembro.SQL.Clear;
dm.QueryMembro.SQL.Add('select * from TBL_MEMBROS where nome LIKE :nome order by nome asc');
dm.QueryMembro.ParamByName('nome').Value := editBuscar.Text + '%';
dm.QueryMembro.Open;
end;

procedure TFrmCadMembro.buscarTudo;
begin
dm.QueryMembro.Close;
dm.QueryMembro.SQL.Clear;
dm.QueryMembro.SQL.Add('select * from TBL_MEMBROS order by nome asc');
dm.QueryMembro.Open;
end;

procedure TFrmCadMembro.carregarComboboxFilial;
begin

end;

procedure TFrmCadMembro.carregarComboboxFuncoes;
begin

end;

procedure TFrmCadMembro.carregarComboboxIgrejas;
begin

end;

procedure TFrmCadMembro.carregarComboboxMatriz;
begin

end;

procedure TFrmCadMembro.carregarImagemPadrao;
begin
    caminhoImg  := GetCurrentDir + '\img\sem-foto.jpg';
    img.Picture.LoadFromFile(caminhoImg);
end;

procedure TFrmCadMembro.desabilitarCampos;
begin
limparcampos();
editNome.Enabled := false;

end;

procedure TFrmCadMembro.editBuscarChange(Sender: TObject);
begin
buscarNome;
end;

procedure TFrmCadMembro.FormShow(Sender: TObject);
begin

DM.TBL_MEMBROS.Active := false;
DM.TBL_MEMBROS.Active := true;

buscarTudo;
carregarComboboxFilial;
carregarComboboxMatriz;
carregarComboboxFuncoes;

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


procedure TFrmCadMembro.gridCellClick(Column: TColumn);
begin
dm.TBL_MEMBROS.Edit;
btnEditar.Enabled := true;
btnDeletar.Enabled := true;
btnAdd.Enabled := true;
habilitarCampos;

if dm.TBL_MEMBROS.FieldByName('nome').Value <> null then
editNome.Text := dm.TBL_MEMBROS.FieldByName('nome').Value;

 if dm.TBL_MEMBROS.FieldByName('imagem').Value <> null then
 ExibeFoto(dm.TBL_MEMBROS, 'imagem', img);

end;

procedure TFrmCadMembro.habilitarCampos;
begin
limparcampos();
editNome.Enabled := true;
end;

procedure TFrmCadMembro.limparCampos;
begin
editNome.text := '';
end;

procedure TFrmCadMembro.salvarFoto;
begin
 if dialog.FileName <> '' then
  begin
  imgPessoa := TPicture.Create;
  imgPessoa.LoadFromFile(dialog.FileName);
  dm.TBL_MEMBROS.FieldByName('imagem').Assign(imgPessoa);
  imgPessoa.Free;
  dialog.FileName := GetCurrentDir + '\img\sem-foto.jpg';
  alterou := false;
  end
  else
    begin
  dm.TBL_MEMBROS.FieldByName('imagem').Value := GetCurrentDir + '\img\sem-foto.jpg';

  end;
end;

end.
