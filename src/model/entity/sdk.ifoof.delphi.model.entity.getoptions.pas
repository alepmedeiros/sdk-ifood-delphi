unit sdk.ifoof.delphi.model.entity.getoptions;

interface

uses
  GBJSON.Attributes, sdk.ifoof.delphi.model.entity.price;

type
  TGetOptions = class
  private
    FId: String;
    FStatus: String;
    FIndex: Integer;
    FProductId: String;
    FName: String;
    FDescription: String;
    FExternalCode: String;
    FImagePath: String;
    FPrice: TPrice;
    FEan: String;
  public
    property Id: String read FId write FId;
    property Status: String read FStatus write FStatus;
    [JSONProp('index')]
    property &Index: Integer read FIndex write FIndex;
    property ProductId: String read FProductId write FProductId;
    property Name: String read FName write FName;
    property Description: String read FDescription write FDescription;
    property ExternalCode: String read FExternalCode write FExternalCode;
    property ImagePath: String read FImagePath write FImagePath;
    property Price: TPrice read FPrice write FPrice;
    property Ean: String read FEan write FEan;

    class function New: TGetOptions;
  end;

implementation

{ TGetOptions }

class function TGetOptions.New: TGetOptions;
begin
  Result := Self.Create;
end;

end.
