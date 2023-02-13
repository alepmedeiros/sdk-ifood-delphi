unit sdk.ifoof.delphi.model.entity.converterjsonobject;

interface

uses
  System.JSON,
  System.Generics.Collections,
  GBJSON.Interfaces;

type
  TConverterJSONObject<T: class, constructor> = class
  private
    FParent: T;
  public
    constructor Create(Parent: T);
    destructor Destroy; override;
    class function New(Parent: T): TConverterJSONObject<T>;
    function ToObject(Value: String): T;
    function ToJSON: TJSONObject;
    function ToList(Value: String): TObjectList<T>;
    function ToJsonArray(Value: TObjectList<T>): TJSONArray;
  end;

implementation

{ TConverterJSONObject<T> }

constructor TConverterJSONObject<T>.Create(Parent: T);
begin
  FParent := Parent;
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLowerCamelCase);
end;

destructor TConverterJSONObject<T>.Destroy;
begin
  FParent.Disposeof;
  inherited;
end;

class function TConverterJSONObject<T>.New(Parent: T): TConverterJSONObject<T>;
begin
  Result := Self.Create(Parent);
end;

function TConverterJSONObject<T>.ToJSON: TJSONObject;
begin
  Result := TGBJSONDefault.Deserializer<T>.ObjectToJsonObject(FParent);
end;

function TConverterJSONObject<T>.ToJsonArray(Value: TObjectList<T>): TJSONArray;
begin
  Result := TGBJSONDefault.Deserializer<T>.ListToJSONArray(Value);
end;

function TConverterJSONObject<T>.ToList(Value: String): TObjectList<T>;
begin
  Result := TGBJSONDefault.Serializer<T>.JsonStringToList(Value);
end;

function TConverterJSONObject<T>.ToObject(Value: String): T;
begin
  Result := TGBJSONDefault.Serializer<T>.JsonStringToObject(Value);
end;

end.
