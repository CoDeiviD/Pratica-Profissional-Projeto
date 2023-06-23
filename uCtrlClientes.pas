unit uCtrlClientes;

interface
 uses uController, uCliente, uDaoClientes, Data.DB;

 type CtrlClientes = class(controller)
   private
   protected
      aDaoClientes : DaoClientes;
   public
      constructor CrieObj;
      destructor Destrua_se;
      procedure setDM (pDM : TObject); override;
      function getDS: TDataSource;    override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
      function Pesquisar (pChave: string; pOBJ: TObject): integer; override;
 end;
implementation

{ CtrlClientes }

function CtrlClientes.Carregar(pPos: integer): TObject;
begin
   Result := aDaoClientes.Carregar(pPos);
end;

function CtrlClientes.CarregarColecao: TObject;
begin
   Result := aDAOClientes.CarregarColecao;
end;

constructor CtrlClientes.CrieObj;
begin
   aDaoClientes := DaoClientes.CrieObj;
end;

destructor CtrlClientes.Destrua_se;
begin
   aDaoClientes.Destrua_se;
end;

function CtrlClientes.getDS: TDataSource;
begin
   Result := aDaoClientes.getDS;
end;

function CtrlClientes.Pesquisar(pChave: string; pOBJ: TObject): integer;
var mQuero : boolean;
    mCliente  : Clientes;
begin
   mCliente := Clientes(pObj);
   if mCliente.getCodigo = 0 then
      mQuero := false
   else
      mQuero := true;

end;

function CtrlClientes.salvar(pObj: TObject): string;
begin
   aDaoClientes.Salvar(pObj);
end;

procedure CtrlClientes.setDM(pDM: TObject);
begin
  inherited;
   aDaoClientes.setDM(pDM);
end;

end.
