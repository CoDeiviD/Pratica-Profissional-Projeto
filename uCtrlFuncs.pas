unit uCtrlFuncs;

interface
 uses uController, uDaoFuncs;

 type CtrlFuncs = class(controller)
   private
   protected
      aDaoFuncionario : DaoFuncs;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
 end;
implementation

{ CtrlFuncs }

constructor CtrlFuncs.CrieObj;
begin
   aDaoFuncionario := DaoFuncs.CrieObj;
end;

destructor CtrlFuncs.Destrua_se;
begin
   aDaoFuncionario.Destrua_se;
end;

function CtrlFuncs.salvar(pObj: TObject): string;
begin

end;

end.
