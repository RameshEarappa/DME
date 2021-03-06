table 70155 "HR Announcements"
{
    DataClassification = ToBeClassified;
    DataCaptionFields = "Annountment Header";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(20; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Annountment Header"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Announcements Content"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Expiry Date" <> 0D then
                    if "Effective Date" >= "Expiry Date" then
                        Error('Effective date should be not be greater than Epiry date.');
            end;

        }
        field(25; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                TestField("Effective Date");
                if "Expiry Date" < "Effective Date" then
                    Error('Expiry date should be greater than Effective date.');
            end;
        }
        field(26; "Publish to ESS"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Created By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Created Date", "Annountment Header") { }
        fieldgroup(Brick; "Created Date", "Annountment Header") { }
    }


    trigger OnInsert()
    begin
        "Entry No." := 0;
        "Created By" := Database.UserId;
        "Created Date" := Today;
        "Created Time" := Time;

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        if "Expiry Date" <= Today then
            Error('you cannot delete record.');
    end;

    trigger OnRename()
    begin

    end;

    var
    procedure SetAnnouncementsContent(CurrRec: Record "HR Announcements"; AnnouncementsContentTxtVal: Text)
    var
        OutStream: OutStream;
    begin
        CLEAR(CurrRec."Announcements Content");
        if AnnouncementsContentTxtVal = '' then
            exit;
        CurrRec."Announcements Content".CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(AnnouncementsContentTxtVal);
        CurrRec.Modify;
    end;

    procedure GetAnnouncementsContent(CurrRec: Record "HR Announcements"): Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CurrRec.CALCFIELDS("Announcements Content");
        if not CurrRec."Announcements Content".HASVALUE then
            exit('');

        CurrRec.CALCFIELDS("Announcements Content");
        CurrRec."Announcements Content".CreateInStream(InStream, TEXTENCODING::UTF8);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator));
    end;

}