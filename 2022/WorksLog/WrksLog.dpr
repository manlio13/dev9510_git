program WrksLog;
 {$IFOPT D-}{$WEAKLINKRTTI ON}{$ENDIF}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
uses
<<<<<<< HEAD
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
=======
>>>>>>> 2bf46da135a59f236260ba97a57c71df11ee62b0
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$E exe}

{$R *.res}

begin
  Application.Initialize;
  //ShortDateFormat := 'dd.mm.yy';
  //DateSeparator := '.';
  Application.MainFormOnTaskbar := True;
  Application.Title := 'WrksLog';
  Application.CreateForm(TForm1, Form1);
  Application.HelpFile:='log.chm';
  Application.Run;
end.
