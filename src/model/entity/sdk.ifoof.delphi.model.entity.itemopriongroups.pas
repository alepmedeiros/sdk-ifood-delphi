unit sdk.ifoof.delphi.model.entity.itemopriongroups;

interface

type
  TItemOptionGroups = class
  private
    FOptionGroupId: String;
    FName: String;
    FMinQuantity: Double;
    FMaxQuantity: Double;
    FOptionGroupIndex: Double;
  public
    property OptionGroupId: String read FOptionGroupId write FOptionGroupId;
    property Name: String read FName write FName;
    property MinQuantity: Double read FMinQuantity write FMinQuantity;
    property MaxQuantity: Double read FMaxQuantity write FMaxQuantity;
    property OptionGroupIndex: Double read FOptionGroupIndex write FOptionGroupIndex;

    class function New: TItemOptionGroups;
  end;

implementation

{ TItemOptionGroups }

class function TItemOptionGroups.New: TItemOptionGroups;
begin
  Result := Self.Create;
end;

end.
