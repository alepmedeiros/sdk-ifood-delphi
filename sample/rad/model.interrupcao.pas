unit model.interrupcao;

interface

uses
  System.Generics.Collections,
  System.JSON,
  GBJSON.Attributes,
  GBJSON.Interfaces;

type
  TInterrupcao = class
  private
    Fid: String;
    Fdescription: String;
    Fstart: TDateTime;
    Fend: TDateTime;
  public
    property id: String read Fid write Fid;
    property description: String read Fdescription write Fdescription;
    property start: TDateTime read Fstart write Fstart;
    [JSONProp('end')]
    property &end: TDateTime read Fend write Fend;

    class function New: TInterrupcao;
    function ToList(Value: String): TObjectList<TInterrupcao>;
    function ToObject(Value: String): TInterrupcao;
    function ToJSON: TJSONObject;
  end;

implementation

class function TInterrupcao.New: TInterrupcao;
begin
  Result := Self.Create;
end;

function TInterrupcao.ToJSON: TJSONObject;
begin
  Result := TGBJSONDefault.Deserializer<TInterrupcao>.ObjectToJsonObject(Self);
end;

function TInterrupcao.ToList(Value: String): TObjectList<TInterrupcao>;
begin
  Result := TGBJSONDefault.Serializer<TInterrupcao>.JsonStringToList(Value);
end;

function TInterrupcao.ToObject(Value: String): TInterrupcao;
begin
  Result := TGBJSONDefault.Serializer<TInterrupcao>.JsonStringToObject(Value);
end;

end.
