unit sdk.ifoof.delphi.model.entity.patchstatusitem;

interface

uses
  sdk.ifoof.delphi.model.entity.converterjsonobject;

type
  TPatchStatusItem = class
  private
    FConverter: TConverterJSONObject<TPatchStatusItem>;
    FStratus: String;
  public
    property Stratus: String read FStratus write FStratus;

    constructor Create;
    destructor Destroy; override;
    class function New: TPatchStatusItem;
    function Converter: TConverterJSONObject<TPatchStatusItem>;
  end;

implementation

{ TPatchStatusItem }

function TPatchStatusItem.Converter: TConverterJSONObject<TPatchStatusItem>;
begin
  Result := FConverter;
end;

constructor TPatchStatusItem.Create;
begin
  FConverter:= TConverterJSONObject<TPatchStatusItem>.New(Self);
end;

destructor TPatchStatusItem.Destroy;
begin

  inherited;
end;

class function TPatchStatusItem.New: TPatchStatusItem;
begin
  Result := Self.Create;
end;

end.
