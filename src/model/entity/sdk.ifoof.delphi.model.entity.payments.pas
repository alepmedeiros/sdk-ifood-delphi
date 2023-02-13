unit sdk.ifoof.delphi.model.entity.payments;

interface

uses
  System.Generics.Collections;

type
  TPayments = class
  private
  public
    class function New: TPayments;
  end;

implementation

{ TPayments }

class function TPayments.New: TPayments;
begin
  Result := Self.Create;
end;

end.
