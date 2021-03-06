page 60138 "Accrual Components Workers-2" //commented By Avinash 
{
    CardPageID = "Accrual Component Emp. Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Accrual Components Employee";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Accrual ID"; Rec."Accrual ID")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Accrual Interval Basis"; Rec."Accrual Interval Basis")
                {
                    ApplicationArea = All;
                }
                field("Accrual Frequency"; Rec."Accrual Frequency")
                {
                    ApplicationArea = All;
                }
                field("Accrual Policy Enrollment"; Rec."Accrual Policy Enrollment")
                {
                    ApplicationArea = All;
                }
                field("Accrual Award Date"; Rec."Accrual Award Date")
                {
                    ApplicationArea = All;
                }
                field("Months Ahead Calculate"; Rec."Months Ahead Calculate")
                {
                    ApplicationArea = All;
                }
                field("Consumption Split by Month"; Rec."Consumption Split by Month")
                {
                    ApplicationArea = All;
                }
                field("Accrual Interval Basis Date"; Rec."Accrual Interval Basis Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }


}

