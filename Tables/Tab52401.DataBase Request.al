table 52401 "DataBase Request"
{
    Caption = 'DataBase Request';
    DataClassification = CustomerContent;

    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(20; "User Id"; Code[50])
        {
            Caption = 'User Id';
            Editable = false;
            TableRelation = "User Setup"."User ID";
        }
        field(30; "Creating date"; Date)
        {
            Caption = 'Creating date';
            Editable = false;
        }
        field(31; "Creating time"; Time)
        {
            Caption = 'Creating time';
            Editable = false;
        }
        field(40; Status; Enum Status)
        {
            Caption = 'Status';
        }
        field(50; Priority; Enum Priority)
        {
            Caption = 'Priority';
        }
        field(60; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(61; "Development DB"; Code[20])
        {
            Caption = 'Development DB';
            TableRelation = "Development DataBase".Code;
            trigger OnValidate()
            begin
                AdminInsert(Rec);
            end;
        }
        field(70; Administrator; Code[50])
        {
            Editable = false;
            Caption = 'Administrator';
            // FieldClass = FlowField;
            // CalcFormula = lookup("User Setup"."User ID" where("Rights" = filter('System Admin' | 'Data Admin' | 'Rights Admin')));
        }
        field(71; "Cancelation comment"; Text[250])
        {
            Caption = 'Cancelation comment';
        }
    }
    keys
    {
        key(PK; "No.")
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
        InitValues(Rec);
        "Sales&Rec.Setup".GET;
        if "No." = '' then begin
            "Sales&Rec.Setup".TestField("Database Requests Nos.");
            NoSeriesMgt.InitSeries("Sales&Rec.Setup"."Database Requests Nos.", xRec."No.", 0D, "No.", fake);
        end;
    end;


    procedure InitValues(VAR Req: Record "DataBase Request")
    begin
        Req."User ID" := UserId;
        Req."Creating date" := Today;
        Req."Creating Time" := Time;
    end;

    procedure AdminInsert(VAR Req: Record "DataBase Request")
    var
        DevelopmentDb: Record "Development DataBase";
    begin
        if Req."Development DB" <> '' then begin
            DevelopmentDb.GET(Req."Development DB");
            Req.Administrator := DevelopmentDb.Administrator;
            // Rec.Modify();
        end;
    end;




}
