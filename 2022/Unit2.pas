unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,ShellAPI;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
   ShellExecute(Self.Handle,
             nil,
             'mailto:' +
             'manlio.laschena@gmail.com' +
             '?Subject=prova email' +
             '&Body=sono io Manlio',
             nil,
             nil,
             SW_NORMAL);
end;

end.
