page 52403 "DataBase Request Card"
{
    Caption = 'DataBase Request Card';
    PageType = Card;
    SourceTable = "DataBase Request";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("User Id"; Rec."User Id")
                {
                    ToolTip = 'Specifies the value of the User Id field.';
                    ApplicationArea = All;
                }
                field("Creating date"; Rec."Creating date")
                {
                    ToolTip = 'Specifies the value of the Creating date field.';
                    ApplicationArea = All;
                }
                field("Creating time"; Rec."Creating time")
                {
                    ToolTip = 'Specifies the value of the Creating time field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
                {
                    ToolTip = 'Specifies the value of the Priority field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Development DB"; Rec."Development DB")
                {
                    ToolTip = 'Specifies the value of the Development DB field.';
                    ApplicationArea = All;
                }
                field(Administrator; Rec.Administrator)
                {
                    ToolTip = 'Specifies the value of the Administrator field.';
                    ApplicationArea = All;
                }
                field("Cancelation comment"; Rec."Cancelation comment")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cancelation comment field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Apply for review")
            {
                Caption = 'Apply for Review';
                Image = Apply;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    ReqManage.SendingRequest(Rec);
                end;
            }
            action("Execute")
            {
                Caption = 'Execute';
                image = ExecuteBatch;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    ReqManage.Executed(Rec);
                end;
            }
            action("Canceled")
            {
                caption = 'Canceled';
                image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    ReqManage.Cancel(Rec);
                end;
            }
            action("DocAttach")
            {
                Caption = 'Document Attachment';
                image = Document;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GETTABLE(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
        }
    }
    var
        ReqManage: Codeunit "Request Management";
}
