unit Unit1;           // Release 2024.9.7 en
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Data.DB, ABSMain, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask,System.UITypes, Vcl.ComCtrls,System.DateUtils,JvSHFileOperation,JvBaseDlg,
  frxClass, frxDBSet, frxExportPDF, JvExStdCtrls, JvHtControls, JvExControls,
  JvDBLookup,System.Types,ShellAPI, frxExportBaseDialog;

  function GetAppVersionStr : string; forward;
type
  TForm1 = class(TForm)
    ABSDatabase1: TABSDatabase;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ABSTable1: TABSTable;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Edit5: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    ABSQuery1: TABSQuery;
    Button3: TButton;
    Edit6: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Label3: TLabel;
    Button7: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Button8: TButton;
    jvshfile1: TJvSHFileOperation;
    Button9: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    Label6: TLabel;
    DataSource2: TDataSource;
    ABSTable2: TABSTable;
    DBLookupComboBox: TDBLookupComboBox;
    JvDBLookupCombo1: TJvDBLookupCombo;
    JvDBLookupCombo2: TJvDBLookupCombo;
    Label7: TLabel;
    frxReport2: TfrxReport;
    Button10: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button9Click(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button10Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button11Click(Sender: TObject);

  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form1: TForm1;
  filtro,result,mom:string;
  somma:double;
  inizio:TDateTime;
  nk,salta,cambio:boolean;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 ABSDatabase1.DatabaseFileName:=ExtractFilePath(Application.ExeName)+'ecom.abs';
 ABSDatabase1.Open;
 ABSTable1.TableName:='ecomTB';
 ABSTable1.Open;
 ABSTable2.TableName:='ecom2TB';
 ABSTable2.Open;
 TFloatField(ABSTable1.FieldByName('Prezzo')).DisplayFormat := '0.00';
 TDateField(ABSTable1.FieldByName('DataOrd')).DisplayFormat := 'dd.mm.yy';
 TDateField(ABSTable1.FieldByName('DataPag')).DisplayFormat := 'dd.mm.yy';
 TDateField(ABSTable1.FieldByName('DataSped')).DisplayFormat := 'dd.mm.yy';
 TDateField(ABSTable1.FieldByName('DataCons')).DisplayFormat := 'dd.mm.yy';

 ABSTable1.Last;
 ABSTable1.Edit;
 ABSTable2.Edit;
 DataSource1.DataSet.Edit;
 //inizializzazione
 edit5.Text:='';
 Edit1.text := FormatDateTime('dd.mm.yyyy',Now);  //formattare una stringa
 edit2.Text:='';
 edit3.Text:='';
 edit4.Text:='';
 salta:=False;
 cambio:=False;
 try
  AbsTable1.First; { Go to first record, which sets Eof False }
  inizio:= ABSTable1.FieldByName('DataOrd').AsDateTime;
  Edit5.Text:= FormatDateTime('dd.mm.yyyy',inizio);
  Label4.Caption:='From '+ABSTable1.FieldByName('DataOrd').AsString;
  while (not AbsTable1.Eof) do { Cycle until Eof is True }
  begin
    somma:=somma+AbsTable1.FieldByName('prezzo').AsFloat;
    AbsTable1.Next; { Eof False on success; Eof True when Next fails on last record }
  end;
 finally
  Label3.Caption:='Total purchased =  : '+ floattostr(somma);
  if DaysBetween(Now,inizio)>0 then
   begin
      Label5.Caption:=FloatToStrF(Somma/(DaysBetween(Now,inizio)/30),ffFixed,4,2)+' for month';
      if ABSTable1.RecNo<0 then mom:='0' else mom := IntToStr(ABSTable1.RecNo);
      Label6.Caption:='N. items : '+ mom;
      somma:=0;
   end;
  
  end;
  Form1.Visible:=True;
   Form1.Caption:='Online orders control , ' + ' Version : '+ GetAppVersionStr;
end;


procedure TForm1.Button11Click(Sender: TObject);   //undelivered
begin
    var
   testo:string;
begin
      DataSource1.DataSet:=ABSQuery1;
        testo:='Select * from ecomTB where DataCons="" ';
    //   testo:= StringReplace(testo,',','.',[rfReplaceAll]);
        //SQL vuole il punto come separatore decimale
       with ABSQuery1 do
     begin
       close;
       SQL.text := testo;
       ExecSql;
       open;
       TFloatField(ABSQuery1.FieldByName('Prezzo')).DisplayFormat := '##0.00';
     end;
end;
end;

procedure TForm1.Button1Click(Sender: TObject);  //cerca
label vai;
var
 datafiltro:string;
 chi: array[1..3] of smallint;
  i: Integer;

begin
     i:=0;
            if edit2.text<>'' then
              begin
                i:=i+1;
                chi[i]:=2;
              end;
            if edit3.Text<>'' then
            begin
            i:=i+1;
            chi[i]:=3;
            end;
            if edit4.Text<>'' then
            begin
            i:=i+1;
            chi[i]:=4;
            end;

     if chi[3]>0 then
     begin
      filtro:=' Fornitore ='+ QuotedStr(Edit2.Text)+' AND  Prodotto LIKE '+quotedStr('%'+edit3.text+'%')+
      ' AND  MezzoPag= '+QuotedStr(Edit4.Text);
      goto vai;
     end;

     if chi[2]>0 then
        begin
          if (edit2.Text<>'') AND (edit3.Text<>'') then
              filtro:=' Fornitore ='+ QuotedStr(Edit2.Text)+' AND  Prodotto LIKE '+quotedStr('%'+edit3.text+'%');
          if (edit2.Text<>'') AND (edit4.Text<>'') then
              filtro:=' Fornitore ='+ QuotedStr(Edit2.Text)+' AND  MezzoPag= '+QuotedStr(Edit4.Text);
          if (edit3.Text<>'') AND (edit4.Text<>'') then
              filtro:=' Prodotto LIKE '+quotedStr('%'+edit3.text+'%')+' AND  MezzoPag= '+QuotedStr(Edit4.Text);
          goto vai;
        end;

      if chi[1]>0 then
        begin
          if (edit2.Text<>'')  then
              filtro:=' Fornitore ='+ QuotedStr(Edit2.Text);
          if (edit4.Text<>'')  then
              filtro:=' MezzoPag= '+QuotedStr(Edit4.Text);
          if (edit3.Text<>'')  then
              filtro:=' Prodotto LIKE '+quotedStr('%'+edit3.text+'%');
          goto vai;
        end;

     vai:
     DataSource1.DataSet:=ABSQuery1;
     with ABSQuery1 do
     begin
       close;
       if i=0 then
       SQL.text := 'select * from ecomTB' else
       SQL.text := 'select * from ecomTB where'+filtro;
       ExecSql;
       open;
       TFloatField(ABSQuery1.FieldByName('Prezzo')).DisplayFormat := '##0.00';
     end;
     datafiltro:= 'DataOrd <= '+ quotedStr(edit1.Text)+' AND DataOrd >= '+quotedStr(Edit5.Text);
     ABSQuery1.FilterOptions := [foCaseInsensitive];
     ABSQuery1.Filter := datafiltro;
     ABSQuery1.Filtered:=True;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edit5.Text:='01/02/2014';
  edit1.Text:=DateToStr(Now);
  edit2.Text:='';
  edit3.Text:='';
  edit4.Text:='';
  ABSQuery1.Close;
  DataSource1.DataSet:=ABSTable1;
  ABSTable1.Filtered:= False;
  ABSTable1.Last;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
        DataSource1.DataSet:=ABSTable1;
        ABSQuery1.Close;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
       DataSource1.DataSet:=ABSQuery1;
       edit6.Text:= StringReplace(edit6.text,',','.',[rfReplaceAll]);  //SQL vuole il punto come separatore decimale
       with ABSQuery1 do
     begin
       close;
       SQL.text := edit6.Text;
       ExecSql;
       open;
       TFloatField(ABSQuery1.FieldByName('Prezzo')).DisplayFormat := '##0.00';
     end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
         Edit6.Text:= 'select * from ecomTB ORDER by DataOrd Desc';
         Button4Click(Sender);
         Edit6.Text:= 'select * from ecomTB';
end;


procedure TForm1.Button6Click(Sender: TObject);  //azzera il database
begin
      if messageDlg('Do you really want to remove all data ?',mtConfirmation,mbYesNo,0)=mrNo then
       exit;
      ABSTable1.Close;
      ABSTable1.EmptyTable;
end;

procedure TForm1.Button7Click(Sender: TObject);   // Done
begin
        if cambio=True then
        if MessageDlg('Do you have data to confirm ?',
         mtconfirmation, [mbYes,mbNo], 0) = mrYes then
         Form1.DBNavigator1Click(nil,nbPost)else cambio:=False;

         if MessageDlg('Do you want to exit ?',
         mtconfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    //Button8Click;
    cambio:=False;
    DataSource1.DataSet:=ABSTable1;
    ABSQuery1.Close;
    ABSTable1.edit;
    ABSTable1.close;
    ABSDatabase1.Close;
    Form1.release;
    application.Terminate;
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);     //Backup
   var
   dir:string;
   dirList:TStringList;      //occorre creare un StringList perchè JVshFileOperation non accetta altro che da StingList
begin
   if MessageDlg('Do you confirm to backup the database ?',
             mtconfirmation, [mbYes,mbNo], 0) = mrYes then
     begin
         dirList:= TStringList.Create;      //inizializzare la string list
         ABSDatabase1.Close;
             if MessageDlg('Do you like to change the saving path ?',
             mtconfirmation, [mbYes,mbNo], 0) = mrYes then
               begin
                  dir:=InputBox('Enter the new path','Pls enter the whole path, ending by \','');  // creare la string
                  dir:=dir+'ecom.bkp';                                              //list passando attraverso una comune string
                  dirList.Add(dir) ;     // nuovo path

                  jvshfile1.DestFiles  :=dirList  ;

                end;
         JVSHFile1.Execute;
         ABSDatabase1.Open;
         ABSTable1.Open;
         if FileExists('ecom.bkp') then
         ShowMessage('Backup done') else
           begin
              ShowMessage('Error ! Failed backup');
              Exit;
           end;


       //  Ricordarsi di mettere in event OnClose -> Button10 e in Object explorer del componente JvsHFile1 il nome del database
      end else Exit;   //in source e in "destFile" il nome del bckup
end;


procedure TForm1.Button9Click(Sender: TObject);       //report
begin
   //occorre ordinare il database prima del rapporto         ISTRUZIONI
   with ABSQuery1 do                                   //inserire il modulo TABSQuery
   begin                                               // cambiare in frsDBDataset1 il DataSet in ABSQuery1
      Close;                                           //scrivere queste righe di codice
      SQL.Text:='select * from ecomTB ORDER BY DataOrd ASC';
      ExecSQL;
   end;
frxReport1.ShowReport;
end;

procedure TForm1.Button10Click(Sender: TObject); //Statistiche
begin
//occorre ordinare il database prima del rapporto         ISTRUZIONI
   with ABSQuery1 do                                   //inserire il modulo TABSQuery
   begin                                               // cambiare in frsDBDataset1 il DataSet in ABSQuery1
      Close;                                           //scrivere queste righe di codice
      SQL.Text:='select * from ecomTB ORDER BY Fornitore,DataOrd ASC';
      ExecSQL;
   end;
frxReport2.ShowReport;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
 var
 clnu:integer;       //per inserire in modo semiautomatica la data del giorno
begin
   cambio:=True;

   clnu:=DBGrid1.SelectedIndex;
  if (clnu = 0)or (clnu=4) or (clnu=6) or (clnu=7) then
    begin
     if dbgrid1.Columns.Items[clnu].Field.Value=null then
       begin
           ABSTable1.Edit;
        if MessageDlg('Do you want to enter today date ?',
             mtconfirmation, [mbYes,mbNo], 0) = mrYes then
             begin
               dbgrid1.Columns.Items[clnu].Field.Value:=DateToStr(Now);
               //ABSTable1.Post;
               Form1.DBNavigator1Click(nil,nbPost);
               Exit;
             end;
       end;

    end ;
   if (clnu=1) or (clnu=2) or (clnu=3) or (clnu=5) then ABSTable1.Edit;


end ;


procedure TForm1.DBGrid1ColExit(Sender: TObject);  //per rendere invisibile la dropBox
begin

   if DBGrid1.SelectedField.FieldName = JvDBLookupCombo1.DataField then
      begin
        DBGrid1.SetFocus;
        dbgrid1.SelectedIndex := 3;
        JvDBLookupCombo1.Visible := False;
      end;
   if DBGrid1.SelectedField.FieldName = JvDBLookupCombo2.DataField then
      begin
         DBGrid1.SetFocus;
        dbgrid1.SelectedIndex := 6;
        JvDBLookupCombo2.Visible := False;
      end;

end;


procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
  var
  clnu:Integer;        // per creare le combo box
begin

  if GetKeyState(VK_SHIFT)<0 //tests if shiftkey is down per inserire un nuovo dato nelle combobox
 then salta :=True;
   if salta=True then
     begin
        clnu:=DBGrid1.SelectedIndex;
          case clnu of
             2 :
            begin
              ABSTable2.Edit;
              salta:=False;
              Exit;                  //  fermato quì nella procedura di inserire un dato nuovo
            end;
             5 :
            begin
              ABSTable2.Edit;
              salta:=False;
              Exit;
            end;


          end;
     end;
   clnu:=DBGrid1.SelectedIndex;
  if (clnu = 2)or (clnu=5) then

   begin

        if ABSTable1.RecordCount>0 then
    begin
         with ABSQuery1 do   //costruire la tabella dei dati per le combobox
      begin
       close;
       SQL.text := 'SELECT DISTINCT Fornitore, MezzoPag from ecomTB';
       execSQL;
       open;
      end;
      ABSQuery1.First;
            // ShowMessage('numero di rec '+IntToStr(ABSQuery1.RecordCount));
      ABSTable2.close;
      ABSTable2.EmptyTable;
      ABSTable2.Open;
        while not ABSQuery1.eof do
      begin
        ABSTable2.Insert;
        ABSTable2.FieldByName('FRN').AsString:=ABSQuery1.FieldByName('Fornitore').AsString;
        ABSTable2.FieldByName('MP').AsString:=ABSQuery1.FieldByName('MezzoPag').AsString;
        ABSTable2.Post;
        ABSQuery1.Next;
      end;
      end;


         with JvDBLookupCombo1 do
        begin
          DataField:= 'Fornitore';   //dove va inserito il valore lookup
          LookupField:='FRN';
          LookupDisplay:='FRN';
          // if ABSTable1.FieldByName('Fornitore').AsString<>''then
          //    dbgrid1.SelectedIndex := 3;

        end;

          with JvDBLookupCombo2 do
        begin
          DataField:= 'MezzoPag';   //dove va inserito il valore lookup
          LookupField:='MP';
          LookupDisplay:='MP';
        end;

         if (gdFocused in State) then  //per dimensionare la finestra delle combobox
         begin
           if (Column.Field.FieldName = JvDBLookupCombo1.DataField) then
             with JvDBLookupCombo1 do
           begin
            Left := Rect.Left + DBGrid1.Left + 2;
            Top := Rect.Top + DBGrid1.Top + 2;
            Width := Rect.Right - Rect.Left;
            Width := Rect.Right - Rect.Left;
            Height := Rect.Bottom - Rect.Top;
            Visible := True;
           end;
         end;

       if (gdFocused in State) then
         begin
           if (Column.Field.FieldName = JvDBLookupCombo2.DataField) then
           with JvDBLookupCombo2 do
          begin
            Left := Rect.Left + DBGrid1.Left + 2;
            Top := Rect.Top + DBGrid1.Top + 2;
            Width := Rect.Right - Rect.Left;
            Width := Rect.Right - Rect.Left;
            Height := Rect.Bottom - Rect.Top;
            Visible := True;
          end;
        end;

   end; {else              // righe di codice eliminate perchè bloccavano la dbgrid quando
       if clnu=1 then      // si cliccava sul campo prodotto cioè clnu=1
     begin
       DBGrid1.SetFocus;
       // dbgrid1.SelectedIndex := 1;
     end;}

end;

procedure TForm1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
 var
 clnu:Integer;
begin
  clnu:=DBGrid1.SelectedIndex;
   case clnu of
     1,3,4 :
      if Key=#13 then
        begin
            DBGrid1.SetFocus;
            dbgrid1.SelectedIndex := (clnu+1);
        end;
     6,7 :
        if Key=#13 then
        Exit;
   end;

end;

procedure TForm1.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
           var
   d1,d2,d3:TDate;

  begin

     if (Button = nbInsert) then
       begin
          ABSTable1.Append;
          DBGrid1.SetFocus;
        dbgrid1.SelectedIndex := 1;

       end;

     if (Button = nbPost)  then
    begin
         ABSTable1.First;
         while not ABSTable1.Eof do   //lo scan serve per consentire più di una modifica/aggiunta
          begin
           Form1.Visible:=False;
             d1:=ABSTable1.FieldByName('DataOrd').AsDateTime;
             d2:=ABSTable1.FieldByName('Datacons').AsDateTime;
             d3:=ABSTable1.FieldByName('DataSped').AsDateTime;
              if (d2<d1) and (d2>0) then
                 ShowMessage('Date error');
                  if d2>d1 then
            begin
               ABSTable1.Edit;
               ABSTable1.FieldByName('delta').AsInteger:= DaysBetween(d2,d1);
               ABSTable1.FieldByName('delta2').AsInteger:= DaysBetween(d2,d3);
               ABSTable1.Post;
            end else
              if d1>inizio then
            begin
              ABSTable1.Edit;
              ABSTable1.Post;
            end else
            begin
               ShowMessage('Order date error');
               Exit;
            end;
            ABSTable1.Next;
          end;
         // Form1.Visible:=True;
           FormCreate(Self);
    end;
  end;

 { function GetAppVersionStr: string;
  var                                             // prima alternativa per la versione ed un decimale
    Rec: LongRec;
  begin
    Rec := LongRec(GetFileVersion(ParamStr(0)));
    Result := Format('%d.%d', [Rec.Hi, Rec.Lo])
  end; }

  function GetAppVersionStr: string;         // seconda versione per una versione completa
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
      [LongRec(FixedPtr.dwFileVersionMS).Hi,  //major
       LongRec(FixedPtr.dwFileVersionMS).Lo,  //minor
       LongRec(FixedPtr.dwFileVersionLS).Hi,  //release
       LongRec(FixedPtr.dwFileVersionLS).Lo]) //build
  end;


end.
