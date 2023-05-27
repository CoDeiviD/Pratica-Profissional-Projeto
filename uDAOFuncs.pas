unit uDAOFuncs;

interface
 uses uDao, uColFuncs, uFuncionario;

 type DAOFuncs = class(DAO)
   private
   protected
      aColFuncs : ColFuncionarios;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
 end;
implementation

{ DAOFuncs }

constructor DAOFuncs.CrieObj;
begin
   aColFuncs := ColFuncionarios.CrieObj;
end;

destructor DAOFuncs.Destrua_se;
begin
   aColFuncs.Destrua_se;
end;

function DAOFuncs.salvar(pObj: TObject): string;
begin

end;

end.
