unit uCtrlForns;

interface
 uses uController, uDaoForns;

 type CtrlForns = class(controller)
   private
   protected
      aDaoFornecedor : DaoForns;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
 end;
implementation

{ CtrlForns }

constructor CtrlForns.CrieObj;
begin
   aDaoFornecedor := DaoForns.CrieObj;
end;

destructor CtrlForns.Destrua_se;
begin
   aDaoFornecedor.Destrua_se;
end;

function CtrlForns.salvar(pObj: TObject): string;
begin

end;

end.
