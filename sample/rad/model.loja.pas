unit model.loja;

interface

uses
  System.Generics.Collections,
  GBJSON.Attributes,
  GBJSON.Interfaces,
  model.endereco,
  model.operacao;

type
  TLoja = class
  private
    FaverageTicket: Double;
    FName: String;
    Fexclusive: Boolean;
    FCorporateName: String;
    FId: string;
    Fstatus: String;
    Fdescription: String;
    FcreatedAt: TDateTime;
    Ftype: String;
    Faddress: TEndereco;
    Foperations: TObjectList<TOperacao>;
  public
    property id: string read FId write FId;
    property name: String read FName write FName;
    property corporateName: String read FCorporateName write FCorporateName;
    property description: String read Fdescription write Fdescription;
    property averageTicket: Double read FaverageTicket write FaverageTicket;
    property exclusive: Boolean read Fexclusive write Fexclusive;
    [JSONProp('type')]
    property &type: String read Ftype write Ftype;
    property status: String read Fstatus write Fstatus;
    property createdAt: TDateTime read FcreatedAt write FcreatedAt;
    property address: TEndereco read Faddress write Faddress;
    property operations: TObjectList<TOperacao> read Foperations write Foperations;

    constructor Create;
    destructor Destroy; override;
    class function New: TLoja;
    function ToList(Value: String): TObjectList<TLoja>;
    function ToObject(Value: String): TLoja;
  end;

implementation

constructor TLoja.Create;
begin
  Faddress:= TEndereco.New;
  Foperations:= TObjectList<TOperacao>.Create;
end;

destructor TLoja.Destroy;
begin
  Faddress.DisposeOf;
  Foperations.DisposeOf;
  inherited;
end;

class function TLoja.New: TLoja;
begin
  Result := Self.Create;
end;

function TLoja.ToList(Value: String): TObjectList<TLoja>;
begin
//  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLowerCamelCase);
  Result := TGBJSONDefault.Serializer<TLoja>.JsonStringToList(Value);
end;

function TLoja.ToObject(Value: String): TLoja;
begin
//  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Serializer<TLoja>.JsonStringToObject(Value);
end;

end.
