unit uDAOClientes;

interface
 uses uDao, uDM, uColClientes, uCliente, Data.DB;

 type DAOClientes = class(DAO)
   private
   protected
      aColClientes : ColClientes;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function getDS : TDataSource;   override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
 end;
implementation

{ DAOClientes }

function DAOClientes.Carregar(pPos: integer): TObject;
begin
   Result := aColClientes.Carregar(pPos);
end;

function DAOClientes.CarregarColecao: TObject;
begin
   Result := aColClientes;
end;

constructor DAOClientes.CrieObj;
begin
   aColClientes := ColClientes.CrieObj;
end;

destructor DAOClientes.Destrua_se;
begin
   aColClientes.Destrua_se;
end;

function DAOClientes.getDS: TDataSource;
begin
   Result := umDM.DsClientes;
end;

function DAOClientes.salvar(pObj: TObject): string;
var aux: integer;
begin
   aux := aColClientes.getTam + 1;
   Clientes(pObj).setCodigo(aux);
   aColClientes.InsereFim(pObj);
end;

end.
