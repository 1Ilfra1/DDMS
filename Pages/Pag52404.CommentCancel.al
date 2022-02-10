page 52404 CommentCancel
{
    Caption = 'CommentCancel';
    PageType = Card;
    SourceTable = "Name/Value Buffer";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Value"; Rec."Value")
                {
                    ToolTip = 'Specifies the value of the Value field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    procedure GetInputValue(): Text[250]
    begin
        exit(Value);
    end;

}
