unit uDAOEstados;

interface
 uses uDao, uColEstados, uEstados;

 type DAOEstados = class(DAO)
   private
   protected
      aColEstados : ColEstados;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ DAOPaises }

function DAOEstados.CarregarColecao: TObject;
begin
   Result := aColEstados;
end;

constructor DAOEstados.CrieObj;
begin
   aColEstados := ColEstados.CrieObj;
end;

destructor DAOEstados.Destrua_se;
begin
   aColEstados.Destrua_se;
end;

function DAOEstados.salvar(pObj: TObject): string;
begin

end;

end.
