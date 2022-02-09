table 52400 "Development DataBase"
{
    Caption = 'Development DataBase';
    DataClassification = CustomerContent;
    DrillDownPageId = "Development DataBase List";
    LookupPageId = "Development DataBase List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
        }
        field(4; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
        }
        field(5; "Bc version"; Enum "BC Version")
        {
            Caption = 'Bc version';
        }
        field(6; Path; Text[250])
        {
            Caption = 'Path';
        }
        field(7; Administrator; Code[50])
        {
            Caption = 'Administrator';
            TableRelation = "User Setup"."User ID" where("Rights" = filter('System Admin' | 'Data Admin' | 'Rights Admin'));
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        "Sales&Rec.Setup": Record "Sales & Receivables Setup";
        fake: Code[20];
    begin
        "Sales&Rec.Setup".GET;
        if Code = '' then begin
            "Sales&Rec.Setup".TestField("Database Development Nos.");
            NoSeriesMgt.InitSeries("Sales&Rec.Setup"."Database Development Nos.", xRec.Code, 0D, Code, fake);
        end;
    end;
}
