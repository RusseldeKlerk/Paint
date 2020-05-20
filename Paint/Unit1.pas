unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ActnMan,
  Vcl.ActnColorMaps, Vcl.StdCtrls, Vcl.ColorGrd, Vcl.Imaging.Jpeg;

type
  TfrmPaint = class(TForm)
    Image1: TImage;
    pnlColor: TPanel;
    btnClear: TButton;
    btnDrawR: TButton;
    btnSave: TButton;
    Button4: TButton;
    Label1: TLabel;
    btnDrawE: TButton;
    Button1: TButton;
    ListBox1: TListBox;
    lblInstruct: TLabel;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    btnDrawL: TButton;
    btnFreeHand: TButton;
    ColorListBox1: TColorListBox;
    cmbPenWidth: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlColorClick(Sender: TObject);
    procedure ColorListBox1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure cmbPenWidthChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnDrawEClick(Sender: TObject);
    procedure btnDrawRClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnDrawLClick(Sender: TObject);
    procedure btnFreeHandClick(Sender: TObject);
  private
    { Private declarations }
  public
  var
    iX, iY: Integer;
    bDraw, bEllipse, bEllipse2, bRectangle, bR2, bL2, bNone, bLine: Boolean;
    Color: TColor;
    iPenWidth, StartX, StartY, EndX, EndY: Integer;
  end;

var
  frmPaint: TfrmPaint;

implementation

{$R *.dfm}

procedure TfrmPaint.btnClearClick(Sender: TObject);
begin
  with Image1, canvas do
  begin
    Pen.Color := clBlack;
    Pen.Width := 1;
    Brush.Color := clWhite;
    Rectangle(0, 0, Image1.Width - 1, Image1.Height - 1);
  end;
end;

procedure TfrmPaint.btnDrawEClick(Sender: TObject);
begin
  lblInstruct.Caption := 'Click where you want the ellipse';
  bEllipse := True;
  bNone := False;
  bRectangle := False;
  bLine := False;
end;

procedure TfrmPaint.btnDrawRClick(Sender: TObject);
begin
  lblInstruct.Caption := 'Click where you want the rectangle';
  bEllipse := False;
  bNone := False;
  bRectangle := True;
  bLine := False;
end;

procedure TfrmPaint.btnFreeHandClick(Sender: TObject);
begin
  bEllipse := False;
  bNone := True;
  bRectangle := False;
  bLine := False;
end;

procedure TfrmPaint.btnSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Image1.Picture.SaveToFile(SaveDialog1.FileName);
end;

procedure TfrmPaint.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Image1.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TfrmPaint.btnDrawLClick(Sender: TObject);
begin
  lblInstruct.Caption := 'Click where you want the line';
  bEllipse := False;
  bNone := False;
  bRectangle := False;
  bLine := True;
end;

procedure TfrmPaint.Button3Click(Sender: TObject);
var
  B: TBitmap;
begin
  B := TBitmap.Create;
  B.Height := Image1.Height;
  B.Width := Image1.Width;
  B.canvas.CopyRect(rect(0, 0, B.Width, B.Height), Image1.canvas,
    Image1.clientrect);
  ListBox1.Items.AddObject('Image ' + inttostr(ListBox1.Items.Count + 1), B);
end;

procedure TfrmPaint.Button4Click(Sender: TObject);
begin
  cmbPenWidth.Visible := True;
end;

procedure TfrmPaint.cmbPenWidthChange(Sender: TObject);
begin
  iPenWidth := cmbPenWidth.ItemIndex + 3;
  cmbPenWidth.Visible := False;
end;

procedure TfrmPaint.ColorListBox1Click(Sender: TObject);
begin
  Color := ColorListBox1.Selected;
  pnlColor.Color := Color;
  ColorListBox1.Visible := False;
end;

procedure TfrmPaint.FormCreate(Sender: TObject);
begin
  bNone := True;
  bEllipse := False;
  bRectangle := False;
  iPenWidth := 3;
  Color := clBlack;
  with Image1, canvas do
  begin
    Brush.Color := clWhite;
    canvas.Rectangle(clientrect);
  end;
end;

procedure TfrmPaint.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  StartX := X;
  StartY := Y;
  EndX := X;
  EndY := Y;
  Image1.canvas.Pen.Color := Color;
  Image1.canvas.Pen.Width := iPenWidth;
  if bRectangle then
  begin
    Image1.canvas.Pen.Color := clWhite;
    bR2 := True;
  end;
    if bLine then
  begin
    Image1.canvas.Pen.Color := clWhite;
    bL2 := True;
  end;
  if bEllipse then
    bEllipse2 := True;
  if bNone then
  begin
    bDraw := True;
    Image1.canvas.MoveTo(X, Y);
    Image1.canvas.LineTo(X, Y);
  end;
end;

procedure TfrmPaint.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  PenColor: TColor;
begin
  if bR2 then
  begin
    with Image1.canvas do
    begin
      Pen.Mode := pmXOR;
      MoveTo(StartX, StartY);
      LineTo(StartX, EndY);
      LineTo(EndX, EndY);
      LineTo(EndX, StartY);
      LineTo(StartX, StartY);
      Pen.Mode := pmXOR;
      MoveTo(StartX, StartY);
      LineTo(StartX, Y);
      LineTo(X, Y);
      LineTo(X, StartY);
      LineTo(StartX, StartY);
    end;
    EndX := X;
    EndY := Y;
  end;
  if bL2 then
  begin
    with Image1.canvas do
    begin
      Pen.Mode := pmXOR;
      MoveTo(StartX, StartY);
      LineTo(EndX, EndY);
      Pen.Mode := pmXOR;
      MoveTo(StartX, StartY);
      LineTo(X, Y);
    end;
    EndX := X;
    EndY := Y;
  end;
  if bEllipse2 then
  begin
    with Image1.canvas do
    begin
      Pen.Mode := pmCopy;
      PenColor := Pen.Color;
      Pen.Color := Brush.Color;
      Ellipse(StartX, StartY, EndX, EndY);
      Pen.Color := PenColor;
      Ellipse(StartX, StartY, X, Y);
    end;
    EndX := X;
    EndY := Y;
  end;

  if bDraw then
  begin
    Image1.Cursor := crNone;
    Image1.canvas.LineTo(X, Y);
    Image1.Cursor := crDefault;
  end;
end;

procedure TfrmPaint.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  bDraw := False;
  bEllipse := False;
  bEllipse2 := False;
  bR2 := False;
  bL2 := False;
  if bLine then
  begin
    with Image1.canvas do
    begin
      Pen.Mode := pmXOR;
      MoveTo(StartX, StartY);
      LineTo(EndX, EndY);
      Pen.Color := Color;
      Pen.Mode := pmCopy;
      MoveTo(StartX, StartY);
      LineTo(EndX, EndY);
    end;
  end;

  if bRectangle then
  begin
    with Image1.canvas do
    begin
      Pen.Mode := pmXOR;
      MoveTo(StartX, StartY);
      LineTo(StartX, EndY);
      LineTo(EndX, EndY);
      LineTo(EndX, StartY);
      LineTo(StartX, StartY);
      Pen.Color := Color;
      Brush.Color := clWhite;
      Pen.Mode := pmCOPY;
      MoveTo(StartX, StartY);
      LineTo(StartX, EndY);
      LineTo(EndX, EndY);
      LineTo(EndX, StartY);
      LineTo(StartX, StartY);
    end;
  end;
end;

procedure TfrmPaint.ListBox1Click(Sender: TObject);
var
  B: TBitmap;
begin
  if ListBox1.ItemIndex >= 0 then
    with ListBox1 do
    begin
      B := TBitmap(Items.objects[ItemIndex]);
      Image1.canvas.CopyRect(Image1.clientrect, B.canvas,
        rect(0, 0, B.Width, B.Height));
    end;
end;

procedure TfrmPaint.pnlColorClick(Sender: TObject);
begin
  ColorListBox1.Visible := True;
end;

end.
