unit uCadastroCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uCaixas,
  uCtrlCaixas;

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
    procedure btnSalvarExit(Sender: TObject);
  private
    { Private declarations }
    aCaixa : Caixas;
    aCtrlCaixa : CtrlCaixas;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); override;
    procedure LimpaEdit;                                 override;
    procedure CarregaEdit;                               override;
    procedure BloqueiaEdit;                              override;
    procedure DesbloqueiaEdit;                           override;
    procedure Salvar;                                    override;
    procedure Sair;                                      override;
  end;

var
  FormCadastroCaixa: TFormCadastroCaixa;

implementation

{$R *.dfm}

procedure TFormCadastroCaixa.BloqueiaEdit;
begin
  inherited;
  self.edtData.Enabled := false;
  self.edtHistorico.Enabled := false;
  self.edtEntrada.Enabled := false;
  self.edtSaida.Enabled := false;
  self.edtSaldoBase.Enabled := false;
end;

procedure TFormCadastroCaixa.btnSalvarExit(Sender: TObject);
begin
  inherited;
  if self.edtSaldoBase.Text <> '' then
     self.edtSaldoBase.Color := clWindow;
  self.Sair;
end;

procedure TFormCadastroCaixa.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(aCaixa.getCodigo);
  self.edtData.Text := datetostr(aCaixa.getData);
  self.edtHistorico.Text := aCaixa.getHistorico;
  self.edtEntrada.Text := floattostr(aCaixa.getEntrada);
  self.edtSaida.Text := floattostr(aCaixa.getSaida);
  self.edtSaldoBase.Text := floattostr(aCaixa.getSaldo);
end;

procedure TFormCadastroCaixa.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aCaixa  := Caixas(pObj);
  aCtrlCaixa := CtrlCaixas(pCtrl);
end;

procedure TFormCadastroCaixa.DesbloqueiaEdit;
begin
  inherited;
  self.edtData.Enabled := true;
  self.edtHistorico.Enabled := true;
  self.edtEntrada.Enabled := true;
  self.edtSaida.Enabled := true;
  self.edtSaldoBase.Enabled := true;
end;

procedure TFormCadastroCaixa.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtData.Clear;
  edtHistorico.Clear;
  edtEntrada.Clear;
  edtSaida.Clear;
  edtSaldoBase.Clear;
end;

procedure TFormCadastroCaixa.Sair;
begin
  inherited;

end;

procedure TFormCadastroCaixa.Salvar;
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
     aCaixa.setHistorico(self.edtHistorico.Text);
     aCaixa.setEntrada(self.edtEntrada.MaxLength);
     aCaixa.setSaida(self.edtSaida.MaxLength);
     aCaixa.setSaldo(self.edtSaldoBase.MaxLength);
     aCtrlCaixa.Salvar(aCaixa.clone);
  end;
end;

end.
