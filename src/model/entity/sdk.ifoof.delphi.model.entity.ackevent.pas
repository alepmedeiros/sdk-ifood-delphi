unit sdk.ifoof.delphi.model.entity.ackevent;

interface

uses
  System.Json,
  System.Generics.Collections,
  GBJSON.Interfaces;

type
  TRespAckEvent = class
  private
    FId: String;
  public
    property Id: String read FId write FId;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespAckEvent;
    function ToObject(Value: String): TRespAckEvent;
    function ToJson: TJSONObject;
    function ToList(Value: String): TObjectList<TRespAckEvent>;
  end;

implementation

{ TAckEvent }

constructor TRespAckEvent.Create;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
end;

destructor TRespAckEvent.Destroy;
begin

  inherited;
end;

class function TRespAckEvent.New: TRespAckEvent;
begin
  Result := Self.Create;
end;

function TRespAckEvent.ToJson: TJSONObject;
begin
  Result := TGBJSONDefault.Deserializer<TRespAckEvent>.ObjectToJsonObject(Self);
end;

function TRespAckEvent.ToList(Value: String): TObjectList<TRespAckEvent>;
begin
  Result := TGBJSONDefault.Serializer<TRespAckEvent>.JsonStringToList(Value);
end;

function TRespAckEvent.ToObject(Value: String): TRespAckEvent;
begin
  Result := TGBJSONDefault.Serializer<TRespAckEvent>.JsonStringToObject(Value);
end;

end.
