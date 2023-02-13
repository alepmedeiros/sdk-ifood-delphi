unit sdk.ifoof.delphi.model.entity.methods;

interface

type
  TMethods = class
  private
  public


    class function New: TMethods;
  end;

implementation

{ TMethods }

class function TMethods.New: TMethods;
begin
  Result := Self.Create;
end;

end.
