unit uDAOCaixas;

interface
 uses uDao, uColCaixas, uCaixas;

 type DAOCaixas = class(DAO)
   private
   protected
      aColCaixas : ColCaixas;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ DAOCaixas }

function DAOCaixas.CarregarColecao: TObject;
begin
   Result := aColCaixas;
end;

constructor DAOCaixas.CrieObj;
begin
   aColCaixas := ColCaixas.CrieObj;
end;

destructor DAOCaixas.Destrua_se;
begin
   aColCaixas.Destrua_se;
end;

function DAOCaixas.salvar(pObj: TObject): string;
begin

end;

end.
