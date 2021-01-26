unit UEntraSaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFormEntraSaida = class(TForm)
    DBGrid1: TDBGrid;
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
  FormEntraSaida: TFormEntraSaida;

implementation

{$R *.dfm}

uses UDM;

end.
