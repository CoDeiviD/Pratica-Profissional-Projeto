unit uConsultaEstados;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroEstados, uEstados, uCtrlEstados;

type
  TFormConsultaEstados = class(TFormConsultaPai)
  private
    { Private declarations }
    umFormCadastroEstados : TFormCadastroEstados;
    oEstado : Estados;
    aCtrlEstado : CtrlEstados;
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
  FormConsultaEstados: TFormConsultaEstados;

implementation

{$R *.dfm}

{ TFormConsultaEstados }

procedure TFormConsultaEstados.Alterar;
begin
  inherited;
  umFormCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  umFormCadastroEstados.LimpaEdit;
  umFormCadastroEstados.CarregaEdit;
  umFormCadastroEstados.ShowModal;
end;

procedure TFormConsultaEstados.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oEstado := Estados(pObj);
end;

procedure TFormConsultaEstados.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroEstados.btnSalvar.Caption;
  umFormCadastroEstados.btnSalvar.Caption := '&Excluir';
  umFormCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  umFormCadastroEstados.LimpaEdit;
  umFormCadastroEstados.CarregaEdit;
  umFormCadastroEstados.ShowModal;
  umFormCadastroEstados.btnSalvar.Caption := aux;

end;

procedure TFormConsultaEstados.Inserir;
begin
  inherited;
  umFormCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  umFormCadastroEstados.LimpaEdit;
  umFormCadastroEstados.ShowModal;
end;

procedure TFormConsultaEstados.Pesquisar;
begin
  inherited;

end;

procedure TFormConsultaEstados.Sair;
begin
  inherited;

end;

procedure TFormConsultaEstados.setCadastro(pObj: TObject);
begin
  inherited;

end;

end.
