unit sdk.ifoof.delphi.model.entity.shifts;

interface

type
  TShifts = class
  private
    FStartTime: String;
    FEndTime: String;
    FMonday: Boolean;
    FTuesday: Boolean;
    FWednesday: Boolean;
    FThursday: Boolean;
    FFriday: Boolean;
    FSaturday: Boolean;
    FSunday: Boolean;
  public
    property StartTime: String read FStartTime write FStartTime;
    property EndTime: String read FEndTime write FEndTime;
    property Monday: Boolean read FMonday write FMonday;
    property Tuesday: Boolean read FTuesday write FTuesday;
    property Wednesday: Boolean read FWednesday write FWednesday;
    property Thursday: Boolean read FThursday write FThursday;
    property Friday: Boolean read FFriday write FFriday;
    property Saturday: Boolean read FSaturday write FSaturday;
    property Sunday: Boolean read FSunday write FSunday;

    class function New: TShifts;
  end;

implementation

{ TShifts }

class function TShifts.New: TShifts;
begin
  Result := Self.Create;
end;

end.
