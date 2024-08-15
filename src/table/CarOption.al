table 50103 "Car Option"
{
    Caption = 'Car Option';
    DataClassification = CustomerContent;

    fields
    {
        field(1; VIN; Code[17])
        {
            DataClassification = CustomerContent;
            TableRelation = Car.VIN;

        }
        field(2; Code; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(10; Price; Decimal)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(pk; VIN, Code)
        {
            Clustered = true;
        }
    }
}