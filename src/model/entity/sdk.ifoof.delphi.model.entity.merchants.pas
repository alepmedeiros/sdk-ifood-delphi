unit sdk.ifoof.delphi.model.entity.merchants;

interface

uses
  System.JSON,
  GBJSON.Interfaces;

type
  TMerchants = class
  private
    FId: String;
    FName: String;
    FCoporateName: String;
  public
    property Id: String read FId write FId;
    property Name: String read FName write FName;
    property CoporateName: String read FCoporateName write FCoporateName;

    constructor Create;
    destructor Destroy; override;
    class function New: TMerchants;
    function ToObject(Value: String): TMerchants;
    function ToJSON: TJSONObject;
  end;

implementation

{ TRespMerchants }

constructor TMerchants.Create;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
end;

destructor TMerchants.Destroy;
begin

  inherited;
end;

class function TMerchants.New: TMerchants;
begin
  Result := Self.Create;
end;

function TMerchants.ToJSON: TJSONObject;
begin
  Result := TGBJSONDefault.Deserializer<TMerchants>.ObjectToJsonObject(Self);
end;

function TMerchants.ToObject(Value: String): TMerchants;
begin
  Result := TGBJSONDefault.Serializer<TMerchants>.JsonStringToObject(Value);
end;

end.
