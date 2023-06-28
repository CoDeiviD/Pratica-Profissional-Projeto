unit uColEstados;

interface
 uses uColecoes, uEstados;
  type ColEstados = class(colecoes)
  private
  protected
  public
     function Pesquisar(pChave: string; pQuero: boolean): integer; overload;
     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColEstados }

procedure ColEstados.LerArq;
begin

end;

function ColEstados.Pesquisar(pChave: string; pQuero: boolean): integer;
var k: integer;
begin
   if self.VerVazia then
      Result := 1
   else
   begin
      k := 1;
      while (k <= tam) and (pChave > Estados(item[k]).getEstado) do
         k := k + 1;
      if pQuero then
      begin
         if k > tam then
            Result := 0
         else
            if pChave = Estados(item[k]).getEstado then
               Result := k
            else
               Result := 0
      end
      else
      begin
         if k > tam then
            Result := k
         else
           if pChave = Estados(item[k]).getEstado then
              Result := 0
           else
              Result := k;
      end;
   end;
end;

procedure ColEstados.SalvarArq;
begin

end;

end.
