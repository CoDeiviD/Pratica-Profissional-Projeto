inherited FormCadastroPaises: TFormCadastroPaises
  Caption = 'Cadastro de Paises'
  PixelsPerInch = 96
  TextHeight = 13
  object lbPais: TLabel [1]
    Left = 112
    Top = 24
    Width = 28
    Height = 13
    Caption = 'Pais *'
  end
  object lbSigla: TLabel [2]
    Left = 329
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Sigla *'
  end
  object lbDDI: TLabel [3]
    Left = 400
    Top = 24
    Width = 27
    Height = 13
    Caption = 'DDI *'
  end
  object lbMoeda: TLabel [7]
    Left = 464
    Top = 24
    Width = 41
    Height = 13
    Caption = 'Moeda *'
  end
  inherited btnSalvar: TButton
    Caption = '&Salvar'
  end
  inherited edtDtCad: TEdit
    TabOrder = 6
  end
  inherited edtDtUltAlt: TEdit
    TabOrder = 7
  end
  object edtPais: TEdit
    Left = 112
    Top = 40
    Width = 211
    Height = 21
    ParentColor = True
    TabOrder = 3
  end
  object edtSigla: TEdit
    Left = 329
    Top = 40
    Width = 49
    Height = 21
    TabOrder = 4
  end
  object edtDDI: TEdit
    Left = 400
    Top = 40
    Width = 41
    Height = 21
    TabOrder = 5
  end
  object edtMoeda: TEdit
    Left = 464
    Top = 40
    Width = 65
    Height = 21
    TabOrder = 8
  end
end
