unit uCtrlClientes;

interface
 uses uController, uDaoClientes;

 type CtrlClientes = class(controller)
   private
   protected
      aDaoClientes : DaoClientes;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ CtrlClientes }

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

function CtrlClientes.salvar(pObj: TObject): string;
begin

end;

end.
