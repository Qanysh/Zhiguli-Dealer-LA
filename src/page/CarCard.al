page 50104 "Car Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = Car;
    Caption = 'Car Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(VIN; Rec.VIN)
                {
                    ApplicationArea = All;

                }
                field("Brand Code"; Rec."Brand Code")
                {
                    ApplicationArea = All;

                }
                field("Model No."; Rec."Model No.")
                {
                    ApplicationArea = All;

                }
                field("Model Name"; Rec."Model Name")
                {
                    ApplicationArea = All;

                }
            }
            group(BodyType)
            {
                Caption = 'Body type';
                field("Body type"; Rec."Body type")
                {
                    ApplicationArea = All;
                    Importance = Promoted;

                }
                field(Height; Rec.Height)
                {
                    ApplicationArea = All;

                }
                field(Width; Rec.Width)
                {
                    ApplicationArea = All;

                }
                field(Length; Rec.Length)
                {
                    ApplicationArea = All;

                }
            }
            group(Options)
            {
                Caption = 'Options';
                field("Additional equipment"; Rec."Additional equipment")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Add equip Description"; Rec."Add equip Description")
                {
                    ApplicationArea = All;
                    // Дает возможность изменять поле по значению галочки (0 или 1)
                    Editable = Rec."Additional equipment";
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;

                }
                field("Production Date"; Rec."Production Date")
                {
                    ApplicationArea = All;
                    Importance = Promoted;

                }
            }
            group(Prices)
            {
                Caption = 'Prices';
                field("Sales Price"; Rec."Sales Price")
                {
                    ApplicationArea = All;
                    Importance = Promoted;

                }
                field("Option Price"; Rec."Option Price")
                {
                    ApplicationArea = All;

                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = All;

                }
            }
            part("Car Options"; "Car Options")
            {
                SubPageLink = VIN = field(VIN);
            }
        }
    }
}