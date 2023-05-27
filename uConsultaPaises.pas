unit uConsultaPaises;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroPaises, uPaises,
  uCtrlPaises,
  uColPaises;

type
  TFormConsultaPaises = class(TFormConsultaPai)
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
end;

procedure TFormConsultaPaises.CarregaLV;
begin
  inherited;

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
end;

procedure TFormConsultaPaises.Inserir;
begin
  inherited;
  umFormCadastroPaises.ConhecaObj(oPais, aCtrlPais);
  umFormCadastroPaises.LimpaEdit;
  umFormCadastroPaises.ShowModal;
end;

procedure TFormConsultaPaises.Pesquisar;
begin
  inherited;

end;

procedure TFormConsultaPaises.Sair;
begin
  inherited;

end;

procedure TFormConsultaPaises.setCadastro(pObj: TObject);
begin
  inherited;
  umFormCadastroPaises := TFormCadastroPaises(pObj);
end;

end.
