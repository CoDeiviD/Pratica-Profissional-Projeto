unit uConsultaContaRcb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroContaRcb, uContasRcb, uCtrlContasRcb, uColContasRcb, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormConsultaContaRcb = class(TFormConsultaPai)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroContaRcb : TFormCadastroContaRcb;
    aContaRcb : ContasRcb;
    aCtrlContaRcb: CtrlContasRcb;
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
  FormConsultaContaRcb: TFormConsultaContaRcb;

implementation

{$R *.dfm}

{ TFormConsultaContaRcb }

procedure TFormConsultaContaRcb.Alterar;
begin
  inherited;

end;

procedure TFormConsultaContaRcb.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aContaRcb := ContasRcb(pObj);
  aCtrlContaRcb := CtrlContasRcb(pCtrl);
  self.DBGrid1.DataSource := aCtrlContaRcb.getDS;
  aCtrlContaRcb.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaContaRcb.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlContaRcb.Carregar(aContaRcb);
  umFormCadastroContaRcb.ConhecaObj(aContaRcb, aCtrlContaRcb);
  mAux := umFormCadastroContaRcb.btnSalvar.Caption;
  umFormCadastroContaRcb.btnSalvar.Caption := '&Excluir';
  umFormCadastroContaRcb.LimpaEdit;

  umFormCadastroContaRcb.CarregaEdit;
  umFormCadastroContaRcb.BloqueiaEdit;
  umFormCadastroContaRcb.ShowModal;
  umFormCadastroContaRcb.DesbloqueiaEdit;
  umFormCadastroContaRcb.btnSalvar.Caption := mAux;
  self.Pesquisar;
end;

procedure TFormConsultaContaRcb.FormCreate(Sender: TObject);
begin
  inherited;
  umFormCadastroContaRcb := TFormCadastroContaRcb.Create(nil);
end;

procedure TFormConsultaContaRcb.Inserir;
begin
  inherited;
  aContaRcb.setCodigo(0);
  umFormCadastroContaRcb.ConhecaObj(aContaRcb, aCtrlContaRcb);
  umFormCadastroContaRcb.LimpaEdit;
  umFormCadastroContaRcb.ShowModal;
  self.Pesquisar;
end;

procedure TFormConsultaContaRcb.Pesquisar;
begin
  inherited;
  aCtrlContaRcb.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaContaRcb.Sair;
begin
  inherited;
//  Close;
end;

procedure TFormConsultaContaRcb.setCadastro(pObj: TObject);
begin
  inherited;
//  umFormCadastroContaRcb := TFormCadastroContaRcb(pObj);
end;

end.
