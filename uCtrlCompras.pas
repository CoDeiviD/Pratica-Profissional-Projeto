unit uCtrlCompras;

interface
 uses uController, uCompras, uDaoCompras, Data.DB;

 type CtrlCompras = class(controller)
   private
   protected
      aDaoCompras : DaoCompras;
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

{ CtrlCompras }

function CtrlCompras.Carregar(pObj : TObject): string;
begin
   Result := aDaoCompras.Carregar(pObj);
end;

constructor CtrlCompras.CrieObj;
begin
   aDaoCompras := DaoCompras.CrieObj;
end;

destructor CtrlCompras.Destrua_se;
begin
   aDaoCompras.Destrua_se;
end;

function CtrlCompras.Excluir(pObj: TOBject): string;
begin
   Result := aDaoCompras.Excluir(pObj);
end;

function CtrlCompras.getDS: TDataSource;
begin
   Result := aDaoCompras.getDS;
end;

function CtrlCompras.Pesquisar(pChave: string): string;
var mQuero : boolean;
    mCompra : Compras;
begin
   Result := aDaoCompras.Pesquisar(pChave);

end;

function CtrlCompras.salvar(pObj: TObject): string;
begin
   Result := aDaoCompras.Salvar(pObj);
end;

procedure CtrlCompras.setDM(pDM: TObject);
begin
  inherited;
   aDaoCompras.setDM(pDM);
end;

end.
