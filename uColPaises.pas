unit uColPaises;

interface
  uses uColecoes, uPaises;
  type ColPaises = class(colecoes)
  private
  protected
  public
     function Pesquisar(pChave: string; pQuero: boolean): integer; overload;
     function Pesquisar(pChave: integer; pQuero: boolean): integer; overload;
     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColPaises }

procedure ColPaises.LerArq;
begin

end;

function ColPaises.Pesquisar(pChave: string; pQuero: boolean): integer;
var k: integer;
begin
   if self.VerVazia then
      Result := 1
   else
   begin
      k := 1;
      while (k <= tam) and (pChave > Paises(item[k]).getPais) do
         k := k + 1;
      if pQuero then
      begin
         if k > tam then
            Result := 0
         else
            if pChave = Paises(item[k]).getPais then
               Result := k
            else
               Result := 0
      end
      else
      begin
         if k > tam then
            Result := k
         else
           if pChave = Paises(item[k]).getPais then
              Result := 0
           else
              Result := k;
      end;
   end;
end;

function ColPaises.Pesquisar(pChave: integer; pQuero: boolean): integer;
begin

end;

procedure ColPaises.SalvarArq;
begin

end;

end.
