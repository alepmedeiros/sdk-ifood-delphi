unit sdk.ifoof.delphi.core.resources.impl.product;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.core.http.interfaces,
  sdk.ifoof.delphi.model.entity.productresponse,
  sdk.ifoof.delphi.model.entity.statusproduct,
  sdk.ifoof.delphi.model.entity.productpricebatch;

type
  TProduct = class(TInterfacedObject, iProduct)
  private
    FCatalog: iCatalog;
    FParameters: iParameters<iProduct>;
    FHTTP: iHTTPClient;
    FJSON: String;

    const
      PRODUCTLIST = '/merchants/%s/products';
      PRODUCTPUT = '/merchants/%s/products/%s';
      PRODSTATUS = '/status';
      PRODPRICE = '/price';
      PRODEXTERNALCODE = '/externalCode/%s/status';
      PRODEXTERNAL = '/externalCode/%s';
  public
    constructor Create(Catalog: iCatalog);
    destructor Destroy; override;
    class function New(Catalog: iCatalog): iProduct;
    function ListProducts(var Value: TObjectList<TProductResponse>): iProduct;
    function CreateProduct(var Value: TProductResponse): iProduct;
    function EditProduct(var Value: TProductResponse): iProduct;
    function DeleteProduct: iProduct;
    function UpdateProductsStatus(Value: TStatusProduct): iProduct;
    function BatchUpdateProductsStatuses(Value: TObjectList<TStatusProduct>): iProduct;
    function BatchUpdateProductsPrices(Value: TObjectList<TProductPriceBatch>): iProduct;
    function BacthUpdateOptionsItemsAndPizzaByProductIdOrExternalId(Value: TStatusProduct): iProduct;
    function ListProductsByExternalId(var Value: TObjectList<TProductResponse>): iProduct;
    function GetProductById(var Value: TObjectList<TProductResponse>): iProduct;
    function Parameters: iParameters<iProduct>;
    function &End: iCatalog;
  end;

implementation

{ TMyClass }

function TProduct.BacthUpdateOptionsItemsAndPizzaByProductIdOrExternalId(Value: TStatusProduct): iProduct;
begin
  Result := Self;
  FHTTP.Token('')
    .Body(Value.Converter.ToJSON.TOString)
    .Patch(Format(PRODUCTLIST+PRODEXTERNALCODE, [FParameters.MerchantId, FParameters.ExternalCode]));
end;

function TProduct.BatchUpdateProductsPrices(Value: TObjectList<TProductPriceBatch>): iProduct;
begin
  Result := Self;
  FHTTP.Token('');
  if not FParameters.CatalogContext.IsEmpty then
    FHTTP.AddQuery('catalogContext', FParameters.CatalogContext);

  FHttp
    .Body(TProductPriceBatch.New.Converter.ToJsonArray(Value).ToString)
    .Patch(Format(PRODUCTLIST+PRODPRICE, [FParameters.MerchantId]));
end;

function TProduct.BatchUpdateProductsStatuses(Value: TObjectList<TStatusProduct>): iProduct;
begin
  Result := Self;
  FHTTP.Token('')
    .AddQuery('catalogContext', FParameters.CatalogContext)
    .Body(TStatusProduct.New.Converter.ToJsonArray(Value).ToString)
    .Patch(Format(PRODUCTLIST+PRODSTATUS, [FParameters.MerchantId]));
end;

function TProduct.&End: iCatalog;
begin
  Result := FCatalog;
end;

constructor TProduct.Create(Catalog: iCatalog);
begin
  FCatalog := Catalog;
end;

function TProduct.CreateProduct(var Value: TProductResponse): iProduct;
begin
  Result := Self;
  FHTTP.Token('').Post(Format(PRODUCTLIST, [FParameters.MerchantId])).Content(FJSON);
  Value := TProductResponse.New.Converter.ToObject(FJSON);
end;

function TProduct.DeleteProduct: iProduct;
begin
  Result := Self;
  FHTTP.Token('').Delete(Format(PRODUCTPUT, [FParameters.MerchantId, FParameters.ProductId]));
end;

destructor TProduct.Destroy;
begin

  inherited;
end;

function TProduct.EditProduct(var Value: TProductResponse): iProduct;
begin
  Result := Self;
  FHTTP.Token('').Put(Format(PRODUCTPUT, [FParameters.MerchantId, FParameters.ProductId]))
    .Content(FJSON);
  Value := TProductResponse.New.Converter.ToObject(FJSON);
end;

function TProduct.GetProductById(var Value: TObjectList<TProductResponse>): iProduct;
begin
  Result := Self;
  FHTTP.Token('').GetAll(Format(PRODUCTPUT, [FParameters.MerchantId, FParameters.ProductId]))
  .Content(FJSON);
  Value := TProductResponse.NEw.Converter.ToList(FJSON);
end;

function TProduct.ListProducts(var Value: TObjectList<TProductResponse>): iProduct;
begin
  Result := Self;
  FHTTP.Token('')
    .AddQuery('limit', FParameters.Limit)
    .AddQuery('page', FParameters.Page)
    .GetAll(Format(PRODUCTLIST, [FParameters.MerchantId]))
    .Content(FJSON);

  Value := TProductResponse.New.Converter.ToList(FJSON);
end;

function TProduct.ListProductsByExternalId(var Value: TObjectList<TProductResponse>): iProduct;
begin
  Result := Self;
  FHTTP.Token('').GetAll(Format(PRODUCTLIST+PRODEXTERNAL, [FParameters.MerchantId, FParameters.ExternalCode]))
  .Content(FJSON);
  Value := TProductResponse.New.Converter.ToList(FJSON);
end;

class function TProduct.New(Catalog: iCatalog): iProduct;
begin
  Result := Self.Create(Catalog);
end;

function TProduct.Parameters: iParameters<iProduct>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iProduct>.New(Self);
  Result := FParameters;
end;

function TProduct.UpdateProductsStatus(Value: TStatusProduct): iProduct;
begin
  Result := Self;
  FHTTP.Token('')
    .AddQuery('catalogContext', FParameters.CatalogContext)
    .Body(Value.Converter.ToJSON.ToString)
    .Patch(Format(PRODUCTPUT+PRODSTATUS,
      [FParameters.MerchantId, FParameters.ProductId]));
end;

end.
