unit sdk.ifoof.delphi.model.entity.getsizes;

interface

uses
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.pizzaprice;

type
  TGetSizes = class
  private
    FId: String;
    FName: String;
    FIndex: Integer;
    FStatus: String;
    FExternalCode: String;
    FSlices: String;
    FAcceptedFractions: TList<String>;
    FPrice: TPizzaPrice;
  public
    property Id: String read FId write FId;
    property Name: String read FName write FName;
    [JSONProp('index')]
    property &Index: Integer read FIndex write FIndex;
    property Status: String read FStatus write FStatus;
    property ExternalCode: String read FExternalCode write FExternalCode;
    property Slices: String read FSlices write FSlices;
    property AcceptedFractions: TList<String> read FAcceptedFractions
      write FAcceptedFractions;
    property Price: TPizzaPrice read FPrice write FPrice;

    class function New: TGetSizes;
  end;

implementation

{ TGetSizes }

class function TGetSizes.New: TGetSizes;
begin
  Result := Self.Create;
end;

end.
