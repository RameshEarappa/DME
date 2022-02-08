page 60134 "Payroll Job Open Postions"
{
    Caption = 'Open Positions';
    CardPageID = "Payroll Job Position Card";
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Payroll Position";
    SourceTableView = WHERE("Open Position" = CONST(true));
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Reports to Position"; Rec."Reports to Position")
                {
                    ApplicationArea = All;
                }
                field("Earning Code Group"; Rec."Earning Code Group")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    // Start 21.10.2020 @mma0786
    actions
    {
        area(Processing)
        {
            action("Attachment")
            {
                ApplicationArea = All;
                Image = Attachments;
                Promoted = true;
                Caption = 'Attachment';
                //PromotedCategory = Category8;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                trigger
                OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GETTABLE(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RUNMODAL;
                end;
            }
        }
    }
    // Stop 21.10.2020 @mma0786


    trigger OnAfterGetRecord()
    begin
        Rec.UpdateOpenPositions;
        Rec.CheckPositionActive;
    end;

    var
        PayrollPosDuration: Record "Payroll Position Duration";
}

