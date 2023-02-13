unit model.conveter;

interface

uses
  System.Generics.Collections,
  System.JSON,
  GBJSON.Interfaces,
  GBJSON.Attributes;

type
  TConvertJsonObj<T: class, constructor> = class
  private
    FParent: T;
  public
    constructor Create(Value: T);
    destructor Destroy; override;
    class function New(Value: T): TConvertJsonObj<T>;
    function ToObject(Value: String): T;
    function ToList(Value: String): TObjectList<T>;
    function ToJson: TJSONObject;
    function ToJsonArray(Value: TObjectList<T>): TJSONArray;
  end;

implementation

constructor TConvertJsonObj<T>.Create(Value: T);
begin
  FParent := Value;
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
end;

destructor TConvertJsonObj<T>.Destroy;
begin
  FParent.DisposeOf;
  inherited;
end;

class function TConvertJsonObj<T>.New(Value: T): TConvertJsonObj<T>;
begin
  Result := Self.Create(Value);
end;

function TConvertJsonObj<T>.ToJson: TJSONObject;
begin
  Result := TGBJSONDefault.Deserializer<T>.ObjectToJsonObject(Self);
end;

function TConvertJsonObj<T>.ToJsonArray(Value: TObjectList<T>): TJSONArray;
begin
  Result := TGBJSONDefault.Deserializer<T>.ListToJSONArray(Value);
end;

function TConvertJsonObj<T>.ToList(Value: String): TObjectList<T>;
begin
  Result := TGBJSONDefault.Serializer<T>.JsonStringToList(Value);
end;

function TConvertJsonObj<T>.ToObject(Value: String): T;
begin
  Result := TGBJSONDefault.Serializer<T>.JsonStringToObject(Value);
end;

end.
