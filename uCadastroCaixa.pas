unit uCadastroCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls;

type
  TFormCadastroCaixa = class(TFormCadastroPai)
    lbData: TLabel;
    lbHistorico: TLabel;
    lbEntrada: TLabel;
    lbSaida: TLabel;
    lbSaldoBase: TLabel;
    edtData: TEdit;
    edtHistorico: TEdit;
    edtEntrada: TEdit;
    edtSaida: TEdit;
    edtSaldoBase: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroCaixa: TFormCadastroCaixa;

implementation

{$R *.dfm}

end.
