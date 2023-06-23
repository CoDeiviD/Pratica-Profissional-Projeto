unit uDAOPessoas;

interface
 uses uDao, uColPessoas, uPessoas, Data.DB;

 type DAOPessoas = class(DAO)
   private
   protected
      aColPessoas : ColPessoas;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
 end;
implementation

{ DAOPessoas }

function DAOPessoas.Carregar(pPos: integer): TObject;
begin
   Result := aColPessoas.Carregar(pPos);
end;

function DAOPessoas.CarregarColecao: TObject;
begin
   Result := aColPessoas;
end;

constructor DAOPessoas.CrieObj;
begin
   aColPessoas := ColPessoas.CrieObj;
end;

destructor DAOPessoas.Destrua_se;
begin
   aColPessoas.Destrua_se;
end;

function DAOPessoas.salvar(pObj: TObject): string;
var aux: integer;
begin
   aux := aColPessoas.getTam + 1;
   Pessoas(pObj).setCodigo(aux);
   aColPessoas.InsereFim(pObj);
end;

end.
