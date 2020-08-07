unit Unit2;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZConnection, mxExport, SMDBFltr, SMDBFind;

type
  Tddm = class(TDataModule)
    con: TZConnection;
    zqrymainan: TZQuery;
    zqrysuplier: TZQuery;
    zqry_staffmainan: TZQuery;
    ds_mainan: TDataSource;
    ds_suplier: TDataSource;
    ds_staffmainan: TDataSource;
    ds_login: TDataSource;
    zqry_login: TZQuery;
    con1: TZConnection;
    ds_struk: TDataSource;
    zqry_staffmainanID_staff: TStringField;
    zqry_staffmainannama_staff: TStringField;
    zqry_staffmainanjenis_kelamin: TStringField;
    zqry_staffmainanalamat: TStringField;
    zqrysuplierID_perusahaan: TStringField;
    zqrysupliernama_perusahaan: TStringField;
    zqrysuplierjenis_barang: TStringField;
    zqrysuplierjumlah_barang: TStringField;
    zqrymainanKode_mainan: TStringField;
    zqrymainanNama: TStringField;
    zqrymainanHarga: TIntegerField;
    zqry_kosong: TZQuery;
    zqry_kosongkode_mainan: TStringField;
    zqry_kosongjmlh_mainan: TStringField;
    zqry_kosongrf_nama_mainan: TStringField;
    zqry_kosongrf_hrg: TIntegerField;
    zqry_kosongid_struk: TIntegerField;
    zqrymainanGambar: TBlobField;
    zqry_kosongrc_totalharga: TIntegerField;
    smdbfndlg_mainan: TSMDBFindDialog;
    smdbfndlg_staff: TSMDBFindDialog;
    smdbfndlg_suplier: TSMDBFindDialog;
    smdbfltrdlg_mainan: TSMDBFilterDialog;
    smdbfltrdlg_staff: TSMDBFilterDialog;
    smdbfltrdlg_suplier: TSMDBFilterDialog;
    mx_mainan: TmxDataSetExport;
    mx_staff: TmxDataSetExport;
    mx_suplier: TmxDataSetExport;
    zqry_kosongno_rec: TIntegerField;
    zqry_cek: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ddm: Tddm;

implementation
uses unit3,unit4;

{$R *.dfm}

end.
