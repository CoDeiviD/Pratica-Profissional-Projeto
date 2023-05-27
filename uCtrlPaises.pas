unit uCtrlPaises;

interface
 uses uController, uDaoPaises;

 type CtrlPaises = class(controller)
   private
   protected
      aDaoPaises : DaoPaises;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
 end;
implementation

{ CtrlPaises }

constructor CtrlPaises.CrieObj;
begin
   aDaoPaises := DaoPaises.CrieObj;
end;

destructor CtrlPaises.Destrua_se;
begin
   aDaoPaises.Destrua_se;
end;

function CtrlPaises.salvar(pObj: TObject): string;
begin

end;

end.
