program Project1;

uses
  Forms,
  UnitTITvoiture in 'UnitTITvoiture.pas' {Form1TITvoiture},
  DllDecl in 'DllDecl.pas';

{$R *.RES}

begin
  Application.Initialize;
  
  Application.CreateForm(TForm1TITvoiture, Form1TITvoiture);
  Application.Run;
end.
