unit sdk.ifoof.delphi.model.entity.sellableitem;

interface

uses
  GBJSON.Attributes,
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.converterjsonobject,
  sdk.ifoof.delphi.model.entity.itemprice,
  sdk.ifoof.delphi.model.entity.itemschedules,
  sdk.ifoof.delphi.model.entity.itemopriongroups,
  sdk.ifoof.delphi.model.entity.itemsllingoption;

type
  TRespSellableItem = class
  private
    FItemId: String;
    FCategoryId: String;
    FItemEan: String;
    FItemExternalCode: String;
    FCategoryName: String;
    FCategoryIndex: Integer;
    FItemName: String;
    FItemDescription: String;
    FItemAdditionalInformation: String;
    FLogosUrls: TList<String>;
    FItemIndex: Integer;
    FItemPrice: TItemPrice;
    FItemMinSalePrice: Integer;
    FItemSchedules: TItemSchedules;
    FItemPackaging: String;
    FItemQuantity: Integer;
    FItemUnit: String;
    FItemOptionGroups: TItemOptionGroups;
    FItemSellingOption: TItemSellingOption;
    FItemGeneralTags: TList<String>;
    FItemProductTags: TList<String>;
    FConverter: TConverterJSONObject<TRespSellableItem>;
  public
    property ItemId: String read FItemId write FItemId;
    property CategoryId: String read FCategoryId write FCategoryId;
    property ItemEan: String read FItemEan write FItemEan;
    property ItemExternalCode: String read FItemExternalCode write FItemExternalCode;
    property CategoryName: String read FCategoryName write FCategoryName;
    property CategoryIndex: Integer read FCategoryIndex write FCategoryIndex;
    property ItemName: String read FItemName write FItemName;
    property ItemDescription: String read FItemDescription write FItemDescription;
    property ItemAdditionalInformation: String read FItemAdditionalInformation write FItemAdditionalInformation;
    property LogosUrls: TList<String> read FLogosUrls write FLogosUrls;
    property ItemIndex: Integer read FItemIndex write FItemIndex;
    property ItemPrice: TItemPrice read FItemPrice write FItemPrice;
    property ItemMinSalePrice: Integer read FItemMinSalePrice write FItemMinSalePrice;
    property ItemSchedules: TItemSchedules read FItemSchedules write FItemSchedules;
    property ItemPackaging: String read FItemPackaging write FItemPackaging;
    property ItemQuantity: Integer read FItemQuantity write FItemQuantity;
    property ItemUnit: String read FItemUnit write FItemUnit;
    property ItemOptionGroups: TItemOptionGroups read FItemOptionGroups write FItemOptionGroups;
    property ItemSellingOption: TItemSellingOption read FItemSellingOption write FItemSellingOption;
    property ItemGeneralTags: TList<String> read FItemGeneralTags write FItemGeneralTags;
    property ItemProductTags: TList<String> read FItemProductTags write FItemProductTags;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespSellableItem;
    function Converter: TConverterJSONObject<TRespSellableItem>;
  end;

implementation

{ TRespSellableItem }

function TRespSellableItem.Converter: TConverterJSONObject<TRespSellableItem>;
begin
  Result := FConverter;
end;

constructor TRespSellableItem.Create;
begin
  FItemPrice:= TItemPrice.New;
  FItemSchedules:= TItemSchedules.New;
  FItemOptionGroups:= TItemOptionGroups.New;
  FItemSellingOption:= TItemSellingOption.New;
  FConverter:= TConverterJSONObject<TRespSellableItem>.New(Self);
end;

destructor TRespSellableItem.Destroy;
begin

  inherited;
end;

class function TRespSellableItem.New: TRespSellableItem;
begin
  Result := Self.Create;
end;

end.
