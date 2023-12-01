object frmCadastroCompra: TfrmCadastroCompra
  Left = 0
  Top = 0
  Caption = 'Cadastro de Compra'
  ClientHeight = 715
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object lbModelo: TLabel
    Left = 8
    Top = 16
    Width = 46
    Height = 13
    Caption = 'Modelo  *'
  end
  object lbSerie: TLabel
    Left = 136
    Top = 16
    Width = 36
    Height = 13
    Caption = 'S'#233'rie  *'
  end
  object lbNumN: TLabel
    Left = 280
    Top = 16
    Width = 90
    Height = 13
    Caption = 'N'#250'mero da Nota  *'
  end
  object lbCodForn: TLabel
    Left = 424
    Top = 16
    Width = 45
    Height = 13
    Caption = 'C'#243'digo  *'
  end
  object lbDtEmis: TLabel
    Left = 8
    Top = 85
    Width = 79
    Height = 13
    Caption = 'Data de Emiss'#227'o'
  end
  object lbDtCheg: TLabel
    Left = 152
    Top = 85
    Width = 84
    Height = 13
    Caption = 'Data de Chegada'
  end
  object Label1: TLabel
    Left = 339
    Top = 141
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label2: TLabel
    Left = 427
    Top = 141
    Width = 70
    Height = 13
    Caption = 'Valor de Custo'
  end
  object Label3: TLabel
    Left = 535
    Top = 141
    Width = 45
    Height = 13
    Caption = 'Desconto'
  end
  object lbProduto: TLabel
    Left = 64
    Top = 141
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object lbFornecedor: TLabel
    Left = 484
    Top = 16
    Width = 67
    Height = 13
    Caption = 'Fornecedor  *'
  end
  object lbCodProduto: TLabel
    Left = 8
    Top = 141
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lbCondPgto: TLabel
    Left = 8
    Top = 437
    Width = 116
    Height = 13
    Caption = 'Condi'#231#227'o de Pagamento'
  end
  object lbDtCad: TLabel
    Left = 203
    Top = 656
    Width = 85
    Height = 13
    Caption = 'Data de Cadastro'
  end
  object lbDtUltAlt: TLabel
    Left = 331
    Top = 656
    Width = 78
    Height = 13
    Caption = #218'ltima Altera'#231#227'o'
  end
  object lbObrigadtorio: TLabel
    Left = 8
    Top = 678
    Width = 99
    Height = 13
    Caption = '* Campo Obrigat'#243'rio'
  end
  object edtModelo: TEdit
    Left = 8
    Top = 35
    Width = 105
    Height = 21
    TabOrder = 0
  end
  object edtSerie: TEdit
    Left = 136
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtNumN: TEdit
    Left = 280
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtCodForn: TEdit
    Left = 424
    Top = 35
    Width = 49
    Height = 21
    TabOrder = 3
  end
  object btnPesquisar: TButton
    Left = 622
    Top = 33
    Width = 75
    Height = 25
    Caption = '&Pesquisar'
    TabOrder = 4
  end
  object edtDtEmis: TEdit
    Left = 8
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edtDtCheg: TEdit
    Left = 152
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object edtQtde: TEdit
    Left = 339
    Top = 160
    Width = 70
    Height = 21
    TabOrder = 7
  end
  object edtVCusto: TEdit
    Left = 427
    Top = 160
    Width = 81
    Height = 21
    TabOrder = 8
  end
  object edtDesc: TEdit
    Left = 531
    Top = 160
    Width = 81
    Height = 21
    TabOrder = 9
  end
  object btnAdd: TButton
    Left = 622
    Top = 158
    Width = 75
    Height = 25
    Caption = '&Adicionar'
    TabOrder = 10
  end
  object LVProdCompra: TListView
    Left = 8
    Top = 203
    Width = 673
    Height = 209
    Columns = <
      item
        Caption = 'C'#243'digo'
      end
      item
        Caption = 'Nome Produto'
      end
      item
        Caption = 'Quantidade de Produtos'
      end
      item
        Caption = 'Valor de Custo'
      end
      item
        Caption = 'Desconto'
      end>
    TabOrder = 11
    ViewStyle = vsReport
  end
  object edtCodProduto: TEdit
    Left = 8
    Top = 160
    Width = 50
    Height = 21
    TabOrder = 12
  end
  object btnSalvar: TButton
    Left = 521
    Top = 681
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 13
    OnClick = btnSalvarClick
  end
  object btnSair: TButton
    Left = 625
    Top = 681
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 14
    OnClick = btnSairClick
  end
  object btnBuscar: TButton
    Left = 191
    Top = 158
    Width = 75
    Height = 25
    Caption = '&Buscar'
    TabOrder = 15
  end
  object edtForn: TEdit
    Left = 479
    Top = 35
    Width = 133
    Height = 21
    TabOrder = 16
  end
  object edtProduto: TEdit
    Left = 64
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 17
  end
  object edtCondPgto: TEdit
    Left = 8
    Top = 456
    Width = 121
    Height = 21
    TabOrder = 18
  end
  object LVCondPgto: TListView
    Left = 8
    Top = 500
    Width = 673
    Height = 150
    Columns = <
      item
        Caption = 'Prazo de parcelamento'
      end
      item
        Caption = 'Forma de Pagamento'
      end
      item
        Caption = 'Percentual (%)'
      end
      item
        Caption = 'Valor Total do Produto'
      end>
    TabOrder = 19
    ViewStyle = vsReport
  end
  object btnGerar: TButton
    Left = 161
    Top = 454
    Width = 75
    Height = 25
    Caption = '&Gerar'
    TabOrder = 20
    OnClick = btnGerarClick
  end
  object edtDtCad: TEdit
    Left = 211
    Top = 675
    Width = 65
    Height = 21
    TabOrder = 21
  end
  object edtDtUltAlt: TEdit
    Left = 339
    Top = 675
    Width = 70
    Height = 21
    TabOrder = 22
  end
end
