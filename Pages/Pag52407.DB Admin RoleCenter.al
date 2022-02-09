page 52407 "DB Admin RoleCenter"
{
    Caption = 'DB Admin RoleCenter';
    PageType = RoleCenter;
    UsageCategory = Administration;

    layout
    {
        area(RoleCenter)
        {
            group(Group1)
            {
                part(Part1; "Dev DB ListPart")
                {
                    Caption = 'Development DB';
                }
                part(Part2; "Request ListPart")
                {
                    Caption = 'Request';
                }
            }
        }
    }
}
