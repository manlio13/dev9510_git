unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,System.Types,System.UITypes,
  Data.DB, ABSMain, Vcl.StdCtrls, Vcl.Controls,Vcl.Graphics,
   Vcl.Forms, Vcl.Dialogs,frxClass, frxDBSet, frxExportPDF, Unit2,EBase,Vcl.DBCtrls;

   function GetAppVersionStr : string; forward;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ABSDatabase1: TABSDatabase;
    ABSQuery1: TABSQuery;
    ABSTable1: TABSTable;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    DataSource1: TDataSource;
    frxReport1: TfrxReport;

    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  versione:string;
  ricorda :Integer;
implementation

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
  ABSMain.StartDisconnected:=True;      //consigliato da Absolute Database support
  ABSDatabase1.DatabaseFilename:= ExtractFilePath(Application.ExeName)+'LibCat.ABS';
  ABSDatabase1.Open;
 // showmessage(ABSDatabase1.Databasefilename);
  ABSTable1.TableName:='Cat';
  ABSTable1.Open;
  ABSTable1.Last;
  GetAppVersionStr;
  Form1.Caption:=Form1.Caption +': Books Catalogue, ver. ' + Versione;
end;

procedure TForm1.Button1Click(Sender: TObject);              //Add
begin
   if (Edit1.Text='')OR (Edit2.Text='') or (Edit3.Text='') or (Edit4.Text='') then
     begin
     ShowMessage('Please fill in Data to be stored ');
     Exit;
     end else
      begin
       ABSTable1.Append;
            ABSTable1.FieldByName('Title').AsString:=Edit1.Text;
            ABSTable1.FieldByName('Author').AsString:=Edit2.Text;
            ABSTable1.FieldByName('Row').AsString:=Edit3.Text;
            ABSTable1.FieldByName('Column').AsString:=Edit4.Text;
       ABSTable1.Post;
          Edit1.Text:='';
          Edit2.Text:='';
          Edit3.Text:='';
          Edit4.Text:='';
         ShowMessage('Uploaded');
         Exit;
       end;

end;

procedure TForm1.Button3Click(Sender: TObject);        //Find

begin
      DataSource1.DataSet:=ABSQuery1;
    if ((Edit1.Text='') AND (Edit2.Text='')) then
     begin
     ShowMessage('Please fill in Title-Box or Author-Box string to be searched');
      Exit;
     end else
       if ((Edit1.Text<>'') AND (Edit2.Text<>'')) then
        begin
       Showmessage('Only one field can be searched at time')
       end else

   if ((Edit1.Text<>'') AND (Edit2.Text='')) then
     begin

       with ABSQuery1 do
       begin
         Close;
         SQL.Text:='select * from Cat where Title like '+ quotedstr('%'+Edit1.text+'%');
         ExecSQL;
         Open;
       end;
     end else
     begin
        with ABSQuery1 do
       begin
         Close;
         SQL.Text:='select * from Cat where Author like ' + quotedstr('%'+Edit2.text+'%');
         ExecSQL;
         Open;
       end;
     end;
      Form1.Visible:=False;
      Form2.Visible:=True;
    //Exit;
end;

procedure TForm1.Button4Click(Sender: TObject);
                                                          //List

begin
   DataSource1.DataSet:=ABSQuery1;
   with ABSQuery1 do                                   //inserire il modulo TABSQuery
   begin                                               // cambiare in frsDBDataset1 il DataSet in ABSQuery1
      Close;                                           //scrivere queste righe di codice
      SQL.Text:='select * from cat ORDER BY Column ASC';
      ExecSQL;
     // Open;
   end;

  frxReport1.ShowReport;

end;

procedure TForm1.Button5Click(Sender: TObject);     //Exit

begin
  if MessageDlg('Do you want to quit? ',mtConfirmation, mbYesNo,0)=mrYes then
  begin
  ABSQuery1.Close;
  ABSTable1.edit;
  ABSTable1.close;
  ABSDatabase1.Close;
  Form1.release;
  application.Terminate;
  end else Exit;
end;


function GetAppVersionStr: string;
var
Exe: string;
Size, Handle: DWORD;
Buffer: TBytes;
FixedPtr: PVSFixedFileInfo;
begin
Exe := ParamStr(0);
Size := GetFileVersionInfoSize(PChar(Exe), Handle);
if Size = 0 then
RaiseLastOSError;
SetLength(Buffer, Size);
if not GetFileVersionInfo(PChar(Exe), Handle, Size, Buffer) then
RaiseLastOSError;
if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
RaiseLastOSError;
Result := Format('%d.%d.%d.%d',
[LongRec(FixedPtr.dwFileVersionMS).Hi, //major
LongRec(FixedPtr.dwFileVersionMS).Lo, //minor
LongRec(FixedPtr.dwFileVersionLS).Hi, //release
LongRec(FixedPtr.dwFileVersionLS).Lo]); //build
versione:= Result;
end;

end.
