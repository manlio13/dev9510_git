unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, ABSMain, Vcl.ExtCtrls, Vcl.DBCtrls, frxClass, frxDBSet,
  frxExportBaseDialog, frxExportPDF,System.UITypes,Vcl.Buttons;

 function GetAppVersionStr : string; forward;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Label4: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    ABSTable1: TABSTable;
    ABSQuery1: TABSQuery;
    ABSDatabase1: TABSDatabase;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    Button6: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    Button7: TButton;
    Location: TLabel;
    Button8: TButton;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;               //per inserire un chm serve caricare la unit
  versione:string;             //Vcl.HtmlHelViewer ed inserire
  dato:Integer;                //Application.HelpFile := '.\library.chm'; in .dpr
  N:array[1..50] of Integer;   //e settare in Form1 HelpContext ed HelpFile
  trova:Boolean   ;
implementation
uses
Unit2,Vcl.HtmlHelpViewer;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);        //form

  begin
     ABSDatabase1.DatabaseFilename:= ExtractFilePath(Application.ExeName)+'MyLibrary.ABS';
     ABSDatabase1.Connected:=True;
     ABSTable1.Active:=True;
     ABSDatabase1.Open;
     ABSTable1.TableName:='Cat';
     ABSTable1.Open;
     ABSTable1.Last;
     GetAppVersionStr;
     Form1.Caption:=Form1.Caption +': Library Catalogue, ver. ' + Versione;
     trova:=False;
  end;

procedure TForm1.Button1Click(Sender: TObject);  //ADD
Begin
   if (Edit1.Text='')OR (Edit2.Text='') or (Edit3.Text='') or (Edit4.Text='') then
     begin
     ShowMessage('Please fill in Data to be stored ');
     Exit;
     end else
      begin
           ABSTable1.ReadOnly:=False;
       ABSTable1.Append;
            ABSTable1.FieldByName('Title').AsString:=Edit1.Text;
            ABSTable1.FieldByName('Author').AsString:=Edit2.Text;
            ABSTable1.FieldByName('Row').AsString:=Edit3.Text;
            ABSTable1.FieldByName('Col').AsString:=Edit4.Text;
       ABSTable1.Post;
          Edit1.Text:='';
          Edit2.Text:='';
          Edit3.Text:='';
          Edit4.Text:='';
         ShowMessage('Uploaded');
         Exit;
       end;
end;

procedure TForm1.Button2Click(Sender: TObject);        //find
    var
    i,t:Integer;
 begin
     ABSTable1.Filtered:=False;
     ABSTable1.first;
    if ABSTable1.isEmpty then
    begin
       ShowMessage('There is nothing to find');
       Exit;
    end;
    t:=0;
    trova:=True;
     DataSource1.DataSet:=ABSQuery1;
    if ((Edit1.Text='') AND (Edit2.Text='') and (Edit3.Text='') and (Edit4.Text='')) then
     begin
     ShowMessage('The search for books can be done by Author or by Title'+#13+
     'or by Shelf indicating both the column and the row'+#13+'    Please fill data');
      Exit;
     end ;
       if Edit1.text<>'' then  t:=t+1;                        //per verificare che ci siano i soli dati necessari
       if Edit2.text<>'' then  t:=t+1;
       if (Edit3.text<>'')AND (Edit4.text<>'') then  t:=t+1;
       if (Edit3.text<>'')XOR (Edit4.text<>'') then  t:=2;
       if t>1 then
        begin
        Showmessage('Attention: wrong selection entry.');
        Button3Click(Self);
        Exit;
       end else
   begin
    if ((Edit1.Text<>'') AND (Edit2.Text='')) then
       with ABSQuery1 do
       begin
         Edit1.text:=LowerCase(Edit1.Text);
         Close;
         SQL.Text:='select * from Cat where lower(Title) like '+
          quotedstr('%'+Edit1.text+'%');
         ExecSQL;
         Open;
       end;
    if ((Edit1.Text='') AND (Edit2.Text<>'')) then
     begin
        Edit2.text:=LowerCase(Edit2.Text);
        with ABSQuery1 do
       begin
         Close;
         SQL.Text:='select * from Cat where lower(Author) like ' + quotedstr('%'+Edit2.text+'%');
         ExecSQL;
         Open;
       end;
     end;
    if ((Edit3.Text<>'') AND (Edit4.Text<>'')) then
     begin
        with ABSQuery1 do
       begin
         Close;     //notare il formato della notazione del query. Att.ai nomi riservati SQL
         SQL.Text:='SELECT * From Cat where Col='+ edit3.text+' AND row ='+Edit4.text;
         ExecSQL;
         Open;
       end;
     end;
   end;         //qui inizia l'utilizzo del risultato del query
       dato:=ABSQuery1.RecordCount;
     if dato>0 then
     with ABSQuery1  do
       begin
        ABSQuery1.First;   //costruisce una lista nell'array N dei Num trovati in ABSQuery
        while not EOF do
           begin
             for i:=1 to dato do   //indice deve inziare da 1 NON =0
             begin        //senza begin-end esegue tutto il ciclo
              N[i]:= FieldByName('Num').AsInteger;
                // ShowMessage(IntToStr(N[i]));
              ABSQuery1.Next;
              end;
          end;
       end else
     begin
       ShowMessage('Cannot find any record. Please check your entry.');

       Exit;
     end;
   end;

procedure TForm1.Button3Click(Sender: TObject);        //clear
begin
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='';
    Edit4.Text:='';
     DataSource1.DataSet:=ABSQuery1;
      with ABSQuery1 do
       begin
         Close;
         SQL.Text:='select * from Cat where Num=0'; //per cancellare la DBGrid perch� Num=0 � vuoto
         ExecSQL;
         Open;
        end;
   Form2.visible:=False;
     trova:=False;
 end;

procedure TForm1.Button4Click(Sender: TObject);   //List
 var
 k:integer ;
begin
   ABSTable1.Filtered:=False;
   ABSTable1.first;
   if ABSTable1.isEmpty then
            begin
              ShowMessage('There is nothing to list');
              Exit
            end;
      DataSource1.DataSet:=ABSQuery1;
   with ABSQuery1 do                                   //inserire il modulo TABSQuery
   begin                                               // cambiare in frsDBDataset1 il DataSet in ABSQuery1
      Close;                                           //scrivere queste righe di codice
      SQL.Text:='select * from cat ORDER BY Col ASC';
      ExecSQL;
      Open;
   end;
  trova:=False;
  frxReport1.ShowReport;
end;

procedure TForm1.Button5Click(Sender: TObject);     //Done
begin
      if MessageDlg('Do you want to quit? ',mtConfirmation, mbYesNo,0)=mrYes then
    begin
       ABSTable1.ReadOnly:=False;
       ABSDatabase1.Readonly:=False;
       ABSQuery1.Close;
       ABSTable1.close;
       ABSDatabase1.Close;
       application.Terminate;
    end else Exit;
end;

procedure TForm1.Button6Click(Sender: TObject);    //Empty DB
begin
   if MessageDlg('Attention ! You are going to erase all data.'+#13+'   DO YOU CONFIRM ?',mtConfirmation,mbYesNo,0)=mrYes then
       begin
        ABSTable1.Close;
        ABSTable1.EmptyTable;
       end  else Exit;

   end;

procedure TForm1.Button7Click(Sender: TObject);  //edit
     var
     S:array[1..50]of string;
     i:Integer;
     filtro:string;
 begin
      if trova=False then
      begin
      ShowMessage('Must use "Find" before you can Edit !' );
      Exit;
      end else
    begin
      with ABSTable1 do
      begin
         Filter:='';
         filtro:='';
         Filtered:=False;
         for i := 1 to dato do
          begin
            S[i]:='Num='+IntToStr(N[i]);
            if i=1 then
             Filtro:=S[1] else
            Filtro:=Filtro +' '+'OR'+' '+S[i];
         end;
          FilterOptions := FilterOptions + [foCaseInsensitive];
          Filter:=filtro;
          Filtered := True;

          DBGrid1.SetFocus;
          DBGrid1.DataSource.DataSet:=ABSTable1;

         if DBGrid1.DataSource.DataSet.IsEmpty then
         begin
           ShowMessage('There is nothing to edit !');
           Exit;
         end ;
        If DBGrid1.Selectedindex=0 then
          begin
           ShowMessage('Please click on the record to be edited.'+#13+
           'Use the Database Navigator to browse and edit' );
           Exit ;
          end ;
          trova:=False;
      end;
   end;
  end;

procedure TForm1.Button8Click(Sender: TObject);    //move
 begin
     ABSTable1.Filtered:=False;
    ABSTable1.first;      //per refresh
    if ABSTable1.isEmpty then
    begin
       ShowMessage('There is nothing to move');
        Exit;
    end;
    Form1.FormStyle:=fsNormal;  //altrimenti la InputBox non � visibile se fsStayOnTop
      if MessageDlg('Confirm you want to move all books'+#13+'from shelf A to shelf B (to be specified)',mtConfirmation,mbYesNo,0)= mrNo then
        Exit else  showmessage('You have confirmed to move a shelf of your library.');
        begin
          form2.visible :=True;
        end;


  end;

procedure TForm1.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
 if Button=nbPost then
  begin
   ShowMessage ('Field has been changed.');
   Button3Click(Self)
  end else Exit
  ;
end;

function GetAppVersionStr: string;     //routine per la versione
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
      versione:= Result+'                      Help :F1' ;
    end;
  end.
