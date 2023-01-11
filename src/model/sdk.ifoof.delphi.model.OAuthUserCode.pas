unit sdk.ifoof.delphi.model.OAuthUserCode;

interface

type
  TOAuthUserCode = class
  private
    FUserCode: String;
    FAuthorizationCodeVerifier: String;
    FVerificationUrl: String;
    FVerificationUrlComplete: String;
    FExpiresIn: Integer;
  public
    property UserCode: String read FUserCode write FUserCode;
    property AuthorizationCodeVerifier: String read FAuthorizationCodeVerifier write FAuthorizationCodeVerifier;
    property VerificationUrl: String read FVerificationUrl write FVerificationUrl;
    property VerificationUrlComplete: String read FVerificationUrlComplete write FVerificationUrlComplete;
    property ExpiresIn: Integer read FExpiresIn write FExpiresIn;
  end;

implementation

end.
