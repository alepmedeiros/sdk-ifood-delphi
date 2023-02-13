unit sdk.ifoof.delphi.model.entity.error;

interface

uses
  System.JSON,
  GBJSON.Interfaces,
  GBJSON.Attributes;

type
  TError = class
  private
    FCode: String;
    FMessage: String;
  public
    property Code: String read FCode write FCode;
    [JSONProp('message')]
    property &Message: String read FMessage write FMessage;

    constructor Create;
    destructor Destroy; override;
    class function New: TError;
  end;

  TRespError = class
  private
    FError: TError;
  public
    property Error: TError read FError write FError;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespError;
    function ToJSON: TJSONObject;
    function ToObject(Value: String): TRespError;
    function ToJsonArray: TJSONArray;
  end;

implementation

{ TRespError }

constructor TRespError.Create;
begin
  FError := TError.New;
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
end;

destructor TRespError.Destroy;
begin

  inherited;
end;

class function TRespError.New: TRespError;
begin
  Result := Self.Create;
end;

function TRespError.ToJSON: TJSONObject;
begin
  Result := TGBJSONDefault.Deserializer<TRespError>.ObjectToJsonObject(Self);
end;

function TRespError.ToJsonArray: TJSONArray;
begin

end;

function TRespError.ToObject(Value: String): TRespError;
begin
  Result := TGBJSONDefault.Serializer<TRespError>.JsonStringToObject(Value);
end;

{ TError }

constructor TError.Create;
begin

end;

destructor TError.Destroy;
begin

  inherited;
end;

class function TError.New: TError;
begin
  Result := Self.Create;
end;

end.
