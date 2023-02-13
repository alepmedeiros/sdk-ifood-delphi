unit sdk.ifoof.delphi.model.entity.getcrusts;

interface

uses
  GBJSON.Attributes, sdk.ifoof.delphi.model.entity.pizzaprice;

type
  TGetCrusts = class
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
    class function New: TGetCrusts;
  end;

implementation

{ TGetCrusts }

constructor TGetCrusts.Create;
begin
  FPrice := TPizzaPrice.New;
end;

destructor TGetCrusts.Destroy;
begin
  FPrice.disposeof;
  inherited;
end;

class function TGetCrusts.New: TGetCrusts;
begin
  Result := Self.Create;
end;

end.
