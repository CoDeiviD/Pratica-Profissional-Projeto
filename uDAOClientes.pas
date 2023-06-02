unit uDAOClientes;

interface
 uses uDao, uColClientes, uCliente;

 type DAOClientes = class(DAO)
   private
   protected
      aColClientes : ColClientes;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ DAOClientes }

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

function DAOClientes.salvar(pObj: TObject): string;
begin

end;

end.
