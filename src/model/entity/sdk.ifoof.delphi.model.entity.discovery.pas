unit sdk.ifoof.delphi.model.entity.discovery;

interface

uses
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TQuote = class
  private
    FGrossValue: Double;
    FDiscount: Double;
    FNetValue: Double;
  public
    property GrossValue: Double read FGrossValue write FGrossValue;
    property Discount: Double read FDiscount write FDiscount;
    property NetValue: Double read FNetValue write FNetValue;

    class function New: TQuote;
  end;

  TDeliveryTime = class
  private
    FMin: Double;
    FMax: Double;
  public
    property Min: Double read FMin write FMin;
    property Max: Double read FMax write FMax;

    class function New: TDeliveryTime;
  end;

  TPaymentMethod = class
  private
    FId: String;
    FBrand: String;
    FLiability: String;
    FPaymentType: String;
    FMethod: String;
  public
    property Id: String read FId write FId;
    property Brand: String read FBrand write FBrand;
    property Liability: String read FLiability write FLiability;
    property PaymentType: String read FPaymentType write FPaymentType;
    property Method: String read FMethod write FMethod;

    class function New: TPaymentMethod;
  end;

  TRespDiscovery = class
  private
    FConverter: TConverterJSONObject<TRespDiscovery>;
    FQuote: TQuote;
    FDeliveryTime: TDeliveryTime;
    FDistance: Integer;
    FHasPaymentMethods: Boolean;
    FPaymentMethods: TObjectList<TPaymentMethod>;
  public
    property Quote: TQuote read FQuote write FQuote;
    property DeliveryTime: TDeliveryTime read FDeliveryTime write FDeliveryTime;
    property Distance: Integer read FDistance write FDistance;
    property HasPaymentMethods: Boolean read FHasPaymentMethods write FHasPaymentMethods;
    property PaymentMethods: TObjectList<TPaymentMethod> read FPaymentMethods write FPaymentMethods;

    constructor Create;
    destructor Destroy; override;
    class function New: TRespDiscovery;
    function Converter: TConverterJSONObject<TRespDiscovery>;
  end;

implementation

{ TRespDiscovery }

function TRespDiscovery.Converter: TConverterJSONObject<TRespDiscovery>;
begin
  Result := FConverter;
end;

constructor TRespDiscovery.Create;
begin
  FDeliveryTime:= TDeliveryTime.New;
  FPaymentMethods:= TObjectList<TPaymentMethod>.Create;
  FConverter:= TConverterJSONObject<TRespDiscovery>.New(Self);
end;

destructor TRespDiscovery.Destroy;
begin
  FConverter.DisposeOf;
  FDeliveryTime.DisposeOf;
  FPaymentMethods.DisposeOf;
  inherited;
end;

class function TRespDiscovery.New: TRespDiscovery;
begin
  Result := Self.Create;
end;

{ TQuote }

class function TQuote.New: TQuote;
begin
  Result := Self.Create;
end;

{ TDeliveryTime }

class function TDeliveryTime.New: TDeliveryTime;
begin
  Result := Self.Create;
end;

{ TPaymentMethod }

class function TPaymentMethod.New: TPaymentMethod;
begin
  Result := Self.Create;
end;

end.
