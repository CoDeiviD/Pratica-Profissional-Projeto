unit uColCaixas;

interface
 uses uColecoes, uCaixas;
  type ColCaixas = class(colecoes)
  private
  protected
  public
     function Pesquisar(pChave: string; pQuero: boolean): integer; overload;
     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColCaixas }

procedure ColCaixas.LerArq;
begin

end;

function ColCaixas.Pesquisar(pChave: string; pQuero: boolean): integer;
var k: integer;
begin
   if self.VerVazia then
      Result := 1
   else
   begin
      k := 1;
      while (k <= tam) and (pChave > Caixas(item[k]).getHistorico) do
         k := k + 1;
      if pQuero then
      begin
         if k > tam then
            Result := 0
         else
            if pChave = Caixas(item[k]).getHistorico then
               Result := k
            else
               Result := 0
      end
      else
      begin
         if k > tam then
            Result := k
         else
           if pChave = Caixas(item[k]).getHistorico then
              Result := 0
           else
              Result := k;
      end;
   end;
end;

procedure ColCaixas.SalvarArq;
begin

end;

end.
