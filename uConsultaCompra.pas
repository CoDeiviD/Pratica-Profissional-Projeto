unit uConsultaCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, uPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls,
  uCadastroCompra, uCompras, uCtrlCompras, uColCompras;

type
  TfrmConsultaCompra = class(TFormConsultaPai)
  procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroCompras : TfrmCadastroCompra;
    aCompra : Compras;
    aCtrlCompra: CtrlCompras;
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
  frmConsultaCompra: TfrmConsultaCompra;

implementation

{$R *.dfm}

{ TfrmConsultaCompra }

procedure TfrmConsultaCompra.Alterar;
var mMsg:  string;
begin
  inherited;
  mMsg := aCtrlCompra.Carregar(aCompra);
  umFormCadastroCompras.ConhecaObj(aCompra, aCtrlCompra);
  umFormCadastroCompras.LimpaEdit;
  umFormCadastroCompras.CarregaEdit;
  umFormCadastroCompras.ShowModal;
end;

procedure TfrmConsultaCompra.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aCompra := Compras(pObj);
  aCtrlCompra := CtrlCompras(pCtrl);
  self.DBGrid1.DataSource := aCtrlCompra.getDS;
  aCtrlCompra.Pesquisar(self.edtChave.Text);
end;

procedure TfrmConsultaCompra.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlCompra.Carregar(aCompra);
  umFormCadastroCompras.ConhecaObj(aCompra, aCtrlCompra);
  mAux := umFormCadastroCompras.btnSalvar.Caption;
  umFormCadastroCompras.btnSalvar.Caption := '&Excluir';
  umFormCadastroCompras.LimpaEdit;

  umFormCadastroCompras.CarregaEdit;
  umFormCadastroCompras.BloqueiaEdit;
  umFormCadastroCompras.ShowModal;
  umFormCadastroCompras.DesbloqueiaEdit;
  umFormCadastroCompras.btnSalvar.Caption := mAux;
  self.Pesquisar;
end;

procedure TfrmConsultaCompra.FormCreate(Sender: TObject);
begin
   inherited;
   umFormCadastroCompras := TfrmCadastroCompra.Create(nil);
end;

procedure TfrmConsultaCompra.Inserir;
begin
  inherited;
  aCompra.setCodigo(0);
  umFormCadastroCompras.ConhecaObj(aCompra, aCtrlCompra);
  umFormCadastroCompras.LimpaEdit;
  umFormCadastroCompras.ShowModal;
  self.Pesquisar;
end;

procedure TfrmConsultaCompra.Pesquisar;
begin
  inherited;
  aCtrlCompra.Pesquisar(self.edtChave.Text);
end;

procedure TfrmConsultaCompra.Sair;
begin
  inherited;

end;

procedure TfrmConsultaCompra.setCadastro(pObj: TObject);
begin
  inherited;

end;

end.
