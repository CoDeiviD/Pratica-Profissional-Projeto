unit uConsultaCondPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls,
  uCadastroCondPgto, uCondPgto, uCtrlCondPgto, uColCondPgto;

type
  TfrmConsultaCondPgto = class(TFormConsultaPai)
  private
    { Private declarations }
    umFormCadastroCondPgto : TfrmCadastroCondPgto;
    aCond : CondPgto;
    aCtrlCondPgto : CtrlCondPgto;
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
  frmConsultaCondPgto: TfrmConsultaCondPgto;

implementation

{$R *.dfm}

{ TFormConsultaPai1 }

procedure TfrmConsultaCondPgto.Alterar;
begin
  inherited;
  umFormCadastroCondPgto.ConhecaObj(aCond, aCtrlCondPgto);
  umFormCadastroCondPgto.LimpaEdit;
  umFormCadastroCondPgto.CarregaEdit;
  umFormCadastroCondPgto.ShowModal;
end;

procedure TfrmConsultaCondPgto.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aCond := CondPgto(pObj);
  //aCtrlCompra := CtrlCompras(pCtrl);
  //self.DBGrid1.DataSource := aCtrlCompra.getDS;
  aCtrlCondPgto.Pesquisar(self.edtChave.Text);
end;

procedure TfrmConsultaCondPgto.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlCondPgto.Carregar(aCond);
  umFormCadastroCondPgto.ConhecaObj(aCond, aCtrlCondPgto);
  mAux := umFormCadastroCondPgto.btnSalvar.Caption;
  umFormCadastroCondPgto.btnSalvar.Caption := '&Excluir';
  umFormCadastroCondPgto.LimpaEdit;

  umFormCadastroCondPgto.CarregaEdit;
  umFormCadastroCondPgto.BloqueiaEdit;
  umFormCadastroCondPgto.ShowModal;
  umFormCadastroCondPgto.DesbloqueiaEdit;
  umFormCadastroCondPgto.btnSalvar.Caption := mAux;
  self.Pesquisar;
end;

procedure TfrmConsultaCondPgto.Inserir;
begin
  inherited;
  //aCond.setCodigo(0);
  //umFormCadastroCompras.ConhecaObj(aCompra, aCtrlCompra);
  umFormCadastroCondPgto.LimpaEdit;
  umFormCadastroCondPgto.ShowModal;
  self.Pesquisar;
end;

procedure TfrmConsultaCondPgto.Pesquisar;
begin
  inherited;
  //aCtrlCompra.Pesquisar(self.edtChave.Text);
end;

procedure TfrmConsultaCondPgto.Sair;
begin
  inherited;

end;

procedure TfrmConsultaCondPgto.setCadastro(pObj: TObject);
begin
  inherited;

end;

end.
