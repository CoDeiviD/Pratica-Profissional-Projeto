unit uDAOCidades;

interface
 uses uDao, uColCidades, uCidades;

 type DAOCidades = class(DAO)
   private
   protected
      aColCidades : ColCidades;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ DAOCidades }

function DAOCidades.CarregarColecao: TObject;
begin
   Result := aColCidades;
end;

constructor DAOCidades.CrieObj;
begin
   aColCidades := ColCidades.CrieObj;
end;

destructor DAOCidades.Destrua_se;
begin
   aColCidades.Destrua_se;
end;

function DAOCidades.salvar(pObj: TObject): string;
begin

end;

end.
