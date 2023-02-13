unit sdk.ifoof.delphi.model.impl.usercode;

interface

uses
  System.SysUtils,
  System.DateUtils,
  sdk.ifoof.delphi.model.interfaces,
  sdk.ifoof.delphi.model.entity.usercode;

type
  TSchemaUserCode = class(TInterfacedObject, iSchemaUserCode)
  private
    FUserCode: TUserCode;
  public
    constructor Create(Json: String);
    destructor Destroy; override;
    class function New(Json: String): iSchemaUserCode;
    function Usercode: String;
    function AuthorizationCodeVerifier: String;
    function VerificationUrl: String;
    function VerificationUrlComplete: String;
    function ExpiresIn: TDateTime;
  end;

implementation

{ TMyClass }

function TSchemaUserCode.AuthorizationCodeVerifier: String;
begin
  Result := FUserCode.AutorizationCodeVerifier;
end;

constructor TSchemaUserCode.Create(Json: String);
begin
  FUserCode := TUserCode.New.Convert.ToObject(Json);
end;

destructor TSchemaUserCode.Destroy;
begin

  inherited;
end;

function TSchemaUserCode.ExpiresIn: TDateTime;
begin
  Result := Now;
end;

class function TSchemaUserCode.New(Json: String): iSchemaUserCode;
begin
  Result := Self.Create(JSON);
end;

function TSchemaUserCode.usercode: String;
begin
  Result := FUserCode.usercode;
end;

function TSchemaUserCode.VerificationUrl: String;
begin
  Result := FUserCode.VerificationUrl;
end;

function TSchemaUserCode.VerificationUrlComplete: String;
begin
  Result := FUserCode.VerificationUrlComplete;
end;

end.
