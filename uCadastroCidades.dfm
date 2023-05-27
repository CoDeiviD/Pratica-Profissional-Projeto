inherited FormCadastroCidades: TFormCadastroCidades
  Caption = 'Cadastro de Cidades'
  PixelsPerInch = 96
  TextHeight = 13
  object lbCidade: TLabel [1]
    Left = 104
    Top = 21
    Width = 42
    Height = 13
    Caption = 'Cidade *'
  end
  object lbDDD: TLabel [2]
    Left = 341
    Top = 21
    Width = 30
    Height = 13
    Caption = 'DDD *'
  end
  object lbCodEstado: TLabel [3]
    Left = 416
    Top = 24
    Width = 52
    Height = 13
    Caption = 'CodEstado'
  end
  object lbEstado: TLabel [4]
    Left = 496
    Top = 21
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  inherited btnSalvar: TButton
    OnExit = btnSalvarExit
  end
  object edtCidade: TEdit [11]
    Left = 104
    Top = 40
    Width = 217
    Height = 21
    TabOrder = 3
  end
  object edtDDD: TEdit [12]
    Left = 341
    Top = 40
    Width = 57
    Height = 21
    TabOrder = 4
  end
  object edtCodEstado: TEdit [13]
    Left = 416
    Top = 40
    Width = 57
    Height = 21
    TabOrder = 5
  end
  object edtEstado: TEdit [14]
    Left = 496
    Top = 40
    Width = 217
    Height = 21
    TabOrder = 6
  end
  object btnPesquisar: TButton [15]
    Left = 729
    Top = 38
    Width = 75
    Height = 25
    Caption = '&Pesquisar'
    TabOrder = 7
    OnClick = btnPesquisarClick
  end
  inherited edtDtCad: TEdit
    TabOrder = 8
  end
  inherited edtDtUltAlt: TEdit
    TabOrder = 9
  end
end
