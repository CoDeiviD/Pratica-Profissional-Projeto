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
      procedure setDM (pDM : TObject); override;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pPos : integer): TObject;                override;
 end;
implementation

{ CtrlPessoas }

function CtrlPessoas.Carregar(pPos: integer): TObject;
begin
   Result := aDaoPessoas.Carregar(pPos);
end;

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
   aDaoPessoas.Salvar(pObj);
end;

procedure CtrlPessoas.setDM(pDM: TObject);
begin
  inherited;
   aDaoPessoas.setDM(pDm);
end;

end.
