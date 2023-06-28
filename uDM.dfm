object DM: TDM
  OldCreateOrder = False
  Height = 530
  Width = 581
  object FDBanco: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'Database=C:\DB\LIGEIRINHO.FDB'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    LoginPrompt = False
    Left = 24
    Top = 48
  end
  object FDTrans: TFDTransaction
    Connection = FDBanco
    Left = 112
    Top = 64
  end
  object qPaises: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Paises')
    Left = 264
    Top = 8
    object qPaisesCODPAIS: TIntegerField
      DisplayLabel = 'C'#211'DIGO'
      FieldName = 'CODPAIS'
      Origin = 'CODPAIS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPaisesPAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Required = True
      Size = 55
    end
    object qPaisesSIGLA: TStringField
      FieldName = 'SIGLA'
      Origin = 'SIGLA'
      Size = 3
    end
    object qPaisesDDI: TStringField
      FieldName = 'DDI'
      Origin = 'DDI'
      Size = 4
    end
    object qPaisesMOEDA: TStringField
      FieldName = 'MOEDA'
      Origin = 'MOEDA'
      Size = 3
    end
  end
  object DsPaises: TDataSource
    DataSet = qPaises
    Left = 344
    Top = 8
  end
  object qEstados: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Estados')
    Left = 264
    Top = 64
    object qEstadosCODESTADO: TIntegerField
      FieldName = 'CODESTADO'
      Origin = 'CODESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qEstadosESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
      Size = 55
    end
    object qEstadosUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 3
    end
    object qEstadosCODPAIS: TIntegerField
      FieldName = 'CODPAIS'
      Origin = 'CODPAIS'
    end
  end
  object DsEstados: TDataSource
    DataSet = qEstados
    Left = 344
    Top = 64
  end
  object qCidades: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Cidades')
    Left = 264
    Top = 120
    object qCidadesCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Origin = 'CODCIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qCidadesCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 40
    end
    object qCidadesDDD: TStringField
      FieldName = 'DDD'
      Origin = 'DDD'
      Size = 3
    end
    object qCidadesCODESTADO: TIntegerField
      FieldName = 'CODESTADO'
      Origin = 'CODESTADO'
    end
  end
  object DsCidades: TDataSource
    DataSet = qCidades
    Left = 344
    Top = 120
  end
  object DsClientes: TDataSource
    DataSet = qClientes
    Left = 344
    Top = 168
  end
  object DsForns: TDataSource
    DataSet = qForns
    Left = 344
    Top = 216
  end
  object qClientes: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Clientes')
    Left = 264
    Top = 168
    object qClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object qClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 35
    end
    object qClientesDTNASC: TDateField
      FieldName = 'DTNASC'
      Origin = 'DTNASC'
    end
    object qClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
      Size = 11
    end
    object qClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 21
    end
    object qClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 22
    end
    object qClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 13
    end
    object qClientesQTDEGRUPO: TIntegerField
      FieldName = 'QTDEGRUPO'
      Origin = 'QTDEGRUPO'
      Required = True
    end
    object qClientesPAGOU: TBooleanField
      FieldName = 'PAGOU'
      Origin = 'PAGOU'
      Required = True
    end
  end
  object qForns: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Fornecedores')
    Left = 264
    Top = 216
  end
  object qFuncs: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Funcionario')
    Left = 264
    Top = 272
  end
  object DSFuncs: TDataSource
    DataSet = qFuncs
    Left = 344
    Top = 272
  end
  object qContPgr: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from ContasPgr')
    Left = 264
    Top = 328
    object qContPgrVALOR: TCurrencyField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
    object qContPgrDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
      Origin = 'DTVENCIMENTO'
    end
    object qContPgrDTPAGAMENTO: TDateField
      FieldName = 'DTPAGAMENTO'
      Origin = 'DTPAGAMENTO'
    end
    object qContPgrVPAGO: TCurrencyField
      FieldName = 'VPAGO'
      Origin = 'VPAGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qContPgrFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Size = 35
    end
  end
  object qContRcb: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from ContasRcb')
    Left = 264
    Top = 384
    object qContRcbVALOR: TCurrencyField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
    object qContRcbDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
      Origin = 'DTVENCIMENTO'
    end
    object qContRcbDTPAGAMENTO: TDateField
      FieldName = 'DTPAGAMENTO'
      Origin = 'DTPAGAMENTO'
    end
    object qContRcbVRECEB: TCurrencyField
      FieldName = 'VRECEB'
      Origin = 'VRECEB'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qContRcbCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 35
    end
  end
  object qProdutos: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Produtos')
    Left = 264
    Top = 432
    object qProdutosTPPRODUTO: TStringField
      FieldName = 'TPPRODUTO'
      Origin = 'TPPRODUTO'
      Required = True
      Size = 25
    end
    object qProdutosSABOR: TStringField
      FieldName = 'SABOR'
      Origin = 'SABOR'
      Required = True
      Size = 15
    end
    object qProdutosPRECO: TCurrencyField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Required = True
    end
  end
  object qCaixas: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Caixas')
    Left = 264
    Top = 480
    object qCaixasDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qCaixasHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Required = True
      Size = 45
    end
    object qCaixasENTRADA: TCurrencyField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
    end
    object qCaixasSAIDA: TCurrencyField
      FieldName = 'SAIDA'
      Origin = 'SAIDA'
    end
    object qCaixasSALDO: TCurrencyField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Required = True
    end
    object qCaixasSALDOTOTAL: TCurrencyField
      FieldName = 'SALDOTOTAL'
      Origin = 'SALDOTOTAL'
      Required = True
    end
  end
  object DSContPgr: TDataSource
    DataSet = qContPgr
    Left = 344
    Top = 328
  end
  object DSContRcb: TDataSource
    DataSet = qContRcb
    Left = 344
    Top = 384
  end
  object DSProdutos: TDataSource
    DataSet = qProdutos
    Left = 344
    Top = 432
  end
  object DSCaixas: TDataSource
    DataSet = qCaixas
    Left = 344
    Top = 480
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    DriverID = 'FB'
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_4_0\fbclient.dll'
    Left = 96
    Top = 184
  end
end
