unit model.status;

interface

uses
  System.Generics.Collections,
  GBJSON.Interfaces,
  model.reopenable,
  model.message,
  model.validations;

type
  TStatus = class
  private
    Foperation: String;
    FsalesChannel: String;
    Favailable: Boolean;
    Fstate: String;
    Freopenable: TReopenable;
    Fvalidations: TObjectList<TValidations>;
    Fmessage: TMessage;
  public
    property operation: String read Foperation write Foperation;
    property salesChannel: String read FsalesChannel write FsalesChannel;
    property available: Boolean read Favailable write Favailable;
    property state: String read Fstate write Fstate;
    property reopenable: TReopenable read Freopenable write Freopenable;
    property validations: TObjectList<TValidations> read Fvalidations
      write Fvalidations;
    [JSONProp('message')]
    property &message: TMessage read Fmessage write Fmessage;

    constructor Create;
    destructor Destroy; override;
    class function New: TStatus;
    function ToList(Value: String): TObjectList<TStatus>;
    function ToObject(Value: String): TStatus;
  end;

implementation

constructor TStatus.Create;
begin
  Freopenable := TReopenable.New;
  Fvalidations:= TObjectList<TValidations>.Create;
end;

destructor TStatus.Destroy;
begin
  Freopenable.DisposeOf;
  Fvalidations.DisposeOf;
  inherited;
end;

class function TStatus.New: TStatus;
begin
  Result := Self.Create;
end;

function TStatus.ToList(Value: String): TObjectList<TStatus>;
begin
  Result := TGBJSONDefault.Serializer<TStatus>.JsonStringToList(Value);
end;

function TStatus.ToObject(Value: String): TStatus;
begin
  Result := TGBJSONDefault.Serializer<TStatus>.JsonStringToObject(Value);
end;

end.
