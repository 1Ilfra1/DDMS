page 52405 "Dev DB ListPart"
{
    Caption = 'Dev DB ListPart';
    PageType = ListPart;
    SourceTable = "Development DataBase";

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
                field(Administrator; Rec.Administrator)
                {
                    ToolTip = 'Specifies the value of the Administrator field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
