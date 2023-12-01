unit uColVendas;

interface
 uses uColecoes, uVendas;
  type ColVendas = class(colecoes)
  private
  protected
  public
     function Pesquisar(pChave: string; pQuero: boolean): integer; overload;
     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColVendas }

procedure ColVendas.LerArq;
begin

end;

function ColVendas.Pesquisar(pChave: string; pQuero: boolean): integer;
var k: integer;
begin
   if self.VerVazia then
      Result := 1
   else
   begin
      k := 1;
      while (k <= tam) and (pChave > Vendas(item[k]).getObs) do
         k := k + 1;
      if pQuero then
      begin
         if k > tam then
            Result := 0
         else
            if pChave = Vendas(item[k]).getObs then
               Result := k
            else
               Result := 0
      end
      else
      begin
         if k > tam then
            Result := k
         else
           if pChave = Vendas(item[k]).getObs then
              Result := 0
           else
              Result := k;
      end;
   end;
end;

procedure ColVendas.SalvarArq;
begin

end;

end.
