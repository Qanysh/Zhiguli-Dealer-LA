page 50106 "Brand Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = Brand;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(FactBoxes)
        {
            part(Logo; "Logo Sub")
            {
                SubPageLink = Code = field(Code);
            }
        }
    }
}