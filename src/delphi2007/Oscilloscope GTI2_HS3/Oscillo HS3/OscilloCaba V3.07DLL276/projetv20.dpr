program projetv20;

uses
  Forms,
  Principal in 'Principal.pas' {OscilloCaba},
  DllDecl in 'DllDecl.pas',
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Options},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {FormEchantillons},
  Unit6 in 'Unit6.pas' {FormRegressiTransfert};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'OscilloCaba';
  Application.CreateForm(TOscilloCaba, OscilloCaba);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TOptions, Options);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TFormEchantillons, FormEchantillons);
  Application.CreateForm(TFormRegressiTransfert, FormRegressiTransfert);
  Application.Run;
end.

