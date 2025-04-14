unit Unit1;        //TagStore 5/12/2021 versione 1 preliminare

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ABSMain, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Mask,System.UITypes, frxClass, frxDBSet;

type
  TForm1 = class(TForm)
    ABSDatabase1: TABSDatabase;
    ABSTable1: TABSTable;
    DBMemo1: TDBMemo;
    NewB: TButton;
    SaveB: TButton;
    FindB: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    NextB: TButton;
    DeleteB: TButton;
    DoneB: TButton;
    Label4: TLabel;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Edit1: TEdit;
    Label5: TLabel;
    ABSQuery1: TABSQuery;
    PrintB: TButton;
    ResetB: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    PreviousB: TButton;
    BrowseB: TButton;
    ClearB: TButton;
    EditB: TButton;
    procedure FormCreate(Sender: TObject);
    procedure NewBClick(Sender: TObject);
    procedure DoneBClick(Sender: TObject);
    procedure SaveBClick(Sender: TObject);
    procedure DeleteBClick(Sender: TObject);
    procedure FindBClick(Sender: TObject);
    procedure NextBClick(Sender: TObject);
    procedure ResetBClick(Sender: TObject);
    procedure PrintBClick(Sender: TObject);
    procedure BrowseBClick(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure ClearBClick(Sender: TObject);
    procedure EditBClick(Sender: TObject);
    procedure PreviousBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetAppVersionStr: string;
  end;

var
  Form1: TForm1;
  dir,versione :string;
  br :SmallInt;
  num,n :Integer;
  setnew:Boolean;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);        //Form create
begin
  dir:= ExtractFilePath(Application.ExeName)+'TSdata.ABS';
  ABSDatabase1.DatabaseFilename  :=dir;
  ABSDatabase1.Open;
  ABSTable1.TableName:='TS';
  DataSource1.DataSet:=ABSTable1;
  ABSTable1.Open;
  //ABSTable1.Last;
  //ABSTable1.Append;
  GetAppVersionStr;
  caption:=caption + '  - ver: '+versione;
  br:=0;
  n:=ABSTable1.RecordCount;
  if n=0 then
  begin
    FindB.Enabled:= False;
    BrowseB.Enabled:=False;
    ResetB.Enabled:=False;
    PrintB.Enabled:=False;
    EditB.Enabled:=False;
    NextB.Enabled:=False;
    PreviousB.Enabled:=False;
    DeleteB.Enabled:=False;
    Label4.caption:='To make an entry type text and one or more Tag. Then click on save. Or you can use Find.';

  end else
  Begin
    BrowseB.Enabled:=True;
    NextB.Enabled:=True;
    PreviousB.Enabled:=True;
    DeleteB.Enabled:=True;
    ClearB.Enabled:=True;
  End;

  if n=1 then
  begin
    FindB.Enabled:= False;
    BrowseB.Enabled:=False;
    ResetB.Enabled:=True;
    PrintB.Enabled:=True;
    EditB.Enabled:=True;
    NextB.Enabled:=False;
    PreviousB.Enabled:=False;
    DeleteB.Enabled:=True;
  end else if n>1 then
  begin
    FindB.Enabled:= True ;
    BrowseB.Enabled:=True;
    ResetB.Enabled:=True;
    PrintB.Enabled:=True;
    EditB.Enabled:=True;
    NextB.Enabled:=True;
    PreviousB.Enabled:=True;
    DeleteB.Enabled:=True;
  end;


end;


procedure TForm1.BrowseBClick(Sender: TObject);       //Browse
var
n:Integer;
begin
 br:=1;
  Edit1.Text:='';
  DataSource1.DataSet:=ABSQuery1;
          with ABSQuery1 do
        begin
         Close;
         SQL.Text:='Select * from TS';
         ExecSQL;
         Open;
          n:=ABSQuery1.RecordCount;
          if n>0 then
          begin
             NextB.enabled:=True;
             PreviousB.Enabled:=True;
             Label4.Caption:='Dataset of '+IntToStr(n)+' records.';
          end;
        // Button5.Enabled:=True;
        // Button11.Enabled:=True;
         //Button12.Enabled:=True;

       end;
end;

procedure TForm1.ClearBClick(Sender: TObject);        //clear
begin

   DBMemo1.Clear;
  
end;

procedure TForm1.EditBClick(Sender: TObject);     //edit
begin
   num:=ABSQuery1.FieldByName('numero').AsInteger;
  if not ABSTable1.locate('numero',IntToStr(num),[]) then
  begin
   Label4.caption:='Error: no record to edit found.';
   Exit;
  end else
  if MessageDlg('Edit This Record?', mtConfirmation, mbYesNoCancel, 0) <> mrYes then
    Abort else
    DataSource1.Dataset:= ABSTable1;
    ABSTable1.Edit;
    Label4.caption:='Edit record and click on save.';
end;

procedure TForm1.NewBClick(Sender: TObject);  //New
begin
  DataSource1.DataSet:=ABSTable1;
  ABSTable1.Open;
  ABSTable1.Last;
  DBMemo1.SetFocus;
  ABSTable1.Edit;
  if setnew=True then
   begin
    Label4.caption:= 'New record already created.';
    Exit;
   end else
     begin
      ABSTable1.Append;
      setnew :=True;
      //Button2.Enabled:=True;
      Label4.Caption:='New record created.Fill Memo && One or more Tag, Click on Save';
     end;
  end;


procedure TForm1.SaveBClick(Sender: TObject);   //Save
begin
  if (DBEdit1.text='') and (DBEdit2.text ='') and (DBEdit3.text = '') then
    begin
      //ShowMessage('Tab data cannot be empty!');
      Label4.Caption:= 'Type at least one Tag!';
      Exit;
    end
    else
       begin
          ABSTable1.Post;
          Label4.Caption:='Record saved.';
          ABSTable1.last;
          //STable1.Append;
        end;
end;

procedure TForm1.FindBClick(Sender: TObject);   //find

begin
  if Edit1.text='' then
   begin
     Label4.Caption:='Enter tag text to find';
     Exit;
   end
     else
     begin
      NextB.Enabled:=False;
      DataSource1.DataSet:=ABSQuery1;
          with ABSQuery1 do
        begin
         Close;
         SQL.Text:='Select * from TS where tag1 ='+ quotedstr(Edit1.text)+'OR tag2='+
         QuotedStr(Edit1.text) +'OR tag3='+QuotedStr(Edit1.text);;
         ExecSQL;
           Open;
          n:=RecordCount ;
          Label4.Caption:='Found '+IntToStr(n)+' records with requested tag';
          if n>0 then
          begin
            NextB.Enabled:=True;
            PreviousB.Enabled:=True;
           // Button5.Enabled:=True;
           // Button11.Enabled:=True;
           // Button12.Enabled:=True;
          end else
                begin
                  Edit1.text:='';
                  Exit;
                end;
         end;
     end;
end ;

procedure TForm1.NextBClick(Sender: TObject); //next
begin
  DataSource1.DataSet:=ABSQuery1;
  if ABSQuery1.IsEmpty =True then
   begin
    // num:=ABSTable1.FieldByName('numero').AsInteger;
       DataSource1.DataSet:=ABSTable1;
       ABSTable1.Next;
       Exit;
   end;

 // DataSource1.DataSet:=ABSQuery1;
  ABSQuery1.Next;
  if ABSQuery1.eof=True then
    begin
     if br=0 then Label4.Caption:='No more records with requested tag !'else
     Label4.caption:='Last record.';
      Edit1.text:='';
      NextB.enabled:=False;
      Exit;
    end else
          begin
           if br=0 then Label4.Caption:='Next record with requested tag !'else
            Label4.caption:='Next record';
           PreviousB.Enabled:=True;
           end;
end;

procedure TForm1.DeleteBClick(Sender: TObject);     //delete
begin
  num:=ABSQuery1.FieldByName('numero').AsInteger;
  if not ABSTable1.locate('numero',IntToStr(num),[]) then
  begin
   Label4.caption:='Error: no record to delete found.';
   Exit;
  end else
  if MessageDlg('Delete This Record?', mtConfirmation, mbYesNoCancel, 0) <> mrYes then
    Abort else
    ABSTable1.Delete;
    Label4.caption:='Record deleted.';
    setnew:=False;
   //Button2.Enabled:=False;
   //Button5.Enabled:=False;
   //Button11.Enabled:=False;
   //Button12.Enabled:=False;
   NextB.Enabled:=False;
   PreviousB.Enabled:=False;
    DataSource1.DataSet:=ABSTable1; //sembra che dal browse il datasource sia sempre ABSQuery
    ABSTable1.append;      //quindi occorre ritornare su ABSTable1 per usare append
end;


procedure TForm1.DoneBClick(Sender: TObject);   //Done
begin
  if setnew=True then
  begin
    Label4.caption:='A new record has been created and not filled.';
    ABSTable1.last;
    //Button11.enabled:=True;
  end else
  begin
    ABSTable1.edit;
    ABSTable1.close;
    ABSDatabase1.Close;
    Form1.release;
    application.Terminate;
  end;
end;

procedure TForm1.PrintBClick(Sender: TObject);    //Print
begin
  if ABSQuery1.IsEmpty =True then
   begin
     Label4.caption:='Print can be used only after Find or Browse';
     Exit;
   end;

  frxDBDataSet1.RangeBegin := rbCurrent;
  frxDBDataSet1.RangeEnd := reCurrent;
  frxReport1.ShowReport;
  Label4.caption:='Printing';
end;


procedure TForm1.ResetBClick(Sender: TObject);   //reset
begin
  if messageDlg('Do you really want to erase all data ?',mtConfirmation,mbYesNo,0)=mrNo then
       exit;
      DataSource1.DataSet:=ABSTable1;
      ABSTable1.Open;
      ABSTable1.Close;
      ABSTable1.EmptyTable;
      setnew:=False;
      ABSTable1.Open;
      ABSTable1.Last;
      ABSTable1.append;
      DBMemo1.SetFocus;
      ABSTable1.Edit;
  Label4.caption:='To make an entry type text and one or more Tag.'+
   ' Then click on save. Or you can use Find.';
end;


procedure TForm1.PreviousBClick(Sender: TObject);   // prior
begin
  DataSource1.DataSet:=ABSQuery1;
  if ABSQuery1.IsEmpty =True then
   begin
    // num:=ABSTable1.FieldByName('numero').AsInteger;
       DataSource1.DataSet:=ABSTable1;
       ABSTable1.Prior;
       Exit;
   end;

  ABSQuery1.Prior;
  NextB.enabled:=True;
  if ABSQuery1.RecNo =1 then
    begin
      if br=0 then Label4.Caption:='This is the first record with requested tag !'else
      Label4.caption:='First record.';
      Edit1.text:='';
      PreviousB.enabled:=False;
      Exit;
    end else
    if br=0 then Label4.Caption:='Previous record with requested tag !'else
    Label4.caption:='Previous record';
end;


procedure TForm1.DBMemo1Change(Sender: TObject);  // di servizio
begin
  ClearB.enabled:=True;
end;


function TForm1.GetAppVersionStr: string;       //versione
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
