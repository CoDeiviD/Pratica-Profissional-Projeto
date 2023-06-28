inherited FormCadastroClientes: TFormCadastroClientes
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbNome: TLabel
    Width = 120
    Caption = 'Nome Completo Cliente *'
    ExplicitWidth = 120
  end
  object lbCFS: TLabel [10]
    Left = 18
    Top = 272
    Width = 176
    Height = 13
    Caption = 'Como Ficou Sabendo da Sorveteria ?'
  end
  object edtCFS: TEdit [26]
    Left = 18
    Top = 291
    Width = 311
    Height = 21
    TabOrder = 11
  end
  inherited btnPesquisar: TButton
    TabOrder = 12
    OnClick = btnPesquisarClick
  end
  inherited edtRG: TEdit
    TabOrder = 13
  end
  inherited edtCEP: TEdit
    TabOrder = 14
  end
  inherited edtMidia: TEdit
    TabOrder = 15
  end
  inherited edtCidade: TEdit
    TabOrder = 16
  end
end
