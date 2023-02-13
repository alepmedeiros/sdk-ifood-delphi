unit sdk.ifoof.delphi.model.entity.token;

interface

uses
  System.JSON,
  GBJSON.Attributes, sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TToken = class
  private
    FAccessToken: String;
    FType: String;
    FExpiresIn: Integer;

    FConvert: TConverterJSONObject<TToken>;
    FRefreshToken: String;
  public
    property AccessToken: String read FAccessToken write FAccessToken;
    [JSONProp('type')]
    property &Type: String read FType write FType;
    property ExpiresIn: Integer read FExpiresIn write FExpiresIn;
    property RefreshToken: String read FRefreshToken write FRefreshToken;

    constructor Create;
    destructor Destroy; override;
    class function New: TToken;
    function Convert: TConverterJSONObject<TToken>;
  end;

implementation

{ TRespToken }

function TToken.Convert: TConverterJSONObject<TToken>;
begin
  Result := FConvert;
end;

constructor TToken.Create;
begin
  FConvert:= TConverterJSONObject<TToken>.NEw(Self);
end;

destructor TToken.Destroy;
begin
  FConvert.DisposeOf;
  inherited;
end;

class function TToken.New: TToken;
begin
  Result := Self.Create;
end;

end.
