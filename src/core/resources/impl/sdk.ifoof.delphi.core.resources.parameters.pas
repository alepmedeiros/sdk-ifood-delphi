unit sdk.ifoof.delphi.core.resources.parameters;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces, sdk.ifoof.delphi.model.enums;

type
  TParameters<T: IInterface> = class(TInterfacedObject, iParameters<T>)
  private
    [weak]
    FParent: T;
    FId: String;
    FClientId: String;
    FGrantType: String;
    FClientSecret: String;
    FAuthorizationCode: String;
    FAuthorizationCodeVerifier: String;
    FRefreshToken: String;
    FPage: String;
    FSize: String;
    FMerchantId: String;
    FOperation: String;
    FInterruptionId: String;
    FXPollingMerchants: String;
    FTypes: String;
    FGroups: String;
    FLatitude: String;
    FLongitude: String;
    FCatalogId: String;
    FStartDate: TDateTime;
    FEndDate: TDateTime;
    FGroupdId: String;
    FAisleGroupId: String;
    FItemId: String;
    FOptionItemId: String;
    FIncludeItems: Boolean;
    FInclude_Items: Boolean;
    FCategoryId: String;
    FLimit: String;
    FProductId: String;
    FCatalogContext: String;
    FExternalCode: String;
    FPizzaId: String;
    FIncludeOptions: Boolean;
    FInclude_Options: Boolean;
    FOptionGroupId: String;
    FBatchId: String;
    FPrefixName: String;
    FShelfId: String;
    FEan: String;
    FOriginCatalogId: String;
    FTargetCatalogId: String;
    FName: String;
    FAisleId: String;
    FIsDefault: Boolean;
    FPeriodoId: String;
    FBeginLastProcessingDate: TDateTime;
    FEndLastProcessingDate: TDateTime;
    FBeginOrderDate: TDateTime;
    FEndOrderDate: TDateTime;
    FOrderStatus: String;
    FBeginUpdateDate: TDateTime;
    FEndUpdateDate: TDateTime;
    FBeginExpectedExecutionDate: TDateTime;
    FEndExpectedExecutionDate: TDateTime;
    FBeginConfirmedPaymentDate: TDateTime;
    FEndConfirmedPaymentDate: TDateTime;
    FBeginPaymentDate: TDateTime;
    FEndPaymentDate: TDateTime;
    FStatus: TStatus;
    F_Type: TType;
    FTransactionDateBegin: TDateTime;
    FTransactionDateEnd: TDateTime;
    FCompetence: TDateTime;
    FBeginCancellationDate: TDateTime;
    FEndCancellationDate: TDateTime;
    FBeginReceivableDate: TDateTime;
    FEndReceivableDate: TDateTime;
    FPageSize: Integer;
    FAddCount: Boolean;
    FDateFrom: TDateTime;
    FDateTo: TDateTime;
    FSort: TSort;
    FSortBy: TSortBy;
    FReviewId: String;
  public
    constructor Create(Parent: T);
    destructor Destroy; override;
    class function New(Parent: T): iParameters<T>;
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
    function BeginLastProcessingDate(Value: TDateTime): iParameters<T>; overload;
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
    function BeginExpectedExecutionDate(Value: TDateTime): iParameters<T>; overload;
    function BeginExpectedExecutionDate: TDateTime; overload;
    function EndExpectedExecutionDate(Value: TDateTime): iParameters<T>; overload;
    function EndExpectedExecutionDate: TDateTime; overload;
    function BeginConfirmedPaymentDate(Value: TDateTime): iParameters<T>; overload;
    function BeginConfirmedPaymentDate: TDateTime; overload;
    function EndConfirmedPaymentDate(Value: TDateTime): iParameters<T>; overload;
    function EndConfirmedPaymentDate: TDateTime; overload;
    function BeginPaymentDate(Value: TDateTime): iParameters<T>; overload;
    function BeginPaymentDate: TDateTime; overload;
    function EndPaymentDate(Value: TDateTime): iParameters<T>; overload;
    function EndPaymentDate: TDateTime; overload;
    function Status(Value: TStatus): iParameters<T>; overload;
    function Status: TStatus; overload;
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

{ TMyClass }

function TParameters<T>.AddCount(Value: Boolean): iParameters<T>;
begin
  Result := Self;
  FAddCount := Value;
end;

function TParameters<T>.AddCount: Boolean;
begin
  Result := FAddCount;
end;

function TParameters<T>.AisleGroupId(Value: String): iParameters<T>;
begin
  Result := Self;
  FAisleGroupId := Value;
end;

function TParameters<T>.AisleGroupId: String;
begin
  Result := FAisleGroupId;
end;

function TParameters<T>.AisleId: String;
begin
  Result := FAisleId;
end;

function TParameters<T>.AisleId(Value: String): iParameters<T>;
begin
  Result := Self;
  FAisleId := Value;
end;

function TParameters<T>.AuthorizationCode(Value: String): iParameters<T>;
begin
  Result := Self;
  FAuthorizationCode := Value;
end;

function TParameters<T>.AuthorizationCode: String;
begin
  Result := FAuthorizationCode;
end;

function TParameters<T>.AuthorizationCodeVerifier: String;
begin
  Result := FAuthorizationCodeVerifier;
end;

function TParameters<T>.AuthorizationCodeVerifier(
  Value: String): iParameters<T>;
begin
  Result := Self;
  FAuthorizationCodeVerifier := Value;
end;

function TParameters<T>.BatchId: String;
begin
  Result := FBatchId;
end;

function TParameters<T>.BatchId(Value: String): iParameters<T>;
begin
  Result := Self;
  FBatchId := Value;
end;

function TParameters<T>.BeginCancellationDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FBeginCancellationDate := Value;
end;

function TParameters<T>.BeginCancellationDate: TDateTime;
begin
  Result := FBeginCancellationDate;
end;

function TParameters<T>.BeginConfirmedPaymentDate: TDateTime;
begin
  Result := FBeginConfirmedPaymentDate;
end;

function TParameters<T>.BeginConfirmedPaymentDate(
  Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FBeginConfirmedPaymentDate := Value;
end;

function TParameters<T>.BeginExpectedExecutionDate: TDateTime;
begin
  Result := FBeginExpectedExecutionDate;
end;

function TParameters<T>.BeginExpectedExecutionDate(
  Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FBeginExpectedExecutionDate := Value;
end;

function TParameters<T>.BeginLastProcessingDate(
  Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FBeginLastProcessingDate := Value;
end;

function TParameters<T>.BeginLastProcessingDate: TDateTime;
begin
  Result := FBeginLastProcessingDate;
end;

function TParameters<T>.BeginOrderDate: TDateTime;
begin
  Result := FBeginOrderDate;
end;

function TParameters<T>.BeginOrderDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FBeginOrderDate := Value;
end;

function TParameters<T>.BeginPaymentDate: TDateTime;
begin
  Result := FBeginPaymentDate;
end;

function TParameters<T>.BeginPaymentDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FBeginPaymentDate := Value;
end;

function TParameters<T>.BeginReceivableDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FBeginReceivableDate := Value;
end;

function TParameters<T>.BeginReceivableDate: TDateTime;
begin
  Result := FBeginReceivableDate;
end;

function TParameters<T>.BeginUpdateDate: TDateTime;
begin
  Result := FBeginUpdateDate;
end;

function TParameters<T>.BeginUpdateDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FBeginUpdateDate := Value;
end;

function TParameters<T>.CatalogContext(Value: String): iParameters<T>;
begin
  Result := Self;
  FCatalogContext := Value;
end;

function TParameters<T>.CatalogContext: String;
begin
  Result := FCatalogContext;
end;

function TParameters<T>.CatalogId(Value: String): iParameters<T>;
begin
  Result := Self;
  FCatalogId := Value;
end;

function TParameters<T>.CatalogId: String;
begin
  Result := FCatalogId;
end;

function TParameters<T>.CategoryId: String;
begin
  Result := FCategoryId;
end;

function TParameters<T>.CategoryId(Value: String): iParameters<T>;
begin
  Result := Self;
  FCategoryId := Value;
end;

function TParameters<T>.ClientId: String;
begin
  Result := FClientId;
end;

function TParameters<T>.ClientId(Value: String): iParameters<T>;
begin
  Result := Self;
  FClientId := Value;
end;

function TParameters<T>.ClientSecret(Value: String): iParameters<T>;
begin
  Result := Self;
  FClientSecret := Value;
end;

function TParameters<T>.ClientSecret: String;
begin
  Result := FClientSecret;
end;

function TParameters<T>.Competence(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FCompetence := Value;
end;

function TParameters<T>.Competence: TDateTime;
begin
  Result := FCompetence;
end;

function TParameters<T>.&End: T;
begin
  Result := FParent;
end;

constructor TParameters<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

function TParameters<T>.DateFrom(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FDateFrom := Value;
end;

function TParameters<T>.DateFrom: TDateTime;
begin
  Result := FDateFrom;
end;

function TParameters<T>.DateTo: TDateTime;
begin
  Result := FDateTo;
end;

function TParameters<T>.DateTo(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FDateTo := Value;
end;

destructor TParameters<T>.Destroy;
begin

  inherited;
end;

function TParameters<T>.Ean: String;
begin
  Result := FEan;
end;

function TParameters<T>.Ean(Value: String): iParameters<T>;
begin
  Result := Self;
  FEan := Value;
end;

function TParameters<T>.EndCancellationDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FEndCancellationDate := Value;
end;

function TParameters<T>.EndCancellationDate: TDateTime;
begin
  Result := FEndCancellationDate;
end;

function TParameters<T>.EndConfirmedPaymentDate(
  Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FEndConfirmedPaymentDate := Value;
end;

function TParameters<T>.EndConfirmedPaymentDate: TDateTime;
begin
  Result := FEndConfirmedPaymentDate;
end;

function TParameters<T>.EndDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FEndDate := Value;
end;

function TParameters<T>.EndDate: TDateTime;
begin
  Result := FEndDate;
end;

function TParameters<T>.EndExpectedExecutionDate: TDateTime;
begin
  Result := FEndExpectedExecutionDate;
end;

function TParameters<T>.EndExpectedExecutionDate(
  Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FEndExpectedExecutionDate := Value;
end;

function TParameters<T>.EndLastProcessingDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FEndLastProcessingDate := Value;
end;

function TParameters<T>.EndLastProcessingDate: TDateTime;
begin
  Result := FEndLastProcessingDate;
end;

function TParameters<T>.EndOrderDate: TDateTime;
begin
  Result := FEndOrderDate;
end;

function TParameters<T>.EndOrderDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FEndOrderDate := Value;
end;

function TParameters<T>.EndPaymentDate: TDateTime;
begin
  Result := FEndPaymentDate;
end;

function TParameters<T>.EndPaymentDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FEndPaymentDate := Value;
end;

function TParameters<T>.EndReceivableDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FEndReceivableDate := Value;
end;

function TParameters<T>.EndReceivableDate: TDateTime;
begin
  Result := FEndReceivableDate;
end;

function TParameters<T>.EndUpdateDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FEndUpdateDate := Value;
end;

function TParameters<T>.EndUpdateDate: TDateTime;
begin
  Result := FEndUpdateDate;
end;

function TParameters<T>.ExternalCode(Value: String): iParameters<T>;
begin
  Result := Self;
  FExternalCode := Value;
end;

function TParameters<T>.ExternalCode: String;
begin
  Result := FExternalCode;
end;

function TParameters<T>.Groups(Value: String): iParameters<T>;
begin
  Result := Self;
  FGroups := Value;
end;

function TParameters<T>.GrantType(Value: String): iParameters<T>;
begin
  Result := Self;
  FGrantType := Value;
end;

function TParameters<T>.GrantType: String;
begin
  Result := FGrantType;
end;

function TParameters<T>.GroupdId: String;
begin
  Result := FGroupdId;
end;

function TParameters<T>.GroupId(Value: String): iParameters<T>;
begin
  Result := Self;
  FGroupdId := Value;
end;

function TParameters<T>.Groups: String;
begin
  Result := FGroups;
end;

function TParameters<T>.Id: String;
begin
  Result := FId;
end;

function TParameters<T>.Id(Value: String): iParameters<T>;
begin
  Result := Self;
  FId := Value;
end;

function TParameters<T>.IncludeItems: Boolean;
begin
  Result := FIncludeItems
end;

function TParameters<T>.IncludeItems(Value: Boolean): iParameters<T>;
begin
  Result := Self;
  FIncludeItems := Value;
end;

function TParameters<T>.IncludeOptions(Value: Boolean): iParameters<T>;
begin
  Result := Self;
  FIncludeOptions := Value;
end;

function TParameters<T>.IncludeOptions: Boolean;
begin
  Result := FIncludeOptions;
end;

function TParameters<T>.Include_Items: Boolean;
begin
  Result := FInclude_Items;
end;

function TParameters<T>.Include_Items(Value: Boolean): iParameters<T>;
begin
  Result := Self;
  FInclude_Items := Value;
end;

function TParameters<T>.Include_Options: Boolean;
begin
  Result := FInclude_Options;
end;

function TParameters<T>.Include_Options(Value: Boolean): iParameters<T>;
begin
  Result := Self;
  FInclude_Options := Value;
end;

function TParameters<T>.InterruptionId(Value: String): iParameters<T>;
begin
  Result := Self;
  FInterruptionId := Value;
end;

function TParameters<T>.InterruptionId: String;
begin
  Result := FInterruptionId;
end;

function TParameters<T>.IsDefault(Value: Boolean): iParameters<T>;
begin
  Result := Self;
  FIsDefault := Value;
end;

function TParameters<T>.IsDefault: Boolean;
begin
  Result := FIsDefault;
end;

function TParameters<T>.ItemId(Value: String): iParameters<T>;
begin
  Result := Self;
  FItemId := Value;
end;

function TParameters<T>.ItemId: String;
begin
  Result := FItemId;
end;

function TParameters<T>.Latitude: String;
begin
  Result := FLatitude;
end;

function TParameters<T>.Latitude(Value: String): iParameters<T>;
begin
  Result := Self;
  FLatitude := Value;
end;

function TParameters<T>.Limit: String;
begin
  Result := FLimit;
end;

function TParameters<T>.Limit(Value: String): iParameters<T>;
begin
  Result := Self;
  FLimit := Value;
end;

function TParameters<T>.Longitude: String;
begin
  Result := FLongitude;
end;

function TParameters<T>.Longitude(Value: String): iParameters<T>;
begin
  Result := Self;
  FLongitude := Value;
end;

function TParameters<T>.MerchantId: String;
begin
  Result := FMerchantId;
end;

function TParameters<T>.MerchantId(Value: String): iParameters<T>;
begin
  Result := Self;
  FMerchantId := Value;
end;

function TParameters<T>.Name(Value: String): iParameters<T>;
begin
  Result := Self;
  FName := Value;
end;

function TParameters<T>.Name: String;
begin
  Result := FName;
end;

class function TParameters<T>.New(Parent: T): iParameters<T>;
begin
  Result := Self.Create(Parent);
end;

function TParameters<T>.Operation(Value: String): iParameters<T>;
begin
  Result := Self;
  FOperation := Value;
end;

function TParameters<T>.Operation: String;
begin
  Result := FOperation;
end;

function TParameters<T>.OptionGroupId(Value: String): iParameters<T>;
begin
  Result := Self;
  FOptionGroupId := Value;
end;

function TParameters<T>.OptionGroupId: String;
begin
  Result := FOptionGroupId;
end;

function TParameters<T>.OptionItemId(Value: String): iParameters<T>;
begin
  Result := Self;
  FOptionItemId := Value;
end;

function TParameters<T>.OptionItemId: String;
begin
  Result := FOptionItemId;
end;

function TParameters<T>.OrderStatus(Value: String): iParameters<T>;
begin
  Result := Self;
  FOrderStatus := Value;
end;

function TParameters<T>.OrderStatus: String;
begin
  Result := FOrderStatus;
end;

function TParameters<T>.OriginCatalogId(Value: String): iParameters<T>;
begin
  Result := Self;
  FOriginCatalogId := Value;
end;

function TParameters<T>.OriginCatalogId: String;
begin
  Result := FOriginCatalogId;
end;

function TParameters<T>.Page: String;
begin
  Result := FPage;
end;

function TParameters<T>.Page(Value: String): iParameters<T>;
begin
  Result := Self;
  FPage := Value;
end;

function TParameters<T>.PageSize: Integer;
begin
  Result := FPageSize;
end;

function TParameters<T>.PageSize(Value: Integer): iParameters<T>;
begin
  Result := Self;
  FPageSize := Value;
end;

function TParameters<T>.PeriodoId(Value: String): iParameters<T>;
begin
  Result := Self;
  FPeriodoId := Value;
end;

function TParameters<T>.PeriodoId: String;
begin
  Result := FPeriodoId;
end;

function TParameters<T>.PizzaId(Value: String): iParameters<T>;
begin
  Result := Self;
  FPizzaId := Value;
end;

function TParameters<T>.PizzaId: String;
begin
  Result := FPizzaId;
end;

function TParameters<T>.PrefixName(Value: String): iParameters<T>;
begin
  Result := Self;
  FPrefixName := Value;
end;

function TParameters<T>.PrefixName: String;
begin
  Result := FPrefixName;
end;

function TParameters<T>.ProductId: String;
begin
  Result := FProductId;
end;

function TParameters<T>.ProductId(Value: String): iParameters<T>;
begin
  Result := Self;
  FProductId := Value;
end;

function TParameters<T>.RefreshToken: String;
begin
  Result := FRefreshToken;
end;

function TParameters<T>.RefreshToken(Value: String): iParameters<T>;
begin
  Result := Self;
  FRefreshToken := Value;
end;

function TParameters<T>.ReviewId: String;
begin
  Result := FReviewId;
end;

function TParameters<T>.ReviewId(Value: String): iParameters<T>;
begin
  Result := Self;
  FReviewId := Value;
end;

function TParameters<T>.ShelfId(Value: String): iParameters<T>;
begin
  Result := Self;
  FShelfId := Value;
end;

function TParameters<T>.ShelfId: String;
begin
  Result := FShelfId;
end;

function TParameters<T>.Size(Value: String): iParameters<T>;
begin
  Result := Self;
  FSize := Value;
end;

function TParameters<T>.Size: String;
begin
  Result := FSize;
end;

function TParameters<T>.Sort(Value: TSort): iParameters<T>;
begin
  Result := Self;
  FSort := Value;
end;

function TParameters<T>.Sort: TSort;
begin
  Result := FSort;
end;

function TParameters<T>.SortBy: TSortBy;
begin
  Result := FSortBy;
end;

function TParameters<T>.SortBy(Value: TSortBy): iParameters<T>;
begin
  Result := Self;
  FSortBy := Value;
end;

function TParameters<T>.StartDate: TDateTime;
begin
  Result := FStartDate;
end;

function TParameters<T>.StartDate(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FStartDate := Value;
end;

function TParameters<T>.Status: TStatus;
begin
  Result := FStatus;
end;

function TParameters<T>.Status(Value: TStatus): iParameters<T>;
begin
  Result := Self;
  FStatus := Value;
end;

function TParameters<T>.TargetCatalogId(Value: String): iParameters<T>;
begin
  Result := Self;
  FTargetCatalogId := Value;
end;

function TParameters<T>.TargetCatalogId: String;
begin
  Result := FTargetCatalogId;
end;

function TParameters<T>.TransactionDateBegin: TDateTime;
begin
  Result := FTransactionDateBegin;
end;

function TParameters<T>.TransactionDateBegin(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FTransactionDateBegin := Value;
end;

function TParameters<T>.TransactionDateEnd: TDateTime;
begin
  Result := FTransactionDateEnd;
end;

function TParameters<T>.TransactionDateEnd(Value: TDateTime): iParameters<T>;
begin
  Result := Self;
  FTransactionDateEnd := Value;
end;

function TParameters<T>.Types: String;
begin
  Result := FTypes;
end;

function TParameters<T>.Types(Value: String): iParameters<T>;
begin
  Result := Self;
  FTypes := Value;
end;

function TParameters<T>.XPollingMerchants: String;
begin
  Result := FXPollingMerchants;
end;

function TParameters<T>.XPollingMerchants(Value: String): iParameters<T>;
begin
  Result := Self;
  FXPollingMerchants := Value;
end;

function TParameters<T>._Type: TType;
begin
  Result := F_Type
end;

function TParameters<T>._Type(Value: TType): iParameters<T>;
begin
  Result := Self;
  F_Type := Value;
end;

end.
