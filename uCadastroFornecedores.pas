unit uCadastroFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPessoas, Vcl.StdCtrls;

type
  TFormCadastroFornecedores = class(TFormCadastroPessoas)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroFornecedores: TFormCadastroFornecedores;

implementation

{$R *.dfm}

end.
