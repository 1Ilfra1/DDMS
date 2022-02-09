pageextension 52402 "PteSales&Rec.Setup" extends "Sales & Receivables Setup"
{
    layout
    {

        addlast("Number Series")
        {
            field("Database development Nos."; "Database Development Nos.")
            {
                Caption = 'Database development Nos.';
            }
            field("Database requests Nos."; "Database Requests Nos.")
            {
                Caption = 'Database requests Nos.';
            }
        }

    }
}