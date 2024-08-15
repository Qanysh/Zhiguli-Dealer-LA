pageextension 50100 SalRecSet extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Model Nos."; Rec."Model Nos.")
            {
                ApplicationArea = All;
            }
        }
    }
}
