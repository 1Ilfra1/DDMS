tableextension 52401 "PteSales&Rec.Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(52300; "Database Development Nos."; Code[20])
        {
            Caption = 'Database Development Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(52301; "Database Requests Nos."; Code[20])
        {
            Caption = 'Database Requests Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
    }
}
