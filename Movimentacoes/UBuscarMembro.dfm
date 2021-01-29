object FrmBUSCARMEMBRO: TFrmBUSCARMEMBRO
  Left = 0
  Top = 0
  Caption = 'Buscar Membro'
  ClientHeight = 335
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
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ROLL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 450
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COMPLEMENTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TELPESSOAL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CONTATO1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CONTATO2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DIZIMISTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'GRUPO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TRATAMENTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SEXO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ESTADO_CIVIL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MINISTERIO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'GRAU_ESCOLARIDADE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'BATIZADO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RG'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOME_PAI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOME_MAE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PAIS_ORIGEM'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TELEFONE_PAIS_ORIGEM'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ATIVO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IGREJA_BATISMO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NATURALIDADE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TITULO_ELEITOR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FILHOS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CONJUGE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CAMPO13'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TIPO_MORADIA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CAMPO15'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'HISTORICO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PROFISSAO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CIDADE_BATISMO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OBSERVACAO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATA_NASC'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATEBATISMO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATEVALCARTEIRA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATEADMISSAO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATECONSAGRA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATECASAMENTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATENASCCONJUGE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATA_BATISMO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IMAGEM'
        Visible = False
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
