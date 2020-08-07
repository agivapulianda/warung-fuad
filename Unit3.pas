unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    pnl_login: TPanel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Login: TBitBtn;
    procedure LoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses
  Unit2, Unit4;
{$R *.dfm}

procedure TForm3.LoginClick(Sender: TObject);
var
  i, x,cek_id: Integer;
  a, b: string;

begin
  ddm.zqry_login.SQL.Text := 'select * from staff_mainan';
  ddm.zqry_login.Active := True;
  x := 0;
  for i := 1 to ddm.zqry_login.Recordcount do begin
    a := ddm.zqry_login['ID_staff'];
    b := ddm.zqry_login['nama_staff'];

    if ((Edit1.Text = a) and (Edit2.Text = b)) then
    begin
      fMain.lbl_staff.Caption := b;
      x := 1;
    end
    else
    ddm.zqry_login.Next;
  end;
  if (x = 1) then begin
    Application.MessageBox('SUCCESS', 'LOGIN BERHASIL', MB_OK);
    fMain.Show;
    Form3.Hide;
  end
  else
    Application.MessageBox('User Name atau Password Tidak Cocok', 'LOGIN SALAH.', MB_OK +
    MB_ICONSTOP);
    Edit1.Text:='';
    Edit2.Text:='';
    fMain.mmo1.Show;
    fMain.mmo2.Hide;

    with ddm.zqry_cek do
    begin
      Active:=false;
      SQL.Clear;
      SQL.Text:='select * from struk order by id_struk';
      active:=True;
      for i := 1 to ddm.zqry_cek.RecordCount do
      begin
        cek_id := StrToInt(ddm.zqry_cek['id_struk']);
        ddm.zqry_cek.Next;

      end;
    end;
    cek_id := cek_id+1;
    fMain.edt_strk.Text:= IntToStr(cek_id);
end;
end.

