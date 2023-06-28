unit uConsultaCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroCaixa, uCaixas, uCtrlCaixas, uColCaixas, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFormConsultaCaixa = class(TFormConsultaPai)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroCaixas : TFormCadastroCaixa;
    aCaixa : Caixas;
    aCtrlCaixa: CtrlCaixas;
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
  FormConsultaCaixa: TFormConsultaCaixa;

implementation

{$R *.dfm}

{ TFormConsultaCaixa }

procedure TFormConsultaCaixa.Alterar;
begin
  inherited;

end;

procedure TFormConsultaCaixa.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aCaixa := Caixas(pObj);
  aCtrlCaixa := CtrlCaixas(pCtrl);
  self.DBGrid1.DataSource := aCtrlCaixa.getDS;
  aCtrlCaixa.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaCaixa.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlCaixa.Carregar(aCaixa);
  umFormCadastroCaixas.ConhecaObj(aCaixa, aCtrlCaixa);
  mAux := umFormCadastroCaixas.btnSalvar.Caption;
  umFormCadastroCaixas.btnSalvar.Caption := '&Excluir';
  umFormCadastroCaixas.LimpaEdit;

  umFormCadastroCaixas.CarregaEdit;
  umFormCadastroCaixas.BloqueiaEdit;
  umFormCadastroCaixas.ShowModal;
  umFormCadastroCaixas.DesbloqueiaEdit;
  umFormCadastroCaixas.btnSalvar.Caption := mAux;
  self.Pesquisar;
end;

procedure TFormConsultaCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  umFormCadastroCaixas := TFormCadastroCaixa.Create(nil);
end;

procedure TFormConsultaCaixa.Inserir;
begin
  inherited;
  aCaixa.setCodigo(0);
  umFormCadastroCaixas.ConhecaObj(aCaixa, aCtrlCaixa);
  umFormCadastroCaixas.LimpaEdit;
  umFormCadastroCaixas.ShowModal;
  self.Pesquisar;
end;

procedure TFormConsultaCaixa.Pesquisar;
begin
  inherited;
  aCtrlCaixa.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaCaixa.Sair;
begin
  inherited;
//  Close;
end;

procedure TFormConsultaCaixa.setCadastro(pObj: TObject);
begin
  inherited;
//  umFormCadastroCaixas := TFormCadastroCaixa(pObj);
end;

end.
