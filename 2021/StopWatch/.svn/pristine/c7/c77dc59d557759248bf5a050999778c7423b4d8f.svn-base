unit Unit1;

interface

uses
  Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,System.Diagnostics,Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Panel1: TPanel;
    Shape1: TShape;
    Edit2: TEdit;
    Timer1: TTimer;
    Label1: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
   //procedure Timer1Timer(Sender: TObject);
    { Private declarations }
  public
  end;
var
  Form1: TForm1;
   ms,mt:double;
   sw:Tstopwatch;
   key:Char;
   park,continua,basta,vis,Scelto:Boolean;
   k, i:Integer;
  // ElapsedMillisecond:Int64;
implementation

{$R *.dfm}
procedure TForm1.Button2Click(Sender: TObject);  //done
begin
   Form1.release;
   application.Terminate;
   Exit;
end;

procedure TForm1.Button3Click(Sender: TObject);      //visual
begin
  scelto:=True;
  vis:=True;
  k:=1;
  basta:=False;
  Edit1.text:='';
  Edit2.text:='';
end;

procedure TForm1.Button4Click(Sender: TObject);   //acustic
begin
   Vis :=False;
   scelto:=True;
   k:=1;
   basta:=False;
   Edit1.text:='';
   Edit2.text:='';
end;

procedure TForm1.FormCreate(Sender: TObject);   //Create
 begin
   sw:=TStopwatch.Create;
   Shape1.visible:=False;
   Park:=true;
   continua:=True;
   basta:=False;
   vis:=False;
   k:=1;
   mt:=0;
   ms:=0;
   scelto:=False;
 end;

   procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
         if (key=(VK_space))and (park=True) then
         begin
           Edit2.Text:= IntToStr(k) ;
           k:=k+1;
           continua:=False;
          sw.stop;
          if vis  then
          ms:=sw.ElapsedMilliseconds-100 else
          ms:=sw.ElapsedMilliseconds-450;

          mt:=mt+ms;
          Edit1.text:=FloatToStr(Abs(ms));
          if ms=0 then
            begin
              Edit1.text:='Too soon';
              k:=k-1;
            end;
             Shape1.visible :=False;
             sw.reset;
         end;
         continua:=True;
         Button1Click(Self);

 end;
procedure TForm1.Timer1Timer(Sender: TObject); //NB aggiungere TForm1 per unsatisfied forward
begin
     if basta=False then
    begin
      if vis then
      Form1.Shape1.Visible:=True else
      Windows.beep(1500,500);
      sw.start;   //parte il tempo
    end;
end;


procedure TForm1.Button1Click(Sender: TObject);       //start
var
  n: Integer;
  begin
    if not scelto  then
    begin
      showmessage('Visual or Acustic must be choosen first.');
      Exit;
    end;

     if k=11 then
       begin
          k:=1;
          sw.reset;
          continua:=False;
          park:=False;
          vis:=False;
          shape1.visible:=False;
          edit2.text:='Cicle end';
          Timer1.Enabled:=False;
          ms:=mt/10;
          Edit1.text:='Average = '+floattostr(ms);
          mt:=0;
          ms:=0;
          basta:=True;
          exit;
       end else
        begin
           park:=True;
           n:=1000 +random (10000);
           Timer1.interval:=n;
           Timer1.enabled:=True;
           while park and continua do
          begin
            Application.ProcessMessages;
           end;
        end;
  end ;
 end.


