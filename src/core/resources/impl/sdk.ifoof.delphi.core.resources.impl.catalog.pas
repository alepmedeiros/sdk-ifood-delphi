unit sdk.ifoof.delphi.core.resources.impl.catalog;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.impl.multisetup,
  sdk.ifoof.delphi.core.resources.impl.inventory,
  sdk.ifoof.delphi.core.resources.impl.batch,
  sdk.ifoof.delphi.core.resources.impl.option,
  sdk.ifoof.delphi.core.resources.impl.optiongroup,
  sdk.ifoof.delphi.core.resources.impl.item,
  sdk.ifoof.delphi.core.resources.impl.pizzaproduct,
  sdk.ifoof.delphi.core.resources.impl.product,
  sdk.ifoof.delphi.core.resources.impl.category,
  sdk.ifoof.delphi.core.resources.parameters,
  sdk.ifoof.delphi.core.http.interfaces,
  sdk.ifoof.delphi.model.entity.catalogs,
  sdk.ifoof.delphi.model.entity.changelog,
  sdk.ifoof.delphi.model.entity.unsellablelitemsList,
  sdk.ifoof.delphi.model.entity.sellableitem,
  sdk.ifoof.delphi.model.entity.patchstatusitem;

type
  TCatalog = class(TInterfacedObject, iCatalog)
  private
    FCategory: iCategory;
    FProduct: iProduct;
    FPizzaProduct: iPizzaProduct;
    FItem: iItem;
    FOptionGroup: iOptionGroup;
    FOption: iOption;
    FBatch: iBatch;
    FInventory: iInventory;
    FMultisetup: iMultiSetup;
    FParameters: iParameters<iCatalog>;

    FHTTP: iHTTPClient;
    FJSON: String;

    const
      CATALOGS = '/merchants/%s/catalogs';
      CHANGELOG = '/merchants/%s/catalogs/%s/changelog';
      UNSELLABLEITEMS = '/merchants/%s/catalogs/%s/unsellableItems';
      SELLABLEITEMS = '/merchants/%s/catalogs/%s/sellableItems';
      PUTCATALOG = '/merchants/%s/catalog/%s';
      PATCHSTATUS = '/merchants/%s/catalog/item/%s/status';
      UPDATOPTIONSTATUS = '/merchants/%s/catalog/item/%s/option/%s/status';
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iCatalog;
    function ListCatalogs(var Value: TRespCatalogs): iCatalog;
    function ListChangelogs(var Value: TObjectList<TRespChangeLog>): iCatalog;
    function ListUnsellableItems(var Value: TRespUnsellablelitemsList): iCatalog;
    function ListSellableItems(var Value: TObjectList<TRespSellableItem>): iCatalog;
    function EditAisleGroupIdCatalog: iCatalog;
    function UpdateItemStatusByItemId(Value: TPatchStatusItem): iCatalog;
    function UpdateOptionStatusByItemIdAndOptionId(Value: TPatchStatusItem): iCatalog;
    function Category: iCategory;
    function product: iProduct;
    function pizzaproduct: iPizzaProduct;
    function item: iItem;
    function optiongroup: iOptionGroup;
    function option: iOption;
    function batch: iBatch;
    function inventory: iInventory;
    function multisetup: iMultiSetup;
    function Parameters: iParameters<iCatalog>;
    function &End: iCatalog;
  end;

implementation

{ TMyClass }

function TCatalog.batch: iBatch;
begin
  if not Assigned(FBatch) then
    FBatch := TBatch.New(Self);
  Result := FBatch;
end;

function TCatalog.category: iCategory;
begin
  if not Assigned(FCategory) then
    FCategory := TCategory.New(Self);
  Result := FCategory;
end;

function TCatalog.&End: iCatalog;
begin
  Result := Self;
end;

constructor TCatalog.Create;
begin

end;

destructor TCatalog.Destroy;
begin

  inherited;
end;

function TCatalog.EditAisleGroupIdCatalog: iCatalog;
begin
  Result := Self;
  FHTTP.Token('')
    .AddQuery('aisleGroupId ', FParameters.AisleGroupId)
    .Put(Format(PUTCATALOG,[FParameters.MerchantId, FParameters.CatalogId]));
end;

function TCatalog.inventory: iInventory;
begin
  if not Assigned(FInventory) then
    FInventory := TInventory.New(Self);
  Result := FInventory;
end;

function TCatalog.item: iItem;
begin
  if not Assigned(FItem) then
    FItem := TItem.New(Self);
  Result := FItem;
end;

function TCatalog.ListCatalogs(var Value: TRespCatalogs): iCatalog;
begin
  Result := Self;

  FHTTP.Token('')
    .Get(Format(CATALOGS, [FParameters.MerchantId]))
    .Content(FJSON);
  Value := TRespCatalogs.New.Converter.ToObject(FJSON);
end;

function TCatalog.ListChangelogs(var Value: TObjectList<TRespChangeLog>): iCatalog;
begin
  Result := Self;
  FHTTP.Token('')
    .AddQuery('startDate', DateTimeToStr(FParameters.StartDate))
    .AddQuery('endDate', DateTimeToStr(FParameters.EndDate))
    .Get(Format(CHANGELOG, [FParameters.MerchantId, FParameters.CatalogId]))
    .Content(FJSON);
  Value := TRespChangeLog.New.Converter.ToList(FJSON);
end;

function TCatalog.ListSellableItems(var Value: TObjectList<TRespSellableItem>): iCatalog;
begin
  Result := Self;
  FHTTP.Token('').Get(Format(SELLABLEITEMS,
    [FParameters.MerchantId, FParameters.GroupdId]))
    .Content(FJSON);
  Value := TRespSellableItem.New.Converter.ToList(FJSON);
end;

function TCatalog.ListUnsellableItems(var Value: TRespUnsellablelitemsList): iCatalog;
begin
  Result := Self;
  FHTTP.Token('').Get(Format(UNSELLABLEITEMS,
    [FParameters.MerchantId, FParameters.CatalogId]))
    .Content(FJSON);
  Value := TRespUnsellablelitemsList.New.Converter.ToObject(FJSON);
end;

function TCatalog.multisetup: iMultiSetup;
begin
  if not Assigned(FMultisetup) then
    FMultisetup := TMultiSetup.New(Self);
  Result := FMultisetup;
end;

class function TCatalog.New: iCatalog;
begin
  Result := Self.Create;
end;

function TCatalog.option: iOption;
begin
  if not Assigned(FOption) then
    FOption := TOption.New(Self);
  Result := FOption;
end;

function TCatalog.optiongroup: iOptionGroup;
begin
  if not Assigned(FOptionGroup) then
    FOptionGroup := TOptionGroup.New(Self);
  Result := FOptionGroup;
end;

function TCatalog.Parameters: iParameters<iCatalog>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iCatalog>.NEw(Self);
  Result := FParameters;
end;

function TCatalog.pizzaproduct: iPizzaProduct;
begin
  if not Assigned(FPizzaProduct) then
    FPizzaProduct := TPizzaProduct.New(Self);
  Result := FPizzaProduct;
end;

function TCatalog.product: iProduct;
begin
  if not Assigned(FProduct) then
    FProduct := TProduct.New(Self);
  Result := FProduct;
end;

function TCatalog.UpdateItemStatusByItemId(Value: TPatchStatusItem): iCatalog;
begin
  Result := Self;
  FHTTP.Token('')
    .Body(Value.Converter.ToJSON.ToString)
    .Patch(Format(PATCHSTATUS,
      [FParameters.MerchantId, FParameters.ItemId]));
end;

function TCatalog.UpdateOptionStatusByItemIdAndOptionId(Value: TPatchStatusItem): iCatalog;
begin
  Result := Self;
  FHTTP.Token('')
    .Body(Value.Converter.ToJSON.ToString)
    .Patch(Format(UPDATOPTIONSTATUS, [FParameters.MerchantId, FParameters.ItemId,
      FParameters.OptionItemId]));
end;

end.
