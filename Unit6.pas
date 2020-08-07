unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TfBayar = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    mm_byr: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBayar: TfBayar;

implementation
uses
  Unit4;
{$R *.dfm}

end.
