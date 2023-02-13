unit sdk.ifoof.delphi.model.entity.interruption;

interface

uses
  System.JSON,
  System.Generics.Collections,
  GBJSON.Interfaces,
  GBJSON.Attributes;

type
  TRespInterruption = class
  private
    FId: String;
    FDescription: String;
    FStart: TDateTime;
    FEnd: TDateTime;
  public
    property Id: String read FId write FId;
    property Description: String read FDescription write FDescription;
    property Start: TDateTime read FStart write FStart;
    [JSONProp('end')]
    property &End: TDateTime read FEnd write FEnd;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespInterruption;
    function ToObject(Value: String): TRespInterruption;
    function ToJson: TJSONObject;
    function ToList(Value: String): TObjectList<TRespInterruption>;
  end;

implementation

{ TRespInterruption }

constructor TRespInterruption.Create;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
end;

destructor TRespInterruption.Destroy;
begin

  inherited;
end;

class function TRespInterruption.New: TRespInterruption;
begin
  Result := Self.Create;
end;

function TRespInterruption.ToJson: TJSONObject;
begin
  Result := TGBJSONDefault.Deserializer<TRespInterruption>.ObjectToJsonObject(Self);
end;

function TRespInterruption.ToList(Value: String): TObjectList<TRespInterruption>;
begin
  Result := TGBJSONDefault.Serializer<TRespInterruption>.JsonStringToList(Value);
end;

function TRespInterruption.ToObject(Value: String): TRespInterruption;
begin
  Result := TGBJSONDefault.Serializer<TRespInterruption>.JsonStringToObject(Value);
end;

end.
