table 50100 Car
{
    Caption = 'Cars';
    DataCaptionFields = "Brand Code", "Model Name";
    DataClassification = CustomerContent;

    fields
    {
        field(1; VIN; Code[17])
        {
            DataClassification = CustomerContent;
        }
        field(10; "Brand Code"; Code[20])
        {
            Caption = 'Brand Code';
            DataClassification = CustomerContent;
            TableRelation = Brand.Code;
        }
        field(20; "Model No."; Code[20])
        {
            Caption = 'Model No.';
            DataClassification = CustomerContent;
            TableRelation = Model.Code;
        }
        field(30; "Model Name"; Text[50])
        {
            Caption = 'Model Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Model.Description WHERE(Code = field("Model No.")));
        }
        field(40; "Body type"; Enum "Body type")
        {
            Caption = 'Body type';
            DataClassification = CustomerContent;
        }
        field(50; Height; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(51; Width; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(52; Length; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(60; "Additional equipment"; Boolean)
        {
            Caption = 'Additional equipment';
            DataClassification = CustomerContent;
        }
        field(61; "Add equip Description"; Text[100])
        {
            Caption = 'Add equip Description';
            DataClassification = CustomerContent;
        }
        field(70; Priority; Integer)
        {
            DataClassification = CustomerContent;
            /* Едут два эстонца (отец с сыном) в телеге на ярмарку. Вдруг отец тянет на себя вожжи, телега останавливает, он подбирает с дороги дохлую ворону, бросает в телегу, и они едут дальше.

             - Зачеем анна наам? - спрашивает сын у отца.
             - Вдруг пригадиццца.

             Проходит год. Опять отец с сыном едут на ярмарку. На том самом месте, где они подобрали дохлую ворону, старший дёргает вожжи, слазит с телеги, аккуратно кладёт ворону на место, и они едут дальше.

             - Заччеем ты её выбраасссил? - спрашивает сын.
             - Не пригодииллассс.*/
        }
        field(80; "Production Date"; Date)
        {
            Caption = 'Production Date';
            DataClassification = SystemMetadata;

        }
        field(90; "Sales Price"; Decimal)
        {
            Caption = 'Sales Price';
            DataClassification = CustomerContent;
        }
        field(91; "Option Price"; Decimal)
        {
            Caption = 'Option Price';
            FieldClass = FlowField;
            CalcFormula = sum("Car Option".Price);
        }
        field(92; "Total Price"; Decimal)
        {
            //Hold ждем консультанта
            Caption = 'Total Price';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(pk; VIN)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        // Рандомайзер до 100
        CalcPrice();

        // Заполнение рабочей датой
        "Production Date" := WORKDATE;
    end;

    trigger OnModify()
    begin
        // Очистка при изменений BodyType
        ClearOptions();

        //Очистка поля Add equip Description в зависимости от Additional equipment
        CheckEquip();
    end;

    // Рандомайзер до 100
    procedure CalcPrice()
    var
        RandomValue: Decimal;
    begin
        RandomValue := Random(100);
        "Sales Price" := RandomValue;
    end;

    // Очистка при изменений BodyType
    procedure ClearOptions()
    begin
        if "Body Type" <> xRec."Body Type" then begin
            "Height" := 0;
            "Width" := 0;
            "Length" := 0;
        end;
    end;

    //Очистка поля Add equip Description в зависимости от Additional equipment
    procedure CheckEquip()
    var
        isAdditionalEquipChecked: Boolean;
    begin
        isAdditionalEquipChecked := Rec."Additional equipment";
        if not isAdditionalEquipChecked then begin
            "Add equip Description" := '';
        end;
    end;

}