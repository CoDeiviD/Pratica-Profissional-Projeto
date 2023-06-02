unit uDAOContasPgr;

interface
 uses uDao, uColContasPgr, uContasPgr;

 type DAOContasPgr = class(DAO)
   private
   protected
      aColContasPgr : ColContasPgr;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ DAOCidades }

function DAOContasPgr.CarregarColecao: TObject;
begin
   Result := aColContasPgr;
end;

constructor DAOContasPgr.CrieObj;
begin
   aColContasPgr := ColContasPgr.CrieObj;
end;

destructor DAOContasPgr.Destrua_se;
begin
   aColContasPgr.Destrua_se;
end;

function DAOContasPgr.salvar(pObj: TObject): string;
begin

end;

end.
