unit sdk.ifoof.delphi.model.entity.operation;

interface

type
  TOpertaion = class
  private
    FName: String;
  public
    property Name: String read FName write FName;

    class function New: TOpertaion;
  end;

implementation

{ TOpertaion }

class function TOpertaion.New: TOpertaion;
begin
  Result := Self.Create;
end;

end.
