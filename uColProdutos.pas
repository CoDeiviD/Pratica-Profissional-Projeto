unit uColProdutos;

interface
 uses uColecoes, uProdutos;
  type ColProdutos = class(colecoes)
  private
  protected
  public
     function Pesquisar(pChave: string; pQuero: boolean): integer; overload;
     function Pesquisar(pChave: integer; pQuero: boolean): integer; overload;
     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColProdutos }

procedure ColProdutos.LerArq;
begin

end;

function ColProdutos.Pesquisar(pChave: string; pQuero: boolean): integer;
var k: integer;
begin
   if self.VerVazia then
      Result := 1
   else
   begin
      k := 1;
      while (k <= tam) and (pChave > Produtos(item[k]).getTpProduto) do
         k := k + 1;
      if pQuero then
      begin
         if k > tam then
            Result := 0
         else
            if pChave = Produtos(item[k]).getTpProduto then
               Result := k
            else
               Result := 0
      end
      else
      begin
         if k > tam then
            Result := k
         else
           if pChave = Produtos(item[k]).getTpProduto then
              Result := 0
           else
              Result := k;
      end;
   end;
end;

function ColProdutos.Pesquisar(pChave: integer; pQuero: boolean): integer;
begin

end;

procedure ColProdutos.SalvarArq;
begin

end;

end.
