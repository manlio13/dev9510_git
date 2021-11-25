unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ABSMain, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    ABSDatabase1: TABSDatabase;
    ABSTable1: TABSTable;
    DBMemo1: TDBMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Label4: TLabel;
    DBText1: TDBText;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  dir :string;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
dir:= ExtractFilePath(Application.ExeName)+'TSdata.ABS';
ABSDatabase1.DatabaseFilename  :=dir;
ABSDatabase1.Open;
ABSTable1.TableName:='TS';
ABSTable1.Open;
end;

procedure TForm1.Button1Click(Sender: TObject);  //New
begin
  ABSTable1.Insert;
  ABSTable1.Edit;
  Label4.Caption:='New record created.Fill Memo && One or more Tab, Click on Save';

end;

procedure TForm1.Button6Click(Sender: TObject);   //Done
begin
   ABSTable1.edit;
    ABSTable1.close;
    ABSDatabase1.Close;
    Form1.release;
    application.Terminate;
end;
end.
