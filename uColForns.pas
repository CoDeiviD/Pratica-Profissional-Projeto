unit uColForns;

interface
 uses uColecoes, uFornecedor;
  type ColFornecedores = class(colecoes)
  private
  protected
  public
     function Pesquisar(pChave: string; pQuero: boolean): integer; overload;
     function Pesquisar(pChave: integer; pQuero: boolean): integer; overload;
     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColFornecedores }

procedure ColFornecedores.LerArq;
begin

end;

function ColFornecedores.Pesquisar(pChave: string; pQuero: boolean): integer;
var k: integer;
begin
   if self.VerVazia then
      Result := 1
   else
   begin
      k := 1;
      while (k <= tam) and (pChave > Fornecedores(item[k]).getNome) do
         k := k + 1;
      if pQuero then
      begin
         if k > tam then
            Result := 0
         else
            if pChave = Fornecedores(item[k]).getNome then
               Result := k
            else
               Result := 0
      end
      else
      begin
         if k > tam then
            Result := k
         else
           if pChave = Fornecedores(item[k]).getNome then
              Result := 0
           else
              Result := k;
      end;
   end;
end;

function ColFornecedores.Pesquisar(pChave: integer; pQuero: boolean): integer;
begin

end;

procedure ColFornecedores.SalvarArq;
begin

end;

end.
