unit uDAOForns;

interface
 uses uDao, uColForns, uFornecedor;

 type DAOForns = class(DAO)
   private
   protected
      aColForns : ColFornecedores;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ DAOForns }

function DAOForns.CarregarColecao: TObject;
begin
   Result := aColForns;
end;

constructor DAOForns.CrieObj;
begin
   aColForns := ColFornecedores.CrieObj;
end;

destructor DAOForns.Destrua_se;
begin
   aColForns.Destrua_se;
end;

function DAOForns.salvar(pObj: TObject): string;
begin

end;

end.
