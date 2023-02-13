unit sdk.ifoof.delphi.core.configuration.impl.configuration;

interface

uses
  sdk.ifoof.delphi.core.configuration.interfaces;

type
  TConfiguration = class(TInterfacedObject, iConfiguration)
  private
    FClientId: String;
    FClientSecret: String;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iConfiguration;
    function ClientId(Value: String): iConfiguration; overload;
    function ClientId: String; overload;
    function ClientSecret(Value: String): iConfiguration; overload;
    function ClientSecret: String; overload;
  end;

implementation

function TConfiguration.ClientId: String;
begin
  Result := FClientId;
end;

function TConfiguration.ClientSecret(Value: String): iConfiguration;
begin
  Result := Self;
  FClientSecret := Value;
end;

function TConfiguration.ClientSecret: String;
begin
  Result := FClientSecret;
end;

function TConfiguration.ClientId(Value: String): iConfiguration;
begin
  Result := Self;
  FClientId := Value;
end;

constructor TConfiguration.Create;
begin

end;

destructor TConfiguration.Destroy;
begin

  inherited;
end;

class function TConfiguration.New: iConfiguration;
begin
  Result := Self.Create;
end;

end.
