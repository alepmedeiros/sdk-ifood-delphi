unit sdk.ifoof.delphi.core.resources.impl.category;

interface

uses
  System.SysUtils,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.core.http.interfaces,
  sdk.ifoof.delphi.model.entity.getcategory;

type
  TCategory = class(TInterfacedObject, iCategory)
  private
    FCatalog: iCatalog;
    FParameters: iParameters<iCategory>;
    FHTTP: iHTTPClient;
    FJSON: String;

    const
      GETCATEGORIES = '/merchants/%s/catalogs/%s/categories';
      CGETCATEGORY = '/merchants/%s/catalogs/%s/categories/%s';
  public
    constructor Create(Catalog: iCatalog);
    destructor Destroy; override;
    class function New(Catalog: iCatalog): iCategory;
    function ListCategories(var Value: TGetCategory): iCategory;
    function CreateCategory(var Value: TGetCategory): iCategory;
    function GetCategory(var Value: TGetCategory): iCategory;
    function EditCategory(var Value: TGetCategory): iCategory;
    function DeleteCategory: iCategory;
    function Parameters: iParameters<iCategory>;
    function &End: iCatalog;
  end;

implementation

{ TMyClass }

function TCategory.&End: iCatalog;
begin
  Result := FCatalog;
end;

constructor TCategory.Create(Catalog: iCatalog);
begin
  FCatalog := Catalog;
end;

function TCategory.CreateCategory(var Value: TGetCategory): iCategory;
begin
  Result := Self;
  FHTTP.Token('')
    .Body(Value.Converter.ToJSON.ToString)
    .Post(Format(GETCATEGORIES, [FParameters.MerchantId, FParameters.CatalogId]))
    .Content(FJSON);

  Value := TGetCategory.New.Converter.ToObject(FJSON);
end;

function TCategory.DeleteCategory: iCategory;
begin
  Result := Self;
  FHTTP.Token('').Delete(Format(CGETCATEGORY,
    [FParameters.MerchantId, FParameters.CatalogId, FParameters.CatalogId]));
end;

destructor TCategory.Destroy;
begin

  inherited;
end;

function TCategory.EditCategory(var Value: TGetCategory): iCategory;
begin
  Result := Self;
  FHTTP.Token('')
    .Body(Value.Converter.ToJSON.ToString)
    .Patch(Format(CGETCATEGORY, [FParameters.MerchantId, FParameters.CatalogId, FParameters.CatalogId]));
end;

function TCategory.GetCategory(var Value: TGetCategory): iCategory;
begin
  Result := Self;
  FHTTP.Token('')
    .AddQuery('includeItems', BoolToStr(FParameters.IncludeItems, True))
    .AddQuery('include_items ',BoolToStr(FParameters.Include_Items, True))
    .Get(Format(CGETCATEGORY, [FParameters.MerchantId, FParameters.CatalogId, FParameters.CategoryId]))
    .Content(FJSON);
  Value := TGetCategory.New.Converter.ToObject(FJSON);
end;

function TCategory.ListCategories(var Value: TGetCategory): iCategory;
begin
  Result := Self;
  FHTTP.Token('')
    .AddQuery('includeItems', BoolToStr(FParameters.IncludeItems, True))
    .AddQuery('include_items', BoolToStr(FParameters.Include_Items, True))
    .Get(Format(GETCATEGORIES, [FParameters.MerchantId, FParameters.CatalogId]))
    .Content(FJSON);

  Value := TGetCategory.New.Converter.ToObject(FJSON);
end;

class function TCategory.New(Catalog: iCatalog): iCategory;
begin
  Result := Self.Create(Catalog);
end;

function TCategory.Parameters: iParameters<iCategory>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iCategory>.New(Self);
  Result := FParameters;
end;

end.
