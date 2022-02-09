pageextension 52401 PteCustomerCard extends "Customer Card"
{
    actions
    {
        // Добавить на карточку клиента Action который будет открывать список баз, для данного клиента.
        addlast(Processing)
        {
            action("List of db")
            {
                Image = Database;
                Caption = 'List of DB';

                trigger OnAction();
                var
                    DevelopmentDB: Record "Development DataBase";
                begin
                    DevelopmentDB.SetRange("Customer Name", Rec.Name);
                    Page.RUN(Page::"Development DataBase List", DevelopmentDB);
                end;
            }
        }
    }
}
