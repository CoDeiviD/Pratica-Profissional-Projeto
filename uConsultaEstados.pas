unit uConsultaEstados;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroEstados, uEstados, uCtrlEstados, uColEstados;

type
  TFormConsultaEstados = class(TFormConsultaPai)
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroEstados : TFormCadastroEstados;
    oEstado : Estados;
    aCtrlEstado : CtrlEstados;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject);  override;
    procedure Inserir;                    override;
    procedure Alterar;                    override;
    procedure Excluir;                    override;
    procedure Sair;                       override;
    procedure Pesquisar;                  override;
    procedure setCadastro(pObj: TObject); override;
    procedure CarregaLV;                  override;
  end;

var
  FormConsultaEstados: TFormConsultaEstados;

implementation

{$R *.dfm}

{ TFormConsultaEstados }

procedure TFormConsultaEstados.Alterar;
begin
  inherited;
  umFormCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  umFormCadastroEstados.LimpaEdit;
  umFormCadastroEstados.CarregaEdit;
  umFormCadastroEstados.ShowModal;
end;

procedure TFormConsultaEstados.btnAlterarClick(Sender: TObject);
begin
  inherited;
  self.Alterar;
end;

procedure TFormConsultaEstados.btnExcluirClick(Sender: TObject);
begin
  inherited;
  self.Excluir;
end;

procedure TFormConsultaEstados.btnInserirClick(Sender: TObject);
begin
  inherited;
  self.Inserir;
end;

procedure TFormConsultaEstados.btnSairClick(Sender: TObject);
begin
  inherited;
  self.Sair;
end;

procedure TFormConsultaEstados.CarregaLV;
var LVItem : TListItem;
    tam, k : integer;
    oEstado : Estados;
    aColEstados : ColEstados;
begin
  inherited;
  aColEstados := ColEstados(aCtrlEstado.CarregarColecao);
  self.ListView1.Clear;
  tam := aColEstados.getTam;
  for k  := 1 to tam do
  begin
     oEstado := Estados(aColEstados.Carregar(k));
     LVItem := ListView1.Items.Add;
     LVItem.Caption := inttostr(oEstado.getCodigo);
     LVItem.SubItems.Add(oEstado.getEstado);
     LVItem.SubItems.Add(oEstado.getUF);
  end;
end;

procedure TFormConsultaEstados.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oEstado := Estados(pObj);
  aCtrlEstado := CtrlEstados(pCtrl);
end;

procedure TFormConsultaEstados.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroEstados.btnSalvar.Caption;
  umFormCadastroEstados.btnSalvar.Caption := '&Excluir';
  umFormCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  umFormCadastroEstados.LimpaEdit;
  umFormCadastroEstados.CarregaEdit;
  umFormCadastroEstados.ShowModal;
  umFormCadastroEstados.btnSalvar.Caption := aux;

end;

procedure TFormConsultaEstados.Inserir;
begin
  inherited;
  umFormCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  umFormCadastroEstados.LimpaEdit;
  umFormCadastroEstados.ShowModal;
  self.CarregaLV;
end;

procedure TFormConsultaEstados.Pesquisar;
begin
  inherited;

end;

procedure TFormConsultaEstados.Sair;
begin
  inherited;
  Close;
end;

procedure TFormConsultaEstados.setCadastro(pObj: TObject);
begin
  inherited;
  umFormCadastroEstados := TFormCadastroEstados(pObj);
end;

end.
