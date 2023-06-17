unit uCadastroCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uCaixas;

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
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    aCaixa : Caixas;
  public
    { Public declarations }
  end;

var
  FormCadastroCaixa: TFormCadastroCaixa;

implementation

{$R *.dfm}

procedure TFormCadastroCaixa.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormCadastroCaixa.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if length(self.edtData.Text) = 0 then
  begin
     showmessage('Campo Cidade é Obrigatório');
     self.edtData.Color := clYellow;
     self.edtData.SetFocus;
  end
  else if (self.edtHistorico.Text) = '' then
  begin
     showmessage('Campo DDD é Obrigatório');
     self.edtHistorico.Color := clYellow;
     self.edtHistorico.SetFocus;
  end
  else if (self.edtSaldoBase.Text) = '' then
  begin
     showmessage('Campo DDD é Obrigatório');
     self.edtSaldoBase.Color := clYellow;
     self.edtSaldoBase.SetFocus;
  end
  else
  begin
     aCaixa.setCodigo(strtoint(self.edtCodigo.Text));
     aCaixa.setEntrada(self.edtEntrada.MaxLength);
     aCaixa.setSaida(self.edtSaida.MaxLength);
  end;
end;

end.
