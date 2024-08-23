unit LogoU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TLogo = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Logo: TLogo;

implementation

{$R *.DFM}

procedure TLogo.FormCreate(Sender: TObject);
begin
 SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle,GWL_STYLE) and not WS_CAPTION or WS_DLGFRAME);
 Height := ClientHeight;
end;

procedure TLogo.FormShow(Sender: TObject);
begin
 Image1.Picture.Icon:=Application.Icon;
end;

end.
