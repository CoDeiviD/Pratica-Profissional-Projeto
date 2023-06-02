unit uCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls;

type
  TFormCadastroProduto = class(TFormCadastroPai)
    lbNomeProd: TLabel;
    lbSabor: TLabel;
    lbPreco: TLabel;
    edtNomeProd: TEdit;
    edtSabor: TEdit;
    edtPreco: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroProduto: TFormCadastroProduto;

implementation

{$R *.dfm}

end.
