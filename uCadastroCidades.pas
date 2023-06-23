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
    procedure btnSalvarExit(Sender: TObject);
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
begin
  inherited;
  umaConsultaEstados.ConhecaObj(aCidade.getoEstado, nil);
  umaConsultaEstados.ShowModal;
  self.edtCodEstado.Text := inttostr(aCidade.getoEstado.getCodigo);
  self.edtEstado.Text := aCidade.getoEstado.getEstado;
end;

procedure TFormCadastroCidades.btnSalvarExit(Sender: TObject);
begin
  inherited;
  if self.edtCidade.Text <> '' then
     self.edtCidade.Color := clWindow;
  self.Sair;
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
begin
  inherited;
  if length(self.edtCidade.Text) = 0 then
  begin
     showmessage('Campo Cidade é Obrigatório');
     self.edtCidade.Color := clYellow;
     self.edtCidade.SetFocus;
  end
  else if (self.edtDDD.Text) = '' then
  begin
     showmessage('Campo DDD é Obrigatório');
     self.edtDDD.Color := clYellow;
     self.edtDDD.SetFocus;
  end
  else
  begin
     aCidade.setCodigo(strtoint(self.edtCodigo.Text));
     aCidade.setCidade(self.edtCidade.Text);
     aCidade.setDDD(self.edtDDD.Text);
     aCtrlCidade.Salvar(aCidade.clone);
  end;
end;

procedure TFormCadastroCidades.setConsulta(pObj: TObject);
begin
  inherited;
  umaConsultaEstados := TFormConsultaEstados(pObj);
end;

end.
