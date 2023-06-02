unit uCadastroContaPgo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls;

type
  TFormCadastroContaPgo = class(TFormCadastroPai)
    edtValorPgr: TEdit;
    lbValorPgr: TLabel;
    lbDtVencP: TLabel;
    lbDtPgtoP: TLabel;
    lbValorPgo: TLabel;
    lbCodForn: TLabel;
    edtDtVencP: TEdit;
    edtDtPgtoP: TEdit;
    edtValorPgo: TEdit;
    edtCodForn: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroContaPgo: TFormCadastroContaPgo;

implementation

{$R *.dfm}

end.
