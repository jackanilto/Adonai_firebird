object FrmBUSCARMEMBRO: TFrmBUSCARMEMBRO
  Left = 0
  Top = 0
  Caption = 'Buscar Membro'
  ClientHeight = 230
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridBUSCAR: TDBGrid
    Left = 8
    Top = 83
    Width = 561
    Height = 137
    DataSource = DM.DSMembro
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGridBUSCARCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROLL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 380
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 23
    Top = 8
    Width = 178
    Height = 66
    Caption = 'Buscar por N'#186' de ROLL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object EditBUSCARROLL: TEdit
      Left = 16
      Top = 30
      Width = 145
      Height = 24
      TabOrder = 0
      OnChange = EditBUSCARROLLChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 279
    Top = 8
    Width = 226
    Height = 66
    Caption = 'Buscar por NOME'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object EditBUSCAR: TEdit
      Left = 16
      Top = 30
      Width = 197
      Height = 24
      TabOrder = 0
      OnChange = EditBUSCARChange
    end
  end
end
