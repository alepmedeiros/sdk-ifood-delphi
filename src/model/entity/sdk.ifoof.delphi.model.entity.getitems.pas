unit sdk.ifoof.delphi.model.entity.getitems;

interface

uses
  System.Generics.Collections,
  sdk.ifoof.delphi.model.entity.price,
  sdk.ifoof.delphi.model.entity.shifts;

type
  TGetItems = class
  private
    FId: String;
    FName: String;
    FDescription: String;
    FAdditionalInformation: String;
    FExternalCode: String;
    FStatus: String;
    FProductId: String;
    FIndex: Integer;
    FImagePath: String;
    FPrice: TPrice;
    FShifts: TObjectList<TShifts>;
    FServing: String;
    FDietaryRestrictions: TList<String>;
    FEan: String;
  public
    property Id: String read FId write FId;
    property Name: String read FName write FName;
    property Description: String read FDescription write FDescription;
    property AdditionalInformation: String read FAdditionalInformation write FAdditionalInformation;
    property ExternalCode: String read FExternalCode write FExternalCode;
    property Status: String read FStatus write FStatus;
    property ProductId: String read FProductId write FProductId;
    [JSONProp('index')]
    property &Index: Integer read FIndex write FIndex;
    property ImagePath: String read FImagePath write FImagePath;
    property Price: TPrice read FPrice write FPrice;
    property Shifts: TObjectList<TShifts> read FShifts write FShifts;
    property Serving: String read FServing write FServing;
    property DietaryRestrictions: TList<String> read FDietaryRestrictions write FDietaryRestrictions;
    property Ean: String read FEan write FEan;

    class function New: TGetItems;
  end;

implementation

{ TGetItems }

class function TGetItems.New: TGetItems;
begin
  Result := Self.Create;
end;

end.
