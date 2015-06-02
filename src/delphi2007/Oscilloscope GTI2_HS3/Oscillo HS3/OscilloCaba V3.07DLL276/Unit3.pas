unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,dlldecl, Buttons, ExtCtrls, ComCtrls, Menus;

type
TWArray2 = array [0..131092] of word;

type GBFE = record
  signal         :integer;
  Frequence      :double;
  coef_freq      :double;
  amplitude      :double;
  coef_amplitude :double;
  offset         :double;
  Symmetry       :double;
end;


type
  TForm3 = class(TForm)
    Memo1: TMemo;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheetGBF: TTabSheet;
    TabSheetParam: TTabSheet;
    TabSheetAMFM: TTabSheet;
    Label1: TLabel;
    Label9: TLabel;
    GBFON: TButton;
    GroupBox1: TGroupBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    ScrollBar1: TScrollBar;
    signalBox: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DC: TSpeedButton;
    Label5: TLabel;
    bruit: TSpeedButton;
    fichier: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    TTL: TSpeedButton;
    Label10: TLabel;
    GroupBox3: TGroupBox;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    ScrollBar2: TScrollBar;
    GroupBox4: TGroupBox;
    ScrollBar3: TScrollBar;
    Button3: TButton;
    GroupBox5: TGroupBox;
    ScrollBar4: TScrollBar;
    Button1: TButton;
    GroupBox7: TGroupBox;
    LabelAmplitude: TLabel;
    LabelOffset: TLabel;
    LabelSymmetry: TLabel;
    ButtonAmplitude: TButton;
    ButtonOffset: TButton;
    ButtonSymmetry: TButton;
    EditReglages: TEdit;
    memBox: TGroupBox;
    SpeedButton15: TSpeedButton;
    Label11: TLabel;
    SpeedButton16: TSpeedButton;
    Label12: TLabel;
    SpeedButton17: TSpeedButton;
    Label13: TLabel;
    SpeedButton18: TSpeedButton;
    Label14: TLabel;
    SpeedButton19: TSpeedButton;
    Label15: TLabel;
    SpeedButton20: TSpeedButton;
    Label23: TLabel;
    GroupBox6: TGroupBox;
    Label24: TLabel;
    ScrollBar8: TScrollBar;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    ScrollBar6: TScrollBar;
    FreqPortBox: TGroupBox;
    Label17: TLabel;
    Label16: TLabel;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    ScrollBar5: TScrollBar;
    VminModBOX: TGroupBox;
    ScrollBar7: TScrollBar;
    TabSheetNum: TTabSheet;
    MainMenu1: TMainMenu;
    Options1: TMenuItem;
    ControleParam: TMenuItem;
    ModulationAMFM: TMenuItem;
    ModulationNum: TMenuItem;
    ButtonFreq: TButton;
    GroupBox8: TGroupBox;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    SpeedButton31: TSpeedButton;
    Label32: TLabel;
    LabelFrequence: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    ButtonON: TButton;
    ButtonOFF: TButton;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    TabSheetFM: TTabSheet;
    ModulationFM: TMenuItem;
    

    procedure GBFONClick(Sender: TObject);
    procedure GBFOFFClick(Sender: TObject);
    
    procedure CARREClick(Sender: TObject);
    procedure TRIANGLEClick(Sender: TObject);
    procedure FREQMOINSClick(Sender: TObject);
    procedure FREQPLUSClick(Sender: TObject);
    procedure sinusClick(Sender: TObject);
    procedure DCClick(Sender: TObject);
    procedure bruitClick(Sender: TObject);
    procedure FichierClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);



    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure ScrollBar4Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure Button3Click(Sender: TObject);
   
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure TTLClick(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure ScrollBar6Change(Sender: TObject);
 
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure FormHide(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Button2Click(Sender: TObject);



    procedure SIGNALClick(Sender: TObject);
    procedure FrequenceClick(Sender: TObject);
    procedure AmplitudeClick(Sender: TObject);
    procedure INITIALISATION(Sender: TObject);
    procedure ButtonAmplitudeClick(Sender: TObject);
    procedure EditReglagesClick(Sender: TObject);
    procedure ButtonOffsetClick(Sender: TObject);
    procedure ButtonSymmetryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ControleParamClick(Sender: TObject);
    procedure ModulationAMFMClick(Sender: TObject);
    procedure ModulationFMClick(Sender: TObject);
    procedure ModulationNumClick(Sender: TObject);
    procedure TabSheetParamEnter(Sender: TObject);
    procedure TabSheetGBFEnter(Sender: TObject);
    procedure ButtonFreqClick(Sender: TObject);

    procedure convertion(TEXTE:string;var syntaxe:boolean);

  private
    { Déclarations privées}
  public
    { Déclarations publiques}

  end;

var
  Form3: TForm3;
  frequence:double;
  etatgbf:word;
  coef_freq:double;
  coef_amplitude:double;
  GenData:array[0..1024] of word;
  FuncGenArray :TWArray2;
  ConfigArray: array [1..960] of array [1..3] of dword;
  Demarage:integer;
  GBF:GBFE;
implementation


uses principal;

{$R *.DFM}

procedure Tform3.convertion(TEXTE:string;var syntaxe:boolean);
begin
    syntaxe:=true;
    try
    begin
    StrToFloat(TEXTE);
    end;
    except
    on EConvertError do syntaxe:=false;
    end;


end;

procedure TForm3.INITIALISATION(Sender: TObject);
begin
     GBF.signal:=0;
     SpeedButton1.Down:=true;
     GBF.Frequence:=1000;
     SpeedButton5.Down:=true;
     GBF.coef_freq:=1000;
     GBF.coef_amplitude:=1000;
     GBF.amplitude:=5;
     GBF.offset:=0;
     GBF.Symmetry:=50;




     SetFuncGenFrequency ( @GBF.Frequence );  // frequence 100 kHz : attention passage par adresse.
     SetFuncGenSignalType ( GBF.signal ) ; // mode sinus
     SetFuncGenAmplitude (  GBF.amplitude);   // amplitude 5 V
     SetFuncGenDCOffset ( GBF.offset );  //Offset 0 V
     SetFuncGenSymmetry ( GBF.Symmetry ); // signal symétrique ( 50 %)
end;

procedure Tform3.GBFONClick(Sender: TObject);
begin
 if demarage=0 then
    begin
    initialisation(sender);
    demarage:=1;
    end;
 getFuncGenOutputOn(@ETATGBF);
 if etatgbf=0 then
 begin

     SetFuncGenFrequency ( @GBF.Frequence );  // frequence  attention passage par adresse.
     SetFuncGenSignalType ( GBF.signal ) ; // mode
     SetFuncGenAmplitude (  GBF.amplitude);   // amplitude
     SetFuncGenDCOffset ( GBF.offset );  //Offset
     SetFuncGenSymmetry ( GBF.Symmetry ); // signal symétrie

 SetFuncGenOutputOn ( 1 ) ; // allumer le gené
 getFuncGenFrequency  ( @frequence );
 label1.caption:=floattostr(frequence/1000);
 //gbfon.caption:='OFF';
 //ButtonONOFF2.Caption:='OFF';
 if  PageControl1.Visible=true then TabSheetParamEnter(sender);







 end;
 {
 else
 begin
 SpeedButton15Click(Sender);
 SetFuncGenOutputOn ( 0 ) ; // éteindre le gené
 gbfon.caption:='ON';
 ButtonONOFF2.Caption:='ON';
 end;  }
end;

procedure TForm3.GBFOFFClick(Sender: TObject);
begin
 getFuncGenOutputOn(@ETATGBF);
 if etatgbf=1 then
 begin
  SpeedButton15Click(Sender);
  SetFuncGenOutputOn ( 0 ) ; // éteindre le gené
 end;

end;



procedure TForm3.sinusClick(Sender: TObject);
begin
     SetFuncGenSignalType ( 0 ) ; // mode sinus
end;


procedure Tform3.CARREClick(Sender: TObject);
begin
 SetFuncGenSignalType ( 2 ) ; // mode carre
end;

procedure Tform3.TRIANGLEClick(Sender: TObject);
begin
SetFuncGenSignalType ( 1 ) ; // mode triangle
end;

procedure TForm3.DCClick(Sender: TObject);
begin
    SetFuncGenSignalType ( 3) ;
end;

procedure TForm3.BruitClick(Sender: TObject);
begin
    SetFuncGenSignalType ( 4 ) ;
end;


procedure TForm3.SIGNALClick(Sender: TObject);
begin

    if SpeedButton1.Down=true   then begin GBF.Signal:=0; {SpeedButton24.Down:=true; }end;
    if SpeedButton24.Down=true  then begin GBF.Signal:=0; {SpeedButton1.Down:=true ; }end;
    if SpeedButton9.Down=true   then begin GBF.Signal:=2; {SpeedButton25.Down:=true; }end;
    if SpeedButton25.Down=true  then begin GBF.Signal:=2; {SpeedButton9.Down:=true ; }end;
    if SpeedButton10.Down=true  then begin GBF.Signal:=1; {SpeedButton26.Down:=true; }end;
    if SpeedButton26.Down=true  then begin GBF.Signal:=1; {SpeedButton10.Down:=true; }end;
    if DC.Down=true             then  GBF.Signal:=3;
    if bruit.Down=true          then  GBF.Signal:=4;

    SetFuncGenSignalType ( GBF.Signal );

end;








procedure TForm3.fichierClick(Sender: TObject);
const NrSamples = 131072;
var
index : dword;
wamp2  : word;

//fre   : double;
wamp1:array[0..131071] of word;
//NrSamples : word;
erreur:word;
begin
    //NrSamples := 1024;


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



    wamp2:=trunc(32767 + wamp1[index]*( 1500 * sin( index * (2*pi/(131071/5242.8))))  +   15000 * sin( index * (2*pi/(131071/3)))+ 1500*sin(index*2*pi/(131071/1003))+ 1500*sin(index*2*pi/(131071/2004))+ 1500*sin(index*2*pi/(131071/1505)));
    FuncGenArray[index] := Wamp2;
    end;



     erreur:=SetFuncGenSignalType ( 5 ) ;
    showmessage(floattostr(erreur));

    erreur:=fillfuncgenmemory(NrSamples,   @FuncGenArray);
    showmessage(floattostr(erreur));
    erreur:=SetFuncGenSignalType ( 5 ) ;
    showmessage(floattostr(erreur));
    frequence := 2500000;
   erreur:=SetFuncGenFrequency ( @frequence );
    showmessage(floattostr(erreur));
    end;




procedure Tform3.FREQMOINSClick(Sender: TObject);

begin
   frequence := frequence+100;
   SetFuncGenFrequency ( @frequence );  // frequence /2 : attention passage par adresse.
end;

procedure Tform3.FREQPLUSClick(Sender: TObject);
begin
   frequence := frequence-100;
   SetFuncGenFrequency ( @frequence );  // frequence *2 : attention passage par adresse.
end;







procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
     Coef_freq:=1;
     ScrollBar1Change(sender);
end;

procedure TForm3.SpeedButton3Click(Sender: TObject);
begin
     Coef_freq:=10;
     ScrollBar1Change(sender);
end;

procedure TForm3.SpeedButton4Click(Sender: TObject);
begin
     Coef_freq:=100;
     ScrollBar1Change(sender);
end;

procedure TForm3.SpeedButton5Click(Sender: TObject);
begin
     Coef_freq:=1000;
     ScrollBar1Change(sender);
end;

procedure TForm3.SpeedButton6Click(Sender: TObject);
begin
     Coef_freq:=10000;
     ScrollBar1Change(sender);
end;

procedure TForm3.SpeedButton7Click(Sender: TObject);
begin
     Coef_freq:=100000;
     ScrollBar1Change(sender);
end;

procedure TForm3.SpeedButton8Click(Sender: TObject);
begin
     Coef_freq:=1000000;
     ScrollBar1Change(sender);
end;

procedure TForm3.FrequenceClick(Sender: TObject);
begin
     if  SpeedButton2.down=true then GBF.coef_freq:=1;
     if  SpeedButton3.down=true then GBF.coef_freq:=10;
     if  SpeedButton4.down=true then GBF.coef_freq:=100;
     if  SpeedButton5.down=true then GBF.coef_freq:=1000;
     if  SpeedButton6.down=true then GBF.coef_freq:=10000;
     if  SpeedButton7.down=true then GBF.coef_freq:=100000;
     if  SpeedButton8.down=true then GBF.coef_freq:=1000000;
     ScrollBar1Change(sender);

end;









procedure TForm3.ScrollBar1Change(Sender: TObject);
begin
     frequence := GBF.coef_freq*ScrollBar1.position/1000;
     GBF.Frequence:=frequence;
     SetFuncGenFrequency ( @frequence );  // frequence /2 : attention passage par adresse.
     getFuncGenFrequency  ( @frequence );  //vérif de la fréquence reelk
     GBF.Frequence:=frequence;
     if (SpeedButton2.Down) or (SpeedButton3.Down) or (SpeedButton4.Down) then
     begin
     label1.caption:=floattostrf(frequence,fffixed,5,3);
     label9.caption:='   Hz';
     end;
     if (SpeedButton5.Down) or (SpeedButton6.Down) or (SpeedButton7.Down) then
     begin
     label1.caption:=floattostrf(frequence/1000,fffixed,5,3);
     label9.caption:='kHz';
     end;
     if SpeedButton8.Down  then
     begin
     label1.caption:=floattostrf(frequence/1000000,fffixed,5,3);
     label9.caption:='MHz';
     end;
end;

procedure TForm3.ScrollBar2Change(Sender: TObject);
begin
     //SetFuncGenAmplitude((12000-ScrollBar2.position)/coef_amplitude);
     GBF.amplitude:=(12000-ScrollBar2.position)/GBF.coef_amplitude;
     SetFuncGenAmplitude(GBF.amplitude);
     LabelAmplitude.Caption:='Amplitude : '+floattostrf(GBF.amplitude,ffFixed,4,3)+' V';
end;

procedure TForm3.ScrollBar3Change(Sender: TObject);
begin
     GBF.offset:= (12000-ScrollBar3.position)/1000;
     setfuncgenDCoffset(GBF.offset);
     LabelOffset.Caption:='Offset       : '+floattostrf(GBF.offset,ffFixed,4,3)+' V';
end;

procedure TForm3.ScrollBar4Change(Sender: TObject);
begin
     GBF.Symmetry:=ScrollBar4.position/10;
     setFuncGenSymmetry(GBF.Symmetry);
     LabelSymmetry.Caption:='Symmetry :  '+floattostrf(GBF.symmetry,ffFixed,4,3)+' %';
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
     GBF.Symmetry:=50;
     setFuncGenSymmetry(50);
     ScrollBar4.position:=500;
end;



procedure TForm3.Button3Click(Sender: TObject);
begin
      setfuncgenDCoffset(0);
      ScrollBar3.position:=12000;
      GBF.offset:=0;
end;


procedure TForm3.SpeedButton11Click(Sender: TObject);
begin
     coef_amplitude:=1000;
     ScrollBar2Change(Sender);
end;

procedure TForm3.SpeedButton12Click(Sender: TObject);
begin
     coef_amplitude:=10000;
     ScrollBar2Change(Sender);
end;

procedure TForm3.SpeedButton13Click(Sender: TObject);
begin
     coef_amplitude:=100000;
     ScrollBar2Change(Sender);
end;

procedure TForm3.AmplitudeClick(Sender: TObject);
begin
     if  SpeedButton11.down=true then GBF.coef_amplitude:=1000;
     if  SpeedButton12.down=true then GBF.coef_amplitude:=10000;
     if  SpeedButton13.down=true then GBF.coef_amplitude:=100000;

     ScrollBar2Change(Sender);
end;











procedure TForm3.TTlClick(Sender: TObject);
begin
     GBF.Signal:=2;
     GBF.amplitude:=2.5;
     GBF.Symmetry:=50;
     GBF.offset:=2.5;

     SetFuncGenSignalType ( 2 ) ; // mode carre
     setFuncGenSymmetry(50);
     setfuncgenDCoffset(2.5);
     SetFuncGenAmplitude(2.5);
     if  SpeedButton31.Down=true then  TTL.Down:=true;
     if  TTL.Down=true          then  SpeedButton31.Down:=true;
     TabSheetParamEnter(Sender);
end;

procedure TForm3.SpeedButton14Click(Sender: TObject);
begin
   {  signalbox.visible:=false;
     //GroupBox4.visible:=false;
     GroupBox5.visible:=false;
     GroupBox1.caption:='Fréquence du Signal Modulant';
     memBox.visible:=true;
     VminModBOX.visible:=true;
     FreqPortBox.visible:=true;
     SpeedButton16Click(Sender);   }
end;

procedure TForm3.SpeedButton15Click(Sender: TObject);
begin
     signalbox.visible:=true;
     GroupBox5.visible:=true;
     GroupBox1.caption:='Fréquence';
     GroupBox1.visible:=true;
     Label1.visible:=true;
     Label9.visible:=true;
     memBox.visible:=false;
     VminModBOX.visible:=false;
     FreqPortBox.visible:=false;
     SpeedButton1.down:=true;
     GroupBox2.visible:=false;
    GroupBox6.visible:=false;
     //sinusClick(Sender);

end;






procedure TForm3.SpeedButton16Click(Sender: TObject);
const NrSamples = 1024;
var
index : integer;
wamp2  : word;
wamp1:array[0..1023] of real;
erreur:word;
begin
     GroupBox1.visible:=true;
     Label1.visible:=true;
     Label9.visible:=true;
     FreqPortBox.visible:=true;
     GroupBox2.visible:=false;
    GroupBox6.visible:=false;


    //Label16.caption:=floattostrf((1024-ScrollBar5.position)*frequence,fffixed,4,0);
    if (SpeedButton2.Down) or (SpeedButton3.Down) or (SpeedButton4.Down) then
     begin
     label16.caption:=floattostrf(frequence*(1024/(1024-ScrollBar5.position)),fffixed,5,3);
     label17.caption:='   Hz';
     end;
     if (SpeedButton5.Down)  then
     begin
     label16.caption:=floattostrf((frequence/1000)*(1024/(1024-ScrollBar5.position)),fffixed,5,3);
     label17.caption:='KHz';
     end;
     if  (SpeedButton6.Down) or (SpeedButton7.Down) then
     begin
     label16.caption:=floattostrf((frequence/1000)*(1024/(1024-ScrollBar5.position))/1000,fffixed,5,3);
     label17.caption:='MHz';
     end;

     if SpeedButton8.Down  then
     begin
     label16.caption:=floattostrf((frequence/1000000)*(1024/(1024-ScrollBar5.position)),fffixed,5,3);
     label17.caption:='MHz';
     end;



    if SpeedButton16.down=true then
    begin
    for index := 0 to 1023 do
        begin
            wamp2:=trunc(32767 + 32767*((1-(1-ScrollBar7.position/100))*sin( index*2*pi/1024)+(1-ScrollBar7.position/100))*sin( index*2*pi/(1024-ScrollBar5.position )     ));
            FuncGenArray[index] := Wamp2;
        end;
    end;

    if SpeedButton17.down=true then
    begin
    for index:=0 to 1023 do
       begin
            if sin(index*(2*pi/1023))>0 then
            wamp1[index]:=1
            else
            wamp1[index]:=2*(1-ScrollBar7.position/100)-1;
       end;

    for index := 0 to 1023 do
        begin
            wamp2:=round(32767 + 32767*wamp1[index]*sin( index*2*pi/(1024-ScrollBar5.position)      ){+32767*sin( index*2*pi/1024)*(12000-ScrollBar3.position)/1000});
            FuncGenArray[index] := Wamp2;
        end;
    end;

    if SpeedButton18.down=true then
    begin
    wamp1[0]:=2*(1-ScrollBar7.position/100)-1;
    for index:=1 to 1023 do
       begin
            if index<=511 then
            wamp1[index]:=wamp1[index-1]+((2-2*(1-ScrollBar7.position/100))/511)
            else
            wamp1[index]:=wamp1[index-1]-((2-2*(1-ScrollBar7.position/100))/511);

       end;

    for index := 0 to 1023 do
        begin
            wamp2:=trunc(32767 + 32767*wamp1[index]*sin( index*2*pi/(1024-ScrollBar5.position)      ){+32767*sin( index*2*pi/1024)*(12000-ScrollBar3.position)/1000});
            FuncGenArray[index] := Wamp2;
        end;
    end;


    erreur:=SetFuncGenSignalType ( 5 ) ;
    erreur:=fillfuncgenmemory(NrSamples,   @FuncGenArray);
    erreur:=SetFuncGenSignalType ( 5 ) ;
end;



procedure TForm3.SpeedButton17Click(Sender: TObject);
const NrSamples = 1024;
var
index : dword;
wamp2  : word;
wamp1:array[0..1023] of word;
erreur:word;
begin

for index:=0 to 1023 do
       begin
            if sin(index*(2*pi/1023))>0 then
            wamp1[index]:=1
            else
            wamp1[index]:=0;
       end;

for index := 0 to 1023 do
        begin
            wamp2:=trunc(32767 + 32767*wamp1[index]*sin( index*2*pi/ScrollBar5.position      ){+32767*sin( index*2*pi/1024)*(12000-ScrollBar3.position)/1000});
            FuncGenArray[index] := Wamp2;
        end;

erreur:=SetFuncGenSignalType ( 5 ) ;

erreur:=fillfuncgenmemory(NrSamples,   @FuncGenArray);

erreur:=SetFuncGenSignalType ( 5 ) ;

end;



procedure TForm3.SpeedButton19Click(Sender: TObject);
var
FreqHArray: array [1..15] of dword;

//ConfigArray: array [1..960] of array [1..3] of dword;
Ci,n,Np,i:integer;
Nm,nn:dword;
Fsm:real;
begin
    GroupBox2.visible:=true;
    GroupBox6.visible:=true;
    GroupBox1.visible:=false;
     Label1.visible:=false;
     Label9.visible:=false;
    FreqPortBox.Visible:=false;

    Nm:=131072;

    FreqHArray[1] :=      38;
    FreqHArray[2] :=     610;
    FreqHArray[3] :=    2441;
    FreqHArray[4] :=    9765;
    FreqHArray[5] :=   39062;
    FreqHArray[6] :=   78125;
    FreqHArray[7] :=  156250;
    FreqHArray[8] :=  321500;
    FreqHArray[9] :=  625000;
    FreqHArray[10]:= 1250000;
    FreqHArray[11]:= 2500000;
    FreqHArray[12]:= 5;
    FreqHArray[13]:=10;
    FreqHArray[14]:=25;
    FreqHArray[15]:=50;






    memo1.text:='';
    memo1.text:='fréquences disponibles'+#13#10;
    // showmessage('memo');
    Ci:=1;
    ConfigArray[Ci,1]:=0;
    memo1.text:=memo1.text + floattostrf(ConfigArray[Ci,1],fffixed,6,2)+#13#10;
   // showmessage('memo');



    while Ci<527 do
          begin
               ConfigArray[Ci+1,1]:=round((127*FreqHArray[15]/Nm)*1000000);
              // memo1.text:=memo1.text + floattostrf(round((127*50/131072)*1000000),fffixed,6,2)+#13#10;
               ConfigArray[Ci+1,3]:=127;
               for i:=1 to 15 do
                   begin
                   n:=1;
                   while n<>127 do
                         begin

                              if i>=12  then
                              Fsm:=round((n/Nm)*(FreqHArray[i])*1000000)
                              else
                              Fsm:=round(n*FreqHArray[i]/Nm);

                              n:=n+2;

                              if (Fsm>ConfigArray[Ci,1]) and (Fsm<=ConfigArray[Ci+1,1]) and (n<ConfigArray[Ci+1,3]) then
                              begin
                                   ConfigArray[Ci+1,1]:=round(Fsm);

                                   if i>=12  then
                                    ConfigArray[Ci+1,2]:=FreqHArray[i]*1000000
                                    else
                                    ConfigArray[Ci+1,2]:=FreqHArray[i];
                         
                                    ConfigArray[Ci+1,3]:=n-2;
                              end;{if}
                         end;{while}
                   end;{for}



          ci:=ci+1;
          memo1.text:=memo1.text + floattostrf(ConfigArray[Ci,1],fffixed,6,2)+'    '+ floattostrf(ConfigArray[Ci,2],fffixed,6,2)+'    '+ floattostrf(ConfigArray[Ci,3],fffixed,6,2)+'   '+ floattostrf(Ci,fffixed,6,0)+#13#10;
          end;{while}
          ScrollBar6Change(Sender);

end;








procedure TForm3.ScrollBar6Change(Sender: TObject);
const NrSamples = 131072;
var
index,n : integer;
wamp2,ci  : word;
wamp1:array[0..131072] of real;
Fmodulant:real;
begin
     Ci:=ScrollBar6.position;
     Fmodulant :=ConfigArray[Ci,1];
     label21.caption:=floattostrf(Fmodulant,fffixed,7,2);
     frequence :=ConfigArray[Ci,2];
     n         :=ConfigArray[Ci,3];
     label22.caption:=floattostrf(n,fffixed,7,2);
       Fmodulant :=n*frequence/131072;
      label18.caption:=floattostrf(Fmodulant,fffixed,7,2);
      label19.caption:=floattostrf(ScrollBar6.position,fffixed,7,2);

     for index := 0 to 131071 do
        begin
            wamp2:=round(32767 + 32767*sin( index*2*pi/(131072/n)));
            FuncGenArray[index] := Wamp2;
        end;

    SetFuncGenSignalType ( 5 ) ;
    fillfuncgenmemory(NrSamples,   @FuncGenArray);
    SetFuncGenSignalType ( 5 ) ;
    SetFuncGenFrequency ( @frequence );  // frequence /2 : attention passage par adresse.
    getFuncGenFrequency  ( @frequence );
    label20.caption:=floattostrf(frequence,fffixed,7,2);
    SpeedButton20Click(Sender);
end;



procedure TForm3.SpeedButton20Click(Sender: TObject);
const NrSamples = 131072;
var
index,n : integer;
wamp2,ci,temp  : word;
wamp1:array[0..131072] of real;
Fmodulant:real;
begin
     
      GroupBox2.visible:=true;
    GroupBox6.visible:=true;
    GroupBox1.visible:=false;
     Label1.visible:=false;
     Label9.visible:=false;
    FreqPortBox.Visible:=false;

     Ci:=ScrollBar6.position;
     Fmodulant :=ConfigArray[Ci,1];

     frequence :=ConfigArray[Ci,2];
     n         :=ConfigArray[Ci,3];

     //Fmodulant :=n*frequence/131072;



     for index := 0 to 131071 do
        begin
            wamp2:=round(32767 + 32767*sin( index*2*pi/(131072/n))*sin(index*2*pi*n/(ScrollBar8.max-ScrollBar8.position)));
            FuncGenArray[index] := Wamp2;
        end;

    SetFuncGenSignalType ( 5 ) ;
    fillfuncgenmemory(NrSamples,   @FuncGenArray);
    SetFuncGenSignalType ( 5 ) ;
    SetFuncGenFrequency ( @frequence );  // frequence /2 : attention passage par adresse.
    getFuncGenFrequency  ( @frequence );
    label24.caption:=floattostrf(Fmodulant*131072/(ScrollBar8.max-ScrollBar8.position),fffixed,7,1);

end;

procedure TForm3.SpeedButton21Click(Sender: TObject);
begin
     ScrollBar5.min:=0;
     ScrollBar5.max:=100;
end;

procedure TForm3.SpeedButton22Click(Sender: TObject);
begin
     ScrollBar5.min:=100;
     ScrollBar5.max:=1000;
end;

procedure TForm3.SpeedButton23Click(Sender: TObject);
begin
     ScrollBar5.min:=1000;
     ScrollBar5.max:=1022;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     SpeedButton15Click(Sender);
     SetFuncGenOutputOn ( 0 ) ; // éteindre le gené
     gbfon.caption:='ON';
     oscillocaba.Button1.visible:=false;
    // OscilloCaba.gbf2.checked:=false;
end;



procedure TForm3.FormHide(Sender: TObject);
begin
     //OscilloCaba.gbf2.checked:=false;
end;

procedure TForm3.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
     Resize:=false;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
     form3.visible:=false;
     //OscilloCaba.gbf2.checked:=false;
end;

procedure TForm3.ButtonFreqClick(Sender: TObject);
var
Syntaxe:boolean;
begin


    convertion(EditReglages.Text,syntaxe);
    if syntaxe=false then EditReglages.Text:='Syntaxe !';
    if (syntaxe=true) then
    begin
    if (StrToFloat(EditReglages.Text)<2000000) and (StrToFloat(EditReglages.Text)>0) then
    begin
    GBF.frequence:=StrToFloat(EditReglages.Text);
    frequence:= GBF.frequence;
    SetFuncGenFrequency ( @frequence );  // frequence /2 : attention passage par adresse.
    getFuncGenFrequency  ( @frequence );  //vérif de la fréquence reelk
    GBF.Frequence:=frequence;

    LabelFrequence.Caption:='Fréquence : '+floattostrf(GBF.frequence,ffFixed,4,3)+' Hz';

   // essai afficheur param

    if GBF.Frequence<=200 then
     begin
     Label28.caption:=floattostrf(frequence,fffixed,5,3);
     label29.caption:='   Hz';
     end;
    if (GBF.Frequence<=20000) and (GBF.Frequence>200)  then
     begin
     Label28.caption:=floattostrf(frequence/1000,fffixed,5,3);
     label29.caption:='kHz';
     end;
    if GBF.Frequence>20000  then
     begin
     Label28.caption:=floattostrf(frequence/1000000,fffixed,5,3);
     label29.caption:='MHz';
     end;

    end
    else EditReglages.Text:='<>Limites';
    end;

end;

procedure TForm3.ButtonAmplitudeClick(Sender: TObject);
var
Syntaxe:boolean;
begin

convertion(EditReglages.Text,syntaxe);
    if syntaxe=false then EditReglages.Text:='Syntaxe !';
    if (syntaxe=true) then
    begin



    if (StrToFloat(EditReglages.Text)<12) and (StrToFloat(EditReglages.Text)>0) then
    begin
    GBF.amplitude:=StrToFloat(EditReglages.Text);
    SetFuncGenAmplitude (  GBF.amplitude);
    LabelAmplitude.Caption:='Amplitude : '+floattostrf(GBF.amplitude,ffFixed,4,3)+' V';

     //afficheur
    if (GBF.amplitude<=1) then
     begin
     Label30.caption:=floattostrf(GBF.amplitude*1000,fffixed,5,0);
     label31.caption:=' mV';
     end;
    if (GBF.amplitude>1)  then
     begin
     Label30.caption:=floattostrf(GBF.amplitude,fffixed,5,3);
     label31.caption:='  V';
     end;
    end
    else EditReglages.Text:='<>Limites';



    end;
end;

procedure TForm3.ButtonOffsetClick(Sender: TObject);
var
Syntaxe:boolean;
begin
convertion(EditReglages.Text,syntaxe);
    if syntaxe=false then EditReglages.Text:='Syntaxe !';
    if (syntaxe=true) then
    begin
    if (StrToFloat(EditReglages.Text)<12) and (StrToFloat(EditReglages.Text)>-12) then
    begin
    GBF.offset:=StrToFloat(EditReglages.Text);
    SetFuncGenDCOffset ( GBF.offset );
    LabelOffset.Caption:='Offset       : '+floattostrf(GBF.offset,ffFixed,4,3)+' V';

     //afficheur
    if (GBF.offset<=1) then
     begin
     Label33.caption:=floattostrf(GBF.offset*1000,fffixed,5,0);
     label34.caption:=' mV';
     end;
    if (GBF.offset>1)  then
     begin
     Label33.caption:=floattostrf(GBF.offset,fffixed,5,3);
     label34.caption:=' V';
     end;




    end
    else EditReglages.Text:='<>Limites';
    end;
end;

procedure TForm3.ButtonSymmetryClick(Sender: TObject);
var
Syntaxe:boolean;
begin
convertion(EditReglages.Text,syntaxe);
    if syntaxe=false then EditReglages.Text:='Syntaxe !';
    if (syntaxe=true) then
    begin
    if (StrToFloat(EditReglages.Text)<100) and (StrToFloat(EditReglages.Text)>0) then
    begin
    GBF.symmetry:=StrToFloat(EditReglages.Text);
    SetFuncGenSymmetry ( GBF.Symmetry );
    LabelSymmetry.Caption:='Symmetry :  '+floattostrf(GBF.symmetry,ffFixed,4,3)+' %';

    Label37.caption:=floattostrf(GBF.symmetry,fffixed,5,3);
    label38.caption:=' %';


    end
    else EditReglages.Text:='<>Limites';
    end;
end;







  //   SetFuncGenDCOffset ( GBF.offset );  //Offset 0 V
    // SetFuncGenSymmetry ( GBF.Symmetry ); // signal symétrique ( 50 %)

procedure TForm3.EditReglagesClick(Sender: TObject);
begin
   EditReglages.Text:='';
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
   form3.Top:=0;
   form3.Left:=0;
  // form3.height:=480;
  // form3.width:=282;
   TabSheetParam.TabVisible:=false;
   TabSheetAMFM.TabVisible:=false;
   TabSheetFM.TabVisible:=false;
   TabSheetNum.TabVisible:=false;

end;

procedure TForm3.ControleParamClick(Sender: TObject);
begin
    if ControleParam.Checked=false then
    begin
    ControleParam.Checked:=true;
    TabSheetParam.TabVisible:=true;
    end
    else
    begin
    ControleParam.Checked:=false;
    TabSheetParam.TabVisible:=false;
    end;
end;

procedure TForm3.ModulationAMFMClick(Sender: TObject);
begin
    if ModulationAMFM.Checked=false then
    begin
    ModulationAMFM.Checked:=true;
    TabSheetAMFM.TabVisible:=true;
    end
    else
    begin
    ModulationAMFM.Checked:=false;
    TabSheetAMFM.TabVisible:=false;
    end;

end;

procedure TForm3.ModulationFMClick(Sender: TObject);
begin  
    if ModulationFM.Checked=false then
    begin
    ModulationFM.Checked:=true;
    TabSheetFM.TabVisible:=true;
    end
    else
    begin
    ModulationFM.Checked:=false;
    TabSheetFM.TabVisible:=false;
    end;
end;

procedure TForm3.ModulationNumClick(Sender: TObject);
begin
    if ModulationNum.Checked=false then
    begin
    ModulationNum.Checked:=true;
    TabSheetNum.TabVisible:=true;
    end
    else
    begin
    ModulationNum.Checked:=false;
    TabSheetNum.TabVisible:=false;
    end;

end;

procedure TForm3.TabSheetParamEnter(Sender: TObject);
begin
    if SpeedButton1.Down=true   then SpeedButton24.Down:=true;

    if SpeedButton9.Down=true   then SpeedButton25.Down:=true;

    if SpeedButton10.Down=true  then SpeedButton26.Down:=true;

    if    TTL.Down=true         then SpeedButton31.Down:=true;

    if (DC.Down=true)  or  (bruit.Down=true)  then
    begin
        SpeedButton1.Down:=true;
        SpeedButton24.Down:=true;
        GBF.Signal:=0;
        SetFuncGenSignalType ( GBF.Signal );
    end;


    LabelAmplitude.Caption:='Amplitude : '+floattostrf(GBF.amplitude,ffFixed,4,3)+' V';
    LabelOffset.Caption:='Offset       : '+floattostrf(GBF.offset,ffFixed,4,3)+' V';
    LabelSymmetry.Caption:='Symmetry :  '+floattostrf(GBF.symmetry,ffFixed,4,3)+' %';
    LabelFrequence.caption:='fréquence : '+floattostrf(GBF.frequence,ffFixed,4,3)+' Hz';
    if GBF.Frequence<=200 then
     begin
     Label28.caption:=floattostrf(GBF.Frequence,fffixed,5,3);
     label29.caption:='   Hz';
     end;
    if (GBF.Frequence<=20000) and (GBF.Frequence>200)  then
     begin
     Label28.caption:=floattostrf(GBF.Frequence/1000,fffixed,5,3);
     label29.caption:='kHz';
     end;
    if GBF.Frequence>20000  then
     begin
     Label28.caption:=floattostrf(GBF.Frequence/1000000,fffixed,5,3);
     label29.caption:='MHz';
     end;
    if (GBF.amplitude<=1) then
     begin
     Label30.caption:=floattostrf(GBF.amplitude*1000,fffixed,5,0);
     label31.caption:=' mV';
     end;
    if (GBF.amplitude>1)  then
     begin
     Label30.caption:=floattostrf(GBF.amplitude,fffixed,5,3);
     label31.caption:='  V';
     end;
    if (GBF.offset<=1) then
     begin
     Label33.caption:=floattostrf(GBF.offset*1000,fffixed,5,0);
     label34.caption:=' mV';
     end;
    if (GBF.offset>1)  then
     begin
     Label33.caption:=floattostrf(GBF.offset,fffixed,5,3);
     label34.caption:=' V';
     end;
     
    Label37.caption:=floattostrf(GBF.symmetry,fffixed,5,3);
    label38.caption:=' %';




    

end;

procedure TForm3.TabSheetGBFEnter(Sender: TObject);
begin
    if SpeedButton24.Down=true   then SpeedButton1.Down:=true;
    if SpeedButton25.Down=true   then SpeedButton9.Down:=true;
    if SpeedButton26.Down=true  then SpeedButton10.Down:=true;


    ///RE-actualisation de l'interface/à la fréquence



     if GBF.frequence<= 2000000 then SpeedButton8.Down:=true;
     if GBF.frequence<=  200000 then SpeedButton7.Down:=true;
     if GBF.frequence<=   20000 then SpeedButton6.Down:=true;
     if GBF.frequence<=    2000 then SpeedButton5.Down:=true;
     if GBF.frequence<=     200 then SpeedButton4.Down:=true;
     if GBF.frequence<=      20 then SpeedButton3.Down:=true;
     if GBF.frequence<=       2 then SpeedButton2.Down:=true;
     
     if  SpeedButton2.down=true then GBF.coef_freq:=1;
     if  SpeedButton3.down=true then GBF.coef_freq:=10;
     if  SpeedButton4.down=true then GBF.coef_freq:=100;
     if  SpeedButton5.down=true then GBF.coef_freq:=1000;
     if  SpeedButton6.down=true then GBF.coef_freq:=10000;
     if  SpeedButton7.down=true then GBF.coef_freq:=100000;
     if  SpeedButton8.down=true then GBF.coef_freq:=1000000;
     
     ScrollBar1.position:=round(1000*GBF.frequence/GBF.coef_freq);
     ScrollBar1Change(sender);


  //   GBF.amplitude:=(12000-ScrollBar2.position)/GBF.coef_amplitude;
  //   GBF.offset:= (12000-ScrollBar3.position)/1000;
  //   GBF.Symmetry:=ScrollBar4.position/10;

     SpeedButton11.Down:=true;
     GBF.coef_amplitude:=1000;
     ScrollBar4.position:=round(10*GBF.Symmetry);
     ScrollBar3.position:=round(12000-GBF.offset*1000);
     ScrollBar2.position:=round(12000-GBF.amplitude*1000);

end;



end.








