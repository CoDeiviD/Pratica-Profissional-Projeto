unit uCadastroCidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uConsultaEstados, uCidades,
  uCtrlCidades;

type
  TFormCadastroCidades = class(TFormCadastroPai)
    lbCidade: TLabel;
    edtCidade: TEdit;
    lbDDD: TLabel;
    edtDDD: TEdit;
    lbCodEstado: TLabel;
    edtCodEstado: TEdit;
    lbEstado: TLabel;
    edtEstado: TEdit;
    btnPesquisar: TButton;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    aCidade : Cidades;
    aCtrlCidade : CtrlCidades;
    umaConsultaEstados : TFormConsultaEstados;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); override;
    procedure LimpaEdit;                                 override;
    procedure CarregaEdit;                               override;
    procedure BloqueiaEdit;                              override;
    procedure DesbloqueiaEdit;                           override;
    procedure Salvar;                                    override;
    procedure Sair;                                      override;
    procedure setConsulta(pObj : TObject); override;
  end;

var
  FormCadastroCidades: TFormCadastroCidades;

implementation

{$R *.dfm}

procedure TFormCadastroCidades.BloqueiaEdit;
begin
  inherited;
  self.edtCidade.Enabled := false;
  self.edtDDD.Enabled := false;
end;

procedure TFormCadastroCidades.btnPesquisarClick(Sender: TObject);
var aux : string;
begin
  inherited;
  aux := umaConsultaEstados.btnSair.Caption;
  umaConsultaEstados.btnSair.Caption := 'Selecionar';
  umaConsultaEstados.ConhecaObj(aCidade.getoEstado, nil);
  umaConsultaEstados.ShowModal;
  umaConsultaEstados.btnSair.Caption := aux;
  self.edtEstado.Text := aCidade.getoEstado.getEstado;
end;

procedure TFormCadastroCidades.CarregaEdit;
begin
  inherited;
  self.edtCodigo.Text := inttostr(aCidade.getCodigo);
  self.edtCidade.Text := aCidade.getCidade;
  self.edtDDD.Text := aCidade.getDDD;
end;

procedure TFormCadastroCidades.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aCidade := Cidades(pObj);
  aCtrlCidade := CtrlCidades(pCtrl);
end;

procedure TFormCadastroCidades.DesbloqueiaEdit;
begin
  inherited;
  self.edtCidade.Enabled := true;
  self.edtDDD.Enabled := true;
end;

procedure TFormCadastroCidades.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtCidade.Clear;
  edtDDD.Clear;
end;

procedure TFormCadastroCidades.Sair;
begin
  inherited;

end;

procedure TFormCadastroCidades.Salvar;
var msg : string;
begin
  inherited;
  if length(self.edtCidade.Text) = 0 then
     self.edtCidade.Color := clYellow;
  if (self.edtDDD.Text) = '' then
     self.edtDDD.Color := clYellow;
  if ehObrigatorio(self.edtCidade.Text, '*') and (length(self.edtCidade.Text)= 0) then
     begin
        showmessage(' Campo Cidade é obrigatorio');
        self.edtEstado.SetFocus;
     end
  else if ehObrigatorio(self.edtCidade.Text, '*') and (self.edtDDD.Text = '') then
     begin
        showmessage('Campo DDD é Obrigatório');
        self.edtDDD.SetFocus;
     end
     else
     begin
        if self.btnSalvar.Caption = '&Salvar' then
        begin
           aCidade.setCodigo(strtoint(self.edtCodigo.Text));
           aCidade.setCidade(self.edtCidade.Text);
           aCidade.setDDD(self.edtDDD.Text);
           msg := aCtrlCidade.Salvar(aCidade.clone);
           if msg = '' then
              showmessage('Cidade Salvo com sucesso!')
           else
              showmessage('Problemas ao salvar: '+ msg);
        end
        else
        begin
           msg := aCtrlCidade.Excluir(aCidade.clone);
           if msg = '' then
              showmessage('Cidade Excluido com sucesso!')
           else
              showmessage('Problemas na exclusao: '+ msg);
        end;
        inherited;
     end;
end;
procedure TFormCadastroCidades.setConsulta(pObj: TObject);
begin
  inherited;
  umaConsultaEstados := TFormConsultaEstados(pObj);
end;
end.
