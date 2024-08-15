page 50101 "Car Options"
{
    ApplicationArea = All;
    Caption = 'CarOptions';
    PageType = ListPart;
    SourceTable = "Car Option";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(VIN; Rec.VIN)
                {
                }
                field(Code; Rec.Code)
                {
                }
                field(Price; Rec.Price)
                {
                }
            }
        }
    }
}
