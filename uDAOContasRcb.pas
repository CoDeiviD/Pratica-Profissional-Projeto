unit uDAOContasRcb;

interface
 uses uDao, uColContasRcb, uContasRcb;

 type DAOContasRcb = class(DAO)
   private
   protected
      aColContasRcb : ColContasRcb;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ DAOContasRcb }

function DAOContasRcb.CarregarColecao: TObject;
begin
   Result := aColContasRcb;
end;

constructor DAOContasRcb.CrieObj;
begin
   aColContasRcb := ColContasRcb.CrieObj;
end;

destructor DAOContasRcb.Destrua_se;
begin
   aColContasRcb.Destrua_se;
end;

function DAOContasRcb.salvar(pObj: TObject): string;
begin

end;

end.
