unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Label1: TLabel;
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
uses      //volendo usare i dati presenti nel form1 occorre inserire la unit1
          // negli uses della unit2, MA nell'IMPLEMENTATION, mentre la unit2 è
          // inserita negli uses dell'INTERFACE di unit1.
unit1;
procedure TForm2.Button1Click(Sender: TObject);
begin
close;
end;

end.

