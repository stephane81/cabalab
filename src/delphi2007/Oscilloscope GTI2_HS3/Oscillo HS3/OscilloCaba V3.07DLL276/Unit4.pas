unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,dlldecl;

type
  TForm4 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Button6: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Déclarations privées}
  public
    { Déclarations publiques}
  end;

var
  Form4: TForm4;
  frequence:double;
implementation

{$R *.DFM}







procedure TForm4.Button1Click(Sender: TObject);
begin
     frequence:=50;
     SetFuncGenSignalType ( 0 ) ; // mode sinus
     SetFuncGenOutputOn ( 1 ) ; // allumer le gené
     SetFuncGenFrequency  ( @frequence );
     getFuncGenFrequency  ( @frequence );
     SetFuncGenAmplitude (10);
     SetFuncGenSymmetry ( 50 );
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
     frequence:=100000;
     SetFuncGenSignalType ( 0 ) ; // mode sinus
     SetFuncGenOutputOn ( 1 ) ; // allumer le gené
     SetFuncGenFrequency  ( @frequence );
     getFuncGenFrequency  ( @frequence );
     SetFuncGenAmplitude (10);
     SetFuncGenSymmetry ( 50 );
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
     frequence:=500;
     SetFuncGenSignalType ( 2 ) ; // mode rectangle
     SetFuncGenOutputOn ( 1 ) ; // allumer le gené
     SetFuncGenFrequency  ( @frequence );
     getFuncGenFrequency  ( @frequence );
     SetFuncGenAmplitude (5);
     SetFuncGenSymmetry ( 50 );
end;

procedure TForm4.Button4Click(Sender: TObject);
var
index : dword;
wamp2  : word;

//fre   : double;
wamp1:array[0..131071] of word;
NrSamples : dword;
erreur:word;
begin
    NrSamples := 131072;


    for index:=0 to 131071 do
       begin
            if sin(index*(2*pi/(131071/30)))>0 then
            wamp1[index]:=1
            else
            wamp1[index]:=0;
       end;



    for index := 0 to 131071 do
    begin
        { k:=k+1;
         for i:=0 to trunc(131072/10) do
         if index<trunc(k*131072/20) then
         wamp1:=1
         else
         wamp1:=0;   }



    wamp2:=trunc(32767 + wamp1[index]*( 32767 * sin(index*(2*pi/(131071/5242.8))) ) )  ;
    FuncGenArray[index] := Wamp2;
    end;



     erreur:=SetFuncGenSignalType ( 5 ) ;
   // showmessage(floattostr(erreur));

    erreur:=fillfuncgenmemory(NrSamples,   @FuncGenArray);
   // showmessage(floattostr(erreur));
    erreur:=SetFuncGenSignalType ( 5 ) ;
   // showmessage(floattostr(erreur));
    frequence := 2500000;
   erreur:=SetFuncGenFrequency ( @frequence );
  //  showmessage(floattostr(erreur));
    SetFuncGenSymmetry ( 50 );
     SetFuncGenAmplitude (2);

end;

procedure TForm4.Button5Click(Sender: TObject);
var
index : dword;
wamp2  : word;

//fre   : double;
wamp1:array[0..131071] of word;
NrSamples : dword;
erreur:word;
begin
    NrSamples := 131072;


    for index:=0 to 131071 do
       begin
            if sin(index*(2*pi/(131071/30)))>0 then
            wamp1[index]:=1
            else
            wamp1[index]:=0;
       end;



    for index := 0 to 131071 do
    begin
        { k:=k+1;
         for i:=0 to trunc(131072/10) do
         if index<trunc(k*131072/20) then
         wamp1:=1
         else
         wamp1:=0;   }



    wamp2:=trunc(32767 + wamp1[index]*( 2500 * sin( index * (2*pi/(131071/5242.8))))  +   30000 * sin( index * (2*pi/(131071/3))) );
    FuncGenArray[index] := Wamp2;
    end;



     erreur:=SetFuncGenSignalType ( 5 ) ;
   // showmessage(floattostr(erreur));

    erreur:=fillfuncgenmemory(NrSamples,   @FuncGenArray);
   // showmessage(floattostr(erreur));
    erreur:=SetFuncGenSignalType ( 5 ) ;
   // showmessage(floattostr(erreur));
    frequence := 2500000;
   erreur:=SetFuncGenFrequency ( @frequence );
   // showmessage(floattostr(erreur));
    SetFuncGenSymmetry ( 50 );

     SetFuncGenAmplitude (10);
end;



procedure TForm4.Button6Click(Sender: TObject);


var
index : dword;
wamp2  : word;

//fre   : double;
wamp1:array[0..131071] of word;
NrSamples : dword;
erreur:word;
begin
    NrSamples := 131072;


    for index:=0 to 131071 do
       begin
            if sin(index*(2*pi/(131071/30)))>0 then
            wamp1[index]:=1
            else
            wamp1[index]:=0;
       end;



    for index := 0 to 131071 do
    begin
        { k:=k+1;
         for i:=0 to trunc(131072/10) do
         if index<trunc(k*131072/20) then
         wamp1:=1
         else
         wamp1:=0;   }



    wamp2:=trunc(32767 + wamp1[index]*( 1500 * sin( index * (2*pi/(131071/5242.8))))  +   25000 * sin( index * (2*pi/(131071/3)))+ 1500*sin(index*2*pi/(131071/1003))+ 1500*sin(index*2*pi/(131071/2004))+ 1500*sin(index*2*pi/(131071/1505)));
    FuncGenArray[index] := Wamp2;
    end;



     erreur:=SetFuncGenSignalType ( 5 ) ;
   // showmessage(floattostr(erreur));

    erreur:=fillfuncgenmemory(NrSamples,   @FuncGenArray);
    //showmessage(floattostr(erreur));
    erreur:=SetFuncGenSignalType ( 5 ) ;
   // showmessage(floattostr(erreur));
    frequence := 2500000;
   erreur:=SetFuncGenFrequency ( @frequence );
   // showmessage(floattostr(erreur));
    SetFuncGenSymmetry ( 50 );
     SetFuncGenAmplitude (10);

end;




end.
 