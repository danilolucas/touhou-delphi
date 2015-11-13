unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, MMSystem, pngimage, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    BackGround: TImage;
    BackGroundScreen: TImage;
    Screen: TPanel;
    Witch: TImage;
    AuraBoss: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Boss: TImage;
    SomButton: TImage;
    Timer4: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure SomButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Shoot:array[1..20] of TImage;
  ind,cont:integer;
  Timer:Boolean=false;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    if(getkeystate(vk_up)<0)
        then
            begin
                Witch.Top:=Witch.Top-5;
                Witch.Picture.LoadFromFile('animation\Witch\WitchBack.png');
            end;

    if(getkeystate(vk_down)<0)
        then
            begin
                Witch.Top:=Witch.Top+5;
                Witch.Picture.LoadFromFile('animation\Witch\WitchBack.png');
            end;

    if(getkeystate(vk_right)<0)
        then
            begin
                Witch.Left:=Witch.Left+5;
                Witch.Picture.LoadFromFile('animation\Witch\WitchRight.png');
            end;

    if(getkeystate(vk_left)<0)
        then
            begin
                Witch.Left:=Witch.Left-5;
                Witch.Picture.LoadFromFile('animation\Witch\WitchLeft.png');
            end;

    if(Witch.Top<1)
        then
            Witch.Top:=Witch.Top+5;
    if(Witch.Top>Screen.Top+390)
        then
            Witch.Top:=Witch.Top-5;
    if(Witch.Left<0)
        then
            Witch.Left:=Witch.Left+5;
    if(Witch.Left>Screen.Left+325)
        then
            Witch.Left:=Witch.Left-5;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    DoubleBuffered:=true;
    ind:=0;
    cont:=1;
    SndPlaySound('sound\th06_14.wav', SND_ASYNC);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
    if(getkeystate(vk_space)<0)
        then
            begin
                if(ind<=19)
                    then
                        begin
                            ind:=ind+1;
                            Shoot[ind]:=TImage.Create(self);
                            Shoot[ind].Parent:=Screen;
                            Shoot[ind].Picture.LoadFromFile('animation\shoot\DoubleBlueShoot.png');
                            Shoot[ind].Top:=Witch.Top-30;
                            Shoot[ind].Left:=Witch.Left;
                            Timer:=true;
                        end
                else
                    if(ind>=19)
                        then
                            begin
                                Shoot[cont].Top:=Witch.Top-30;
                                Shoot[cont].Left:=Witch.Left;
                                cont:=cont+1;
                                if(cont>=19)
                                    then
                                        cont:=1;
                            end;
            end;

end;

procedure TForm1.Timer3Timer(Sender: TObject);
  var x:byte;
begin
    if(Timer=true)
        then
            begin
            x:=1;
            while (x<=ind) do
                begin
                    Shoot[x].Top:=Shoot[x].Top-10;
                    x:=x+1;
                end;
            end;
end;

procedure TForm1.SomButtonMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    SndPlaySound('nil', SND_ASYNC);
end;

end.





