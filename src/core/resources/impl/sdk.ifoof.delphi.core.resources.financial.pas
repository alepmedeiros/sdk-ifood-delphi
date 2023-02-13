unit sdk.ifoof.delphi.core.resources.financial;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.conciliation;

type
  TFinancial = class(TInterfacedObject, iFinancial)
  private
    FConciliation: iConciliation;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFinancial;
    function Conciliation: iConciliation;
    function &End: iFinancial;
  end;

implementation

{ TMyClass }

function TFinancial.Conciliation: iConciliation;
begin
  if not Assigned(FConciliation) then
    FConciliation := TConciliation.New(Self);
  Result := FConciliation;
end;

function TFinancial.&End: iFinancial;
begin
  Result := Self;
end;

constructor TFinancial.Create;
begin

end;

destructor TFinancial.Destroy;
begin

  inherited;
end;

class function TFinancial.New: iFinancial;
begin
  Result := Self.Create;
end;

end.
