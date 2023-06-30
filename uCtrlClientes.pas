unit uCtrlClientes;

interface
 uses uController, uCliente, uCtrlCidades, uDaoClientes, Data.DB;

 type CtrlClientes = class(controller)
   private
   protected
      aDaoClientes : DaoClientes;
      aCtrlCidade : CtrlCidades;
   public
      constructor CrieObj;
      destructor Destrua_se;
      procedure setDM (pDM : TObject); override;
      function getDS: TDataSource;    override;
      function salvar(pObj : TObject): string; override;
      function Carregar(pOBJ: TObject): string;    override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;
 end;
implementation

{ CtrlClientes }

function CtrlClientes.Carregar(pOBJ: TObject): string;
begin
   Result := aDaoClientes.Carregar(pObj);
end;

constructor CtrlClientes.CrieObj;
begin
   aDaoClientes := DaoClientes.CrieObj;
end;

destructor CtrlClientes.Destrua_se;
begin
   aDaoClientes.Destrua_se;
end;

function CtrlClientes.Excluir(pObj: TOBject): string;
begin
   Result := aDaoClientes.Excluir(pObj);
end;

function CtrlClientes.getDS: TDataSource;
begin
   Result := aDaoClientes.getDS;
end;

function CtrlClientes.Pesquisar(pChave: string): string;
var mQuero : boolean;
    mCliente  : Clientes;
begin
   Result := aDaoClientes.Pesquisar(pChave);

end;

function CtrlClientes.salvar(pObj: TObject): string;
begin
   Result := aDaoClientes.Salvar(pObj);
end;

procedure CtrlClientes.setDM(pDM: TObject);
begin
  inherited;
   aDaoClientes.setDM(pDM);
end;

end.
