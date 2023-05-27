unit uCtrlEstados;

interface
 uses uController, uDaoEstados;

 type CtrlEstados = class(controller)
   private
   protected
      aDaoEstados : DaoEstados;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
 end;
implementation

{ CtrlEstados }

constructor CtrlEstados.CrieObj;
begin
   aDaoEstados := DaoEstados.CrieObj;
end;

destructor CtrlEstados.Destrua_se;
begin
   aDaoEstados.Destrua_se;
end;

function CtrlEstados.salvar(pObj: TObject): string;
begin

end;

end.
