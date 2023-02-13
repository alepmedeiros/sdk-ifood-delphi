unit sdk.ifoof.delphi.model.entity.itemsllingoption;

interface

uses
  System.Generics.Collections;

type
  TItemSellingOption = class
  private
    FMinimum: Double;
    FIncremental: Double;
    FAvailableUnits: TList<String>;
  public
    property Minimum: Double read FMinimum write FMinimum;
    property Incremental: Double read FIncremental write FIncremental;
    property AvailableUnits: TList<String> read FAvailableUnits write FAvailableUnits;

    class function New: TItemSellingOption;
  end;

implementation

{ TItemSellingOption }

class function TItemSellingOption.New: TItemSellingOption;
begin
  Result := Self.Create;
end;

end.
