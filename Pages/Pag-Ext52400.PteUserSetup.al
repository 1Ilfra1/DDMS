pageextension 52400 PteUserSetup extends "User Setup"
{
    layout
    {
        // Adding a new control field 'ShoeSize' in the group 'General'
        addlast(Control1)
        {
            field("Rights"; Rights)
            {
                Caption = 'Rights';
            }
            field("Request Count"; RequestCount)
            {
                Caption = 'Request Count';
            }
        }
    }

    actions
    {
        // Adding a new action group 'MyNewActionGroup' in the 'Creation' area
        addlast(Processing)
        {
            action("List of db")
            {
                Image = Database;
                Caption = 'List of DB';
                trigger OnAction();
                var
                    UserSetup: Record "User Setup";
                    DevelopmentDB: Record "Development DataBase";
                begin
                    UserSetup.GET(USERID());
                    if UserSetup.Rights <> UserSetup.Rights::" " then begin
                        DevelopmentDB.SETRANGE(Administrator, UserId());
                        Page.RUN(Page::"Development DataBase List", DevelopmentDB);
                    end;
                end;
            }
        }
    }
}
