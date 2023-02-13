unit sdk.ifoof.delphi.model.entity.event;

interface

uses
  System.JSON,
  System.Generics.Collections,
  GBJSON.Interfaces;

type
  TMetadata = class
  private
    FDescription: String;
  public
    property Description: String read FDescription write FDescription;
    class function New: TMetadata;
  end;

  TRespEvent = class
  private
    FCreatedAt: TDateTime;
    FFullCode: String;
    FMetadata: TMetadata;
    FCode: String;
    FOrderId: String;
    FId: String;
  public
    property CreatedAt: TDateTime read FCreatedAt write FCreatedAt;
    property FullCode: String read FFullCode write FFullCode;
    property Metadata: TMetadata read FMetadata write FMetadata;
    property Code: String read FCode write FCode;
    property OrderId: String read FOrderId write FOrderId;
    property Id: String read FId write FId;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespEvent;
    function ToObject(Value: String): TRespEvent;
    function ToJson: TJSONObject;
    function ToList(Value: String): TObjectList<TRespEvent>;
  end;

implementation

{ TRespEvent }

constructor TRespEvent.Create;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  FMetadata:= TMetadata.New;
end;

destructor TRespEvent.Destroy;
begin

  inherited;
end;

class function TRespEvent.New: TRespEvent;
begin
  Result := Self.Create;
end;

function TRespEvent.ToJson: TJSONObject;
begin
  Result := TGBJSONDefault.Deserializer<TRespEvent>.ObjectToJsonObject(Self);
end;

function TRespEvent.ToList(Value: String): TObjectList<TRespEvent>;
begin
  Result := TGBJSONDefault.Serializer<TRespEvent>.JsonStringToList(Value);
end;

function TRespEvent.ToObject(Value: String): TRespEvent;
begin
  Result := TGBJSONDefault.Serializer<TRespEvent>.JsonStringToObject(Value);
end;

{ TMetadata }

class function TMetadata.New: TMetadata;
begin
  Result := Self.Create;
end;

end.
