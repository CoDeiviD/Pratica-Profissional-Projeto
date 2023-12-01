unit uCadastroVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, uCadastroPai, uPai,
  uVendas, uCtrlVendas, uConsultaCondPgto;

type
  TfrmCadastroVenda = class(TFormCadastroPai)
    lbCliente: TLabel;
    edtCliente: TEdit;
    Button1: TButton;
    cbxData: TComboBox;
    lbDataV: TLabel;
    lbCondPgto: TLabel;
    edtCondPgto: TEdit;
    LVCondPgto: TListView;
    btnGerar: TButton;
    lbObs: TLabel;
    edtObs: TEdit;
    LVVenda: TListView;
    procedure btnGerarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    aVenda : Vendas;
    aCtrlVenda: CtrlVendas;
    umFormConsultaCondPgto: TfrmConsultaCondPgto;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); virtual;
    procedure LimpaEdit;                                 virtual;
    procedure CarregaEdit;                               virtual;
    procedure BloqueiaEdit;                              virtual;
    procedure DesbloqueiaEdit;                           virtual;
    procedure Salvar;                                    virtual;
    procedure Sair;                                      virtual;
    procedure setConsulta(pObj: TObject);                virtual;
    function ehObrigatorio(pTexto: string; pLetra: char): boolean; virtual;
  end;

var
  frmCadastroVenda: TfrmCadastroVenda;

implementation

{$R *.dfm}

{ TfrmCadastroVenda }

procedure TfrmCadastroVenda.BloqueiaEdit;
begin
  self.edtCliente.Enabled := false;
  self.cbxData.Enabled := false;
  self.edtObs.Enabled := false;
end;

procedure TfrmCadastroVenda.btnGerarClick(Sender: TObject);
begin
  inherited;
  umFormConsultaCondPgto.ShowModal;
end;

procedure TfrmCadastroVenda.btnSairClick(Sender: TObject);
begin
  inherited;
  Sair;
end;

procedure TfrmCadastroVenda.btnSalvarClick(Sender: TObject);
begin
  inherited;
  Salvar;
  Sair;
end;

procedure TfrmCadastroVenda.CarregaEdit;
begin
  //self.edtCliente.Text := aVenda.getoCodClie;
  self.cbxData.Text := datetostr(aVenda.getDtVenda);
  self.edtObs.Text := aVenda.getObs;
end;

procedure TfrmCadastroVenda.ConhecaObj(pObj, pCtrl: TObject);
begin
  aVenda := Vendas(pObj);
  aCtrlVenda := CtrlVendas(pCtrl);
end;

procedure TfrmCadastroVenda.DesbloqueiaEdit;
begin
  self.edtCliente.Enabled := true;
  self.cbxData.Enabled := true;
  self.edtObs.Enabled := true;
end;

function TfrmCadastroVenda.ehObrigatorio(pTexto: string; pLetra: char): boolean;
begin

end;

procedure TfrmCadastroVenda.LimpaEdit;
begin
  edtCliente.Clear;
  cbxData.Clear;
  edtObs.Clear;
end;

procedure TfrmCadastroVenda.Sair;
begin

end;

procedure TfrmCadastroVenda.Salvar;
var msg : string;
    obj: TObject;
begin
  inherited;
  if length(self.edtCliente.Text) = 0 then
     self.edtCliente.Color := clYellow;
  if length(self.cbxData.Text) = 0 then
     self.cbxData.Color := clYellow;
  if length(self.edtObs.Text) = 0 then
     self.edtObs.Color := clYellow;
  if ehObrigatorio(self.edtCliente.Text, '*') and (length(self.edtCliente.Text)= 0) then
  begin
     showmessage('Campo Modelo é Obrigatório');
     self.edtCliente.SetFocus;
  end
  else if ehObrigatorio(self.edtCliente.Text, '*') and (self.cbxData.Text = '') then
  begin
     showmessage('Campo Série é Obrigatório');
     self.cbxData.SetFocus;
  end
  else if ehObrigatorio(self.edtCliente.Text, '*') and (self.edtObs.Text = '') then
  begin
     showmessage('Campo Número da Nota é Obrigatório');
     self.edtObs.SetFocus;
  end
  else
  begin
     if self.btnSalvar.Caption = '&Salvar' then
     begin
        //aVenda.setoCodClie(obj.ToString(edtCliente)).Text);
        aVenda.setDtVenda(strtodate(self.cbxData.Text));
        aVenda.setObs(self.edtObs.Text);
        msg := aCtrlVenda.Salvar(aVenda.clone);
        if msg = '' then
              showmessage('Produto Salvo com sucesso!')
           else
              showmessage('Problemas ao salvar: '+ msg);
     end
     else
        begin
           msg := aCtrlVenda.Excluir(aVenda.clone);
           if msg = '' then
              showmessage('Produto Excluido com sucesso!')
           else
              showmessage('Problemas na exclusao: '+ msg);
        end;
     inherited;
     end;
end;

procedure TfrmCadastroVenda.setConsulta(pObj: TObject);
begin

end;

end.
