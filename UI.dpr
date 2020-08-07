program UI;

uses
  Forms,
  Unit4 in 'Unit4.pas' {fMain},
  Unit2 in 'Unit2.pas' {ddm: TDataModule},
  Unit3 in 'Unit3.pas' {Form3},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  //Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TForm1, Form1);
  Application.Title := 'Toko Mainan';
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(Tddm, ddm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
