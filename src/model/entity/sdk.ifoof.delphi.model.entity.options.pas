unit sdk.ifoof.delphi.model.entity.options;

interface

uses
  System.Generics.Collections;

type
  TOptions = class
  private
    FOptionId: String;
    FName: String;
    FExternalCode: String;
    FDescription: String;
    FLogosUrls: TList<String>;
    FPackaging: String;
    FQuantity: Double;
    FUnit: String;
  public
    property OptionId: String read FOptionId write FOptionId;
    property Name: String read FName write FName;
    property ExternalCode: String read FExternalCode write FExternalCode;
    property Description: String read FDescription write FDescription;
    property LogosUrls: TList<String> read FLogosUrls write FLogosUrls;
    property Packaging: String read FPackaging write FPackaging;
    property Quantity: Double read FQuantity write FQuantity;
    [JSONProp('unit')]
    property &Unit: String read FUnit write FUnit;


    class function New: TOptions;
  end;

implementation

{ TOptions }

class function TOptions.New: TOptions;
begin
  Result := Self.Create;
end;

end.
