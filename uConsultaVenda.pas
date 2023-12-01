unit uConsultaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, uPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls,
  uCadastroVenda, uVendas, uCtrlVendas, uColVendas;

type
  TfrmConsultaVenda = class(TFormConsultaPai)
  procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    umFrmCadastroVenda: TfrmCadastroVenda;
    aVenda: Vendas;
    aCtrlVenda: CtrlVendas;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pCtrl: TObject);  override;
    procedure Inserir;                    override;
    procedure Alterar;                    override;
    procedure Excluir;                    override;
    procedure Sair;                       override;
    procedure Pesquisar;                  override;
    procedure setCadastro(pObj: TObject); override;
  end;

var
  frmConsultaVenda: TfrmConsultaVenda;

implementation

{$R *.dfm}

{ TfrmConsultaVenda }

procedure TfrmConsultaVenda.Alterar;
var mMsg:  string;
begin
  inherited;
  mMsg := aCtrlVenda.Carregar(aVenda);
  umFrmCadastroVenda.ConhecaObj(aVenda, aCtrlVenda);
  umFrmCadastroVenda.LimpaEdit;
  umFrmCadastroVenda.CarregaEdit;
  umFrmCadastroVenda.ShowModal;
end;

procedure TfrmConsultaVenda.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aVenda := Vendas(pObj);
  aCtrlVenda := CtrlVendas(pCtrl);
  self.DBGrid1.DataSource := aCtrlVenda.getDS;
  aCtrlVenda.Pesquisar(self.edtChave.Text);
end;

procedure TfrmConsultaVenda.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlVenda.Carregar(aVenda);
  umFrmCadastroVenda.ConhecaObj(aVenda, aCtrlVenda);
  mAux := umFrmCadastroVenda.btnSalvar.Caption;
  umFrmCadastroVenda.btnSalvar.Caption := '&Excluir';
  umFrmCadastroVenda.LimpaEdit;

  umFrmCadastroVenda.CarregaEdit;
  umFrmCadastroVenda.BloqueiaEdit;
  umFrmCadastroVenda.ShowModal;
  umFrmCadastroVenda.DesbloqueiaEdit;
  umFrmCadastroVenda.btnSalvar.Caption := mAux;
  self.Pesquisar;
end;

procedure TfrmConsultaVenda.FormCreate(Sender: TObject);
begin
   inherited;
   umFrmCadastroVenda := TfrmCadastroVenda.Create(nil);
end;

procedure TfrmConsultaVenda.Inserir;
begin
  inherited;
  aVenda.setCodigo(0);
  umFrmCadastroVenda.ConhecaObj(aVenda, aCtrlVenda);
  umFrmCadastroVenda.LimpaEdit;
  umFrmCadastroVenda.ShowModal;
  self.Pesquisar;
end;

procedure TfrmConsultaVenda.Pesquisar;
begin
  inherited;
  aCtrlVenda.Pesquisar(self.edtChave.Text);
end;

procedure TfrmConsultaVenda.Sair;
begin
  inherited;

end;

procedure TfrmConsultaVenda.setCadastro(pObj: TObject);
begin
  inherited;

end;

end.
