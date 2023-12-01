unit uCtrlVendas;

interface
  uses uController, uVendas, uDaoVendas, Data.DB;

 type CtrlVendas = class(controller)
   private
   protected
      aDaoVendas : DaoVendas;
   public
      constructor CrieObj;
      destructor Destrua_se;
      procedure setDM (pDM : TObject); override;
      function getDS: TDataSource;    override;
      function salvar(pObj : TObject): string; override;
      function Carregar(pObj : TObject): string;   override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;
 end;
implementation

{ CtrlVendas }

function CtrlVendas.Carregar(pObj : TObject): string;
begin
   Result := aDaoVendas.Carregar(pObj);
end;

constructor CtrlVendas.CrieObj;
begin
   aDaoVendas := DaoVendas.CrieObj;
end;

destructor CtrlVendas.Destrua_se;
begin
   aDaoVendas.Destrua_se;
end;

function CtrlVendas.Excluir(pObj: TOBject): string;
begin
   Result := aDaoVendas.Excluir(pObj);
end;

function CtrlVendas.getDS: TDataSource;
begin
   Result := aDaoVendas.getDS;
end;

function CtrlVendas.Pesquisar(pChave: string): string;
var mQuero : boolean;
    mVenda : Vendas;
begin
   Result := aDaoVendas.Pesquisar(pChave);

end;

function CtrlVendas.salvar(pObj: TObject): string;
begin
   Result := aDaoVendas.Salvar(pObj);
end;

procedure CtrlVendas.setDM(pDM: TObject);
begin
  inherited;
   aDaoVendas.setDM(pDm);
end;

end.
