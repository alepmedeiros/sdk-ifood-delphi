unit model.validations;

interface

uses
  GBJSON.Attributes,
  model.message;

type
  TValidations = class
  private
    Fid: String;
    Fcode: String;
    Fstate: String;
    Fmessage: TMessage;
  public
    property id: String read Fid write Fid;
    property code: String read Fcode write Fcode;
    property state: String read Fstate write Fstate;
    [JSONProp('message')]
    property &message: TMessage read Fmessage write Fmessage;

    constructor Create;
    destructor Destroy; override;
    class function New: TValidations;
  end;

implementation

constructor TValidations.Create;
begin
  Fmessage := TMessage.New;
end;

destructor TValidations.Destroy;
begin
  Fmessage.Disposeof;
  inherited;
end;

class function TValidations.New: TValidations;
begin
  Result := Self.Create;
end;

end.
