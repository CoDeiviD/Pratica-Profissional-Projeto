unit uConsultaCidades;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroCidades, uCidades;

type
  TFormConsultaCidades = class(TFormConsultaPai)
  private
    { Private declarations }
    umFormCadastroCidades : TFormCadastroCidades;
    aCidade : Cidades;
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
begin
  inherited;
  umFormCadastroCidades.ConhecaObj(aCidade, nil);
  umFormCadastroCidades.LimpaEdit;
  umFormCadastroCidades.CarregaEdit;
  umFormCadastroCidades.ShowModal;
end;

procedure TFormConsultaCidades.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aCidade := Cidades(pObj);
end;

procedure TFormConsultaCidades.Excluir;
begin
  inherited;
  umFormConsultaCidades.ConhecaObj(aCidade,nil);
  umFormConsultaCidades.ShowModal;
end;

procedure TFormConsultaCidades.Inserir;
begin
  inherited;
  umFormConsultaCidades.ConhecaObj(aCidade,nil);
  umFormConsultaCidades.ShowModal;
end;

procedure TFormConsultaCidades.Pesquisar;
begin
  inherited;

end;

procedure TFormConsultaCidades.Sair;
begin
  inherited;

end;

procedure TFormConsultaCidades.setCadastro(pObj: TObject);
begin
  inherited;

end;

end.
