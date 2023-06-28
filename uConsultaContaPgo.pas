unit uConsultaContaPgo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroContaPgo, uContasPgr, uCtrlContasPgr, uColContasPgr, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormConsultaContaPgo = class(TFormConsultaPai)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroContaPgo : TFormCadastroContaPgo;
    aContaPgo : ContasPgr;
    aCtrlContaPgo: CtrlContasPgr;
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
  FormConsultaContaPgo: TFormConsultaContaPgo;

implementation

{$R *.dfm}

procedure TFormConsultaContaPgo.Alterar;
begin
  inherited;

end;

procedure TFormConsultaContaPgo.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aContaPgo := ContasPgr(pObj);
  aCtrlContaPgo := CtrlContasPgr(pCtrl);
  self.DBGrid1.DataSource := aCtrlContaPgo.getDS;
  aCtrlContaPgo.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaContaPgo.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlContaPgo.Carregar(aContaPgo);
  umFormCadastroContaPgo.ConhecaObj(aContaPgo, aCtrlContaPgo);
  mAux := umFormCadastroContaPgo.btnSalvar.Caption;
  umFormCadastroContaPgo.btnSalvar.Caption := '&Excluir';
  umFormCadastroContaPgo.LimpaEdit;

  umFormCadastroContaPgo.CarregaEdit;
  umFormCadastroContaPgo.BloqueiaEdit;
  umFormCadastroContaPgo.ShowModal;
  umFormCadastroContaPgo.DesbloqueiaEdit;
  umFormCadastroContaPgo.btnSalvar.Caption := mAux;
  self.Pesquisar;
end;

procedure TFormConsultaContaPgo.FormCreate(Sender: TObject);
begin
  inherited;
  umFormCadastroContaPgo := TFormCadastroContaPgo.Create(nil);
end;

procedure TFormConsultaContaPgo.Inserir;
begin
  inherited;
  aContaPgo.setCodigo(0);
  umFormCadastroContaPgo.ConhecaObj(aContaPgo, aCtrlContaPgo);
  umFormCadastroContaPgo.LimpaEdit;
  umFormCadastroContaPgo.ShowModal;
  self.Pesquisar;
end;

procedure TFormConsultaContaPgo.Pesquisar;
begin
  inherited;
  aCtrlContaPgo.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaContaPgo.Sair;
begin
  inherited;
//  Close;
end;

procedure TFormConsultaContaPgo.setCadastro(pObj: TObject);
begin
  inherited;
//  umFormCadastroContaPgo := TFormCadastroContaPgo(pObj);
end;

end.
