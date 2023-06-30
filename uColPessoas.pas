unit uColPessoas;

interface
 uses uColecoes, uPessoas;
  type ColPessoas = class(colecoes)
  private
  protected
  public
//     function Pesquisar(pChave: string; pQuero: boolean): integer; overload;
//     procedure SalvarArq;
     procedure LerArq;
  end;
implementation

{ ColPessoas }

procedure ColPessoas.LerArq;
begin

end;

//function ColPessoas.Pesquisar(pChave: string; pQuero: boolean): integer;
//var k: integer;
//begin
//   if self.VerVazia then
//      Result := 1
//   else
//   begin
//      k := 1;
//      while (k <= tam) and (pChave > Pessoas(item[k]).getNome) do
//         k := k + 1;
//      if pQuero then
//      begin
//         if k > tam then
//            Result := 0
//         else
//            if pChave = Pessoas(item[k]).getNome then
//               Result := k
//            else
//               Result := 0
//      end
//      else
//      begin
//         if k > tam then
//            Result := k
//         else
//           if pChave = Pessoas(item[k]).getNome then
//              Result := 0
//           else
//              Result := k;
//      end;
//  end;
//end;

//procedure ColPessoas.SalvarArq;
//begin
//
//end;

end.
