unit BibliotekaU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBTables, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids,
  Buttons, ComCtrls, Printers, Gauges;

type
  TMainForm = class(TForm)
    DBGrid2: TDBGrid;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    N1: TMenuItem;
    Wyj1: TMenuItem;
    DataSource1: TDataSource;
    Query1: TQuery;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    Edit10: TEdit;
    CheckBox2: TCheckBox;
    Edit20: TEdit;
    Panel1: TPanel;
    Edit1: TEdit;
    Label4: TLabel;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    PrintDialog1: TPrintDialog;
    Sort1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem2: TMenuItem;
    Konfiguracjadrukarki1: TMenuItem;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    P1: TMenuItem;
    P2: TMenuItem;
    P3: TMenuItem;
    Prostywydruk1: TMenuItem;
    Bevel1: TBevel;
    SpeedButton6: TSpeedButton;
    Panel4: TPanel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Bevel2: TBevel;
    SpeedButton8: TSpeedButton;
    Bevel3: TBevel;
    Title: TPanel;
    SpeedButton7: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Panel5: TPanel;
    Shape1: TShape;
    Label6: TLabel;
    SpeedButton10: TSpeedButton;
    Panel6: TPanel;
    Shape2: TShape;
    Label7: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Query1AfterOpen(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Konfiguracjadrukarki1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure Wyj1Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure Prostywydruk1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
  private
    procedure WMGetMinMaxInfo(var Message: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses Wydruk1U, LogoU, SearchU;

{$R *.DFM}

const

      Fields1 : Array[0..7] of String = ('DataPrzyj','NrEwid','Tytul','Autor','RokWyd','Nazwa','DokumentPrzyj','tekst');
      Titles1 : Array[0..7] of String = (' Data Przyjecia',' Numer ewidencyjny',' Tytul',' Autor',' Rok wydania',' Wydawnictwo',' Dokument przyjecia','Status');
      Sizes1  : Array[0..7] of Integer = (100,100,250,150,50,200,200,100);

      Fields2 : Array[0..8] of String = ('datawyc','dataprzyj','nrEwid','przyczyna','Tytul','Autor','RokWyd','Nazwa','DokumentPrzyj');
      Titles2 : Array[0..8] of String = (' Data wycofania',' Data przyjecia',' Numer ewidencyjny',' Przyczyna wycofania',' Tytu³',' Autor',' Rok wydania',' Wydawnictwo',' Dokument przyjecia');
      Sizes2  : Array[0..8] of Integer = (100,100,150,170,200,150,200,200,100);

      Fields3 : Array[0..6] of String = ('datawyp','datazwrot','tytul','autor','nazwisko','imie','status');
      Titles3 : Array[0..6] of String = (' Data wyp.',' Data zwrotu',' Tytu³',' Autor',' Nazwisko',' Imie',' Klasa');
      Sizes3  : Array[0..6] of Integer = (70,70,200,100,150,150,70);

      Fields4 : Array[0..5] of String = ('tytul','autor','datawyp','nazwisko','imie','status');
      Titles4 : Array[0..5] of String = (' Tytu³',' Autor',' Data wyp.',' Nazwisko',' Imie',' Klasa');
      Sizes4  : Array[0..5] of Integer = (200,100,70,100,100,50);

      Fields5 : Array[0..4] of String = ('datawyp','datazwrot','nazwisko','imie','status');
      Titles5 : Array[0..4] of String = (' Data wyp.',' Data zwrotu',' Nazwisko',' Imie',' Klasa');
      Sizes5  : Array[0..4] of Integer = (85,85,160,160,80);

var  TypRaportu   : Byte;    // 1 - Lista przyjec
                             // 2 - Obecne ksiazki
                             // 3 - Wycofane ksiazki
                             // 4 - Hist. wyp.
                             // 5 - Wypozyczone ksiazki

procedure TMainForm.WMGetMinMaxInfo(var Message: TWMGetMinMaxInfo);
begin
 with Message.MinMaxInfo^ do
  begin
   ptMinTrackSize.x := 801;
   ptMinTrackSize.y := 574;
  end;
end;

procedure TMainForm.Edit1Change(Sender: TObject);
var f : string;
begin
  if N11.Checked then f:='dataprzyj';
  if N12.Checked then f:='nrewid';
  if N13.Checked then f:='tytul';
  if TypRaportu=4 then
   begin
    if N11.Checked then f:='datawyp';
    if N12.Checked then f:='nazwisko';
    if N13.Checked then f:='tytul';
   end;
if Query1.Active then Query1.Locate(f,Edit1.Text,[loPartialKey,loCaseInsensitive]);

end;

procedure TMainForm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key in [13,34,33,38,40,35,36] then
  begin
   DBGrid2.SetFocus;
   Edit1.text:='';
  end;
 Case Key of
  vk_Down : Query1.Next;
  vk_Up   : Query1.Prior;
 end;

end;

procedure TMainForm.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#72,#80,#75,#77,#27,#13]) then
   begin
    Edit1.Text:='';
    if key<>#9 then Edit1.Text:=Key;
    if Edit1.CanFocus then Edit1.SetFocus;
    Edit1.SelStart:=1;
   end;
end;

procedure TMainForm.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key in [vk_up,vk_down,32,33,vk_end,vk_home] then Edit1.Text:='';
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 if assigned(Logo) then
  begin
   Logo.Close;
   Logo.Label1.Caption:='Program tworzy wybrany raport. Prosze czekaæ...';
  end;


 Left:=0; Top:=0;
 Width:=780; Height:=572;
end;

procedure TMainForm.CheckBox1Click(Sender: TObject);
begin
 if (Sender as TCheckBox).Checked then Begin
                                        TEdit(FindComponent('Edit'+IntToStr((Sender as TCheckBox).Tag))).Color:=clWindow;
                                        TEdit(FindComponent('Edit'+IntToStr((Sender as TCheckBox).Tag))).Enabled:=True;
                                        TEdit(FindComponent('Edit'+IntToStr((Sender as TCheckBox).Tag))).SetFocus;
                                       End
                                  else Begin
                                        TEdit(FindComponent('Edit'+IntToStr((Sender as TCheckBox).Tag))).Color:=clBtnFace;
                                        TEdit(FindComponent('Edit'+IntToStr((Sender as TCheckBox).Tag))).Enabled:=False;
                                        If Edit1.CanFocus then Edit1.SetFocus;
                                       End;

end;



procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
 PopUpMenu2.PopUp(MainForm.Left+34,MainForm.Top+255);
end;

procedure TMainForm.FormCreate(Sender: TObject);
var MyList: TStringList;
    Lines : Integer;
begin
 Application.ShowHint:=True;
 Application.HintShortCuts:=True;
 Application.HintPause:=150;
 Application.HintHidePause:=2000;


 // Automatyczna modyfikacja lub tworzenie nowego aliasu dla bazy danych MJ(2000)

 MyList := TStringList.Create;
 Session.GetAliasNames(MyList);
 For Lines:=0 to MyList.Count-1 do if Pos('biblioteka',MyList.Strings[Lines])>0 then
  begin
   MyList.Clear;
   MyList.Add('PATH='+ExtractFilePath(Application.exename));
   Session.ModifyAlias('biblioteka',MyList);
   Session.SaveConfigFile;
   exit;
  end;
 Session.AddStandardAlias('biblioteka',ExtractFilePath(Application.exename),'DBASE');
 Session.SaveConfigFile;
end;

procedure TMainForm.Konfiguracjadrukarki1Click(Sender: TObject);
begin
 PrintDialog1.Execute;
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
 if N11.Checked then exit;
 Edit1.MaxLength:=10;
 N13.Checked:=False;N12.Checked:=False; N11.Checked:=True;
 P1.Checked:=N11.Checked; P2.Checked:=N12.Checked; P2.Checked:=N12.Checked;
 Case TypRaportu of
   1 : SpeedButton2Click(sender);
   2 : SpeedButton6Click(sender);
   3 : SpeedButton8Click(sender);
   4 : SpeedButton7Click(sender);
  end;

end;

procedure TMainForm.N12Click(Sender: TObject);
begin
 if N12.Checked then exit;
 Edit1.MaxLength:=10;
 N13.Checked:=False;N12.Checked:=True; N11.Checked:=False;
 P1.Checked:=N11.Checked; P2.Checked:=N12.Checked; P2.Checked:=N12.Checked; 
Case TypRaportu of
   1 : SpeedButton2Click(sender);
   2 : SpeedButton6Click(sender);
   3 : SpeedButton8Click(sender);
   4 : SpeedButton7Click(sender);
  end; 
end;

procedure TMainForm.N13Click(Sender: TObject);
begin
 if N13.Checked then exit;
 Edit1.MaxLength:=10;
 N13.Checked:=True;N12.Checked:=false; N11.Checked:=False;
 P1.Checked:=N11.Checked; P2.Checked:=N12.Checked; P2.Checked:=N12.Checked;
Case TypRaportu of
   1 : SpeedButton2Click(sender);
   2 : SpeedButton6Click(sender);
   3 : SpeedButton8Click(sender);
   4 : SpeedButton7Click(sender);
  end;
end;

procedure TMainForm.Wyj1Click(Sender: TObject);
begin
 Close;
end;

procedure TMainForm.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var R : TRect;
begin
  if TypRaportu=1 then
   begin
   R:=Rect;
    if (state<>[gdSelected,gdFocused]) and (Query1.FieldByName('status').AsInteger=2) then
     begin
      DBGrid2.Canvas.Font.Color:=0;
      DBGrid2.Canvas.Brush.Color:=$00EFEFFF;
      DBGrid2.Canvas.FillRect(R);
      Inc(R.Top,2);
      Inc(R.Left,2);
      DrawText(DBGrid2.Canvas.Handle, PChar(Column.Field.AsString),Length(Column.Field.AsString),r,DT_NOPREFIX);
     end;
  end;


  if TypRaportu in [4,7] then
   begin
   R:=Rect;
    if (state<>[gdSelected,gdFocused]) and (Query1.FieldByName('datazwrot').AsString='') then
     begin
      DBGrid2.Canvas.Font.Color:=0;
      DBGrid2.Canvas.Brush.Color:=$00FFEFEF;
      DBGrid2.Canvas.FillRect(R);
      Inc(R.Top,2);
      Inc(R.Left,2);
      DrawText(DBGrid2.Canvas.Handle, PChar(Column.Field.AsString),Length(Column.Field.AsString),r,DT_NOPREFIX);
     end;
  end;

end;

procedure TMainForm.SpeedButton5Click(Sender: TObject);
begin
 PopUpMenu1.PopUp(MainForm.Left+34,MainForm.Top+283)

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox(
        'Czy chcesz zakoñczyæ pracê z programem?',
        'Koniec',
        MB_YESNO) <> IDYES then Action:=caNone;
end;

procedure TMainForm.SpeedButton6Click(Sender: TObject);
var SQLSyntax1 : String;
    SQLSyntax2 : String;
    SQLSyntax3 : String;
    i          : integer;
begin
   MenuItem2.Visible:=True;
   Logo.Show;
   Logo.Update;

   SpeedButton9.Enabled:=True;
   Panel5.Visible:=False;
   Title.Caption:=' Lista wszystkich ksi¹¿ek znajduj¹cych siê w bibliotece';
   TypRaportu:=2;
   DBGrid2.DataSource:=nil;
   SQLSyntax1:='select DataPrzyj,NrEwid,Tytul,Autor,RokWyd,Wydawcy.Nazwa,DokumentPrzyj,status.tekst,ogolna.status,ogolna.id,streszczenie,opis';
   SQLSyntax2:=' from PrzyjNaStan,ogolna,status,wydawcy';
   SQLSyntax3:=' where (PrzyjNaStan.id=ogolna.id) and (status.statusid=ogolna.status) and (ogolna.wydawca=wydawcy.wydawcaid) and (ogolna.status=1)';

   if CheckBox1.Checked then
    begin
     Title.Caption:=Title.Caption+' od dnia: '+Edit10.Text;
     SQLSyntax3:=ConCat(SQLSyntax3,' and (dataprzyj>="'+Edit10.Text+'")');
    end;
   if CheckBox2.Checked then
    begin
     Title.Caption:=Title.Caption+' do dnia: '+Edit20.Text;
     SQLSyntax3:=ConCat(SQLSyntax3,' and (dataprzyj<="'+Edit20.Text+'")');
    end;

   SQLSyntax3:=ConCat(SQLSyntax3,' order by ');

   if N11.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'dataprzyj');
   if N12.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'nrewid');
   if N13.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'tytul');


   Query1.SQL.Clear;
   Query1.SQL.Add(SQLSyntax1+SQLSyntax2+SQLSyntax3);
   Query1.Open;

   DBGrid2.Columns.Clear;
   for i:=0 to 7 do
   begin
    DBGrid2.Columns.Add;
    DBGrid2.Columns.Items[i].FieldName:=Fields1[i];
    DBGrid2.Columns.Items[i].Title.Caption:=Titles1[i];
    DBGrid2.Columns.Items[i].Width:=Sizes1[i];
   end;
  DBGrid2.DataSource:=DataSource1;


  if N11.Checked then
   begin
    DBGrid2.Columns.Items[0].Title.Font.Style := [fsBold];
    DBGrid2.Columns.Items[0].Color:=$00EEEEEE;
    Label4.Caption:='Data przyjecia:';
   end;
  if N12.Checked then
   begin
    Label4.Caption:='Numer ewidencyjny:';
    DBGrid2.Columns.Items[1].Color:=$00EEEEEE;
    DBGrid2.Columns.Items[1].Title.Font.Style := [fsBold];
   end;

  if N13.Checked then
   begin
    Label4.Caption:='Tytul:';
    DBGrid2.Columns.Items[2].Color:=$00EEEEEE;
    DBGrid2.Columns.Items[2].Title.Font.Style := [fsBold];
   end;

// if Query1.RecordCount>0 then SpeedButton9.Enabled:=True else SpeedButton9.Enabled:=False;
 Logo.Close;
 DBGrid2.SetFocus;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
var SQLSyntax1 : String;
    SQLSyntax2 : String;
    SQLSyntax3 : String;
    i          : integer;
begin
   MenuItem2.Visible:=True;
   Logo.Show;
   Logo.Update;

   SpeedButton9.Enabled:=True;
   Panel5.Visible:=True;
   Label6.Caption:='wycofana ksi¹¿ka';
   Shape1.Brush.Color:=$00EFEFFF;

   Title.Caption:=' Historia wszystkich przyjêæ';
   TypRaportu:=1;
   DBGrid2.DataSource:=nil;
   SQLSyntax1:='select DataPrzyj,NrEwid,Tytul,Autor,RokWyd,Wydawcy.Nazwa,DokumentPrzyj,status.tekst,ogolna.status,ogolna.id,streszczenie,opis';
   SQLSyntax2:=' from PrzyjNaStan,ogolna,status,wydawcy';
   SQLSyntax3:=' where (PrzyjNaStan.id=ogolna.id) and (status.statusid=ogolna.status) and (ogolna.wydawca=wydawcy.wydawcaid)';

   if CheckBox1.Checked then
    begin
     Title.Caption:=Title.Caption+' od dnia: '+Edit10.Text;
     SQLSyntax3:=ConCat(SQLSyntax3,' and (dataprzyj>="'+Edit10.Text+'")');
    end;
   if CheckBox2.Checked then
    begin
     Title.Caption:=Title.Caption+' do dnia: '+Edit20.Text;
     SQLSyntax3:=ConCat(SQLSyntax3,' and (dataprzyj<="'+Edit20.Text+'")');
    end;

   SQLSyntax3:=ConCat(SQLSyntax3,' order by ');

   if N11.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'dataprzyj');
   if N12.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'nrewid');
   if N13.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'tytul');


   Query1.SQL.Clear;
   Query1.SQL.Add(SQLSyntax1+SQLSyntax2+SQLSyntax3);
   Query1.Open;

   DBGrid2.Columns.Clear;
   for i:=0 to 7 do
   begin
    DBGrid2.Columns.Add;
    DBGrid2.Columns.Items[i].FieldName:=Fields1[i];
    DBGrid2.Columns.Items[i].Title.Caption:=Titles1[i];
    DBGrid2.Columns.Items[i].Width:=Sizes1[i];
   end;
  DBGrid2.DataSource:=DataSource1;


  if N11.Checked then
   begin
    DBGrid2.Columns.Items[0].Title.Font.Style := [fsBold];
    DBGrid2.Columns.Items[0].Color:=$00EEEEEE;
    Label4.Caption:='Data przyjecia:';
   end;
  if N12.Checked then
   begin
    Label4.Caption:='Numer ewidencyjny:';
    DBGrid2.Columns.Items[1].Color:=$00EEEEEE;
    DBGrid2.Columns.Items[1].Title.Font.Style := [fsBold];
   end;

  if N13.Checked then
   begin
    Label4.Caption:='Tytul:';
    DBGrid2.Columns.Items[2].Color:=$00EEEEEE;
    DBGrid2.Columns.Items[2].Title.Font.Style := [fsBold];
   end;

// if Query1.RecordCount>0 then SpeedButton9.Enabled:=True else SpeedButton9.Enabled:=False;
 DBGrid2.SetFocus;
 Logo.Close;

end;

procedure TMainForm.Query1AfterOpen(DataSet: TDataSet);
begin
 Panel1.Caption:=' Iloœæ pozycji na liœcie: '+IntToStr(Query1.RecordCount);
 DBGrid2.Repaint;
 if Query1.RecordCount>0 then
  begin
   SpeedButton1.Enabled:=True;
   SpeedButton5.Enabled:=True;
   Sort1.Enabled:=True;
   Edit1.Enabled:=true;
   Edit1.Color:=ClWindow;
   SpeedButton21.Enabled:=True;
  end else
  begin
   SpeedButton1.Enabled:=False;
   SpeedButton5.Enabled:=False;
   Edit1.Enabled:=False;
   Edit1.Color:=ClBtnFace;
   Sort1.Enabled:=False;
   SpeedButton21.Enabled:=False;
   SpeedButton9.Enabled:=False;
  end;


end;

procedure TMainForm.SpeedButton9Click(Sender: TObject);
var SQLSyntax1 : String;
    SQLSyntax2 : String;
    SQLSyntax3 : String;
    i          : integer;
begin
   MenuItem2.Visible:=False;

   Logo.Show;
   Logo.Update;

   Title.Caption:=' Lista osób, które wypo¿yczyly ksi¹¿ke: '+Query1.FieldByName('TYTUL').AsString;

   Panel5.Visible:=True;
   Label6.Caption:='aktualnie wypo¿yczona';
   Shape1.Brush.Color:=$00FFEFEF;

   TypRaportu:=7;
   DBGrid2.DataSource:=nil;

   SQLSyntax1:='select wyp.datawyp,wyp.datazwrot,nazwisko,imie,status,tytul,opis,streszczenie,autor';
   SQLSyntax2:=' from wyp,osoby,ogolna';
   SQLSyntax3:=' where (ogolna.id=wyp.id) and (wyp.id='+Query1.FieldByName('ID').AsString+') and (wyp.idosoby=osoby.idosoby)';

   if CheckBox1.Checked then
    begin
     Title.Caption:=Title.Caption+' od dnia: '+Edit10.Text;
     SQLSyntax3:=ConCat(SQLSyntax3,' and (datawyp>="'+Edit10.Text+'")');
    end;
   if CheckBox2.Checked then
    begin
     Title.Caption:=Title.Caption+' do dnia: '+Edit20.Text;
     SQLSyntax3:=ConCat(SQLSyntax3,' and (datawyp<="'+Edit20.Text+'")');
    end;

   SQLSyntax3:=ConCat(SQLSyntax3,' order by nazwisko');

{   if N11.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'datawyp');
   if N12.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'nazwisko');
   if N13.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'tytul');}


   Query1.SQL.Clear;
   Query1.SQL.Add(SQLSyntax1+SQLSyntax2+SQLSyntax3);
   Query1.Open;

   DBGrid2.Columns.Clear;
   for i:=0 to 4 do
   begin
    DBGrid2.Columns.Add;
    DBGrid2.Columns.Items[i].FieldName:=Fields5[i];
    DBGrid2.Columns.Items[i].Title.Caption:=Titles5[i];
    DBGrid2.Columns.Items[i].Width:=Sizes5[i];
   end;
  DBGrid2.DataSource:=DataSource1;


  if N11.Checked then
   begin
    DBGrid2.Columns.Items[0].Title.Font.Style := [fsBold];
    DBGrid2.Columns.Items[0].Color:=$00EEEEEE;
    Label4.Caption:='Data wypo¿yczenia:';
   end;
  if N12.Checked then
   begin
    Label4.Caption:='Nazwisko:';
    DBGrid2.Columns.Items[4].Color:=$00EEEEEE;
    DBGrid2.Columns.Items[4].Title.Font.Style := [fsBold];
   end;

  if N13.Checked then
   begin
    Label4.Caption:='Tytul:';
    DBGrid2.Columns.Items[2].Color:=$00EEEEEE;
    DBGrid2.Columns.Items[2].Title.Font.Style := [fsBold];
   end;

// if Query1.RecordCount>0 then SpeedButton9.Enabled:=True else SpeedButton9.Enabled:=False;
 DBGrid2.SetFocus;
 SpeedButton9.Enabled:=False;

  Logo.Close;

end;

procedure TMainForm.SpeedButton21Click(Sender: TObject);
var NewQuery : String;
    OldSort  : String;
begin
 Search.ShowModal;
 if SearchYes then
  begin
 Logo.Show;
 Logo.Update;

   NewQuery:=Copy(Query1.SQL.Strings[0],1,Pos(' order by',Query1.SQL.Strings[0])-1);
   OldSort:=Copy(Query1.SQL.Strings[0],Pos('order by',Query1.SQL.Strings[0])-1,Length(Query1.SQL.Strings[0]));

   NewQuery:=NewQuery+' and (';
   if Search.CheckBox1.Checked then NewQuery:=NewQuery+'(upper(tytul) like "%'+SearchWord+'%") or ';
   if Search.CheckBox2.Checked then NewQuery:=NewQuery+'(upper(autor) like "%'+SearchWord+'%") or ';
   if Search.CheckBox3.Checked then NewQuery:=NewQuery+'(upper(opis) like "%'+SearchWord+'%") or ';
   if Search.CheckBox4.Checked then NewQuery:=NewQuery+'(upper(streszczenie) like "%'+SearchWord+'%") or ';

   NewQuery:=Copy(NewQuery,1,Length(NewQuery)-3);
   NewQuery:=NewQuery+') '+oldsort;

   Query1.SQL.Clear;
   Query1.SQL.Add(NewQuery);
   Query1.Open;

   Case TypRaportu of
    1 : Title.Caption:=' Historia przyjêæ';
    2 : Title.Caption:=' Lista wszystkich ksiazek w bibliotece';
    3 : Title.Caption:=' Lista wycofanych ksiazek';
    4 : Title.Caption:=' Historia wypozyczen';
   end;

  if CheckBox1.Checked then Title.Caption:=Title.Caption+' od dnia: '+Edit10.Text;
  if CheckBox2.Checked then Title.Caption:=Title.Caption+' do dnia: '+Edit20.Text;
  Title.Caption:=Title.Caption+': wynik szukania slowa: "'+SearchWord+'"';
  Logo.Close;

  end;
end;

procedure TMainForm.SpeedButton8Click(Sender: TObject);
var SQLSyntax1 : String;
    SQLSyntax2 : String;
    SQLSyntax3 : String;
    i          : integer;
begin
   MenuItem2.Visible:=True;
   Logo.Show;
   Logo.Update;

   SpeedButton9.Enabled:=True;

   Panel5.Visible:=False;
   Title.Caption:=' Lista wycofanych ksi¹¿ek ';
   TypRaportu:=3;
   DBGrid2.DataSource:=nil;



   SQLSyntax1:='select DataWyc,DataPrzyj,NrEwid,przyczyna,Tytul,Autor,RokWyd,Wydawcy.Nazwa, DokumentPrzyj,ogolna.status,ogolna.id,streszczenie,opis';
   SQLSyntax2:=' from WycofanieZeStanu,ogolna,PrzyjNaStan,wydawcy';
   SQLSyntax3:=' where (WycofanieZeStanu.id=przyjnastan.id) and (WycofanieZeStanu.id=ogolna.id) and (ogolna.wydawca=wydawcy.wydawcaid)';

   if CheckBox1.Checked then
    begin
     Title.Caption:=Title.Caption+' od dnia: '+Edit10.Text;
     SQLSyntax3:=ConCat(SQLSyntax3,' and (datawyc>="'+Edit10.Text+'")');
    end;
   if CheckBox2.Checked then
    begin
     Title.Caption:=Title.Caption+' do dnia: '+Edit20.Text;
     SQLSyntax3:=ConCat(SQLSyntax3,' and (datawyc<="'+Edit20.Text+'")');
    end;

   SQLSyntax3:=ConCat(SQLSyntax3,' order by ');

   if N11.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'datawyc');
   if N12.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'nrewid');
   if N13.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'tytul');


   Query1.SQL.Clear;
   Query1.SQL.Add(SQLSyntax1+SQLSyntax2+SQLSyntax3);
   Query1.Open;

   DBGrid2.Columns.Clear;
   for i:=0 to 8 do
   begin
    DBGrid2.Columns.Add;
    DBGrid2.Columns.Items[i].FieldName:=Fields2[i];
    DBGrid2.Columns.Items[i].Title.Caption:=Titles2[i];
    DBGrid2.Columns.Items[i].Width:=Sizes2[i];
   end;
  DBGrid2.DataSource:=DataSource1;


  if N11.Checked then
   begin
    DBGrid2.Columns.Items[0].Title.Font.Style := [fsBold];
    DBGrid2.Columns.Items[0].Color:=$00EEEEEE;
    Label4.Caption:='Data przyjecia:';
   end;
  if N12.Checked then
   begin
    Label4.Caption:='Numer ewidencyjny:';
    DBGrid2.Columns.Items[1].Color:=$00EEEEEE;
    DBGrid2.Columns.Items[1].Title.Font.Style := [fsBold];
   end;

  if N13.Checked then
   begin
    Label4.Caption:='Tytul:';
    DBGrid2.Columns.Items[2].Color:=$00EEEEEE;
    DBGrid2.Columns.Items[2].Title.Font.Style := [fsBold];
   end;

// if Query1.RecordCount>0 then SpeedButton9.Enabled:=True else SpeedButton9.Enabled:=False;
 DBGrid2.SetFocus;
  Logo.Close;


end;

procedure TMainForm.SpeedButton7Click(Sender: TObject);
var SQLSyntax1 : String;
    SQLSyntax2 : String;
    SQLSyntax3 : String;
    i          : integer;
begin
   MenuItem2.Visible:=False;
   Logo.Show;
   Logo.Update;

   SpeedButton9.Enabled:=True;
   Panel5.Visible:=True;
   Label6.Caption:='aktualnie wypo¿yczona';
   Shape1.Brush.Color:=$00FFEFEF;

   Title.Caption:=' Historia wypo¿yczeñ ksi¹¿ek ';
   TypRaportu:=4;
   DBGrid2.DataSource:=nil;


   //select from  where (wyp.idosoby=osoby.idosoby) and (wyp.id=ogolna.id)

   SQLSyntax1:='select wyp.datawyp,wyp.datazwrot,tytul,autor, nazwisko,imie,status,opis,streszczenie,id';
   SQLSyntax2:=' from wyp,osoby,ogolna';
   SQLSyntax3:=' where (wyp.idosoby=osoby.idosoby) and (wyp.id=ogolna.id)';

   if CheckBox1.Checked then
    begin
     Title.Caption:=Title.Caption+' od dnia: '+Edit10.Text;
     SQLSyntax3:=ConCat(SQLSyntax3,' and (datawyp>="'+Edit10.Text+'")');
    end;
   if CheckBox2.Checked then
    begin
     Title.Caption:=Title.Caption+' do dnia: '+Edit20.Text;
     SQLSyntax3:=ConCat(SQLSyntax3,' and (datawyp<="'+Edit20.Text+'")');
    end;

   SQLSyntax3:=ConCat(SQLSyntax3,' order by ');

   if N11.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'datawyp');
   if N12.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'nazwisko');
   if N13.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'tytul');


   Query1.SQL.Clear;
   Query1.SQL.Add(SQLSyntax1+SQLSyntax2+SQLSyntax3);
   Query1.Open;

   DBGrid2.Columns.Clear;
   for i:=0 to 6 do
   begin
    DBGrid2.Columns.Add;
    DBGrid2.Columns.Items[i].FieldName:=Fields3[i];
    DBGrid2.Columns.Items[i].Title.Caption:=Titles3[i];
    DBGrid2.Columns.Items[i].Width:=Sizes3[i];
   end;
  DBGrid2.DataSource:=DataSource1;


  if N11.Checked then
   begin
    DBGrid2.Columns.Items[0].Title.Font.Style := [fsBold];
    DBGrid2.Columns.Items[0].Color:=$00EEEEEE;
    Label4.Caption:='Data wypo¿yczenia:';
   end;
  if N12.Checked then
   begin
    Label4.Caption:='Nazwisko:';
    DBGrid2.Columns.Items[4].Color:=$00EEEEEE;
    DBGrid2.Columns.Items[4].Title.Font.Style := [fsBold];
   end;

  if N13.Checked then
   begin
    Label4.Caption:='Tytul:';
    DBGrid2.Columns.Items[2].Color:=$00EEEEEE;
    DBGrid2.Columns.Items[2].Title.Font.Style := [fsBold];
   end;

// if Query1.RecordCount>0 then SpeedButton9.Enabled:=True else SpeedButton9.Enabled:=False;
 DBGrid2.SetFocus;
  Logo.Close;

end;

procedure TMainForm.SpeedButton10Click(Sender: TObject);
var SQLSyntax1 : String;
    SQLSyntax2 : String;
    SQLSyntax3 : String;
    i          : integer;
begin
   MenuItem2.Visible:=False;
   Logo.Show;
   Logo.Update;

   SpeedButton9.Enabled:=True;

   Panel5.Visible:=False;

   Title.Caption:=' Lista wypo¿yczonych ksi¹¿ek ';
   TypRaportu:=5;
   DBGrid2.DataSource:=nil;


//select tytul,autor,wyp.datawyp,nazwisko,imie,osoby.status from ogolna,wyp,osoby where (wyp.idosoby=osoby.idosoby) and (wyp.id=ogolna.id) and (datazwrot='')

   SQLSyntax1:='select tytul,autor,wyp.datawyp,nazwisko,imie,osoby.status,opis,streszczenie,id';
   SQLSyntax2:=' from ogolna,wyp,osoby';
   SQLSyntax3:=' where (wyp.idosoby=osoby.idosoby) and (wyp.id=ogolna.id) and (datazwrot="")';

   if CheckBox1.Checked then
    begin
     Title.Caption:=Title.Caption+' od dnia: '+Edit10.Text;
     SQLSyntax3:=ConCat(SQLSyntax3,' and (datawyp>="'+Edit10.Text+'")');
    end;
   if CheckBox2.Checked then
    begin
     Title.Caption:=Title.Caption+' do dnia: '+Edit20.Text;
     SQLSyntax3:=ConCat(SQLSyntax3,' and (datawyp<="'+Edit20.Text+'")');
    end;

   SQLSyntax3:=ConCat(SQLSyntax3,' order by ');

   if N11.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'datawyp');
   if N12.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'nazwisko');
   if N13.Checked then SQLSyntax3:=ConCat(SQLSyntax3,'tytul');


   
   Query1.SQL.Clear;
   Query1.SQL.Add(SQLSyntax1+SQLSyntax2+SQLSyntax3);
   Query1.Open;

   DBGrid2.Columns.Clear;
   for i:=0 to 5 do
   begin
    DBGrid2.Columns.Add;
    DBGrid2.Columns.Items[i].FieldName:=Fields4[i];
    DBGrid2.Columns.Items[i].Title.Caption:=Titles4[i];
    DBGrid2.Columns.Items[i].Width:=Sizes4[i];
   end;
  DBGrid2.DataSource:=DataSource1;


  if N11.Checked then
   begin
    DBGrid2.Columns.Items[2].Title.Font.Style := [fsBold];
    DBGrid2.Columns.Items[2].Color:=$00EEEEEE;
    Label4.Caption:='Data wypo¿yczenia:';
   end;
  if N12.Checked then
   begin
    Label4.Caption:='Nazwisko:';
    DBGrid2.Columns.Items[3].Color:=$00EEEEEE;
    DBGrid2.Columns.Items[3].Title.Font.Style := [fsBold];
   end;

  if N13.Checked then
   begin
    Label4.Caption:='Tytul:';
    DBGrid2.Columns.Items[0].Color:=$00EEEEEE;
    DBGrid2.Columns.Items[0].Title.Font.Style := [fsBold];
   end;

// if Query1.RecordCount>0 then SpeedButton9.Enabled:=True else SpeedButton9.Enabled:=False;
 DBGrid2.SetFocus;

  Logo.Close;

end;

procedure TMainForm.Prostywydruk1Click(Sender: TObject);
begin
 if TypRaportu in [1,2] then
  begin
   if TypRaportu=1 then
   Wydruk1.QuickRep1.ReportTitle:=Title.Caption;
   Wydruk1.QuickRep1.Zoom:=100;
   Wydruk1.QuickRep1.Preview;
  end;

 if TypRaportu in [3] then
  begin
   Wydruk1.QuickRep3.ReportTitle:=Title.Caption ;
   Wydruk1.QuickRep3.Zoom:=100;
   Wydruk1.QuickRep3.Preview;
  end;

 if TypRaportu in [4,7] then
  begin
   Wydruk1.QuickRep4.ReportTitle:=Title.Caption ;
   Wydruk1.QuickRep4.Zoom:=100;
   Wydruk1.QuickRep4.Preview;
  end;

 if TypRaportu in [5] then
  begin
   Wydruk1.QuickRep6.ReportTitle:=Title.Caption ;
   Wydruk1.QuickRep6.Zoom:=100;
   Wydruk1.QuickRep6.Preview;
  end;


   MainForm.SetFocus;

end;

procedure TMainForm.MenuItem2Click(Sender: TObject);
begin
 if TypRaportu in [1,2] then
  begin
   if TypRaportu=1 then
   Wydruk1.QuickRep5.ReportTitle:='Historia przyjec - raport szczegolowy' else  Wydruk1.QuickRep5.ReportTitle:='Lista obecnych ksi¹¿ek - raport szczegolowy';
   Wydruk1.QuickRep5.Zoom:=100;
   Wydruk1.QuickRep5.Preview;
   end;

 if TypRaportu in [3] then
  begin
   Wydruk1.QuickRep2.ReportTitle:='Wycofane - raport szczegolowy' ;
   Wydruk1.QuickRep2.Zoom:=100;
   Wydruk1.QuickRep2.Preview;
   end;

   MainForm.SetFocus;

end;

procedure TMainForm.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in [#8,#13,'0'..'9','-']) then key:=#0;
end;

end.
