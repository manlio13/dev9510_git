unit Unit1;        //TagStore 240425 versione 1 pre-release

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
    Bevel1: TBevel;
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
    procedure ClearBClick(Sender: TObject);
    procedure EditBClick(Sender: TObject);
    procedure PreviousBClick(Sender: TObject);
    procedure Stato(nn:Integer);
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
  num,n,nn:Integer;
  setnew,setedit:Boolean;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);        //Form create
begin
    if FileExists('TSdata.ABS') then
     begin
      dir:= ExtractFilePath(Application.ExeName)+'TSdata.ABS';
     end else
     begin
       ShowMessage('Unexpected error. Please verify program installation.');
       application.Terminate;
     end;
  ABSDatabase1.DatabaseFilename  :=dir;
  ABSDatabase1.Open;
  ABSTable1.TableName:='TS';
  DataSource1.DataSet:=ABSTable1;
  ABSTable1.Open;
  GetAppVersionStr;
  n:=ABSTable1.RecordCount;
  caption:=caption + '  - ver: '+versione +'  number of records = '+IntToStr(n);
  ABSTable1.close ;
   Label4.caption:='To make an entry click on New';
   Stato(n);
   // BrowseB.Enabled:=False;
   // ResetB.Enabled:=False;
    PrintB.Enabled:=False;
    EditB.Enabled:=False;
    NextB.Enabled:=False;
    PreviousB.Enabled:=False;
    DeleteB.Enabled:=False;
    ClearB.Enabled :=False;
    setnew:=False;
    setedit:=False;

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
          Stato(n);
     if n>0 then
      Label4.Caption:='Dataset of '+IntToStr(n)+' records. First record.'else
             Label4.Caption:='only one record.';
         Stato(n);


    end
end;

procedure TForm1.ClearBClick(Sender: TObject);        //clear
begin
   DataSource1.DataSet:=ABSTable1;
   ABSTable1.open;
   if (setnew=True) and (DBMemo1.text<>'') then
   begin
     ABSTable1.Delete;
     setnew:=False;
     Label4.Caption:='New record cleared. Click new again if necessary';
   end;
   n:=ABSTable1.RecordCount;
   Edit1.text:='';
   DBMemo1.Clear;
   DBEdit1.text:='';
   DBEdit2.text:='';
   DBEdit3.text:='';
   PrintB.Enabled:=False;
   EditB.Enabled:=False;
   NextB.Enabled:=False;
   PreviousB.Enabled:=False;
   DeleteB.Enabled:=False;
   ClearB.Enabled :=False;
   BrowseB.Enabled:=True;
   setnew:=False;
   setedit:=False;
   if n=0 then
   begin
     BrowseB.Enabled:=False;
     DeleteB.Enabled:=False;
     FindB.Enabled:= False;
     ResetB.Enabled:=False;
   end;

   Caption:='';
   Caption:='TagStore' + '  - ver: '+versione +
           '  number of records = '+IntToStr(n);
   Label4.Caption:='Cleared. To make an entry click on New';
end;

procedure TForm1.EditBClick(Sender: TObject);     //edit
begin

   if ABSQuery1.IsEmpty =False then         //trova il numero del record
   num:=ABSQuery1.FieldByName('numero').AsInteger else
      begin
       DataSource1.Dataset:=ABSTable1;
       ABSTable1.open;
       num:=ABSTable1.FieldByName('numero').AsInteger;
      end;
  DataSource1.Dataset:=ABSTable1;
  ABSTable1.open;
  if not ABSTable1.locate('numero',IntToStr(num),[]) then
  begin
   Label4.caption:='Error: no record to edit found.';
   Exit;
  end else
  if MessageDlg('Edit This Record?', mtConfirmation, mbYesNoCancel, 0) <> mrYes then
    Exit else
    ABSQuery1.Close;
    ABSTable1.Edit;
    setedit:=True;
    Label4.caption:='Edit record and click on save.';
end;


procedure TForm1.NewBClick(Sender: TObject);  //New
begin
  DataSource1.DataSet:=ABSTable1;
  ABSTable1.Open;
  ABSTable1.Last;
  ABSTable1.Edit; //serve perchè se si è al secondo click non si può salvare
  DBMemo1.SetFocus;  //perchè non in edit mode
  if setnew=True then
   begin
    Label4.caption:= 'New record already created.';
    Exit;
   end else
     begin
      ABSTable1.append;
      setnew :=True;
      Label4.Caption:='New record created.Fill Memo && One or more Tag, Click on Save';
      FindB.Enabled:=False;
      BrowseB.Enabled:=False;
      ClearB.Enabled:=True; //se si vuol correggere l'Entry
      Form1.BorderIcons:=[ ];
      end;
  end;


procedure TForm1.SaveBClick(Sender: TObject);   //Save
begin

   if (setnew=False) and (setedit=false) then
    begin
     Label4.Caption:= 'There is noting to save.';
     Exit;
    end;

  if (DBMemo1.text='')or((DBEdit1.text='') and (DBEdit2.text ='') and (DBEdit3.text = '')) then
    begin
      Label4.Caption:= 'Record has not been correctly filled.';
      DeleteB.enabled:=True;
      Exit;
    end
    else
       begin
          ABSTable1.Post;
          Label4.Caption:='Record saved.';
          setnew:=False;
          setedit:=False;
          //ABSTable1.last;
          n:=ABSTable1.RecordCount;
           Caption:='';
           Caption:='TagStore' + '  - ver: '+versione +
           '  number of records = '+IntToStr(n);
          Stato(n);
        end;
end;

procedure TForm1.Stato(nn: Integer);        //Stato
begin
  if nn=0 then
  begin
    FindB.Enabled:= False;
    BrowseB.Enabled:=False;
    ResetB.Enabled:=False;
    PrintB.Enabled:=False;
    EditB.Enabled:=False;
    NextB.Enabled:=False;
    PreviousB.Enabled:=False;
    DeleteB.Enabled:=False;
    ClearB.Enabled :=False;
  end else
   if nn=1 then
  begin
    FindB.Enabled:= True;
    BrowseB.Enabled:=True;
    ResetB.Enabled:=True;
    PrintB.Enabled:=True;
    EditB.Enabled:=True;
    NextB.Enabled:=True;
    PreviousB.Enabled:=True;
    DeleteB.Enabled:=True;
    ClearB.Enabled:=True;
  end else
   if nn>1 then
  begin
    FindB.Enabled:= True ;
    BrowseB.Enabled:=True;
    ResetB.Enabled:=True;
    PrintB.Enabled:=True;
    EditB.Enabled:=True;
    NextB.Enabled:=True;
    PreviousB.Enabled:=True;
    DeleteB.Enabled:=True;
    ClearB.Enabled:=True;
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
      //NextB.Enabled:=False;
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
            BrowseB.Enabled:=False;
            EditB.Enabled:=True;
            ClearB.Enabled:=True;
            Edit1.text:='';
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
  if ABSQuery1.IsEmpty =True then //per utillizzare next senza il query
   begin
    // num:=ABSTable1.FieldByName('numero').AsInteger;
       DataSource1.DataSet:=ABSTable1;
       ABSTable1.open;
       ABSTable1.Next;
       Exit;
   end;

  ABSQuery1.Next;              //br =0 per usare next con find
  if ABSQuery1.eof=True then
    begin
     if br=0 then Label4.Caption:='No more records with requested tag !'else
     Label4.caption:='Last record.';
      Edit1.text:='';   //cancella il tag di ricerca
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
     DataSource1.DataSet:=ABSQuery1;
    if ABSQuery1.RecordCount>0 then
    num:=ABSQuery1.FieldByName('numero').AsInteger else
    begin
      DataSource1.Dataset:=ABSTable1;
      ABSTable1.open;
      num:=ABSTable1.FieldByName('numero').AsInteger;
    end;

      DataSource1.Dataset:=ABSTable1; //comunque si arriva ad ABSTable1
      ABSTable1.open;
    if not ABSTable1.locate('numero',IntToStr(num),[]) then
    begin
      Label4.caption:='Error: no record to delete found.';
      Exit;
    end else
    if MessageDlg('Delete This Record?', mtConfirmation, mbYesNoCancel, 0) <> mrYes then
      begin
      ABSTable1.Close;
       Exit ;
      End else
      ABSTable1.Delete;
      Label4.caption:='Record deleted.';
      ABSQuery1.Close;
      if setnew=True then
      begin
       setnew:=False;
       Form1.BorderIcons:=[biSystemMenu];
      end;
      ClearBClick(Self);
end;

procedure TForm1.DoneBClick(Sender: TObject);   //Done
begin
  if (setnew=True) and (DBMemo1.text='') and (DBEdit1.text='') and (DBEdit2.text='')
   and (DBEdit3.text='') then
   begin
    //ABSTable1.open;
    //ABSTable1.edit;
    ABSTable1.close;
    ABSDatabase1.Close;
    Form1.release;
    application.Terminate;
   end else
   if setnew=True then
  begin
    Label4.caption:='A new record has been created and not filled.';
   DataSource1.DataSet :=ABSTable1;
    ABSTable1.open;
    ABSTable1.Edit;
     Form1.BorderIcons:=[ ];
    //Exit;  }
  end else
  begin
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
      DataSource1.DataSet:=ABSTable1;
      ABSTable1.Open;
      if ABSTable1.RecordCount=0 then
       begin
         Label4.caption:='Database is empty. Nothing to reset.';
         Exit;
       end;
      if messageDlg('Do you really want to erase all data ?',mtConfirmation,mbYesNo,0)=mrNo then
       exit;
      ABSTable1.Close;
      ABSTable1.EmptyTable;
      setnew:=False;
      setedit:=False;
      Label4.caption:='Database reset done.';
      Caption:='';
      Caption:='TagStore' + '  - ver: '+versione +
           '  number of records = '+IntToStr(0);
      stato(0);

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
