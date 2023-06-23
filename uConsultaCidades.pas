unit uConsultaCidades;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroCidades, uCidades, uCtrlCidades, uColCidades, uPai;

type
  TFormConsultaCidades = class(TFormConsultaPai)
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroCidades : TFormCadastroCidades;
    aCidade : Cidades;
    aCtrlCidade: CtrlCidades;
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
  umFormConsultaCidades: TFormConsultaCidades;

implementation

{$R *.dfm}

{ TFormConsultaCidades }

procedure TFormConsultaCidades.Alterar;
begin
  inherited;
  umFormCadastroCidades.ConhecaObj(aCidade, aCtrlCidade);
  umFormCadastroCidades.LimpaEdit;
  umFormCadastroCidades.CarregaEdit;
  umFormCadastroCidades.ShowModal;
end;

procedure TFormConsultaCidades.btnAlterarClick(Sender: TObject);
begin
   self.Alterar;
end;

procedure TFormConsultaCidades.btnExcluirClick(Sender: TObject);
begin
  inherited;
  self.Excluir;
end;

procedure TFormConsultaCidades.btnInserirClick(Sender: TObject);
begin
  inherited;
  self.Inserir;
end;

procedure TFormConsultaCidades.btnSairClick(Sender: TObject);
begin
  inherited;
  self.Sair;
end;

procedure TFormConsultaCidades.CarregaLV;
var LVItem : TListItem;
    tam, k : integer;
    aCidade  : Cidades;
    aColCidades : ColCidades;
begin
  inherited;
  aColCidades := ColCidades(aCtrlCidade.CarregarColecao);
  self.ListView1.Clear;
  tam := aColCidades.getTam;
  for k  := 1 to tam do
  begin
     aCidade := Cidades(aColCidades.Carregar(k));
     LVItem := ListView1.Items.Add;
     LVItem.Caption := inttostr(aCidade.getCodigo);
     LVItem.SubItems.Add(aCidade.getCidade);
     LVItem.SubItems.Add(aCidade.getDDD);
  end;
end;

procedure TFormConsultaCidades.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aCidade := Cidades(pObj);
  aCtrlCidade := CtrlCidades(pCtrl);
end;

procedure TFormConsultaCidades.Excluir;
begin
  inherited;
  umFormConsultaCidades.ConhecaObj(aCidade,aCtrlCidade);
  umFormConsultaCidades.ShowModal;
end;

procedure TFormConsultaCidades.Inserir;
begin
  inherited;
  umFormConsultaCidades.ConhecaObj(aCidade,aCtrlCidade);
  umFormCadastroCidades.LimpaEdit;
  umFormConsultaCidades.ShowModal;
  self.CarregaLV;
end;

procedure TFormConsultaCidades.Pesquisar;
begin
  inherited;
  aCtrlCidade.Pesquisar(self.edtChave.Text, aCidade);
end;

procedure TFormConsultaCidades.Sair;
begin
  inherited;
  Close;
end;

procedure TFormConsultaCidades.setCadastro(pObj: TObject);
begin
  inherited;
  umFormCadastroCidades := TFormCadastroCidades(pObj);
end;

end.
