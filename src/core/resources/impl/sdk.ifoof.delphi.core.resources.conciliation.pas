unit sdk.ifoof.delphi.core.resources.conciliation;

interface

uses
  sdk.ifoof.delphi.core.resources.interfaces,
  sdk.ifoof.delphi.core.resources.parameters;

type
  TConciliation = class(TInterfacedObject, iConciliation)
  private
    FFinancial: iFinancial;
    FParameters: iParameters<iConciliation>;
  public
    constructor Create(Financial: iFinancial);
    destructor Destroy; override;
    class function New(Financial: iFinancial): iConciliation;
    function GetSalesByMerchant: iConciliation;
    function GetSalesAdjustmentsByMerchant: iConciliation;
    function GetPaymentsInfo: iConciliation;
    function GetPaymentDetails: iConciliation;
    function GetOccurrences: iConciliation;
    function GetMaintenanceFees: iConciliation;
    function GetIncomeTaxes: iConciliation;
    function GetPeriodsInfo: iConciliation;
    function GetChargeCancellations: iConciliation;
    function GetCancellations: iConciliation;
    function GetReceivableRecordsInfo: iConciliation;
    function GetSalesIfoodBenefitsByMerchant: iConciliation;
    function GetAdjustmentsIfoodNenefitsByMerchant: iConciliation;
    function Parameters: iParameters<iConciliation>;
    function &End: iFinancial;
  end;

implementation

{ TMyClass }

function TConciliation.&End: iFinancial;
begin
  Result := FFinancial;
end;

constructor TConciliation.Create(Financial: iFinancial);
begin
  FFinancial := Financial;
end;

destructor TConciliation.Destroy;
begin

  inherited;
end;

function TConciliation.GetAdjustmentsIfoodNenefitsByMerchant: iConciliation;
begin
  Result := Self;
end;

function TConciliation.GetCancellations: iConciliation;
begin
  Result := Self;
end;

function TConciliation.GetChargeCancellations: iConciliation;
begin
  Result := Self;
end;

function TConciliation.GetIncomeTaxes: iConciliation;
begin
  Result := Self;
end;

function TConciliation.GetMaintenanceFees: iConciliation;
begin
  Result := Self;
end;

function TConciliation.GetOccurrences: iConciliation;
begin
  Result := Self;
end;

function TConciliation.GetPaymentDetails: iConciliation;
begin
  Result := Self;
end;

function TConciliation.GetPaymentsInfo: iConciliation;
begin
  Result := Self;
end;

function TConciliation.GetPeriodsInfo: iConciliation;
begin
  Result := Self;
end;

function TConciliation.GetReceivableRecordsInfo: iConciliation;
begin
  Result := Self;
end;

function TConciliation.GetSalesAdjustmentsByMerchant: iConciliation;
begin
  Result := Self;
end;

function TConciliation.GetSalesByMerchant: iConciliation;
begin
  Result := Self;
end;

function TConciliation.GetSalesIfoodBenefitsByMerchant: iConciliation;
begin
  Result := Self;
end;

class function TConciliation.New(Financial: iFinancial): iConciliation;
begin
  Result := Self.Create(Financial);
end;

function TConciliation.Parameters: iParameters<iConciliation>;
begin
  if not Assigned(FParameters) then
    FParameters:= TParameters<iConciliation>.New(Self);
  Result := FParameters;
end;

end.
