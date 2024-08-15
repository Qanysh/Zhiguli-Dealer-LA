page 50103 Models
{
    ApplicationArea = All;
    Caption = 'Models';
    PageType = List;
    SourceTable = Model;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }
}
