unit sdk.ifoof.delphi.core.resources.impl.oauth;

interface

uses
  System.SysUtils,
  System.DateUtils,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.model.enums,
  sdk.ifoof.delphi.core.http.impl.RestClient,
  sdk.ifoof.delphi.core.http.interfaces,
  sdk.ifoof.delphi.model.interfaces,
  sdk.ifoof.delphi.model.impl.usercode, sdk.ifoof.delphi.model.impl.token;

type
  TOAuth = class(TInterfacedObject, iOAuth)
  private
    FAuthentication: iAuthentication;
    FHTTP: iHttpClient;

    FUserCode: iSchemaUserCode;

  CONST
    usercode = '/oauth/userCode';
    token = '/oauth/token';
  public
    constructor Create(Authentication: iAuthentication);
    destructor Destroy; override;
    class function New(Authentication: iAuthentication): iOAuth;
    function RequestsUserCode(var AutorizationCode: String): iOAuth;
    function RequestsAccessToken(AutorizationCode: String): iSchemaToken;
    function &End: iAuthentication;
  end;

implementation

{ TOAuth }

function TOAuth.&End: iAuthentication;
begin
  Result := FAuthentication;
end;

constructor TOAuth.Create(Authentication: iAuthentication);
begin
  FAuthentication := Authentication;
  FHTTP := TRestClient.New(TProviders.Authentication.ToString);
end;

destructor TOAuth.Destroy;
begin

  inherited;
end;

class function TOAuth.New(Authentication: iAuthentication): iOAuth;
begin
  Result := Self.Create(Authentication);
end;

function TOAuth.RequestsAccessToken(AutorizationCode: String): iSchemaToken;
var
  lJson: String;
begin
  FHTTP.Authorization(authorization_code)
    .Params('clienteId', FAuthentication.Config.ClientId)
    .Params('clientSecret', FAuthentication.Config.ClientSecret)
    .Params('authorizationCode', AutorizationCode)
    .Params('authorizationCodeVerifier', FUserCode.AuthorizationCodeVerifier)
    .Post(token).Content(lJson);

  Result := TSchemaToken.New(lJSON);
end;

function TOAuth.RequestsUserCode(var AutorizationCode: String): iOAuth;
var
  lJson: String;
begin
  Result := Self;
  FHTTP.Authorization(authorization_code)
    .Params('clientId', FAuthentication.Config.ClientId)
    .Post(usercode).Content(lJson);

  FUserCode := TSchemaUserCode.New(lJson);

  AutorizationCode := FUserCode.AuthorizationCodeVerifier;
end;

end.
