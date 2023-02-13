unit model.message;

interface

type
  TMessage = class
  private
    Ftitle: String;
    Fsubtitle: String;
    Fdescription: String;
  public
    property title: String read Ftitle write Ftitle;
    property subtitle: String read Fsubtitle write Fsubtitle;
    property description: String read Fdescription write Fdescription;

    class function New: TMessage;
  end;

implementation

class function TMessage.New: TMessage;
begin
  Result := Self.Create;
end;

end.
