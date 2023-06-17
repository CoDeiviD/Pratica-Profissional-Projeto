unit uPai;

interface
  type Pai = class
    private
    protected
      codigo     : integer;
      DataCad    : string[10];
      DataUltAlt : string[10];
    public
      constructor CrieObj;
      constructor CrieInit(pCodigo : integer);
      destructor Destrua_se;
      procedure setCodigo(pCodigo : integer);
      procedure setDataCad(pDataCad : string);
      procedure setDataUltAlt(pDataUltAlt : string);
      function getCodigo : integer;
      function getDataCad : string;
      function getDataUltAlt : string;
  end;
implementation

{ Pai }

constructor Pai.CrieInit(pCodigo: integer);
begin
   Codigo := pCodigo;
end;

constructor Pai.CrieObj;
begin
   Codigo := 0;
end;

destructor Pai.Destrua_se;
begin
   Destrua_se;
end;

function Pai.getCodigo: integer;
begin
   result := Codigo;
end;

function Pai.getDataCad: string;
begin
   result := DataCad;
end;

function Pai.getDataUltAlt: string;
begin
   result := DataUltAlt;
end;

procedure Pai.setCodigo(pCodigo: integer);
begin
   Codigo := pCodigo;
end;

procedure Pai.setDataCad(pDataCad: string);
begin
   DataCad := pDataCad;
end;

procedure Pai.setDataUltAlt(pDataUltAlt: string);
begin
   DataUltAlt := pDataUltAlt;
end;

end.
