unit uColCidades;

interface
 uses uColecoes, uCidades;
  type ColCidades = class(colecoes)
  private
  protected
  public
     function Pesquisar(pChave: string; pQuero: boolean): integer; overload;
     function Pesquisar(pChave: integer; pQuero: boolean): integer; overload;
     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColCidades }

procedure ColCidades.LerArq;
begin

end;

function ColCidades.Pesquisar(pChave: string; pQuero: boolean): integer;
var k: integer;
begin
   if self.VerVazia then
      Result := 1
   else
   begin
      k := 1;
      while (k <= tam) and (pChave > Cidades(item[k]).getCidade) do
         k := k + 1;
      if pQuero then
      begin
         if k > tam then
            Result := 0
         else
            if pChave = Cidades(item[k]).getCidade then
               Result := k
            else
               Result := 0
      end
      else
      begin
         if k > tam then
            Result := k
         else
           if pChave = Cidades(item[k]).getCidade then
              Result := 0
           else
              Result := k;
      end;
   end;
end;

function ColCidades.Pesquisar(pChave: integer; pQuero: boolean): integer;
begin

end;

procedure ColCidades.SalvarArq;
begin

end;

end.
