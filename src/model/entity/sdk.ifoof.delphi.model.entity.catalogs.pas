unit sdk.ifoof.delphi.model.entity.catalogs;

interface

uses
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TRespCatalogs = class
  private
    FCatalogId: String;
    FStatus: String;
    FContext: String;
    FModifiedAt: TDateTime;
    FGroupId: String;
    FConverter: TConverterJSONObject<TRespCatalogs>;
  public
    property CatalogId: String read FCatalogId write FCatalogId;
    property Status: String read FStatus write FStatus;
    property Context: String read FContext write FContext;
    property ModifiedAt: TDateTime read FModifiedAt write FModifiedAt;
    property GroupId: String read FGroupId write FGroupId;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespCatalogs;
    function Converter: TConverterJSONObject<TRespCatalogs>;
  end;

implementation

{ TRespCatalogs }

function TRespCatalogs.Converter: TConverterJSONObject<TRespCatalogs>;
begin
  Result := FConverter;
end;

constructor TRespCatalogs.Create;
begin
  FConverter := TConverterJSONObject<TRespCatalogs>.New(Self);
end;

destructor TRespCatalogs.Destroy;
begin
  FConverter.DisposeOf;
  inherited;
end;

class function TRespCatalogs.New: TRespCatalogs;
begin
  Result := Self.Create;
end;

end.
