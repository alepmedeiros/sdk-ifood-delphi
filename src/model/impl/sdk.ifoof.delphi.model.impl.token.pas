unit sdk.ifoof.delphi.model.impl.token;

interface

uses
  System.SysUtils,
  System.DateUtils, sdk.ifoof.delphi.model.interfaces,
  sdk.ifoof.delphi.model.entity.token;

type
  TSchemaToken = class(TInterfacedObject, iSchemaToken)
  private
    FToken: TToken;

    function SecondToHor(Second: Cardinal): TDateTime;
  public
    constructor Create(JSON: String);
    destructor Destroy; override;
    class function New(JSON: String): iSchemaToken;
    function AccessToken: String;
    function RefreshToken: String;
    function ExpiresIn: TDateTime;
  end;

implementation

{ TMyClass }

function TSchemaToken.AccessToken: String;
begin
  Result := FToken.AccessToken;
end;

constructor TSchemaToken.Create(JSON: String);
begin
  FToken := TToken.New.Convert.ToObject(JSON);
end;

destructor TSchemaToken.Destroy;
begin
  FToken.DisposeOf;
  inherited;
end;

function TSchemaToken.ExpiresIn: TDateTime;
begin
  Result := SecondToHor(FToken.ExpiresIn);
end;

class function TSchemaToken.New(JSON: String): iSchemaToken;
begin
  Result := Self.Create(JSON);
end;

function TSchemaToken.RefreshToken: String;
begin
  Result := FToken.RefreshToken;
end;

function TSchemaToken.SecondToHor(Second: Cardinal): TDateTime;
begin
  Result := IncHour(now,(Second div 3600));
end;

end.
