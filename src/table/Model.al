table 50102 Model
{
    Caption = 'Model';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;

        }
        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        // Заполнение нумерации моделей
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        SalesReceivablesSetup.Get();
        if Code = '' then
            Code := NoSeries.GetNextNo(SalesReceivablesSetup."Model Nos.")
    end;
}