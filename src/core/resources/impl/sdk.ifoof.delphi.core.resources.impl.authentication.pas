unit sdk.ifoof.delphi.core.resources.impl.authentication;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.impl.oauth,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.model.enums, sdk.ifoof.delphi.core.configuration.interfaces;

type
  TAuthentication = class(TInterfacedObject, iAuthentication)
  private
    FConfig: iConfiguration;
    FOAuth: iOAuth;
  public
    constructor Create(Config: iConfiguration);
    destructor Destroy; override;
    class function New(Config: iConfiguration): iAuthentication;
    function oauth: iOAuth;
    function Config: iConfiguration;
    function &End: iAuthentication;
  end;

implementation

{ TAuthentication }

function TAuthentication.&End: iAuthentication;
begin
  Result := Self;
end;

function TAuthentication.Config: iConfiguration;
begin
  Result := FConfig;
end;

constructor TAuthentication.Create(Config: iConfiguration);
begin
  FConfig:= Config;
end;

destructor TAuthentication.Destroy;
begin

  inherited;
end;

class function TAuthentication.New(Config: iConfiguration): iAuthentication;
begin
  Result := Self.Create(Config);
end;

function TAuthentication.oauth: iOAuth;
begin
  if not Assigned(FOAuth) then
    FOAuth := TOAuth.New(Self);
  Result := FOAuth;
end;

end.
