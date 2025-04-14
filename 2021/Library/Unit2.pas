unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Data.DB,System.UITypes;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
<<<<<<< HEAD
=======
    Edit5: TEdit;
    Edit6: TEdit;
    Label7: TLabel;
    Label8: TLabel;
>>>>>>> 2bf46da135a59f236260ba97a57c71df11ee62b0
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
 uses
 Unit1;
{$R *.dfm}

<<<<<<< HEAD
procedure TForm2.Button1Click(Sender: TObject);     //acquisisce coordinate
    begin
   if (Edit1.text='') or (Edit2.Text='') or (Edit3.text='') or (Edit4.text='') then
=======
procedure TForm2.Button1Click(Sender: TObject);     // START     acquisisce coordinate
    begin
   if (Edit1.text='') or (Edit2.Text='') or (Edit3.text='') or (Edit4.text='') or (Edit5.text='') then
>>>>>>> 2bf46da135a59f236260ba97a57c71df11ee62b0
   begin
    ShowMessage('Wrong or incomplete entry !'+#13+'Clear to reset');
      Exit;
   end;
<<<<<<< HEAD
  if messagedlg ('Please check carefully coordinates of shelfs.',mtConfirmation,mbYesNo,0)=mrNo then
=======
  if messagedlg ('Please check carefully coordinates of shelfs. NO to redo.',mtConfirmation,mbYesNo,0)=mrNo then
>>>>>>> 2bf46da135a59f236260ba97a57c71df11ee62b0
    begin
      Form2.visible:=False;
      Edit1.text:='';
      Edit2.text:='';
      Edit3.text:='';
      Edit4.text:='';
      Exit
    end;
<<<<<<< HEAD
  if MessageDlg('Books on shelf ('+edit1.text+','+edit2.text+') will be moved to shelf ('+edit3.text+','+edit4.text+')',mtConfirmation,mbYesNO,0)=mrNo then
=======
  if MessageDlg('Books on shelf ('+edit1.text+','+edit2.text+')of Library '+edit5.text+
    ' will be moved to shelf ('+edit3.text+','+edit4.text+')of Library '+edit6.text,mtConfirmation,mbYesNO,0)=mrNo then
>>>>>>> 2bf46da135a59f236260ba97a57c71df11ee62b0
    begin
     Form2.visible:=False;
     Edit1.text:='';
     Edit2.text:='';
     Edit3.text:='';
     Edit4.text:='';
     Exit
    end  else
   begin
      Form1.DataSource1.DataSet:=Form1.ABSQuery1;
     with Form1.ABSQuery1 do
     begin
<<<<<<< HEAD
      Close;        //fare grande attenzione alla notazione usata per redigere il query
      SQL.Text:='select * from Cat where col='+edit1.text+' AND row='+edit2.text;
      ExecSQL;
      if Form1.ABSQuery1.isEmpty then
           ShowMessage('Wrong or incomplete entry !'+#13+'Clear to reset');
           Exit;
     end;
   end;
   begin
     Form1.DataSource1.DataSet:=Form1.ABSQuery1;
     with Form1.ABSQuery1 do
     begin
      Close;        //fare grande attenzione alla notazione usata per redigere il query
      SQL.Text:='UPDATE Cat set col='+edit3.text+',row='+edit4.text+' where col='+edit1.text+' AND row='+edit2.text;
      ExecSQL;
     // Open;
     end;
   end;
=======
        Close;        //fare grande attenzione alla notazione usata per redigere il query
      SQL.Text:='select * from Cat where Col= '+edit1.text+' AND Row= '+edit2.text +
      ' AND lower(Location) like ' + quotedstr('%'+Edit5.text+'%');
      ExecSQL;
      open;
        if Form1.ABSQuery1.FieldCount =0    then //verifica l'esistenza dei record
           begin
           ShowMessage('Wrong or incomplete entry !'+#13+'Clear to reset');
           Exit;
           end;
       // Form1.DataSource1.DataSet:=Form1.ABSQuery1;
        with Form1.ABSQuery1 do
       begin
         Close;        //fare grande attenzione alla notazione usata per redigere il query
         SQL.Text:='UPDATE Cat set col= '+quotedstr(edit3.text)+',row= '+ quotedstr(edit4.text)+',Location= '
         +quotedstr(edit6.text)+ ' where col='+quotedstr(edit1.text)+ ' AND row='+quotedstr(edit2.text) +
         'AND Location= '+quotedstr(edit5.text);
         ExecSQL;
         //Open;
       end;
     end;
>>>>>>> 2bf46da135a59f236260ba97a57c71df11ee62b0
     Edit1.text:='';
     Edit2.text:='';
     Edit3.text:='';
     Edit4.text:='';
<<<<<<< HEAD
  Form2.visible:=False;
  Form1.FormStyle := fsStayOnTop;
end;

=======
     Form2.visible:=False;
     Form1.FormStyle := fsStayOnTop;
     ShowMessage('Task done !') ;
  end;

end;
>>>>>>> 2bf46da135a59f236260ba97a57c71df11ee62b0
end.
