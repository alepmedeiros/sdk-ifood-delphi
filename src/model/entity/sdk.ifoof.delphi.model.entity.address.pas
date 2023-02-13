unit sdk.ifoof.delphi.model.entity.address;

interface

type
  TAddress = class
  private
    FCountry: String;
    FState: String;
    FCity: String;
    FPostalCode: String;
    FDistrict: String;
    FStreet: String;
    FNumber: String;
    FLatitude: Double;
    FLongitude: Double;
  public
    property Country: String read FCountry write FCountry;
    property State: String read FState write FState;
    property City: String read FCity write FCity;
    property PostalCode: String read FPostalCode write FPostalCode;
    property District: String read FDistrict write FDistrict;
    property Street: String read FStreet write FStreet;
    property Number: String read FNumber write FNumber;
    property Latitude: Double read FLatitude write FLatitude;
    property Longitude: Double read FLongitude write FLongitude;

    class function New: TAddress;
  end;

implementation

{ TAddress }

class function TAddress.New: TAddress;
begin
  Result := Self.Create;
end;

end.
