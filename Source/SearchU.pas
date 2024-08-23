unit SearchU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TSearch = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Search: TSearch;
  SearchYes : Boolean;
  SearchWord : String;
implementation

uses BibliotekaU;

{$R *.DFM}

procedure TSearch.Button1Click(Sender: TObject);
var i,s : integer;
    z : string[1];
    t : array[1..100] of Char;

begin
 // Poprawka, zeby szukal tez z polskimi znakami
 s:=Length(Edit1.Text);
 fillChar(t,100,0);
 for i:=1 to s do t[i]:=Edit1.Text[i];

 for i:=1 to s do
   Case T[i] of
    ' ' : t[i]:='Í';
    '”' : t[i]:='Û';
    '•' : t[i]:='π';
    'å' : t[i]:='ú';
    '£' : t[i]:='≥';
    'Ø' : t[i]:='ø';
    'è' : t[i]:='ü';
    '∆' : t[i]:='Ê';
    '—' : t[i]:='Ò';
   end;

 SearchWord:='';
 for i:=1 to s do SearchWord:=SearchWord+t[i];

 SearchYes:=True;
 if (not CheckBox1.Checked)
 and (not CheckBox2.Checked)
 and (not CheckBox3.Checked)
 and (not CheckBox4.Checked) then SearchYes:=False;
 Close;
end;

procedure TSearch.Button2Click(Sender: TObject);
begin
 SearchYes:=False;
 Close;
end;

procedure TSearch.FormShow(Sender: TObject);
begin
 Edit1.SetFocus;
 Left:=MainForm.Left+100;
 Top:=MainForm.Top+200;
end;

end.
