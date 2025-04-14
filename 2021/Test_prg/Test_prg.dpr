program Test_prg;

uses
  Vcl.Forms,
  Unit1 in '..\..\..\..\OneDrive\Documenti\Embarcadero\Studio\Projects\Unit1.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
