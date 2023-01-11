unit sdkifoodtest;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TIfoodTest = class
  private
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
  end;

implementation

procedure TIfoodTest.Setup;
begin
end;

procedure TIfoodTest.TearDown;
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TIfoodTest);

end.
