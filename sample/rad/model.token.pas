unit model.token;

interface

uses
  GBJSON.Attributes,
  GBJSON.Interfaces,
  model.conveter;

type
  TToken = class
  private
    FAccessToken: String;
    FType: String;
    FExpiresIn: Integer;
    FrefreshToken: String;
  public
    property accessToken: String read FAccessToken write FAccessToken;
    property refreshToken: String read FrefreshToken write FrefreshToken;
    [JSONProp('type')]
    property &Type: String read FType write FType;
    property expiresIn: Integer read FExpiresIn write FExpiresIn;

    class function New: TToken;
    function ToObject(Value: String): TToken;
  end;

implementation

class function TToken.New: TToken;
begin
  Result := Self.Create;
end;

function TToken.ToObject(Value: String): TToken;
begin
//  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Serializer<TToken>.JsonStringToObject(Value);
end;

end.
