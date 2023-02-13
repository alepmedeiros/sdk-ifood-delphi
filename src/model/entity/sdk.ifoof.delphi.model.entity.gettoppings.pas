unit sdk.ifoof.delphi.model.entity.gettoppings;

interface

uses
  System.Generics.Collections,
  GBJSON.Attributes,
  sdk.ifoof.delphi.model.entity.pizzaprice;

type
  TGetToppings = class
  private
    FId: String;
    FExternalCode: String;
    FName: String;
    FDescription: String;
    FImagePath: String;
    FStatus: String;
    FDietaryRestrictions: TList<String>;
    FIndex: Integer;
    FPrice: TPizzaPrice;
  public
    property Id: String read FId write FId;
    property ExternalCode: String read FExternalCode write FExternalCode;
    property Name: String read FName write FName;
    property Description: String read FDescription write FDescription;
    property ImagePath: String read FImagePath write FImagePath;
    property Status: String read FStatus write FStatus;
    property DietaryRestrictions: TList<String> read FDietaryRestrictions
      write FDietaryRestrictions;
    [JSONProp('index')]
    property &Index: Integer read FIndex write FIndex;
    property Price: TPizzaPrice read FPrice write FPrice;

    constructor Create;
    destructor Destroy; override;
    class function New: TGetToppings;
  end;

implementation

{ TGetToppings }

constructor TGetToppings.Create;
begin
  FPrice:= TPizzaPrice.New;
end;

destructor TGetToppings.Destroy;
begin

  inherited;
end;

class function TGetToppings.New: TGetToppings;
begin

end;

end.
