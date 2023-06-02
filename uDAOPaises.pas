unit uDAOPaises;

interface
 uses uDao, uColPaises, uPaises;

 type DAOPaises = class(DAO)
   private
   protected
      aColPaises : ColPaises;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ DAOPaises }

function DAOPaises.CarregarColecao: TObject;
begin
   result := aColPaises;
end;

constructor DAOPaises.CrieObj;
begin
   aColPaises := ColPaises.CrieObj;
end;

destructor DAOPaises.Destrua_se;
begin
   aColPaises.Destrua_se;
end;

function DAOPaises.salvar(pObj: TObject): string;
begin

end;

end.
