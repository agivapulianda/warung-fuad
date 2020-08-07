unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls,unit2, Grids, DBGrids, SMDBGrid,
  SMDBCtrl, Menus, EDBImage;

type
  TForm1 = class(TForm)
    img1: TImage;
    lbl1: TLabel;
    Label1: TLabel;
    smdbgrd_mainan: TSMDBGrid;
    Label2: TLabel;
    smdbgrd_suplier: TSMDBGrid;
    smdbgrd_staff: TSMDBGrid;
    Button1: TButton;
    STAFF: TButton;
    MAIANAN: TButton;
    pnl_maianan: TPanel;
    pnl_staff: TPanel;
    pnl_supl: TPanel;
    img_Sup: TImage;
    img_mainan: TImage;
    Image1: TImage;
    Label3: TLabel;
    img_photo: TEDBImage;
    pm_foto: TPopupMenu;
    Load1: TMenuItem;
    smdbnvgtr_staff: TSMDBNavigator;
    smdbnvgtr_suplier: TSMDBNavigator;
    smdbnvgtr_maina: TSMDBNavigator;
    procedure MAIANANClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure STAFFClick(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure smdbnvgtr_mainaClick(Sender: TObject;
      Button: TSMNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses myLib_Blob,myLib_SMDBGrid;
{$R *.dfm}

procedure TForm1.MAIANANClick(Sender: TObject);
begin
 pnl_maianan.Show;
 pnl_supl.Hide;
 pnl_staff.Hide;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 pnl_maianan.Hide;
 pnl_supl.Show;
 pnl_staff.Hide;
end;

procedure TForm1.STAFFClick(Sender: TObject);
begin
 pnl_maianan.Hide;
 pnl_supl.Hide;
 pnl_staff.Show;
end;

procedure TForm1.Load1Click(Sender: TObject);
begin
 Blob_FromFileImage(ddm.zqrymainanGambar);
end;

procedure TForm1.smdbnvgtr_mainaClick(Sender: TObject;
  Button: TSMNavigateBtn);
begin
 case Button of
 sbFind : unit2.ddm.smdbfndlg_mainan.Execute;
 sbFilter : unit2.ddm.smdbfltrdlg_mainan.Execute;
 sbExport : unit2.ddm.mx_mainan.Select;
end;
end;

procedure smdbnvgtr_suplierClick(Sender: TObject;
      Button: TSMNavigateBtn);
begin
 case Button of
 sbFind : unit2.ddm.smdbfndlg_suplier.Execute;
 sbFilter : unit2.ddm.smdbfltrdlg_suplier.Execute;
 sbExport : unit2.ddm.mx_suplier.Select;
end;
end;

procedure smdbnvgtr_staffClick(Sender: TObject;
      Button: TSMNavigateBtn);
begin
 case Button of
 sbFind : unit2.ddm.smdbfndlg_staff.Execute;
 sbFilter : unit2.ddm.smdbfltrdlg_staff.Execute;
 sbExport : unit2.ddm.mx_staff.Select;
end;
end;
end.
