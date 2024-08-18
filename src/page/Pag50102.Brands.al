page 50102 Brands
{
    ApplicationArea = All;
    Caption = 'Brands';
    PageType = List;
    SourceTable = Brand;
    UsageCategory = Lists;
    CardPageId = "Brand Card";

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
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ImportLogo)
            {
                ApplicationArea = All;
                Caption = 'Import Logo';
                Image = Import;
                ToolTip = 'Import a picture file.';

                trigger OnAction()
                begin
                    ImportFromDevice();
                end;
            }
            action(DeleteLogo)
            {
                ApplicationArea = All;
                Caption = 'Delete Logo';
                // Доступ к удалению дается через CheckHasLogo()
                Enabled = DeleteEnabled;
                Image = Delete;
                ToolTip = 'Delete the record.';

                trigger OnAction()
                begin
                    DeleteLogoPicture();
                end;
            }
        }
    }

    // Проверка на наличие логотипа
    trigger OnAfterGetRecord()
    begin
        CheckHasLogo();
    end;

    var
        OverrideImageQst: Label 'The existing picture will be replaced. Do you want to continue?';
        DeleteImageQst: Label 'Are you sure you want to delete the picture?';
        SelectPictureTxt: Label 'Select a picture to upload';
        DeleteEnabled: Boolean;

    // Импорт изображения с компьютера
    procedure ImportFromDevice()
    var
        FileManagement: Codeunit "File Management";
        FileName: Text;
        ClientFileName: Text;
        InStr: InStream;
    begin
        Rec.Find();
        Rec.TestField(Code);

        ClientFileName := '';
        UploadIntoStream(SelectPictureTxt, '', '', ClientFileName, InStr);
        if ClientFileName <> '' then
            FileName := FileManagement.GetFileName(ClientFileName);
        if FileName = '' then
            Error('');

        Clear(Rec.Logo);
        Rec.Logo.ImportStream(InStr, FileName);
        Rec.Modify(true);
    end;

    // Удаление логотипа
    procedure DeleteLogoPicture()
    begin
        if not Confirm(DeleteImageQst) then
            exit;
        Clear(Rec.Logo);
        Rec.Modify(true);
    end;

    procedure CheckHasLogo(): Boolean
    begin
        if Rec.Logo.HasValue() then begin
            DeleteEnabled := true;
        end else
            DeleteEnabled := false;
    end;
}
