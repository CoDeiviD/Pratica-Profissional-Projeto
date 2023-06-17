unit uEstados;

interface
   uses uPai, uPaises;
   type
         Estados = class(Pai)
    private
    protected
       Estado  : string[40];
       UF : string[2];
       oPais   : Paises;
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo: integer; pEstado, pUF: String; pCodPais: integer);
      destructor Destrua_se;
      procedure setEstado(pEstado:string);
      procedure setUF(pUF:string);
      procedure setoPais(poPais:paises);
      function getEstado: string;
      function getUF: string;
      function getoPais : Paises;
end;
implementation

{ Estados }

constructor Estados.CrieInit(pCodigo: integer; pEstado, pUF: String;
  pCodPais: integer);
begin
  //inherited;
   codigo := pCodigo;
   Estado := pEstado;
   UF := pUF;
   oPais := Paises.CrieInit(pCodPais ,'','','','');
end;

constructor Estados.CrieObj;
begin
  inherited;
   codigo := 0;
   Estado := '';
   UF := '';
   oPais := Paises.CrieObj;
end;

destructor Estados.Destrua_se;
begin
   oPais.Destrua_se;
end;

function Estados.getEstado: string;
begin
   Result := Estado;
end;

function Estados.getoPais: Paises;
begin
   Result := oPais;
end;

function Estados.getUF: string;
begin
   Result := UF;
end;

procedure Estados.setEstado(pEstado: string);
begin
   Estado := pEstado;
end;

procedure Estados.setoPais(poPais: paises);
begin
   oPais := poPais;
end;

procedure Estados.setUF(pUF: string);
begin
   UF := pUF;
end;

end.
