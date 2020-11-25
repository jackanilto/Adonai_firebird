unit UTratamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmTRATAMENTOS = class(TForm)
    GridGrupos: TDBGrid;
    EditCOD: TEdit;
    EditGRUPOS: TEdit;
    Label1: TLabel;
    btnNovo: TBitBtn;
    BtnSalvar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTRATAMENTOS: TFrmTRATAMENTOS;

implementation

{$R *.dfm}

uses UCadMembro, UDM, UGrupos, ULogin, UPrincipal, UProfissoes;

end.
