object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 545
  Width = 928
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=C:\Adonai_firebird\Database\ADONIAFB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 840
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 840
    Top = 144
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Adonai_firebird\Firebird\fbclient.dll'
    Left = 840
    Top = 80
  end
  object TblAcesso: TFDTable
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_ACESSO'
    TableName = 'TBL_ACESSO'
    Left = 56
    Top = 32
    object TblAcessoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object TblAcessoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object TblAcessoSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 50
    end
    object TblAcessoMEMBROS: TStringField
      FieldName = 'MEMBROS'
      Origin = 'MEMBROS'
      Size = 3
    end
    object TblAcessoTRATAMENTOS: TStringField
      FieldName = 'TRATAMENTOS'
      Origin = 'TRATAMENTOS'
      Size = 3
    end
    object TblAcessoGRUPOS: TStringField
      FieldName = 'GRUPOS'
      Origin = 'GRUPOS'
      Size = 3
    end
    object TblAcessoCADUSERS: TStringField
      FieldName = 'CADUSERS'
      Origin = 'CADUSERS'
      Size = 3
    end
    object TblAcessoENTRADA: TStringField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      Size = 3
    end
    object TblAcessoSAIDA: TStringField
      FieldName = 'SAIDA'
      Origin = 'SAIDA'
      Size = 3
    end
    object TblAcessoSO_CONSULTA: TStringField
      FieldName = 'SO_CONSULTA'
      Origin = 'SO_CONSULTA'
      Size = 3
    end
  end
  object DSAcesso: TDataSource
    DataSet = QueryAcesso
    Left = 56
    Top = 88
  end
  object TBL_MEMBROS: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_MEMBROS'
    TableName = 'TBL_MEMBROS'
    Left = 144
    Top = 32
    object TBL_MEMBROSID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TBL_MEMBROSNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object TBL_MEMBROSENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 200
    end
    object TBL_MEMBROSNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 200
    end
    object TBL_MEMBROSBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 200
    end
    object TBL_MEMBROSCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 200
    end
    object TBL_MEMBROSESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 200
    end
    object TBL_MEMBROSCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 200
    end
    object TBL_MEMBROSCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 200
    end
    object TBL_MEMBROSCONTATO1: TStringField
      FieldName = 'CONTATO1'
      Origin = 'CONTATO1'
      Size = 200
    end
    object TBL_MEMBROSCONTATO2: TStringField
      FieldName = 'CONTATO2'
      Origin = 'CONTATO2'
      Size = 200
    end
    object TBL_MEMBROSEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 200
    end
    object TBL_MEMBROSDIZIMISTA: TStringField
      FieldName = 'DIZIMISTA'
      Origin = 'DIZIMISTA'
      Size = 200
    end
    object TBL_MEMBROSVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object TBL_MEMBROSGRUPO: TStringField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Size = 200
    end
    object TBL_MEMBROSTRATAMENTO: TStringField
      FieldName = 'TRATAMENTO'
      Origin = 'TRATAMENTO'
      Size = 200
    end
    object TBL_MEMBROSIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Origin = 'IMAGEM'
    end
    object TBL_MEMBROSSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Size = 193
    end
    object TBL_MEMBROSESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'ESTADO_CIVIL'
      Size = 200
    end
    object TBL_MEMBROSMINISTERIO: TStringField
      FieldName = 'MINISTERIO'
      Origin = 'MINISTERIO'
      Size = 200
    end
    object TBL_MEMBROSPOFISSAO: TStringField
      FieldName = 'POFISSAO'
      Origin = 'POFISSAO'
      Size = 200
    end
    object TBL_MEMBROSGRAU_ESCOLARIDADE: TStringField
      FieldName = 'GRAU_ESCOLARIDADE'
      Origin = 'GRAU_ESCOLARIDADE'
      Size = 200
    end
    object TBL_MEMBROSBATIZADO: TStringField
      FieldName = 'BATIZADO'
      Origin = 'BATIZADO'
      Size = 200
    end
    object TBL_MEMBROSRG: TStringField
      FieldName = 'RG'
      Origin = 'RG'
      Size = 200
    end
    object TBL_MEMBROSCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 200
    end
    object TBL_MEMBROSNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Origin = 'NOME_PAI'
      Size = 200
    end
    object TBL_MEMBROSNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Origin = 'NOME_MAE'
      FixedChar = True
      Size = 200
    end
    object TBL_MEMBROSDATA_BATISMO: TStringField
      FieldName = 'DATA_BATISMO'
      Origin = 'DATA_BATISMO'
      Size = 10
    end
    object TBL_MEMBROSDATA_ADMISSAO: TStringField
      FieldName = 'DATA_ADMISSAO'
      Origin = 'DATA_ADMISSAO'
      Size = 10
    end
    object TBL_MEMBROSPAIS_ORIGEM: TStringField
      FieldName = 'PAIS_ORIGEM'
      Origin = 'PAIS_ORIGEM'
      Size = 200
    end
    object TBL_MEMBROSTELEFONE_PAIS_ORIGEM: TStringField
      FieldName = 'TELEFONE_PAIS_ORIGEM'
      Origin = 'TELEFONE_PAIS_ORIGEM'
      Size = 200
    end
    object TBL_MEMBROSDATA_CASAMENTO: TStringField
      FieldName = 'DATA_CASAMENTO'
      Origin = 'DATA_CASAMENTO'
      Size = 10
    end
    object TBL_MEMBROSATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 200
    end
    object TBL_MEMBROSIGREJA_BATISMO: TStringField
      FieldName = 'IGREJA_BATISMO'
      Origin = 'IGREJA_BATISMO'
      Size = 200
    end
    object TBL_MEMBROSDATA_CONSAGRACAO: TStringField
      FieldName = 'DATA_CONSAGRACAO'
      Origin = 'DATA_CONSAGRACAO'
      Size = 10
    end
    object TBL_MEMBROSNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Origin = 'NATURALIDADE'
      Size = 200
    end
    object TBL_MEMBROSTITULO_ELEITOR: TStringField
      FieldName = 'TITULO_ELEITOR'
      Origin = 'TITULO_ELEITOR'
      Size = 200
    end
    object TBL_MEMBROSFILHOS: TStringField
      FieldName = 'FILHOS'
      Origin = 'FILHOS'
      Size = 200
    end
    object TBL_MEMBROSVALIDADE_CARTEIRA: TStringField
      FieldName = 'VALIDADE_CARTEIRA'
      Origin = 'VALIDADE_CARTEIRA'
      Size = 10
    end
    object TBL_MEMBROSTAG: TStringField
      FieldName = 'TAG'
      Origin = 'TAG'
      Size = 200
    end
    object TBL_MEMBROSCONJUGE: TStringField
      FieldName = 'CONJUGE'
      Origin = 'CONJUGE'
      Size = 200
    end
    object TBL_MEMBROSTIPO_MORADIA: TStringField
      FieldName = 'TIPO_MORADIA'
      Origin = 'TIPO_MORADIA'
      Size = 200
    end
    object TBL_MEMBROSHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 200
    end
    object TBL_MEMBROSPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
      Size = 200
    end
    object TBL_MEMBROSNASC_CONJUGE: TStringField
      FieldName = 'NASC_CONJUGE'
      Origin = 'NASC_CONJUGE'
      Size = 10
    end
    object TBL_MEMBROSCIDADE_BATISMO: TStringField
      FieldName = 'CIDADE_BATISMO'
      Origin = 'CIDADE_BATISMO'
      Size = 10
    end
    object TBL_MEMBROSDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
      Origin = 'DATA_NASC'
    end
    object TBL_MEMBROSCAMPO13: TStringField
      FieldName = 'CAMPO13'
      Origin = 'CAMPO13'
      Size = 200
    end
    object TBL_MEMBROSCAMPO15: TStringField
      FieldName = 'CAMPO15'
      Origin = 'CAMPO15'
      Size = 200
    end
    object TBL_MEMBROSOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 200
    end
    object TBL_MEMBROSOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 200
    end
    object TBL_MEMBROSTELPESSOAL: TStringField
      FieldName = 'TELPESSOAL'
      Origin = 'TELPESSOAL'
      Size = 200
    end
  end
  object DSMembro: TDataSource
    DataSet = QueryMembro
    Left = 145
    Top = 88
  end
  object QueryMembro: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select  *  from tbl_membros order by nome asc')
    Left = 144
    Top = 136
  end
  object TBL_PROFISSOES: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_PROFISSOES'
    TableName = 'TBL_PROFISSOES'
    Left = 248
    Top = 32
    object TBL_PROFISSOESID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object TBL_PROFISSOESPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
      Size = 50
    end
  end
  object DSProfissoes: TDataSource
    DataSet = QueryProfissoes
    Left = 248
    Top = 88
  end
  object QueryProfissoes: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from TBL_PROFISSOES')
    Left = 248
    Top = 136
    object QueryProfissoesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryProfissoesPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
      Size = 100
    end
  end
  object TBL_GRUPOS: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_GRUPOS'
    TableName = 'TBL_GRUPOS'
    Left = 336
    Top = 32
    object TBL_GRUPOSID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object TBL_GRUPOSNOME_GRUPO: TStringField
      DisplayLabel = 'NOME DO GRUPO'
      FieldName = 'NOME_GRUPO'
      Origin = 'NOME_GRUPO'
      Size = 50
    end
  end
  object DSGrupos: TDataSource
    DataSet = QueryGupos
    Left = 336
    Top = 88
  end
  object QueryGupos: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from TBL_GRUPOS ORDER BY NOME_GRUPO ASC')
    Left = 336
    Top = 136
  end
  object TBL_TRATAMENTOS: TFDTable
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_TRATAMENTOS'
    TableName = 'TBL_TRATAMENTOS'
    Left = 448
    Top = 32
    object TBL_TRATAMENTOSID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object TBL_TRATAMENTOSTRATAMENTO: TStringField
      FieldName = 'TRATAMENTO'
      Origin = 'TRATAMENTO'
      Size = 50
    end
  end
  object DSTratamentos: TDataSource
    DataSet = QueryTratamentos
    Left = 448
    Top = 88
  end
  object QueryTratamentos: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from TBL_TRATAMENTOS ORDER by TRATAMENTO ASC')
    Left = 448
    Top = 136
  end
  object QueryAcesso: TFDQuery
    Connection = FDConn
    Left = 56
    Top = 136
  end
  object TBL_ENTRA_SAI: TFDTable
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'TBL_ENTRADA_SAIDA'
    TableName = 'TBL_ENTRADA_SAIDA'
    Left = 64
    Top = 256
  end
  object DSEntSai: TDataSource
    DataSet = QueryEntSai
    Left = 64
    Top = 304
  end
  object QueryEntSai: TFDQuery
    Connection = FDConn
    Left = 64
    Top = 360
  end
end
