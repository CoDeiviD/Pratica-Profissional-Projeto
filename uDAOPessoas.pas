unit uDAOPessoas;

interface
 uses uDao, uColPessoas, uPessoas, Data.DB;

 type DAOPessoas = class(DAO)
   private
   protected
      aColPessoas : ColPessoas;
   public
      constructor CrieObj;
      destructor Destrua_se;
      function salvar(pObj : TObject): string; override;
      function CarregarColecao: TObject;        override;
      function Carregar(pObj : TObject): string;                override;
      function Pesquisar (pChave: string): string; override;
      function Excluir (pObj : TOBject): string;  override;
 end;
implementation

uses
  System.SysUtils;

{ DAOPessoas }

function DAOPessoas.Carregar(pObj : TObject): string;
begin
end;

function DAOPessoas.CarregarColecao: TObject;
begin
   Result := aColPessoas;
end;

constructor DAOPessoas.CrieObj;
begin

end;

destructor DAOPessoas.Destrua_se;
begin

end;

function DAOPessoas.Excluir(pObj: TOBject): string;
begin

end;

function DAOPessoas.Pesquisar(pChave: string): string;
begin

end;

function DAOPessoas.salvar(pObj: TObject): string;
begin

end;

end.
