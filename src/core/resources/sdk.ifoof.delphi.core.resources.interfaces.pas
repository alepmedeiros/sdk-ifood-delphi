unit sdk.ifoof.delphi.core.resources.interfaces;

interface

uses
  System.Generics.Collections,
  sdk.ifoof.delphi.model.enums,
  sdk.ifoof.delphi.model.entity.usercode,
  sdk.ifoof.delphi.model.entity.token,
  sdk.ifoof.delphi.model.entity.merchant,
  sdk.ifoof.delphi.model.entity.status,
  sdk.ifoof.delphi.model.entity.interruption,
  sdk.ifoof.delphi.model.entity.event,
  sdk.ifoof.delphi.model.entity.ackevent,
  sdk.ifoof.delphi.model.entity.orderdetails,
  sdk.ifoof.delphi.model.entity.cancellationreasons,
  sdk.ifoof.delphi.model.entity.requestcancel,
  sdk.ifoof.delphi.model.entity.tracking,
  sdk.ifoof.delphi.model.entity.discovery,
  sdk.ifoof.delphi.model.entity.checkout,
  sdk.ifoof.delphi.model.entity.responsecheckout,
  sdk.ifoof.delphi.model.entity.catalogs,
  sdk.ifoof.delphi.model.entity.changelog,
  sdk.ifoof.delphi.model.entity.unsellablelitemsList,
  sdk.ifoof.delphi.model.entity.sellableitem,
  sdk.ifoof.delphi.model.entity.patchstatusitem,
  sdk.ifoof.delphi.model.entity.getcategory,
  sdk.ifoof.delphi.model.entity.productresponse,
  sdk.ifoof.delphi.model.entity.statusproduct,
  sdk.ifoof.delphi.model.entity.productpricebatch,
  sdk.ifoof.delphi.core.configuration.interfaces,
  sdk.ifoof.delphi.model.interfaces;

type
  iAuthentication = interface;
  iMerchant = interface;
  iOrder = interface;
  iShipping = interface;
  iCatalog = interface;
  iShelves = interface;
  iFinancial = interface;
  iReview = interface;
  iGroceries = interface;
  iParameters<T> = interface;

  iOAuth = interface
    function RequestsUserCode(var AutorizationCode: String): iOAuth;
    function RequestsAccessToken(AutorizationCode: String): iSchemaToken;
    function &End: iAuthentication;
  end;

  iAuthentication = interface
    function OAuth: iOAuth;
    function Config: iConfiguration;
    function &End: iAuthentication;
  end;

  iStatus = interface
    function GetMerchantStatus: TObjectList<TRespStatus>;
    function GetMerchantStatusByOperation: TRespStatus;
    function Parameters: iParameters<iStatus>;
    function &End: iMerchant;
  end;

  iInterruption = interface
    function ListMerchantsInterruptions: TObjectList<TRespInterruption>;
    function CreateInterruption(Value: TRespInterruption): TRespInterruption;
    function DeleteInterruption: iInterruption;
    function Parameters: iParameters<iInterruption>;
    function &End: iMerchant;
  end;

  iMerchant = interface
    function ListMerchants: TObjectList<TRespMerchant>;
    function GetMerchantDetails: TRespMerchant;
    function status: iStatus;
    function interruption: iInterruption;
    function Parameters: iParameters<iMerchant>;
    function &End: iMerchant;
  end;

  iEvents = interface
    function GetNewEvents: TObjectList<TRespEvent>;
    function AcknowledgeEvents(Value: TRespAckEvent): iEvents;
    function Parameters: iParameters<iEvents>;
    function &End: iOrder;
  end;

  iDetails = interface
    function GetOrderDetails: TRespOrderDetails;
    function Parameters: iParameters<iDetails>;
    function &End: iOrder;
  end;

  iActions = interface
    function ConfirmOrder: Boolean;
    function StartPreparation: Boolean;
    function ReadyToPichup: Boolean;
    function DispatchOrder: Boolean;
    function GetAvailableCacellationCodesForTheOrder
      : TObjectList<TRespCancellationReasons>;
    function RequestToCancel(Value: TRespRequestCancel): Boolean;
    function AcceptCancellationRequest: Boolean;
    function DenyCacellationRequest: Boolean;
    function Parameters: iParameters<iActions>;
    function &End: iOrder;
  end;

  iDelivery = interface
    function TrackTheOrder: TRespTracking;
    function RequestDriver: Boolean;
    function Parameters: iParameters<iDelivery>;
    function &End: iOrder;
  end;

  iOrder = interface
    function Events: iEvents;
    function Details: iDetails;
    function Actions: iActions;
    function Delivery: iDelivery;
    function &End: iOrder;
  end;

  iDeliveryAvailabilities = interface
    function DeliveryAvailabilities(var Value: TRespDiscovery)
      : iDeliveryAvailabilities;
    function Parameters: iParameters<iDeliveryAvailabilities>;
    function &End: iShipping;
  end;

  iOrders = interface
    function CreateOrder(Value: TRespCheckout;
      var Resp: TResponseCheckout): iOrders;
    function Parameters: iParameters<iOrders>;
    function &End: iShipping;
  end;

  iShipping = interface
    function DeliveryAvailabilities: iDeliveryAvailabilities;
    function Orders: iOrders;
    function &End: iShipping;
  end;

  iCategory = interface
    function ListCategories(var Value: TGetCategory): iCategory;
    function CreateCategory(var Value: TGetCategory): iCategory;
    function GetCategory(var Value: TGetCategory): iCategory;
    function EditCategory(var Value: TGetCategory): iCategory;
    function DeleteCategory: iCategory;
    function Parameters: iParameters<iCategory>;
    function &End: iCatalog;
  end;

  iProduct = interface
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

  iPizzaProduct = interface
    function CreatePizza: iPizzaProduct;
    function ListPizzas: iPizzaProduct;
    function LinkPizzaToCategory: iPizzaProduct;
    function UnLinkPizzaFromCategory: iPizzaProduct;
    function UpdatePizza: iPizzaProduct;
    function UpdatePizzasStatus: iPizzaProduct;
    function BatchUpdatePizzasPricesByPDV: iPizzaProduct;
    function BatchUpdatePizzasPrices: iPizzaProduct;
    function Parameters: iParameters<iPizzaProduct>;
    function &End: iCatalog;
  end;

  iItem = interface
    function GetItem: iItem;
    function CreateItem: iItem;
    function EditItem: iItem;
    function DeleteItem: iItem;
    function EditTheStatusOfItem: iItem;
    function Parameters: iParameters<iItem>;
    function &End: iCatalog;
  end;

  iOptionGroup = interface
    function CreateOptionGroup: iOptionGroup;
    function ListOptinoGroups: iOptionGroup;
    function UpdateOptionGroups: iOptionGroup;
    function DeleteOptionGroup: iOptionGroup;
    function AssociateOptionGroupToProduct: iOptionGroup;
    function UpdateOptionGroupProductAssociation: iOptionGroup;
    function DisassociateOptionGroupFromProduct: iOptionGroup;
    function UpdateOptionGroupsStatus: iOptionGroup;
    function Parameters: iParameters<iOptionGroup>;
    function &End: iCatalog;
  end;

  iOption = interface
    function CreateOption: iOption;
    function UpdateOption: iOption;
    function DeleteOption: iOption;
    function Parameters: iParameters<iOption>;
    function &End: iCatalog;
  end;

  iBatch = interface
    function ListBatchOperationResults: iBatch;
    function Parameters: iParameters<iBatch>;
    function &End: iCatalog;
  end;

  iInventory = interface
    function CreateOrUptadeTheStockOfProduct: iInventory;
    function GetsTheStockOfProductForGivenOwnerId: iInventory;
    function DeletesTheStockForListOfProductsForGivenOwnerId: iInventory;
    function Parameters: iParameters<iInventory>;
    function &End: iCatalog;
  end;

  iMultiSetup = interface
    function CreateOrUpdateItem: iMultiSetup;
    function UpdateOptionPrice: iMultiSetup;
    function UpdateOptionStatus: iMultiSetup;
    function ListItemsWithinThatCategory: iMultiSetup;
    function DeleteCategory: iMultiSetup;
    function DeleteOptionGroup: iMultiSetup;
    function CheckIfMerchantUseTheMultisetupModule: iMultiSetup;
    function Parameters: iParameters<iMultiSetup>;
    function &End: iCatalog;
  end;

  iCatalog = interface
    function ListCatalogs(var Value: TRespCatalogs): iCatalog;
    function ListChangelogs(var Value: TObjectList<TRespChangeLog>): iCatalog;
    function ListUnsellableItems(var Value: TRespUnsellablelitemsList)
      : iCatalog;
    function ListSellableItems(var Value: TObjectList<TRespSellableItem>)
      : iCatalog;
    function EditAisleGroupIdCatalog: iCatalog;
    function UpdateItemStatusByItemId(Value: TPatchStatusItem): iCatalog;
    function UpdateOptionStatusByItemIdAndOptionId(Value: TPatchStatusItem)
      : iCatalog;
    function Category: iCategory;
    function Product: iProduct;
    function PizzaProduct: iPizzaProduct;
    function Item: iItem;
    function OptionGroup: iOptionGroup;
    function Option: iOption;
    function Batch: iBatch;
    function Inventory: iInventory;
    function Multisetup: iMultiSetup;
    function Parameters: iParameters<iCatalog>;
    function &End: iCatalog;
  end;

  iAisle = interface
    function CreateAisle: iAisle;
    function EditAisle: iAisle;
    function GetAisle: iAisle;
    function CreateAisleProductRelation: iAisle;
    function DeleteAisleProductRelation: iAisle;
    function Parameters: iParameters<iAisle>;
    function &End: iShelves;
  end;

  iAisleGroup = interface
    function CreateAisleGroup: iAisleGroup;
    function EditAisleGroup: iAisleGroup;
    function GetAisleGroup: iAisleGroup;
    function Parameters: iParameters<iAisleGroup>;
    function &End: iShelves;
  end;

  iShelves = interface
    function CreateShelves: iShelves;
    function GetShelves: iShelves;
    function EditShelf: iShelves;
    function DeleteShelf: iShelves;
    function GetShelfProductByEan: iShelves;
    function LinkProductToShelf: iShelves;
    function CreateShelfProduct: iShelves;
    function EditShelfProduct: iShelves;
    function UpdateSellingOptionByMerchant: iShelves;
    function MigrateCatalogTagAndCombo: iShelves;
    function CreatesSMMigrationCatalog: iShelves;
    function Aisle: iAisle;
    function AisleGroup: iAisleGroup;
    function Parameters: iParameters<iShelves>;
    function &End: iShelves;
  end;

  iConciliation = interface
    function GetSalesByMerchant: iConciliation;
    function GetSalesAdjustmentsByMerchant: iConciliation;
    function GetPaymentsInfo: iConciliation;
    function GetPaymentDetails: iConciliation;
    function GetOccurrences: iConciliation;
    function GetMaintenanceFees: iConciliation;
    function GetIncomeTaxes: iConciliation;
    function GetPeriodsInfo: iConciliation;
    function GetChargeCancellations: iConciliation;
    function GetCancellations: iConciliation;
    function GetReceivableRecordsInfo: iConciliation;
    function GetSalesIfoodBenefitsByMerchant: iConciliation;
    function GetAdjustmentsIfoodNenefitsByMerchant: iConciliation;
    function Parameters: iParameters<iConciliation>;
    function &End: iFinancial;
  end;

  iFinancial = interface
    function Conciliation: iConciliation;
    function &End: iFinancial;
  end;

  iSummary = interface
    function GetSummary: iSummary;
    function Parameters: iParameters<iSummary>;
    function &End: iReview;
  end;

  iReview = interface
    function ListReviews: iReview;
    function GetReview: iReview;
    function PostReviewReply: iReview;
    function Summary: iSummary;
    function Parameters: iParameters<iReview>;
    function &End: iReview;
  end;

  iOrderModifier = interface
    function ReturnsIfPossibleModifyOrder: iOrderModifier;
    function ListsPatchRequestsOfOrder: iOrderModifier;
    function ListsReplacementsOfOrder: iOrderModifier;
    function CreatesNewPatchRequest: iOrderModifier;
    function Parameters: iParameters<iOrderModifier>;
    function &End: iGroceries;
  end;

  iGroceries = interface
    function OrderModifier: iOrderModifier;
    function &End: iGroceries;
  end;

  iResources = interface
    function Authentication: iAuthentication;
    function merchant: iMerchant;
    function Order: iOrder;
    function Shipping: iShipping;
    function Catalog: iCatalog;
    function Shelves: iShelves;
    function Financial: iFinancial;
    function Review: iReview;
    function Groceries: iGroceries;
    function &End: iResources;
  end;

  iParameters<T> = interface
    function Id(Value: String): iParameters<T>; overload;
    function Id: String; overload;
    function ClientId(Value: String): iParameters<T>; overload;
    function ClientId: String; overload;
    function GrantType(Value: String): iParameters<T>; overload;
    function GrantType: String; overload;
    function ClientSecret(Value: String): iParameters<T>; overload;
    function ClientSecret: String; overload;
    function AuthorizationCode(Value: String): iParameters<T>; overload;
    function AuthorizationCode: String; overload;
    function AuthorizationCodeVerifier(Value: String): iParameters<T>; overload;
    function AuthorizationCodeVerifier: String; overload;
    function RefreshToken(Value: String): iParameters<T>; overload;
    function RefreshToken: String; overload;
    function Page(Value: String): iParameters<T>; overload;
    function Page: String; overload;
    function Size(Value: String): iParameters<T>; overload;
    function Size: String; overload;
    function MerchantId(Value: String): iParameters<T>; overload;
    function MerchantId: String; overload;
    function Operation(Value: String): iParameters<T>; overload;
    function Operation: String; overload;
    function InterruptionId(Value: String): iParameters<T>; overload;
    function InterruptionId: String; overload;
    function XPollingMerchants(Value: String): iParameters<T>; overload;
    function XPollingMerchants: String; overload;
    function Types(Value: String): iParameters<T>; overload;
    function Types: String; overload;
    function Groups(Value: String): iParameters<T>; overload;
    function Groups: String; overload;
    function Latitude(Value: String): iParameters<T>; overload;
    function Latitude: String; overload;
    function Longitude(Value: String): iParameters<T>; overload;
    function Longitude: String; overload;
    function CatalogId(Value: String): iParameters<T>; overload;
    function CatalogId: String; overload;
    function StartDate(Value: TDateTime): iParameters<T>; overload;
    function StartDate: TDateTime; overload;
    function EndDate(Value: TDateTime): iParameters<T>; overload;
    function EndDate: TDateTime; overload;
    function GroupId(Value: String): iParameters<T>; overload;
    function GroupdId: String; overload;
    function AisleGroupId(Value: String): iParameters<T>; overload;
    function AisleGroupId: String; overload;
    function ItemId(Value: String): iParameters<T>; overload;
    function ItemId: String; overload;
    function OptionItemId(Value: String): iParameters<T>; overload;
    function OptionItemId: String; overload;
    function IncludeItems(Value: Boolean): iParameters<T>; overload;
    function IncludeItems: Boolean; overload;
    function Include_Items(Value: Boolean): iParameters<T>; overload;
    function Include_Items: Boolean; overload;
    function CategoryId(Value: String): iParameters<T>; overload;
    function CategoryId: String; overload;
    function Limit(Value: String): iParameters<T>; overload;
    function Limit: String; overload;
    function ProductId(Value: String): iParameters<T>; overload;
    function ProductId: String; overload;
    function CatalogContext(Value: String): iParameters<T>; overload;
    function CatalogContext: String; overload;
    function ExternalCode(Value: String): iParameters<T>; overload;
    function ExternalCode: String; overload;
    function PizzaId(Value: String): iParameters<T>; overload;
    function PizzaId: String; overload;
    function IncludeOptions(Value: Boolean): iParameters<T>; overload;
    function IncludeOptions: Boolean; overload;
    function Include_Options(Value: Boolean): iParameters<T>; overload;
    function Include_Options: Boolean; overload;
    function OptionGroupId(Value: String): iParameters<T>; overload;
    function OptionGroupId: String; overload;
    function BatchId(Value: String): iParameters<T>; overload;
    function BatchId: String; overload;
    function PrefixName(Value: String): iParameters<T>; overload;
    function PrefixName: String; overload;
    function ShelfId(Value: String): iParameters<T>; overload;
    function ShelfId: String; overload;
    function Ean(Value: String): iParameters<T>; overload;
    function Ean: String; overload;
    function OriginCatalogId(Value: String): iParameters<T>; overload;
    function OriginCatalogId: String; overload;
    function TargetCatalogId(Value: String): iParameters<T>; overload;
    function TargetCatalogId: String; overload;
    function Name(Value: String): iParameters<T>; overload;
    function Name: String; overload;
    function AisleId(Value: String): iParameters<T>; overload;
    function AisleId: String; overload;
    function IsDefault(Value: Boolean): iParameters<T>; overload;
    function IsDefault: Boolean; overload;
    function PeriodoId(Value: String): iParameters<T>; overload;
    function PeriodoId: String; overload;
    function BeginLastProcessingDate(Value: TDateTime): iParameters<T>;
      overload;
    function BeginLastProcessingDate: TDateTime; overload;
    function EndLastProcessingDate(Value: TDateTime): iParameters<T>; overload;
    function EndLastProcessingDate: TDateTime; overload;
    function BeginOrderDate(Value: TDateTime): iParameters<T>; overload;
    function BeginOrderDate: TDateTime; overload;
    function EndOrderDate(Value: TDateTime): iParameters<T>; overload;
    function EndOrderDate: TDateTime; overload;
    function OrderStatus(Value: String): iParameters<T>; overload;
    function OrderStatus: String; overload;
    function BeginUpdateDate(Value: TDateTime): iParameters<T>; overload;
    function BeginUpdateDate: TDateTime; overload;
    function EndUpdateDate(Value: TDateTime): iParameters<T>; overload;
    function EndUpdateDate: TDateTime; overload;
    function BeginExpectedExecutionDate(Value: TDateTime)
      : iParameters<T>; overload;
    function BeginExpectedExecutionDate: TDateTime; overload;
    function EndExpectedExecutionDate(Value: TDateTime)
      : iParameters<T>; overload;
    function EndExpectedExecutionDate: TDateTime; overload;
    function BeginConfirmedPaymentDate(Value: TDateTime)
      : iParameters<T>; overload;
    function BeginConfirmedPaymentDate: TDateTime; overload;
    function EndConfirmedPaymentDate(Value: TDateTime): iParameters<T>;
      overload;
    function EndConfirmedPaymentDate: TDateTime; overload;
    function BeginPaymentDate(Value: TDateTime): iParameters<T>; overload;
    function BeginPaymentDate: TDateTime; overload;
    function EndPaymentDate(Value: TDateTime): iParameters<T>; overload;
    function EndPaymentDate: TDateTime; overload;
    function status(Value: TStatus): iParameters<T>; overload;
    function status: TStatus; overload;
    function _Type(Value: TType): iParameters<T>; overload;
    function _Type: TType; overload;
    function TransactionDateBegin(Value: TDateTime): iParameters<T>; overload;
    function TransactionDateBegin: TDateTime; overload;
    function TransactionDateEnd(Value: TDateTime): iParameters<T>; overload;
    function TransactionDateEnd: TDateTime; overload;
    function Competence(Value: TDateTime): iParameters<T>; overload;
    function Competence: TDateTime; overload;
    function BeginCancellationDate(Value: TDateTime): iParameters<T>; overload;
    function BeginCancellationDate: TDateTime; overload;
    function EndCancellationDate(Value: TDateTime): iParameters<T>; overload;
    function EndCancellationDate: TDateTime; overload;
    function BeginReceivableDate(Value: TDateTime): iParameters<T>; overload;
    function BeginReceivableDate: TDateTime; overload;
    function EndReceivableDate(Value: TDateTime): iParameters<T>; overload;
    function EndReceivableDate: TDateTime; overload;
    function PageSize(Value: Integer): iParameters<T>; overload;
    function PageSize: Integer; overload;
    function AddCount(Value: Boolean): iParameters<T>; overload;
    function AddCount: Boolean; overload;
    function DateFrom(Value: TDateTime): iParameters<T>; overload;
    function DateFrom: TDateTime; overload;
    function DateTo(Value: TDateTime): iParameters<T>; overload;
    function DateTo: TDateTime; overload;
    function Sort(Value: TSort): iParameters<T>; overload;
    function Sort: TSort; overload;
    function SortBy(Value: TSortBy): iParameters<T>; overload;
    function SortBy: TSortBy; overload;
    function ReviewId(Value: String): iParameters<T>; overload;
    function ReviewId: String; overload;
    function &End: T;
  end;

implementation

end.
