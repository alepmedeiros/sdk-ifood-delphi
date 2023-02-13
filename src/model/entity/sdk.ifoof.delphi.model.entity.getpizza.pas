unit sdk.ifoof.delphi.model.entity.getpizza;

interface

uses
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.getsizes,
  sdk.ifoof.delphi.model.entity.getcrusts,
  sdk.ifoof.delphi.model.entity.getedge,
  sdk.ifoof.delphi.model.entity.gettoppings,
  sdk.ifoof.delphi.model.entity.shifts,
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TGetPizza = class
  private
    FId: String;
    FSizes: TObjectList<TGetSizes>;
    FCrusts: TObjectList<TGetCrusts>;
    FEdges: TObjectList<TGetEdge>;
    FToppings: TObjectList<TGetToppings>;
    FShifts: TObjectList<TShifts>;
    FConverter: TConverterJSONObject<TGetPizza>;

  public
    property Id: String read FId write FId;
    property Sizes: TObjectList<TGetSizes> read FSizes write FSizes;
    property Crusts: TObjectList<TGetCrusts> read FCrusts write FCrusts;
    property Edges: TObjectList<TGetEdge> read FEdges write FEdges;
    property Toppings: TObjectList<TGetToppings> read FToppings write FToppings;
    property Shifts: TObjectList<TShifts> read FShifts write FShifts;

    constructor Create;
    destructor Destroy; override;
    class function New: TGetPizza;
    function Converter: TConverterJSONObject<TGetPizza>;
  end;

implementation

{ TGetPizza }

function TGetPizza.Converter: TConverterJSONObject<TGetPizza>;
begin
  Result := FConverter;
end;

constructor TGetPizza.Create;
begin
  FConverter:= TConverterJSONObject<TGetPizza>.New(self);
  FSizes:= TObjectList<TGetSizes>.Create;
  FCrusts:= TObjectList<TGetCrusts>.Create;
  FEdges:= TObjectList<TGetEdge>.Create;
  FToppings:= TObjectList<TGetToppings>.Create;
  FShifts:= TObjectList<TShifts>.Create;
end;

destructor TGetPizza.Destroy;
begin
  FConverter.DisposeOf;
  FSizes.DisposeOf;
  FCrusts.DisposeOf;
  FEdges.DisposeOf;
  FToppings.DisposeOf;
  FShifts.DisposeOf;
  inherited;
end;

class function TGetPizza.New: TGetPizza;
begin
  Result := Self.Create;
end;

end.
