unit sdk.ifoof.delphi.model.entity.weight;

interface

uses
  System.Generics.Collections;

type
  TWeight = class
  private
    FQuantity: Integer;
    FUnit: TList<String>;
  public
    property Quantity: Integer read FQuantity write FQuantity;
    [JSONProp('unit')]
    property &Unit: TList<String> read FUnit write FUnit;

    constructor Create;
    destructor Destroy; override;
    class function New: TWeight;
  end;

implementation

{ TClassPadrao }

constructor TWeight.Create;
begin

end;

destructor TWeight.Destroy;
begin

  inherited;
end;

class function TWeight.New: TWeight;
begin
  Result := Self.Create;
end;

end.
