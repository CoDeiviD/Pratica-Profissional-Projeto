unit uCtrlCaixas;

interface
 uses uController, uDaoCaixas;

 type CtrlCaixas = class(controller)
   private
   protected
      aDaoCaixas : DaoCaixas;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ CtrlCaixas }

function CtrlCaixas.CarregarColecao: TObject;
begin
   Result := aDAOCaixas.CarregarColecao;
end;

constructor CtrlCaixas.CrieObj;
begin
   aDaoCaixas := DaoCaixas.CrieObj;
end;

destructor CtrlCaixas.Destrua_se;
begin
   aDaoCaixas.Destrua_se;
end;

function CtrlCaixas.salvar(pObj: TObject): string;
begin

end;

end.
