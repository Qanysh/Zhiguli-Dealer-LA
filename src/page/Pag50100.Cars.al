page 50100 Cars
{
    ApplicationArea = All;
    Caption = 'Cars';
    PageType = List;
    SourceTable = Car;
    UsageCategory = Lists;
    CardPageId = "Car Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(VIN; Rec.VIN)
                {
                }
                field(BrandCode; Rec."Brand Code")
                {
                }
                field("Model No."; Rec."Model No.")
                {
                }
                field("Model Name"; Rec."Model Name")
                {
                }
                field("Body Type"; Rec."Body Type")
                {
                }
                field(Height; Rec.Height)
                {
                }
                field(Width; Rec.Width)
                {
                }
                field(Length; Rec.Length)
                {
                }
                field("Additional Equipment"; Rec."Additional Equipment")
                {
                }
                field("Add equip Description"; Rec."Add equip Description")
                {
                }
                field(Priority; Rec.Priority)
                {
                }
                field("Production Date"; Rec."Production Date")
                {
                }
            }
        }
        area(FactBoxes)
        {
            part(PricesPart; "Prices Sub")
            {
                SubPageLink = VIN = field(VIN);
            }
        }
    }
}
