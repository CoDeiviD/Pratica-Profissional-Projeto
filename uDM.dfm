object DM: TDM
  Height = 927
  Width = 609
  PixelsPerInch = 120
  object FDBanco: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1250'
      'Server=localhost'
      'Port=3050'
      'Database=C:\DB\LIGEIRINHO.FDB'
      'Protocol=TCPIP'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 30
    Top = 60
  end
  object FDTrans: TFDTransaction
    Connection = FDBanco
    Left = 140
    Top = 80
  end
  object qPaises: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Paises')
    Left = 330
    Top = 10
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
    Left = 430
    Top = 10
  end
  object qEstados: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Estados')
    Left = 330
    Top = 80
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
    Left = 430
    Top = 80
  end
  object qCidades: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Cidades')
    Left = 330
    Top = 150
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
    Left = 430
    Top = 150
  end
  object DsClientes: TDataSource
    DataSet = qClientes
    Left = 430
    Top = 210
  end
  object DsForns: TDataSource
    DataSet = qForns
    Left = 430
    Top = 270
  end
  object qClientes: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Clientes')
    Left = 330
    Top = 210
    object qClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
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
      Size = 11
    end
    object qClientesRG: TStringField
      FieldName = 'RG'
      Origin = 'RG'
      Required = True
      Size = 7
    end
    object qClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 9
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
      Required = True
      Size = 13
    end
    object qClientesMIDIA: TStringField
      FieldName = 'MIDIA'
      Origin = 'MIDIA'
      Size = 30
    end
    object qClientesCFS: TStringField
      FieldName = 'CFS'
      Origin = 'CFS'
      Size = 40
    end
    object qClientesCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qClientesCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Origin = 'CODCIDADE'
    end
  end
  object qForns: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Fornecedores')
    Left = 330
    Top = 270
    object qFornsNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 35
    end
    object qFornsRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Required = True
      Size = 21
    end
    object qFornsINSCRESTADUAL: TStringField
      FieldName = 'INSCRESTADUAL'
      Origin = 'INSCRESTADUAL'
      Required = True
      Size = 21
    end
    object qFornsCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      Size = 11
    end
    object qFornsCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 9
    end
    object qFornsENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 21
    end
    object qFornsEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 22
    end
    object qFornsTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      Size = 13
    end
    object qFornsCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Origin = 'CODFORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qFornsCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Origin = 'CODCIDADE'
    end
    object qFornsCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      Origin = 'CODPRODUTO'
    end
  end
  object qFuncs: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Funcionario')
    Left = 330
    Top = 340
  end
  object DSFuncs: TDataSource
    DataSet = qFuncs
    Left = 430
    Top = 340
  end
  object qContPgr: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from ContasPgr')
    Left = 330
    Top = 410
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
    Left = 330
    Top = 480
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
    Left = 330
    Top = 540
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
    Left = 330
    Top = 600
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
    Left = 430
    Top = 410
  end
  object DSContRcb: TDataSource
    DataSet = qContRcb
    Left = 430
    Top = 480
  end
  object DSProdutos: TDataSource
    DataSet = qProdutos
    Left = 430
    Top = 540
  end
  object DSCaixas: TDataSource
    DataSet = qCaixas
    Left = 430
    Top = 600
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    DriverID = 'FB'
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_4_0\fbclient.dll'
    Embedded = True
    Left = 120
    Top = 230
  end
  object FDIBValidate1: TFDIBValidate
    Left = 80
    Top = 410
  end
  object qCompras: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from Compras')
    Left = 328
    Top = 680
  end
  object qCondsPgto: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    Left = 328
    Top = 752
  end
  object DSCompras: TDataSource
    DataSet = qCompras
    Left = 432
    Top = 680
  end
  object DSCondsPgto: TDataSource
    DataSet = qCondsPgto
    Left = 432
    Top = 752
  end
  object DSVendas: TDataSource
    DataSet = qVendas
    Left = 432
    Top = 840
  end
  object qVendas: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    Left = 328
    Top = 840
  end
end
