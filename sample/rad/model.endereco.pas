unit model.endereco;

interface

type
  TEndereco = class
  private
    Fdistrict: String;
    Flatitude: double;
    Fstreet: String;
    FpostalCode: String;
    Fstate: String;
    Flongitude: Double;
    Fnumber: string;
    Fcountry: String;
  public
    property country: String read Fcountry write Fcountry;
    property state: String read Fstate write Fstate;
    property postalCode: String read FpostalCode write FpostalCode;
    property district: String read Fdistrict write Fdistrict;
    property street: String read Fstreet write Fstreet;
    property number: string read Fnumber write Fnumber;
    property latitude: double read Flatitude write Flatitude;
    property longitude: Double read Flongitude write Flongitude;

    class function New: TEndereco;
  end;

implementation


class function TEndereco.New: TEndereco;
begin
  Result := Self.Create;
end;

end.
