page 52402 "Request List"
{
    ApplicationArea = All;
    Caption = 'Request List';
    PageType = List;
    SourceTable = "Requestt";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Request Card";

    layout
    {
        area(content)
        {
            repeater(General)
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
                field(Status; Rec.Status)
                {
                    StyleExpr = Style;
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Cancelation comment"; Rec."Cancelation comment")
                {
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Cancelation comment field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId());
        if UserSetup.Rights = UserSetup.Rights::" " then begin
            FilterGroup(2);
            Rec.SetRange("User ID", UserId());
            FilterGroup(0);
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        Style := 'Standard';
        if Rec.Priority = Rec.Priority::Emergency then
            Style := 'Attention';
    end;
    var
        UserSetup: Record "User Setup";
        Style: Text[20];
}
