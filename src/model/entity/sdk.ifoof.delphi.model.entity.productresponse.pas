unit sdk.ifoof.delphi.model.entity.productresponse;

interface

uses
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.converterjsonobject,
  sdk.ifoof.delphi.model.entity.sellingoption,
  sdk.ifoof.delphi.model.entity.weight,
  sdk.ifoof.delphi.model.entity.getoptiongroup;

type
  TProductResponse = class
  private
    FConverter: TConverterJSONObject<TProductResponse>;
    FId: String;
    FName: String;
    FDescription: String;
    FAdditionalInformation: String;
    FExternalCode: String;
    FImage: String;
    FServing: String;
    FDietaryRestrictions: TList<String>;
    FEan: String;
    FSellingOption: TSellingOption;
    FWeight: TWeight;
    FMultipleImages: TList<String>;
    FOptionGroups: TGetOptionGroup;
  public
    property Id: String read FId write FId;
    property Name: String read FName write FName;
    property Description: String read FDescription write FDescription;
    property AdditionalInformation: String read FAdditionalInformation
      write FAdditionalInformation;
    property ExternalCode: String read FExternalCode write FExternalCode;
    property Image: String read FImage write FImage;
    property Serving: String read FServing write FServing;
    property DietaryRestrictions: TList<String> read FDietaryRestrictions
      write FDietaryRestrictions;
    property Ean: String read FEan write FEan;
    property sellingoption: TSellingOption read FSellingOption
      write FSellingOption;
    property Weight: TWeight read FWeight write FWeight;
    property MultipleImages: TList<String> read FMultipleImages write FMultipleImages;
    property OptionGroups: TGetOptionGroup read FOptionGroups write FOptionGroups;

    constructor Create;
    destructor Destroy; override;
    class function New: TProductResponse;
    function Converter: TConverterJSONObject<TProductResponse>;
  end;

implementation

{ TProductResponse }

function TProductResponse.Converter: TConverterJSONObject<TProductResponse>;
begin
  Result := FConverter;
end;

constructor TProductResponse.Create;
begin
  FConverter := TConverterJSONObject<TProductResponse>.New(Self);
end;

destructor TProductResponse.Destroy;
begin
  FConverter.DisposeOf;
  inherited;
end;

class function TProductResponse.New: TProductResponse;
begin
  Result := Self.Create;
end;

end.
