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
    edtData: TEdit;
    edtHistorico: TEdit;
    edtEntrada: TEdit;
    edtSaida: TEdit;
    lbSaldoTot: TLabel;
    edtSaldoTot: TEdit;
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
  self.edtSaldoTot.Enabled := false;
end;

procedure TFormCadastroCaixa.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(aCaixa.getCodigo);
  self.edtData.Text := datetostr(aCaixa.getData);
  self.edtHistorico.Text := aCaixa.getHistorico;
  self.edtEntrada.Text := floattostr(aCaixa.getEntrada);
  self.edtSaida.Text := floattostr(aCaixa.getSaida);
  self.edtSaldoTot.Text := floattostr(aCaixa.getSaldo);
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
  self.edtSaldoTot.Enabled := true;
end;

procedure TFormCadastroCaixa.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtData.Clear;
  edtHistorico.Clear;
  edtEntrada.Clear;
  edtSaida.Clear;
  edtSaldoTot.Clear;
end;

procedure TFormCadastroCaixa.Sair;
begin
  inherited;

end;

procedure TFormCadastroCaixa.Salvar;
var msg : string;
begin
  inherited;
  if length(self.edtData.Text) = 0 then
     self.edtData.Color := clYellow;
  if (self.edtHistorico.Text) = '' then
     self.edtHistorico.Color := clYellow;
  if (self.edtSaldoTot.Text) = '' then
     self.edtSaldoTot.Color := clYellow;
     if ehObrigatorio(self.edtData.Text, '*') and (length(self.edtData.Text)= 0) then
     begin
     showmessage('Campo Data é Obrigatório');
     self.edtData.SetFocus;
     end
     else if ehObrigatorio(self.edtData.Text, '*') and (self.edtHistorico.Text = '') then
     begin
     showmessage('Campo Historico é Obrigatório');
     self.edtHistorico.SetFocus;
     end
     else if ehObrigatorio(self.edtData.Text, '*') and (self.edtSaldoTot.Text = '') then
     begin
     showmessage('Campo Saldo Total é Obrigatório');
     self.edtHistorico.SetFocus;
     end
     else
     begin
       if self.btnSalvar.Caption = '&Salvar' then
       begin
          aCaixa.setCodigo(strtoint(self.edtCodigo.Text));
          aCaixa.setHistorico(self.edtHistorico.Text);
          aCaixa.setEntrada(self.edtEntrada.MaxLength);
          aCaixa.setSaida(self.edtSaida.MaxLength);
          aCaixa.setSaldo(self.edtSaldoTot.MaxLength);
          msg := aCtrlCaixa.Salvar(aCaixa.clone);
          if msg = '' then
             showmessage('Caixa Salvo com sucesso!')
          else
             showmessage('Problemas ao salvar: '+ msg);
        end
        else
        begin
           msg := aCtrlCaixa.Excluir(aCaixa.clone);
           if msg = '' then
              showmessage('Caixa Excluido com sucesso!')
           else
              showmessage('Problemas na exclusao: '+ msg);
        end;
         inherited;
     end;
end;

end.
