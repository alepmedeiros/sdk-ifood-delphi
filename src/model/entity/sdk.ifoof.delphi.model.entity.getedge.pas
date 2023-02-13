unit sdk.ifoof.delphi.model.entity.getedge;

interface

uses
  GBJSON.Attributes,
  sdk.ifoof.delphi.model.entity.pizzaprice;

type
  TGetEdge = class
  private
    FId: String;
    FName: String;
    FStatus: String;
    FExternalCode: String;
    FIndex: Integer;
    FPrice: TPizzaPrice;
  public
    property Id: String read FId write FId;
    property Name: String read FName write FName;
    property Status: String read FStatus write FStatus;
    property ExternalCode: String read FExternalCode write FExternalCode;
    [JSONProp('index')]
    property &Index: Integer read FIndex write FIndex;
    property Price: TPizzaPrice read FPrice write FPrice;

    constructor Create;
    destructor Destroy; override;
    class function New: TGetEdge;
  end;

implementation

{ TGetEdge }

constructor TGetEdge.Create;
begin
  FPrice:= TPizzaPrice.New;
end;

destructor TGetEdge.Destroy;
begin
  FPrice.DisposeOf;
  inherited;
end;

class function TGetEdge.New: TGetEdge;
begin
  Result := Self.Create;
end;

end.
