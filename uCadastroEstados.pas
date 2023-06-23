unit uCadastroEstados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroPai, Vcl.StdCtrls,
  uConsultaPaises, uEstados,
  uCtrlEstados;

type
  TFormCadastroEstados = class(TFormCadastroPai)
    edtEstado: TEdit;
    edtUF: TEdit;
    edtCodPais: TEdit;
    edtPais: TEdit;
    btnPesquisar: TButton;
    lbEstado: TLabel;
    lbUF: TLabel;
    lbCodPais: TLabel;
    lbPais: TLabel;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSalvarExit(Sender: TObject);
  private
    { Private declarations }
    oEstado : Estados;
    aCtrlEstado : CtrlEstados;
    umaConsultaPaises : TFormConsultaPaises;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject); override;
    procedure LimpaEdit;                                 override;
    procedure CarregaEdit;                               override;
    procedure BloqueiaEdit;                              override;
    procedure DesbloqueiaEdit;                           override;
    procedure Salvar;                                    override;
    procedure Sair;                                      override;
    procedure setConsulta(pObj: TObject);                override;
  end;

var
  FormCadastroEstados: TFormCadastroEstados;

implementation

{$R *.dfm}

{ TFormCadastroEstados }

procedure TFormCadastroEstados.BloqueiaEdit;
begin
  inherited;
  self.edtEstado.Enabled := false;
  self.edtUF.Enabled := false;
end;

procedure TFormCadastroEstados.btnPesquisarClick(Sender: TObject);
var aux : string;
begin
  inherited;
  aux := umaConsultaPaises.btnSair.Caption;
  umaConsultaPaises.btnSair.Caption := 'Selecionar';
  umaConsultaPaises.ConhecaObj(oEstado.getoPais, nil);
  umaConsultaPaises.ShowModal;
  umaConsultaPaises.btnSair.Caption := aux;
  self.edtCodPais.Text := inttostr(oEstado.getoPais.getCodigo);
  self.edtPais.Text := oEstado.getoPais.getPais;
end;

procedure TFormCadastroEstados.btnSalvarExit(Sender: TObject);
begin
  inherited;
  if self.edtEstado.Text <> '' then
     self.edtEstado.Color := clWindow;
  self.Sair;
end;

procedure TFormCadastroEstados.CarregaEdit;
begin
  inherited;
    self.edtCodigo.Text := inttostr(oEstado.getCodigo);
    self.edtEstado.Text := oEstado.getEstado;
    self.edtUF.Text := oEstado.getUF;
end;

procedure TFormCadastroEstados.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oEstado := Estados(pObj);
  aCtrlEstado := CtrlEstados(pCtrl);
end;

procedure TFormCadastroEstados.DesbloqueiaEdit;
begin
  inherited;
  self.edtEstado.Enabled := true;
  self.edtUF.Enabled := true;
end;

procedure TFormCadastroEstados.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtEstado.Clear;
  edtUF.Clear;
end;

procedure TFormCadastroEstados.Sair;
begin
  inherited;

end;

procedure TFormCadastroEstados.Salvar;
begin
  inherited;
  if length(self.edtEstado.Text) = 0 then
  begin
     showmessage('Campo Estado é Obrigatório');
     self.edtEstado.Color := clYellow;
     self.edtEstado.SetFocus;
  end
  else if (self.edtUF.Text) = '' then
  begin
     showmessage('Campo UF é Obrigatório');
     self.edtUF.Color := clYellow;
     self.edtUF.SetFocus;
  end
  else
  begin
     oEstado.setCodigo(strtoint(self.edtCodigo.Text));
     oEstado.setEstado(self.edtEstado.Text);
     oEstado.setUF(self.edtUF.Text);
     aCtrlEstado.Salvar(oEstado.clone);
  end;
end;

procedure TFormCadastroEstados.setConsulta(pObj: TObject);
begin
  inherited;
  umaConsultaPaises := TFormConsultaPaises(pObj);
end;

end.
