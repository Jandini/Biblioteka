unit Wydruk1U;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TWydruk1 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand6: TQRBand;
    QRShape9: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand7: TQRBand;
    QRShape10: TQRShape;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand8: TQRBand;
    QRSysData7: TQRSysData;
    QRShape11: TQRShape;
    QRBand9: TQRBand;
    QRSysData8: TQRSysData;
    QRBand10: TQRBand;
    QRShape12: TQRShape;
    QRSysData9: TQRSysData;
    QuickRep5: TQuickRep;
    QRBand18: TQRBand;
    QRSysData15: TQRSysData;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRBand5: TQRBand;
    QRSysData4: TQRSysData;
    DetailBand1: TQRBand;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRExpr5: TQRExpr;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText34: TQRDBText;
    QRLabel40: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel39: TQRLabel;
    QRShape15: TQRShape;
    QuickRep2: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRSysData2: TQRSysData;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QuickRep3: TQuickRep;
    QRBand4: TQRBand;
    QRShape2: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRBand11: TQRBand;
    QRShape3: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText20: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRBand12: TQRBand;
    QRSysData3: TQRSysData;
    QRShape4: TQRShape;
    QRBand13: TQRBand;
    QRSysData5: TQRSysData;
    QRBand14: TQRBand;
    QRShape5: TQRShape;
    QRSysData6: TQRSysData;
    QuickRep4: TQuickRep;
    QRBand15: TQRBand;
    QRShape6: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel41: TQRLabel;
    QRBand16: TQRBand;
    QRShape7: TQRShape;
    QRDBText25: TQRDBText;
    QRDBText32: TQRDBText;
    QRExpr4: TQRExpr;
    QRDBText33: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRBand17: TQRBand;
    QRSysData10: TQRSysData;
    QRShape8: TQRShape;
    QRBand19: TQRBand;
    QRSysData11: TQRSysData;
    QRBand20: TQRBand;
    QRShape13: TQRShape;
    QRSysData12: TQRSysData;
    QRLabel42: TQRLabel;
    QRDBText37: TQRDBText;
    QuickRep6: TQuickRep;
    QRBand21: TQRBand;
    QRShape14: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRBand22: TQRBand;
    QRShape16: TQRShape;
    QRDBText39: TQRDBText;
    QRExpr6: TQRExpr;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRBand23: TQRBand;
    QRSysData13: TQRSysData;
    QRShape17: TQRShape;
    QRBand24: TQRBand;
    QRSysData14: TQRSysData;
    QRBand25: TQRBand;
    QRShape18: TQRShape;
    QRSysData16: TQRSysData;
    QRLabel43: TQRLabel;
    QRDBText38: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Wydruk1: TWydruk1;

implementation


uses BibliotekaU;
{$R *.DFM}



end.
