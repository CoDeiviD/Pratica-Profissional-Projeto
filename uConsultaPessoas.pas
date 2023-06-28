unit uConsultaPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Vcl.ComCtrls, Vcl.StdCtrls,
  uCadastroPessoas, uPessoas, uCtrlPessoas, uColPessoas, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFormConsultaPessoas = class(TFormConsultaPai)
    procedure btnInserirClick(Sender: TObject);
  private
    { Private declarations }
    umFormCadastroPessoas : TFormCadastroPessoas;
    aPessoa : Pessoas;
    aCtrlPessoa : CtrlPessoas;
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
  FormConsultaPessoas: TFormConsultaPessoas;

implementation

{$R *.dfm}

{ TFormConsultaPessoas }

procedure TFormConsultaPessoas.Alterar;
begin
  inherited;
  umFormCadastroPessoas.ConhecaObj(aPessoa, aCtrlPessoa);
  umFormCadastroPessoas.LimpaEdit;
  umFormCadastroPessoas.CarregaEdit;
  umFormCadastroPessoas.ShowModal;
end;

procedure TFormConsultaPessoas.btnInserirClick(Sender: TObject);
begin
  inherited;
   self.Inserir;
end;

procedure TFormConsultaPessoas.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aPessoa := Pessoas(pObj);
  aCtrlPessoa := CtrlPessoas(pCtrl);
end;

procedure TFormConsultaPessoas.Excluir;
var aux : string;
begin
  inherited;
  aux := umFormCadastroPessoas.btnSalvar.Caption;
  umFormCadastroPessoas.btnSalvar.Caption := '&Excluir';
  umFormCadastroPessoas.ConhecaObj(aPessoa, aCtrlPessoa);

  umFormCadastroPessoas.LimpaEdit;
  umFormCadastroPessoas.CarregaEdit;
  umFormCadastroPessoas.ShowModal;
  umFormCadastroPessoas.btnSalvar.Caption := aux;
end;

procedure TFormConsultaPessoas.Inserir;
begin
  inherited;
  umFormCadastroPessoas.ConhecaObj(aPessoa, aCtrlPessoa);
  umFormCadastroPessoas.LimpaEdit;
  umFormCadastroPessoas.ShowModal;
end;

procedure TFormConsultaPessoas.Pesquisar;
begin
  inherited;
//  aCtrlPessoa.Pesquisar(self.edtChave.Text, aPessoa);
end;

procedure TFormConsultaPessoas.Sair;
begin
  inherited;
  Close;
end;

procedure TFormConsultaPessoas.setCadastro(pObj: TObject);
begin
  inherited;
  umFormCadastroPessoas := TFormCadastroPessoas(pObj);
end;

end.
