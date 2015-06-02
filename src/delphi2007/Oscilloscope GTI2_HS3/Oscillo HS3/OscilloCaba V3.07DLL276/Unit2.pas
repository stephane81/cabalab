unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, dlldecl, ComCtrls;

type
  TOptions = class(TForm)
    GroupBoxCH1: TGroupBox;
    GroupBoxCH2: TGroupBox;
    ButtonSuppr: TButton;
    ButtonOK: TButton;
    EditOptions: TEdit;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    LabelCALCH1: TLabel;
    LabelBDT1: TLabel;
    LabelCalCh2: TLabel;
    LabelBDT2: TLabel;
    Buttoncouleur1: TButton;
    ButtonCouleur2: TButton;

    PaintBox3: TPaintBox;
    ColorDialog1: TColorDialog;
    CouplageCH1: TGroupBox;
    AC1: TRadioButton;
    DC1: TRadioButton;
    INVch1: TCheckBox;
    couplageCH2: TGroupBox;
    AC2: TRadioButton;
    DC2: TRadioButton;
    INVch2: TCheckBox;
    GroupBoxXY: TGroupBox;
    Button1: TButton;
    LabelY: TLabel;
    LabelX: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    Label1: TLabel;
    procedure affichage(Sender: TPaintbox);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure ButtonSupprClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure couleurCH1Click(Sender: TObject);
    procedure couleurCH2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  
    procedure PageControl1Change(Sender: TObject);

  private
    { Déclarations privées}
  public
    { Déclarations publiques}
  end;

var
  Options: TOptions;
  pages: array[1..10]of TTabSheet;
implementation

uses Unit1, Principal;

{$R *.DFM}

procedure TOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Oscillocaba.visible:=true;
end;

procedure TOptions.FormCreate(Sender: TObject);
begin
    Options.Top:=0;
    Options.Left:=0;

    pages[1]:=TabSheet1;
    pages[2]:=TabSheet2;
    pages[3]:=TabSheet3;
    pages[4]:=TabSheet4;
    pages[5]:=TabSheet5;
    pages[6]:=TabSheet6;
    pages[7]:=TabSheet7;
    pages[8]:=TabSheet8;
    pages[9]:=TabSheet9;
    pages[10]:=TabSheet10;
end;

procedure TOptions.Affichage(Sender: Tpaintbox);
var Curseur_Abscisse, Curseur_Ordonnee : Word;
    Calibre1 , Calibre2 : Double;
    Longueur_Acquisition : dword;
    x,y,t:integer ;
begin



Longueur_Acquisition := principal.courbes [principal.courbe_options].long_ech;
Calibre1             := principal.courbes [principal.courbe_options].calibCh1_ech;
Calibre2             := principal.courbes [principal.courbe_options].calibCh2_ech;






// Affichage Voie 1
   if ((Principal.courbes [principal.courbe_options].mode=ch1) or (Principal.courbes [principal.courbe_options].mode=chop)) and (sender=paintbox1) then
      begin
          // GroupBoxCH1.visible:=true;
           LabelCALCH1.caption:= 'Cal CH1 = '+floattostr(Principal.courbes [principal.courbe_options].calibCh1_ech/4)+' V/div';
         //  LabelBDT1.caption:= Principal.courbes [principal.courbe_options].BDT;
         //  LabelACDC1.caption:= Principal.courbes [principal.courbe_options].acdc;
        //   LabelINV1.caption:= Principal.courbes [principal.courbe_options].inv;



           // effaçage
           Sender.Canvas.Brush.Color := clBlack;
           Sender.Canvas.Rectangle(0, 0, Sender.Width - 1, Sender.Height - 1);

           // traçé grille

           Sender.Canvas.Pen.Color := clSilver;
           for x:=1 to 9 do
               begin
                    for Y:=0 to 10 do
                        begin
                             for t:=1 to 4 do
                                 begin
                                      Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.height/8) + t*round(Sender.height/40)  );
                                      Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Sender.height/8)+ t*round(Sender.height/40) +1);
                                 end;
                             Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/8));
                             Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Sender.Height/8)+2);
                             Sender.Canvas.moveTo(x*round(Sender.Width/10)+1, y*round(Sender.Height/8)+1);
                             Sender.Canvas.LineTo(x*round(Sender.Width/10)-1, y*round(Sender.Height/8)+1);
                        end;
               end;

           for x:=0 to 9 do
               begin
                    for Y:=1 to 10 do
                        begin
                             //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/100)  );
                             for t:=1 to 4 do
                                 begin
                                      Sender.Canvas.MoveTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50), y*round(Sender.height/8));
                                      Sender.Canvas.LineTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50)+1, y*round(Sender.height/8));

                                 end;
                        end;
               end;

           // ligne de 0
           Sender.Canvas.Pen.Color := clWhite;
           Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
           Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));


           Sender.Canvas.Pen.Color := clLime;
           Sender.Canvas.MoveTo(0, Round(  Principal.courbes [principal.courbe_options].voie1[ 0 ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) ));

           for Curseur_Abscisse := 1 to Sender.Width - 1 do
           begin
                Sender.Canvas.Pen.Color :=  Principal.courbes [courbe_options].couleur1;
                Curseur_Ordonnee := Round(  -Principal.courbes [principal.courbe_options].voie1[ round( Curseur_Abscisse * Longueur_Acquisition / Sender.Width ) ] * (Sender.Height/2) / Calibre1 + (Sender.Height/2) );
                Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
      end;


    

// Affichage Voie 2
   if ((Principal.courbes [courbe_options].mode=ch2) or (Principal.courbes [courbe_options].mode=chop)) and (sender=paintbox2)then
      begin
           //GroupBoxCH2.visible:=true;
           LabelCALCH2.caption:= 'Cal CH2 = '+floattostr(Principal.courbes [principal.courbe_options].calibCh2_ech/4)+' V/div';

           // effaçage
           Sender.Canvas.Brush.Color := clBlack;
           Sender.Canvas.Rectangle(0, 0, Sender.Width - 1, Sender.Height - 1);

           // traçé grille

           Sender.Canvas.Pen.Color := clSilver;
           for x:=1 to 9 do
               begin
                    for Y:=0 to 10 do
                        begin
                             for t:=1 to 4 do
                                 begin
                                      Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.height/8) + t*round(Sender.height/40)  );
                                      Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Sender.height/8)+ t*round(Sender.height/40) +1);
                                 end;
                             Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/8));
                             Sender.Canvas.LineTo(x*round(Sender.Width/10), y*round(Sender.Height/8)+2);
                             Sender.Canvas.moveTo(x*round(Sender.Width/10)+1, y*round(Sender.Height/8)+1);
                             Sender.Canvas.LineTo(x*round(Sender.Width/10)-1, y*round(Sender.Height/8)+1);
                        end;
               end;

           for x:=0 to 9 do
               begin
                    for Y:=1 to 10 do
                        begin
                             //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/100)  );
                             for t:=1 to 4 do
                                 begin
                                      Sender.Canvas.MoveTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50), y*round(Sender.height/8));
                                      Sender.Canvas.LineTo(x*round(Sender.Width/10)+ t*round(Sender.Width/50)+1, y*round(Sender.height/8));

                                 end;
                        end;
               end;

           // ligne de 0
           Sender.Canvas.Pen.Color := clWhite;
           Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
           Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));



           sender.Canvas.Pen.Color := clAqua;
           sender.Canvas.MoveTo(0, Round(  -{(invech2)*}Principal.courbes [courbe_options].voie2[ 0 ] * (sender.Height/2) / Calibre2 + (sender.Height/2) ));

          for Curseur_Abscisse := 1 to sender.Width - 1 do
          begin

          sender.Canvas.Pen.Color := Principal.courbes [courbe_options].couleur2;

          Curseur_Ordonnee := Round(  -{(invech2)*}Principal.courbes [courbe_options].voie2[ round( Curseur_Abscisse * Longueur_Acquisition / sender.Width ) ] * (sender.Height/2) / Calibre2 + (sender.Height/2) );
          sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;

    end;
//affichage XY
    if (Principal.courbes [principal.courbe_options].XY = true) and (sender=paintbox3) then
    begin
        //GroupBoxXY.visible:=true;
        LabelY.caption:= 'Y = CH2   Cal CH2 = '+floattostr(Principal.courbes [principal.courbe_options].calibCh2_ech/4)+' V/div';
        LabelX.caption:= 'X = CH1   Cal CH1 = '+floattostr(Principal.courbes [principal.courbe_options].calibCh1_ech/4)+' V/div';
        // effaçage
        Sender.Canvas.Brush.Color := clBlack;
        Sender.Canvas.Rectangle(0, 0, Sender.Width - 1, Sender.Height - 1);

        // traçé grille  perso1 XY
        Sender.Canvas.Pen.Color := clSilver;
        for x:=1 to 9 do
        begin
        for Y:=0 to 9 do
        begin
        for t:=1 to 4 do
        begin
             Sender.Canvas.MoveTo(x*round(Sender.Width/8), y*round(Sender.height/8) + t*round(Sender.height/40)  );
             Sender.Canvas.LineTo(x*round(Sender.Width/8), y*round(Sender.height/8)+ t*round(Sender.height/40) +1);
             end;
        Sender.Canvas.MoveTo(x*round(Sender.Width/8), y*round(Sender.Height/8));
        Sender.Canvas.LineTo(x*round(Sender.Width/8), y*round(Sender.Height/8)+2);
        Sender.Canvas.moveTo(x*round(Sender.Width/8)+1, y*round(Sender.Height/8)+1);
        Sender.Canvas.LineTo(x*round(Sender.Width/8)-1, y*round(Sender.Height/8)+1);
        end;
        end;

        for x:=0 to 9 do
        begin
        for Y:=1 to 9 do
        begin
        //Sender.Canvas.MoveTo(x*round(Sender.Width/10), y*round(Sender.Height/100)  );
        for t:=1 to 4 do
        begin
        Sender.Canvas.MoveTo(x*round(Sender.Width/8)+ t*round(Sender.Width/40), y*round(Sender.height/8));
        Sender.Canvas.LineTo(x*round(Sender.Width/8)+ t*round(Sender.Width/40)+1, y*round(Sender.height/8));

        end;
        end;
        end;


        // lignes de 0
        Sender.Canvas.Pen.Color := clWhite;
        Sender.Canvas.MoveTo(0, round(Sender.Height/2) );
        Sender.Canvas.LineTo(Sender.Width , round(Sender.Height/2));
        Sender.Canvas.MoveTo( round(Sender.Width/2),0 );
        Sender.Canvas.LineTo(round(Sender.Width/2) , Sender.Height);

// Affichage Voie XY

    Sender.Canvas.Pen.Color := clLime;
    Sender.Canvas.MoveTo( round((invech1)*Ch1DoubleArray[ 1  ] * (Sender.width/2) / Calibre1 + (Sender.width/2)),round(-(invech2)*Ch2DoubleArray[ 1 ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2)) );


          for x := 0 to Longueur_Acquisition-1 do
          begin
          Sender.Canvas.Pen.Color :=  Principal.courbes [courbe_options].couleur1;

          Curseur_abscisse := Round(  Principal.courbes [principal.courbe_options].voie1[ x ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
          Curseur_Ordonnee := Round(  -Principal.courbes [principal.courbe_options].voie2[ x ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );

          //Curseur_abscisse := Round(  (invech1)*Ch1DoubleArray[  positiontableau  ] * (Sender.width/2) / Calibre1 + (Sender.width/2) );
          //Curseur_Ordonnee := Round(  -(invech2)*Ch2DoubleArray[  positiontableau  ] * (Sender.Height/2) / Calibre2 + (Sender.Height/2) );

          Sender.Canvas.LineTo(Curseur_Abscisse, Curseur_Ordonnee);
          end;
    end;

end;



procedure TOptions.FormShow(Sender: TObject);
var
i:integer;
begin




      {
      editoptions.text := principal.courbes[principal.courbe_options].nom ;
      GroupBoxCH1.visible:=false;
      GroupBoxCH2.visible:=false;
      GroupBoxXY.visible:=false;

      if Principal.courbes [principal.courbe_options].XY = true then
      begin
      Affichage(paintbox3);
      Options.Width:=1024;

      end
      else Options.Width:=512;

      Affichage(paintbox1);
      Affichage(paintbox2);


      aC1.checked:=true;
      aC2.checked:=true;
      DC1.checked:=Principal.courbes [principal.courbe_options].couplageCH1DC;
      DC2.checked:=Principal.courbes [principal.courbe_options].couplageCH2DC;
      INVch1.checked:=Principal.courbes [principal.courbe_options].INVCH1;
      INVch2.checked:=Principal.courbes [principal.courbe_options].INVCH2;
       }
      /////modif 3.xxx  TabSheet!
       for i:=1 to 10 do
       pages[i].TabVisible:=False;
       for i:=1 to principal.nb_courbes_stockees do
       pages[i].TabVisible:=true;

       PageControl1.TabIndex:=principal.courbe_options -1;
       PageControl1Change(Sender);





end;

procedure TOptions.FormPaint(Sender: TObject);

begin
    Affichage(paintbox1);
    Affichage(paintbox2);
    Affichage(paintbox3);
   //  PageControl1Change(Sender);
end;







procedure TOptions.ButtonSupprClick(Sender: TObject);
var i : integer ;
begin

   if principal.courbe_options <> principal.nb_courbes_stockees then
      for i:= principal.courbe_options to principal.nb_courbes_stockees - 1 do
          principal.courbes[i] := principal.courbes[i+1];


principal.nb_courbes_stockees := principal.nb_courbes_stockees - 1 ;

Options.Visible:=False;
Oscillocaba.visible:=true;



end;

procedure TOptions.ButtonOKClick(Sender: TObject);
begin


principal.courbes[principal.courbe_options].nom := Options.editOptions.text ;
//form1.visible:= true;

options.visible:=false;
Oscillocaba.visible:=true;

end;


procedure TOptions.couleurCH1Click(Sender: TObject);
begin
ColorDialog1.execute;
principal.courbes[principal.courbe_options].couleur1:=colordialog1.color;
Options.visible:=true;
formshow(self);
end;


procedure TOptions.couleurCH2Click(Sender: TObject);
begin

ColorDialog1.execute;
principal.courbes[principal.courbe_options].couleur2:=colordialog1.color;
Options.visible:=true;
formshow(self);
end;





procedure TOptions.PageControl1Change(Sender: TObject);
var
i:integer;
begin

    principal.courbe_options:=PageControl1.TabIndex +1;
    label1.caption:=floattostr(principal.courbe_options);
    editoptions.text := principal.courbes[principal.courbe_options].nom ;
      GroupBoxCH1.visible:=false;
      GroupBoxCH2.visible:=false;
      GroupBoxXY.visible:=false;

      if Principal.courbes [principal.courbe_options].mode=ch1 then
      begin

      Options.Width:=550;
      Options.Height:=768;
      GroupBoxCH1.visible:=true;
      Affichage(paintbox1);
      end;

      if Principal.courbes [principal.courbe_options].mode=ch2 then
      begin

      Options.Width:=550;
      Options.Height:=768;
      GroupBoxCH2.Top:=400;
      GroupBoxCH2.visible:=true;

      Affichage(paintbox2);
      end;

      if  Principal.courbes [principal.courbe_options].mode=chop then
      begin

      Options.Width:=550;
      Options.Height:=768;
      GroupBoxCH2.Top:=400;
      GroupBoxCH1.visible:=true;
      GroupBoxCH2.visible:=true;
      Affichage(paintbox1);
      Affichage(paintbox2);
      end;


      if Principal.courbes [principal.courbe_options].XY = true then
      begin

      Options.Width:=1024;
      Options.Height:=768;
      GroupBoxCH2.Top:=400;
      GroupBoxCH1.visible:=true;
      GroupBoxCH2.visible:=true;
      GroupBoxXY.visible:=true;
      Affichage(paintbox1);
      Affichage(paintbox2);
      Affichage(paintbox3);
      end;


     // Affichage(paintbox1);
     // Affichage(paintbox2);


      aC1.checked:=true;
      aC2.checked:=true;
      DC1.checked:=Principal.courbes [principal.courbe_options].couplageCH1DC;
      DC2.checked:=Principal.courbes [principal.courbe_options].couplageCH2DC;
      INVch1.checked:=Principal.courbes [principal.courbe_options].INVCH1;
      INVch2.checked:=Principal.courbes [principal.courbe_options].INVCH2;


end;

end.
