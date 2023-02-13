unit sdk.ifoof.delphi.model.entity.usercode;

interface

uses
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TUserCode = class
  private
    FUserCode: String;
    FAutorizationCodeVerifier: String;
    FVerificationUrl: String;
    FVerificationUrlComplete: String;
    FExpiresIn: Integer;
    FConvert: TConverterJSONObject<TUserCode>;
  public
    property usercode: String read FUserCode write FUserCode;
    property AutorizationCodeVerifier: String read FAutorizationCodeVerifier
      write FAutorizationCodeVerifier;
    property VerificationUrl: String read FVerificationUrl
      write FVerificationUrl;
    property VerificationUrlComplete: String read FVerificationUrlComplete
      write FVerificationUrlComplete;
    property ExpiresIn: Integer read FExpiresIn write FExpiresIn;

    constructor Create;
    destructor Destroy; override;
    class function New: TUserCode;
    function Convert: TConverterJSONObject<TUserCode>;
  end;

implementation

{ TRespUserCode }

function TUserCode.Convert: TConverterJSONObject<TUserCode>;
begin
  Result := FConvert;
end;

constructor TUserCode.Create;
begin
  FConvert := TConverterJSONObject<TUserCode>.New(self);
end;

destructor TUserCode.Destroy;
begin
  FConvert.DisposeOf;
  inherited;
end;

class function TUserCode.New: TUserCode;
begin
  Result := Self.Create;
end;

end.
