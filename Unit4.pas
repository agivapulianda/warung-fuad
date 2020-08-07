unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Unit1, Grids, DBGrids, SMDBGrid, SMDBComb,
  Unit5, Buttons;

type
  TfMain = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit6: TEdit;
    Label7: TLabel;
    Button3: TButton;
    mmo1: TMemo;
    Kd_mn: TEdit;
    nm: TEdit;
    hrg: TEdit;
    jm: TEdit;
    OK: TButton;
    btn1: TButton;
    smdbgrd_struk: TSMDBGrid;
    edt_strk: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    stafftx: TEdit;
    lbl3: TLabel;
    Label8: TLabel;
    edt_Bayar: TEdit;
    edt_Kembalian: TEdit;
    mmo2: TMemo;
    btn_print: TButton;
    lbl_datapenjualan: TLabel;
    tmr1: TTimer;
    lbl_hari: TLabel;
    lbl_tgl: TLabel;
    lbl_jam: TLabel;
    btn_close: TBitBtn;
    BitBtn1: TBitBtn;
    lbl_staff: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;
  a: string;
  b, k: Integer;
implementation
uses
  Unit2, Unit6, Unit3;
{$R *.dfm}

procedure TfMain.Button3Click(Sender: TObject);
begin
  Form1.pnl_maianan.Visible := True;
  Form1.pnl_staff.Visible := False;
  Form1.pnl_supl.Visible := False;
  Form1.ShowModal;
end;

procedure TfMain.Button1Click(Sender: TObject);
begin
  a := FloatToStr(StrToFloat(hrg.Text) * StrToFloat(jm.Text));
  mmo1.Lines.Add(nm.Text + ' ' + hrg.Text + ' x ' + jm.Text + ' = ' + a);
  b := b + (StrToInt(a));
  Edit6.Text := FloatToStr(b);

  if (nm.Text <> '') and (jm.Text <> '') and (edt_strk.Text <> '') then
  begin
    ddm.zqry_kosong.Append;
    ddm.zqry_kosong.fieldbyName('id_struk').AsString := edt_strk.text;
    ddm.zqry_kosong.fieldbyName('kode_mainan').AsString := Kd_mn.text;
    ddm.zqry_kosong.fieldbyName('jmlh_mainan').AsString := jm.text;
    ddm.zqry_kosong.Post;
  end;
  ddm.zqry_kosong.Active := False;
  ddm.zqry_kosong.Active := True;
  mmo1.Show;
  mmo2.Hide;
end;

procedure TfMain.OKClick(Sender: TObject);
var
  a, b: string;
  c, i, x: Integer;
begin
  ddm.zqrymainan.SQL.Text := 'select * from mainan';
  ddm.zqrymainan.Active := True;
  x := 0;
  for i := 1 to ddm.zqrymainan.Recordcount do
  begin
    a := ddm.zqrymainan['Kode_mainan'];
    b := ddm.zqrymainan['Nama'];
    c := ddm.zqrymainan['Harga'];
    if (Kd_mn.Text = a) then
    begin
      x := 1;
    end
    else
      ddm.zqrymainan.Next;
  end;
  if (x = 1) then
  begin
    nm.Text := b;
    hrg.Text := IntToStr(c);
  end
  else
    Application.MessageBox('BARANG TIDAK ADA.', 'INFO', MB_OK + MB_ICONWARNING);
end;

procedure TfMain.btn1Click(Sender: TObject);
begin
  Kd_mn.Clear;
  hrg.Clear;
  jm.Clear;
  nm.Clear;
end;

procedure TfMain.Button2Click(Sender: TObject);
var
  j, byr: Integer;
begin

  begin
    j := StrToInt(Edit6.Text);
    byr := StrtoInt(edt_Bayar.Text);
    if byr < j then
    begin
      Application.MessageBox('Uang tidak cukup untuk pembayaran',
        'Pembayaran', MB_OK + MB_ICONWARNING);
      k := 0;
      k := byr - j;
    end
    else
      k := byr - j;
    edt_Kembalian.Text := IntToStr(k);
    mmo2.Hide;
    mmo1.Show;
  end;
end;

procedure TfMain.btn_printClick(Sender: TObject);
var
  w, z: string;
  daftar: TStringList;
  i: Integer;
begin
  mmo1.Hide;
  mmo2.Show;
  if (mmo1.Text <> '') then
  begin
    w := FloatToStr(StrToFloat(edt_Bayar.Text));
    z := FloatToStr(StrToFloat(edt_Kembalian.Text));
    if (k > 0) or (k = 0) then
    begin
      mmo2.Clear;
      mmo2.Lines.Add('------ Toko Mainan Thanos Abadi ------');
      mmo2.Lines.Add('');
      mmo2.Lines.Add('~ Struk ' + edt_strk.Text + '~');
      mmo2.Lines.Add('Produk Pembelian');
      //mmo2.Lines.Add('--------------------------------------------');
      begin
        daftar := TStringList.Create;
        daftar.Add(mmo1.Text);

        for i := 0 to daftar.Count - 1 do
          mmo2.Lines.Add(daftar[i]);

        daftar.Free;
      end;
      mmo2.Lines.Add('');
      mmo2.Lines.Add('--------------------------------------------');
      mmo2.Lines.Add('Total Harga  = Rp. ' + Edit6.Text);
      mmo2.Lines.Add('Bayar             = Rp. ' + w);
      mmo2.Lines.Add('--------------------------------------------');
      mmo2.Lines.Add('Kembalian    = Rp. ' + z);
      mmo2.Lines.Add('');
      mmo2.Lines.Add('------------TERIMA KASIH---------------');
      mmo2.Lines.Add('-----Sudah Berbelanja di Toko Kami-----');
      mmo2.Lines.Add(' Kasir : ' + lbl_staff.Caption);
      mmo2.Lines.Add(' Tanggal  : ' + datetostr(date));
      mmo2.Lines.Add(' Waktu  :  ' + timetostr(time));
      edt_strk.text := IntToStr(StrToInt(edt_strk.text)+1);
    end
    else
      Application.MessageBox('Uang tidak cukup untuk pembayaran',
        'Pembayaran', MB_OK + MB_ICONWARNING);

  end
  else
    Application.MessageBox('Tidak ada Transaksi !!!', 'INFO', MB_OK +
      MB_ICONWARNING);

end;

procedure TfMain.tmr1Timer(Sender: TObject);
var
  ADate: TDateTime;
  hari: array[1..7] of string;
begin
  hari[1] := 'Minggu,';
  hari[2] := 'Senin,';
  hari[3] := 'Selasa,';
  hari[4] := 'Rabu,';
  hari[5] := 'Kamis,';
  hari[6] := 'Jumat,';
  hari[7] := 'Sabtu,';

  ADate := date;
  lbl_hari.caption := hari[DayofWeek(ADate)];
  DateSeparator := '-';
  lbl_tgl.caption := DateToStr(Now);
  lbl_jam.Caption := FormatDateTime('hh:mm:ss', Time);
end;

procedure TfMain.btn_closeClick(Sender: TObject);
begin
  edt_strk.Clear;
  Kd_mn.Clear;
  nm.Clear;
  hrg.Clear;
  jm.Clear;
  mmo1.Clear;
  mmo2.Clear;
  Edit6.Clear;
  edt_Bayar.Clear;
  edt_Kembalian.Clear;
  fMain.Hide;
  Form1.Hide;
  form3.Show;
end;

procedure TfMain.BitBtn1Click(Sender: TObject);
begin
  if Application.MessageBox('Yakin menutup aplikasi ?', 'Exit', MB_OKCANCEL +
    MB_ICONWARNING + MB_DEFBUTTON2) = IDOK then
  begin
    fMain.Close();
    Form1.Close();
    form3.Close();
  end;

end;

end.

