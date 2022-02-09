page 52401 "Development DataBase Card"
{
    Caption = 'Development DataBase Card';
    PageType = Card;
    SourceTable = "Development DataBase";
    Editable = true;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ShowMandatory = true;
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                }
                field("Bc version"; Rec."Bc version")
                {
                    ToolTip = 'Specifies the value of the Bc version field.';
                    ApplicationArea = All;
                }
                field(Path; Rec.Path)
                {
                    ToolTip = 'Specifies the value of the Path field.';
                    ApplicationArea = All;
                }
                field(Administrator; Rec.Administrator)
                {
                    ToolTip = 'Specifies the value of the Administrator field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("List of Db")
            {
                Caption = 'List of DataBases';
                Image = Database;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    UserSetup.Get(UserId());
                    if UserSetup.Rights <> UserSetup.Rights::" " then
                        DevelopmentDBList.Run();
                end;
            }
            action("Report")
            {
                Caption = 'Report';
                image = Report;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    UserSetup.Get(UserId());
                    if UserSetup.Rights <> UserSetup.Rights::" " then
                        DBReport.Run();
                end;
            }
        }
    }
    var
        UserSetup: Record "User Setup";
        DevelopmentDBList: Page "Development DataBase List";
        DataBasesTab: Record "Development DataBase";
        DBReport: Report "DevelopmentDB Rep";
}
