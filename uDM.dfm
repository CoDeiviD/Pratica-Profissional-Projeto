object DM: TDM
  OldCreateOrder = False
  Height = 530
  Width = 581
  object FDBanco: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'Database=C:\DB\LIGEIRINHO.FDB'
      'Pooled=True'
      'DriverID=FB')
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
    SQL.Strings = (
      'select * from Paises')
    Left = 264
    Top = 8
  end
  object DsPaises: TDataSource
    DataSet = qPaises
    Left = 344
    Top = 8
  end
  object qEstados: TFDQuery
    Connection = FDBanco
    SQL.Strings = (
      'select * from Estados')
    Left = 264
    Top = 64
  end
  object DsEstados: TDataSource
    DataSet = qEstados
    Left = 344
    Top = 64
  end
  object qCidades: TFDQuery
    Connection = FDBanco
    SQL.Strings = (
      'select * from Cidades')
    Left = 264
    Top = 120
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
    SQL.Strings = (
      'select * from Clientes')
    Left = 264
    Top = 168
  end
  object qForns: TFDQuery
    Connection = FDBanco
    SQL.Strings = (
      'select * from Fornecedores')
    Left = 264
    Top = 216
  end
  object qFuncs: TFDQuery
    Connection = FDBanco
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
    SQL.Strings = (
      'select * from ContasPgr')
    Left = 264
    Top = 328
  end
  object qContRcb: TFDQuery
    Connection = FDBanco
    SQL.Strings = (
      'select * from ContasRcb')
    Left = 264
    Top = 384
  end
  object qProdutos: TFDQuery
    Connection = FDBanco
    SQL.Strings = (
      'select * from Produtos')
    Left = 264
    Top = 432
  end
  object qCaixas: TFDQuery
    Connection = FDBanco
    SQL.Strings = (
      'select * from Caixas')
    Left = 264
    Top = 480
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
end
