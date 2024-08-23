{$A+,B-,C-,D+,E-,F-,G+,H+,I+,J+,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}

{$MINSTACKSIZE $00004000}

{$MAXSTACKSIZE $00100000}

{$IMAGEBASE $00400000}

{$APPTYPE GUI}

program Biblioteka;

uses
  Forms,
  Windows,
  BibliotekaU in 'BibliotekaU.pas' {MainForm},
  Wydruk1U in 'Wydruk1U.pas' {Wydruk1},
  LogoU in 'LogoU.pas' {Logo},
  SearchU in 'SearchU.pas' {Search};

{$R *.RES}

begin
  Logo:=TLogo.Create(Application);
  Logo.Show;
  Logo.UpDate;
  Sleep(1000);
  Application.Initialize;
  Application.Title := 'Biblioteka';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TWydruk1, Wydruk1);
  Application.CreateForm(TSearch, Search);
  Application.Run;
end.
