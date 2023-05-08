unit uCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPessoas, Vcl.StdCtrls;

type
  TFormCadastroClientes = class(TFormCadastroPessoas)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroClientes: TFormCadastroClientes;

implementation

{$R *.dfm}

end.
