unit uCtrlCidades;

interface
 uses uController, uDaoCidades;

 type CtrlCidades = class(controller)
   private
   protected
      aDaoCidades : DaoCidades;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ CtrlCidades }

function CtrlCidades.CarregarColecao: TObject;
begin
   Result := aDAOCidades.CarregarColecao;
end;

constructor CtrlCidades.CrieObj;
begin
   aDaoCidades := DaoCidades.CrieObj;
end;

destructor CtrlCidades.Destrua_se;
begin
   aDaoCidades.Destrua_se;
end;

function CtrlCidades.salvar(pObj: TObject): string;
begin

end;

end.
