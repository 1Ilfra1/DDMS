page 52400 "Development DB List"
{
    ApplicationArea = All;
    Caption = 'Development DB';
    PageType = List;
    SourceTable = "Development DB";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Development DB Card";


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
                RunObject = XMLport DevDBXML;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
            }
            action("Report of Data base list")
            {
                Caption = 'Report of Data base list';
                Image = Report;
                RunObject = Report "DevelopmentDB Rep";
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
            }
        }
    }
}
