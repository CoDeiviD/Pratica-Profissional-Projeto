inherited FormCadastroProduto: TFormCadastroProduto
  Caption = 'Cadastro de Produto'
  ClientHeight = 420
  ClientWidth = 827
  TextHeight = 13
  object lbNomeProd: TLabel [4]
    Left = 144
    Top = 16
    Width = 92
    Height = 13
    Caption = 'Nome do Produto *'
  end
  object lbSabor: TLabel [5]
    Left = 424
    Top = 21
    Width = 28
    Height = 13
    Caption = 'Sabor'
  end
  object lbPreco: TLabel [6]
    Left = 595
    Top = 21
    Width = 36
    Height = 13
    Caption = 'Pre'#231'o *'
  end
  object lbQtde: TLabel [7]
    Left = 235
    Top = 253
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object lbVCusto: TLabel [8]
    Left = 323
    Top = 253
    Width = 70
    Height = 13
    Caption = 'Valor de Custo'
  end
  object lbDesconto: TLabel [9]
    Left = 431
    Top = 253
    Width = 45
    Height = 13
    Caption = 'Desconto'
  end
  inherited btnSalvar: TButton
    Caption = '&Salvar'
  end
  object edtNomeProd: TEdit
    Left = 136
    Top = 40
    Width = 257
    Height = 21
    TabOrder = 5
  end
  object edtSabor: TEdit
    Left = 424
    Top = 40
    Width = 145
    Height = 21
    TabOrder = 6
  end
  object edtPreco: TEdit
    Left = 595
    Top = 40
    Width = 105
    Height = 21
    TabOrder = 7
  end
  object edtQtde: TEdit
    Left = 235
    Top = 272
    Width = 70
    Height = 21
    TabOrder = 8
  end
  object edtVCusto: TEdit
    Left = 323
    Top = 272
    Width = 81
    Height = 21
    TabOrder = 9
  end
  object edtDesc: TEdit
    Left = 427
    Top = 272
    Width = 81
    Height = 21
    TabOrder = 10
  end
end
