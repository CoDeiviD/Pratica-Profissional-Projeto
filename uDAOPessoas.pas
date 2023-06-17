unit uDAOPessoas;

interface
 uses uDao, uColPessoas, uPessoas;

 type DAOPessoas = class(DAO)
   private
   protected
      aColPessoas : ColPessoas;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ DAOPessoas }

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
begin

end;

end.
