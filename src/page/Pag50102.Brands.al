page 50102 Brands
{
    ApplicationArea = All;
    Caption = 'Brands';
    PageType = List;
    SourceTable = Brand;
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
                field(Name; Rec.Name)
                {
                }
                field(Logo; Rec.Logo)
                {
                    ApplicationArea = All;
                    // Image = Report;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Upload Logo")
            {
                Caption = 'Upload Logo';
                ApplicationArea = All;
                Image = Import;

                trigger OnAction()
                var
                    FromFileName: Text;
                    InStreamLogo: Instream;
                begin
                    // if UploadIntoStream('Import', '', 'All Files (*-*)|*-*', FromFileName, InStreamLogo) then begin
                    //     Rec.Logo.ImportStream(InStreamLogo, FromFileName);
                    //     Rec.Modify(true);
                    // end;
                end;
            }
        }
    }
}
