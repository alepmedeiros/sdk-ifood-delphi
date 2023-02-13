unit sdk.ifoof.delphi.model.entity.itemschedules;

interface

type
  TItemSchedules = class
  private
  public
    class function New: TItemSchedules;
  end;

implementation

{ TItemSchedules }

class function TItemSchedules.New: TItemSchedules;
begin
  Result := Self.Create;
end;

end.
