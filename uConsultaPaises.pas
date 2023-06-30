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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
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
  end;

var
  FormConsultaPaises: TFormConsultaPaises;

implementation

{$R *.dfm}

{ TFormConsultaPaises }

procedure TFormConsultaPaises.Alterar;
var mMsg :string;
begin
  inherited;
  mMsg := aCtrlPais.Carregar(oPais);
  umFormCadastroPaises.ConhecaObj(oPais, aCtrlPais);
  umFormCadastroPaises.LimpaEdit;
  umFormCadastroPaises.CarregaEdit;
  umFormCadastroPaises.ShowModal;
end;

procedure TFormConsultaPaises.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oPais := Paises(pObj);
  aCtrlPais := CtrlPaises(pCtrl);
  self.DBGrid1.DataSource := aCtrlPais.getDS;
  aCtrlPais.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaPaises.Excluir;
var mMsg, mAux :string;
begin
  inherited;
  mMsg := aCtrlPais.Carregar(oPais);
  umFormCadastroPaises.ConhecaObj(oPais, aCtrlPais);
  mAux := umFormCadastroPaises.btnSalvar.Caption;
  umFormCadastroPaises.btnSalvar.Caption := '&Excluir';
  umFormCadastroPaises.LimpaEdit;

  umFormCadastroPaises.CarregaEdit;
  umFormCadastroPaises.BloqueiaEdit;
  umFormCadastroPaises.ShowModal;
  umFormCadastroPaises.DesbloqueiaEdit;
  umFormCadastroPaises.btnSalvar.Caption := mAux;
  self.Pesquisar;
end;

procedure TFormConsultaPaises.FormCreate(Sender: TObject);
begin
  inherited;
  umFormCadastroPaises := TFormCadastroPaises.Create(nil);
end;

procedure TFormConsultaPaises.Inserir;
begin
  inherited;
  oPais.setCodigo(0);
  umFormCadastroPaises.ConhecaObj(oPais, aCtrlPais);
  umFormCadastroPaises.LimpaEdit;
  umFormCadastroPaises.ShowModal;
  self.Pesquisar;
end;

procedure TFormConsultaPaises.Pesquisar;
begin
  inherited;
  aCtrlPais.Pesquisar(self.edtChave.Text);
end;

procedure TFormConsultaPaises.Sair;
begin
  inherited;
//  Close;
end;

procedure TFormConsultaPaises.setCadastro(pObj: TObject);
begin
  inherited;
//  umFormCadastroPaises := TFormCadastroPaises(pObj);
end;

end.
