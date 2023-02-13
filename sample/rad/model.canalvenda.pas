unit model.canalvenda;

interface

type
  TCanalVenda = class
  private
    Fname: String;
    Fenabled: Boolean;
  public
    property name: String read Fname write Fname;
    property enabled: Boolean read Fenabled write Fenabled;

    class function New: TCanalVenda;
  end;

implementation


class function TCanalVenda.New: TCanalVenda;
begin
  Result := Self.Create;
end;

end.
