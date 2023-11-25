unit uColCompras;

interface
 uses uColecoes, uCompras;
  type ColCompras = class(colecoes)
  private
  protected
  public
     function Pesquisar(pChave: string; pQuero: boolean): integer; overload;
     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColProdutos }

procedure ColCompras.LerArq;
begin

end;

function ColCompras.Pesquisar(pChave: string; pQuero: boolean): integer;
var k: integer;
begin
   if self.VerVazia then
      Result := 1
   else
   begin
      k := 1;
      while (k <= tam) and (pChave > Compras(item[k]).getModelo) do
         k := k + 1;
      if pQuero then
      begin
         if k > tam then
            Result := 0
         else
            if pChave = Compras(item[k]).getModelo then
               Result := k
            else
               Result := 0
      end
      else
      begin
         if k > tam then
            Result := k
         else
           if pChave = Compras(item[k]).getModelo then
              Result := 0
           else
              Result := k;
      end;
   end;
end;

procedure ColCompras.SalvarArq;
begin

end;

end.
