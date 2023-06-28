unit uCtrlCaixas;

interface
 uses uController, uCaixas, uDaoCaixas, Data.DB;

 type CtrlCaixas = class(controller)
   private
   protected
      aDaoCaixas : DaoCaixas;
   public
      constructor CrieObj;
      destructor Destrua_se;
      procedure setDM (pDM : TObject); override;
      function getDS: TDataSource;    override;
      function salvar(pObj : TObject): string;    override;
      function Carregar(pObj : TObject): string;  override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;
 end;
implementation

{ CtrlCaixas }

function CtrlCaixas.Carregar(pObj : TObject): string;
begin
   Result := aDaoCaixas.Carregar(pObj);
end;

constructor CtrlCaixas.CrieObj;
begin
   aDaoCaixas := DaoCaixas.CrieObj;
end;

destructor CtrlCaixas.Destrua_se;
begin
   aDaoCaixas.Destrua_se;
end;

function CtrlCaixas.Excluir(pObj: TOBject): string;
begin
   Result := aDaoCaixas.Excluir(pObj);
end;

function CtrlCaixas.getDS: TDataSource;
begin
   Result := aDaoCaixas.getDS;
end;

function CtrlCaixas.Pesquisar(pChave: string): string;
var mQuero : boolean;
    mCaixa  : Caixas;
begin
   Result := aDaoCaixas.Pesquisar(pChave);

end;

function CtrlCaixas.salvar(pObj: TObject): string;
begin
   Result := aDaoCaixas.Salvar(pObj);
end;

procedure CtrlCaixas.setDM(pDM: TObject);
begin
  inherited;
  aDaoCaixas.setDM(pDM);
end;

end.
