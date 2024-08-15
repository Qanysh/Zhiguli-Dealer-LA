page 50105 "Prices Sub"
{
    Caption = 'Prices';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = Car;

    layout
    {
        area(Content)
        {
            field("Sales Price"; Rec."Sales Price")
            {
            }
            field("Option Price"; Rec."Option Price")
            {
            }
            field("Total Price"; Rec."Total Price")
            {
            }
        }
    }
}