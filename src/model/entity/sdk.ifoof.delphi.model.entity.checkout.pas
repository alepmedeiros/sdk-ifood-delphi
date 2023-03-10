unit sdk.ifoof.delphi.model.entity.checkout;

interface

uses
  System.Generics.Collections,
  GBJSON.Attributes,
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TPhone = class
  private
    FCountryCode: String;
    FAreaCode: String;
    FNumber: String;
  public
    property CountryCode: String read FCountryCode write FCountryCode;
    property AreaCode: String read FAreaCode write FAreaCode;
    property Number: String read FNumber write FNumber;

    class function New: TPhone;
  end;

  TCoordinates = class
  private
    Flatitude: Double;
    FLongitude: Double;
  public
    property Latitude: Double read Flatitude write Flatitude;
    property Longitude: Double read FLongitude write FLongitude;

    class function New: TCoordinates;
  end;

  TDeliveryAddress = class
  private
    FPostalCode: String;
    FStreetNumber: String;
    FStreetName: String;
    FComplement: String;
    FNeighborhood: String;
    FCity: String;
    FReference: String;
    FCoordinates: TCoordinates;
  public
    property PostalCode: String read FPostalCode write FPostalCode;
    property StreetNumber: String read FStreetNumber write FStreetNumber;
    property StreetName: String read FStreetName write FStreetName;
    property Complement: String read FComplement write FComplement;
    property Neighborhood: String read FNeighborhood write FNeighborhood;
    property City: String read FCity write FCity;
    property Reference: String read FReference write FReference;
    property Coordinates: TCoordinates read FCoordinates write FCoordinates;

    class function New: TDeliveryAddress;
  end;

  TOptions = class
  private
    FId: String;
    FName: String;
    FExternalCode: String;
    FIndex: Integer;
    FQuantity: Integer;
    FUnitPrice: Double;
    FPrice: Double;
  public
    property Id: String read FId write FId;
    property Name: String read FName write FName;
    property ExternalCode: String read FExternalCode write FExternalCode;
    [JSONProp('index')]
    property &Index: Integer read FIndex write FIndex;
    property Quantity: Integer read FQuantity write FQuantity;
    property UnitPrice: Double read FUnitPrice write FUnitPrice;
    property Price: Double read FPrice write FPrice;

    class function New: TOptions;
  end;

  TItems = class
  private
    FId: String;
    FName: String;
    FExternalCode: String;
    FQuantity: Integer;
    FUnitPrice: Double;
    FPrice: Double;
    FOptionsPrice: Double;
    FTotalPrice: Double;
  public
    property Id: String read FId write FId;
    property Name: String read FName write FName; 
    property ExternalCode: String read FExternalCode write FExternalCode;
    property Quantity: Integer read FQuantity write FQuantity;
    property UnitPrice	: Double read FUnitPrice	 write FUnitPrice	;
    property Price: Double read FPrice write FPrice;
    property OptionsPrice: Double read FOptionsPrice write FOptionsPrice;
    property TotalPrice: Double read FTotalPrice write FTotalPrice;

    class function New: TItems;
  end;

  TCard = class
  private
    FBrand: String;
  public
    property Brand: String read FBrand write FBrand;
    
    class function New: TCard;
  end;
  
  TMethodsPayment = class
  private
    FMethod: String;
    FType: String;
    FValue: String;
    FCard: TCard;
  public
    property Method: String read FMethod write FMethod;
    [JSONProp('type')]
    property &Type: String read FType write FType;
    property Value: String read FValue write FValue;
    property Card: TCard read FCard write FCard;
    
    class function New: TMethodsPayment;
  end;
  
  TPayments = class
  private
    FMethods: TObjectList<TMethodsPayment>;
  public
    property Methods: TObjectList<TMethodsPayment> read FMethods write FMethods;
    
    class function New: TPayments;
  end;

  TMetadata = class
  private
    FDescription: String;
  public
    property Description: String read FDescription write FDescription;
    class function New: TMetadata;
  end;
  
  TDelivery = class
  private
    FMerchantFee: Double;
    FDeliveryAddress: TDeliveryAddress;
  public
    property MerchantFee: Double read FMerchantFee write FMerchantFee;
    property DeliveryAddress: TDeliveryAddress read FDeliveryAddress write FDeliveryAddress;

    class function New: TDelivery;
  end;

  TCustomer = class
  private
    FName: String;
    FPhone: TPhone;
  public
    property Name: String read FName write FName; 
    property Phone: TPhone read FPhone write FPhone;

    class function New: TCustomer;
  end;

  TRespCheckout = class
  private
    FConverter: TConverterJSONObject<TRespCheckout>;
    FCustomer: TCustomer;
    FDelivery: TDelivery;
    FItems: TObjectList<TItems>;
    FPayments: TPayments;
    FMetadata: TMetadata;
  public
    property Customer: TCustomer read FCustomer write FCustomer;
    property Delivery: TDelivery read FDelivery write FDelivery;
    property Items: TObjectList<TItems> read FItems write FItems;
    property Payments: TPayments read FPayments write FPayments;
    property Metadata: TMetadata read FMetadata write FMetadata;
    
    constructor Create;
    destructor Destroy; override;
    class function New: TRespCheckout;
    function Converter: TConverterJSONObject<TRespCheckout>;
  end;

implementation

{ TRespCheckout }

function TRespCheckout.Converter: TConverterJSONObject<TRespCheckout>;
begin
  Result := FCOnverter;
end;

constructor TRespCheckout.Create;
begin
  FConverter:= TConverterJSONObject<TRespCheckout>.New(Self);
end;

destructor TRespCheckout.Destroy;
begin

  inherited;
end;

class function TRespCheckout.New: TRespCheckout;
begin
  Result := Self.Create;
end;

{ TCustomer }

class function TCustomer.New: TCustomer;
begin
  Result := Self.Create;
end;

{ TPhone }

class function TPhone.New: TPhone;
begin
  Result := Self.Create;
end;

{ TDelivery }

class function TDelivery.New: TDelivery;
begin
  Result := Self.Create;
end;

{ TDeliveryAddress }

class function TDeliveryAddress.New: TDeliveryAddress;
begin
  Result := Self.Create;
end;

{ TCoordinates }

class function TCoordinates.New: TCoordinates;
begin
  Result := Self.Create;
end;

{ TItems }

class function TItems.New: TItems;
begin
  Result := Self.Create;
end;

{ TOptions }

class function TOptions.New: TOptions;
begin
  Result := Self.Create;
end;

{ TPayments }

class function TPayments.New: TPayments;
begin
  Result := Self.Create;
end;

{ TMethodsPayment }

class function TMethodsPayment.New: TMethodsPayment;
begin
  Result := Self.Create;
end;

{ TCard }

class function TCard.New: TCard;
begin
  Result := Self.Create;
end;

{ TMetadata }

class function TMetadata.New: TMetadata;
begin
  Result := Self.Create;
end;

end.
