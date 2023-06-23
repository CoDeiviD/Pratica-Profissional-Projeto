unit uConsultaPaises;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroPaises, uPaises,
  uCtrlPaises,
  uColPaises, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFormConsultaPaises = class(TFormConsultaPai)
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroPaises : TFormCadastroPaises;
    oPais : Paises;
    aCtrlPais : CtrlPaises;
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
  FormConsultaPaises: TFormConsultaPaises;

implementation

{$R *.dfm}

{ TFormConsultaPaises }

procedure TFormConsultaPaises.Alterar;
begin
  inherited;
  umFormCadastroPaises.ConhecaObj(oPais, aCtrlPais);
  umFormCadastroPaises.LimpaEdit;
  umFormCadastroPaises.CarregaEdit;
  umFormCadastroPaises.ShowModal;
  self.Excluir;
  self.Inserir;
end;

procedure TFormConsultaPaises.btnAlterarClick(Sender: TObject);
begin
  inherited;
  self.Alterar;
end;

procedure TFormConsultaPaises.btnExcluirClick(Sender: TObject);
begin
  inherited;
  self.Excluir;
end;

procedure TFormConsultaPaises.btnInserirClick(Sender: TObject);
begin
  inherited;
  self.Inserir;
end;

procedure TFormConsultaPaises.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TFormConsultaPaises.btnSairClick(Sender: TObject);
begin
  inherited;
  self.Sair;
end;

procedure TFormConsultaPaises.CarregaLV;
var LVItem : TListItem;
    tam, k : integer;
    oPais  : Paises;
    aColPaises : ColPaises;
begin
  inherited;
  aColPaises := ColPaises(aCtrlPais.CarregarColecao);
  self.ListView1.Clear;
  tam := aColPaises.getTam;
  for k  := 1 to tam do
  begin
     oPais := Paises(aColPaises.Carregar(k));
     LVItem := ListView1.Items.Add;
     LVItem.Caption := inttostr(oPais.getCodigo);
     LVItem.SubItems.Add(oPais.getPais);
     LVItem.SubItems.Add(oPais.getSigla);
     LVItem.SubItems.Add(oPais.getDDI);
     LVItem.SubItems.Add(oPais.getMoeda);
  end;

end;

procedure TFormConsultaPaises.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oPais := Paises(pObj);
  aCtrlPais := CtrlPaises(pCtrl);
end;

procedure TFormConsultaPaises.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroPaises.btnSalvar.Caption;
  umFormCadastroPaises.btnSalvar.Caption := 'Excluir';
  umFormCadastroPaises.ConhecaObj(oPais, aCtrlPais);

  umFormCadastroPaises.LimpaEdit;
  umFormCadastroPaises.CarregaEdit;
  umFormCadastroPaises.BloqueiaEdit;
  umFormCadastroPaises.ShowModal;
  umFormCadastroPaises.DesbloqueiaEdit;
  umFormCadastroPaises.btnSalvar.Caption := aux;
  oPais.Destrua_se;
end;

procedure TFormConsultaPaises.Inserir;
begin
  inherited;
  umFormCadastroPaises.ConhecaObj(oPais, aCtrlPais);
  umFormCadastroPaises.LimpaEdit;
  umFormCadastroPaises.ShowModal;
  self.CarregaLV;
end;

procedure TFormConsultaPaises.Pesquisar;
begin
  inherited;
  aCtrlPais.Pesquisar(self.edtChave.Text, oPais);
end;

procedure TFormConsultaPaises.Sair;
begin
  inherited;
  Close;
end;

procedure TFormConsultaPaises.setCadastro(pObj: TObject);
begin
  inherited;
  umFormCadastroPaises := TFormCadastroPaises(pObj);
end;

end.
