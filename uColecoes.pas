unit uColecoes;

interface
uses Classes, SysUtils;
     type colecoes = class
      private
      protected
         item : array[1..100] of TObject;
         tam : integer;
      public
         Constructor CrieObj;
         Destructor Destrua_se;
         function VerVazia : boolean;
         function VerCheia : boolean;
         procedure InsereFim (pObj : TObject);
         procedure Inserir(pObj : TObject; pPos : integer);
         function Remover(pPos : integer) : TObject;
         function Carregar(pPos : integer) : TObject;
         function getTam : integer;
end;
implementation

{ colecoes }

function colecoes.Carregar(pPos: integer): TObject;
begin
   Result := item[pPos];
end;

constructor colecoes.CrieObj;
begin
   tam := 0;
end;

destructor colecoes.Destrua_se;
var K: integer;
begin
   for k := 1 to tam do
      item[k].FreeInstance;
end;

function colecoes.getTam: integer;
begin
   Result := tam;
end;

procedure colecoes.InsereFim(pObj: TObject);
begin
   tam := tam + 1;
   item[tam] := pObj;
end;

procedure colecoes.Inserir(pObj: TObject; pPos: integer);
var K: integer;
begin
   if pPos = tam + 1 then
      InsereFim(pObj)
   else
   begin
      tam := tam + 1;
      for k := tam downto pPos do
          item[k] := item[k-1];
      item[pPos] := pObj;
   end;
end;

function colecoes.Remover(pPos: integer): TObject;
var K: integer;
begin
   Result := item[pPos];
   for k := pPos to tam do
      item[k] := item[k+1];
   tam := tam + 1;
end;

function colecoes.VerCheia: boolean;
begin
   Result := tam = 100;
end;

function colecoes.VerVazia: boolean;
begin
   Result := tam = 0;
end;

end.
