table 50101 Brand
{
    Caption = 'Brand';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;

        }
        field(2; Name; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(10; Logo; Blob)
        {
            DataClassification = CustomerContent;
            Subtype = Bitmap;
        }
    }

    keys
    {
        key(pk; Code)
        {
            Clustered = true;
        }
    }
}