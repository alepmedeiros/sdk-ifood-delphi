unit model.codigousuario;

interface

uses
  System.JSON,
  GBJSON.Attributes,
  GBJSON.Interfaces,
  model.conveter, System.SysUtils;

type
  TCodigoUsuario = class
  private
    FVerificationUrl: String;
    FUserCode: String;
    FVerificationUrlComplete: String;
    FExpiresIn: Integer;
    FAuthorizationCodeVerifier: String;
  public
    property userCode: String read FUserCode write FUserCode;
    property authorizationCodeVerifier: String read FAuthorizationCodeVerifier write FAuthorizationCodeVerifier;
    property verificationUrl: String read FVerificationUrl write FVerificationUrl;
    property verificationUrlComplete: String read FVerificationUrlComplete write FVerificationUrlComplete;
    property expiresIn: Integer read FExpiresIn write FExpiresIn;

    class function New: TCodigoUsuario;
    function ToObject(Value: String): TCodigoUsuario;
  end;

implementation

class function TCodigoUsuario.New: TCodigoUsuario;
begin
  Result := Self.Create;
end;

function TCodigoUsuario.ToObject(Value: String): TCodigoUsuario;
begin
  Result := TGBJSONDefault.Serializer<TCodigoUsuario>.JsonStringToObject(Value);
end;

end.
