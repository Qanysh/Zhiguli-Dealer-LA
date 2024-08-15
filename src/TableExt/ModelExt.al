tableextension 50100 SalRecSet extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Model Nos."; Code[20])
        {
            Caption = 'Model Nos.';
            TableRelation = "No. Series";
        }
    }
}