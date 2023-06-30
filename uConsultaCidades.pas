unit uConsultaCidades;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroCidades, uCidades, uCtrlCidades, uColCidades, uPai, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormConsultaCidades = class(TFormConsultaPai)
    procedure FormCreate(Sender: TObject);
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
  end;

var
  umFormConsultaCidades: TFormConsultaCidades;

implementation

{$R *.dfm}

{ TFormConsultaCidades }

procedure TFormConsultaCidades.Alterar;
var mMsg: string;
begin
  inherited;
  mMsg := aCtrlCidade.Carregar(aCidade);
  umFormCadastroCidades.ConhecaObj(aCidade, aCtrlCidade);
  umFormCadastroCidades.LimpaEdit;
  umFormCadastroCidades.CarregaEdit;
  umFormCadastroCidades.ShowModal;
end;

procedure TFormConsultaCidades.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aCidade := Cidades(pObj);
  aCtrlCidade := CtrlCidades(pCtrl);
  self.DBGrid1.DataSource := aCtrlCidade.getDS;
  aCtrlCidade.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaCidades.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlCidade.Carregar(aCidade);
  umFormCadastroCidades.ConhecaObj(aCidade, aCtrlCidade);
  mAux := umFormCadastroCidades.btnSalvar.Caption;
  umFormCadastroCidades.btnSalvar.Caption := '&Excluir';
  umFormCadastroCidades.LimpaEdit;

  umFormCadastroCidades.CarregaEdit;
  umFormCadastroCidades.BloqueiaEdit;
  umFormCadastroCidades.ShowModal;
  umFormCadastroCidades.DesbloqueiaEdit;
  umFormCadastroCidades.btnSalvar.Caption := mAux;
  self.Pesquisar;
end;

procedure TFormConsultaCidades.FormCreate(Sender: TObject);
begin
  inherited;
  umFormCadastroCidades := TFormCadastroCidades.Create(nil);
end;

procedure TFormConsultaCidades.Inserir;
begin
  inherited;
  aCidade.setCodigo(0);
  umFormCadastroCidades.ConhecaObj(aCidade, aCtrlCidade);
  umFormCadastroCidades.LimpaEdit;
  umFormCadastroCidades.ShowModal;
  self.Pesquisar;
end;

procedure TFormConsultaCidades.Pesquisar;
begin
  inherited;
  aCtrlCidade.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaCidades.Sair;
begin
  inherited;
//  Close;
end;

procedure TFormConsultaCidades.setCadastro(pObj: TObject);
begin
  inherited;
//  umFormCadastroCidades := TFormCadastroCidades(pObj);
end;

end.
