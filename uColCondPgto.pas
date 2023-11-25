unit uColCondPgto;

interface
 uses uColecoes, uCondPgto;
  type ColCondPgto = class(colecoes)
  private
  protected
  public
     function Pesquisar(pChave: string; pQuero: boolean): integer; overload;
     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColCondPgto }

procedure ColCondPgto.LerArq;
begin

end;

function ColCondPgto.Pesquisar(pChave: string; pQuero: boolean): integer;
   var k: integer;
begin
   if self.VerVazia then
      Result := 1
   else
   begin
      k := 1;
      while (k <= tam) and (pChave > CondPgto(item[k]).getFormaPgto) do
         k := k + 1;
      if pQuero then
      begin
         if k > tam then
            Result := 0
         else
            if pChave = CondPgto(item[k]).getFormaPgto then
               Result := k
            else
               Result := 0
      end
      else
      begin
         if k > tam then
            Result := k
         else
           if pChave = CondPgto(item[k]).getFormaPgto then
              Result := 0
           else
              Result := k;
      end;
   end;
end;

procedure ColCondPgto.SalvarArq;
begin

end;

end.
