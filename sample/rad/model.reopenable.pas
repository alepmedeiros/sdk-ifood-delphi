unit model.reopenable;

interface

uses
  GBJSON.Attributes;

type
  TReopenable = class
  private
    Fidentifier: String;
    FType: String;
    Freopenable: Boolean;
  public
    property identifier: String read Fidentifier write Fidentifier;
    [JSONProp('type')]
    property &type: String read Ftype write Ftype;
    property reopenable: Boolean read Freopenable write Freopenable;

    class function New: TReopenable;
  end;

implementation

class function TReopenable.New: TReopenable;
begin
  Result := Self.Create;
end;

end.
