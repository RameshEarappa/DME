page 60350 "Employee Contacts SubPage"
{
    // version PHASE -2

    AutoSplitKey = true;
    Caption = 'Contacts';
    PageType = ListPart;
    SourceTable = "Employee Contacts Line";
    UsageCategory = Lists;
    ApplicationArea = All;
    // InsertAllowed = false;
    // DeleteAllowed = false;
    // ModifyAllowed = false;
    // Editable = false;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("Contact Number & Address"; Rec."Contact Number & Address")
                {
                    ApplicationArea = All;
                }
                field(Extension; Rec.Extension)
                {
                    ApplicationArea = All;
                }
                field(Primary; Rec.Primary)
                {
                    ApplicationArea = All;
                }
                field("Emergency Contact"; Rec."Emergency Contact")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

