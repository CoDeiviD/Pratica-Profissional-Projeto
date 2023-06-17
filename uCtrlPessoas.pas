unit uCtrlPessoas;

interface
 uses uController, uDaoPessoas;

 type CtrlPessoas = class(controller)
   private
   protected
      aDaoPessoas : DaoPessoas;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
 end;
implementation

{ CtrlPessoas }

function CtrlPessoas.CarregarColecao: TObject;
begin
   Result := aDaoPessoas;
end;

constructor CtrlPessoas.CrieObj;
begin
   aDaoPessoas := DaoPessoas.CrieObj;
end;

destructor CtrlPessoas.Destrua_se;
begin
   aDaoPessoas.Destrua_se;
end;

function CtrlPessoas.salvar(pObj: TObject): string;
begin

end;

end.
