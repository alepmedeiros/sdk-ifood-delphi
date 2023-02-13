unit sdk.ifoof.delphi.model.entity.getcategory;

interface

uses
  GBJSON.Attributes,
  sdk.ifoof.delphi.model.entity.converterjsonobject,
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.getitems,
  sdk.ifoof.delphi.model.entity.getpizza;

type
  TGetCategory = class
  private
    FConverter: TConverterJSONObject<TGetCategory>;
    FId: String;
    FIndex: Integer;
    FName: String;
    FExternalCode: String;
    FStatus: String;
    FItems: TObjectList<TGetItems>;
    FTemplate: String;
    FPizza: TGetPizza;
  public
    property Id: String read FId write FId;
    [JSONProp('index')]
    property &Index: Integer read FIndex write FIndex;
    property Name: String read FName write FName;
    property ExternalCode: String read FExternalCode write FExternalCode;
    property Status: String read FStatus write FStatus;
    property Items: TObjectList<TGetItems> read FItems write FItems;
    property Template: String read FTemplate write FTemplate;
    property Pizza: TGetPizza read FPizza write FPizza;

    constructor Create;
    destructor Destroy; override;
    class function New: TGetCategory;
    function Converter: TConverterJSONObject<TGetCategory>;
  end;

implementation

{ TGetCategory }

function TGetCategory.Converter: TConverterJSONObject<TGetCategory>;
begin
  Result := FConverter;
end;

constructor TGetCategory.Create;
begin
  FConverter := TConverterJSONObject<TGetCategory>.New(Self);
  FPizza:= TGetPizza.New;
  FItems:= TObjectList<TGetItems>.Create;
end;

destructor TGetCategory.Destroy;
begin
  FConverter.DisposeOf;
  FPizza.DisposeOf;
  FItems.DisposeOf;
  inherited;
end;

class function TGetCategory.New: TGetCategory;
begin
  Result := Self.Create;
end;

end.
