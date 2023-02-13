program IfoodRAD;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  model.enums in 'model.enums.pas',
  model.conveter in 'model.conveter.pas',
  model.token in 'model.token.pas',
  model.loja in 'model.loja.pas',
  model.endereco in 'model.endereco.pas',
  model.operacao in 'model.operacao.pas',
  model.canalvenda in 'model.canalvenda.pas',
  model.codigousuario in 'model.codigousuario.pas',
  model.status in 'model.status.pas',
  model.reopenable in 'model.reopenable.pas',
  model.validations in 'model.validations.pas',
  model.message in 'model.message.pas',
  model.interrupcao in 'model.interrupcao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
