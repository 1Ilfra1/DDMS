page 52400 "Development DataBase List"
{
    ApplicationArea = All;
    Caption = 'Development DataBase List';
    PageType = List;
    SourceTable = "Development DataBase";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Development DataBase Card";


    layout
    {
        area(content)
        {
            repeater(General)
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
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
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
            action(DevDBXML)
            {
                Caption = 'DevDBXML';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Xmlport.Run(Xmlport::DevDBXML, false, false);
                end;
            }
            action("Report of Data base list")
            {
                Caption = 'Report of Data base list';
                Image = Report;
                // RunObject = Report "DevelopmentDB Rep";
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Report.Run(Report::"DevelopmentDB Rep");
                end;
            }
        }
    }
}
