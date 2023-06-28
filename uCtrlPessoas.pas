unit uCtrlPessoas;

interface
 uses uController, uPessoas, uDaoPessoas, Data.DB;

 type CtrlPessoas = class(controller)
   private
   protected
      aDaoPessoas : DaoPessoas;
   public
      constructor CrieObj;
      destructor Destrua_se;
      procedure setDM (pDM : TObject); override;
      function getDS: TDataSource;    override;
      function salvar(pObj : TObject): string;   override;
//      function Carregar(pObj : TObject): string; override;
      function Pesquisar (pChave: string): string; override;
//      function Excluir (pObj : TOBject): string;   override;
 end;
implementation

{ CtrlPessoas }

//function CtrlPessoas.Carregar(pPos: integer): TObject;
//begin
//   Result := aDaoPessoas.Carregar(pPos);
//end;

constructor CtrlPessoas.CrieObj;
begin
   aDaoPessoas := DaoPessoas.CrieObj;
end;

destructor CtrlPessoas.Destrua_se;
begin
   aDaoPessoas.Destrua_se;
end;

//function CtrlPessoas.Excluir(pObj: TOBject): boolean;
//begin

//end;

function CtrlPessoas.getDS: TDataSource;
begin
   Result := aDaoPessoas.getDS;
end;

function CtrlPessoas.Pesquisar(pChave: string): string;
begin

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
