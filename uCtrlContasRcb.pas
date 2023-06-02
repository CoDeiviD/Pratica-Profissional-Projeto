unit uCtrlContasRcb;

interface
 uses uController, uDaoContasRcb;

 type CtrlContasRcb = class(controller)
   private
   protected
      aDaoContasRcb : DaoContasRcb;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ CtrlContasRcb }

function CtrlContasRcb.CarregarColecao: TObject;
begin
   Result := aDAOContasRcb.CarregarColecao;
end;

constructor CtrlContasRcb.CrieObj;
begin
   aDaoContasRcb := DaoContasRcb.CrieObj;
end;

destructor CtrlContasRcb.Destrua_se;
begin
   aDaoContasRcb.Destrua_se;
end;

function CtrlContasRcb.salvar(pObj: TObject): string;
begin

end;

end.
