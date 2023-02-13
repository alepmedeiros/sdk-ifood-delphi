unit sdk.ifoof.delphi.model.entity.responsecheckout;

interface

type
  TResponseCheckout = class
  private
    FId: String;
    FTrackingUrl: String;
  public
    property Id: String read FId write FId;
    property TrackingUrl: String read FTrackingUrl write FTrackingUrl;

    class function New: TResponseCheckout;
  end;

implementation

{ TResponseCheckout }

class function TResponseCheckout.New: TResponseCheckout;
begin
  Result := Self.Create;
end;

end.
