report 52400 "DevelopmentDB Rep"
{
    Caption = 'DevelopmentDBRep';
    DefaultLayout = RDLC; // if Word use WordLayout property
    RDLCLayout = 'Rep_XML\DevelopmentDbRep.rdl';
    
    dataset
    {
        dataitem(DevelopmentDBIlfra; "Development DataBase")
        {
            column(userid; userid)
            {
            }
            column(today; today)
            {
            }
            column(Code; "Code")
            {
            }
            column(Description; Description)
            {
            }
            column(Bcversion; "Bc version")
            {
            }
            column(Path; Path)
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(CustomerLbl; CustomerLbl)
            {
            }
            column(VersionLbl; VersionLbl)
            {
            }
            column(DataPrintLbl; DataPrintLbl)
            {
            }
            column(UserLbl; UserLbl)
            {
            }
            column(PathLbl; PathLbl)
            {
            }
            column(DescriptionLbl; DescriptionLbl)
            {
            }
            column(CodeLbl; CodeLbl)
            {
            }
            column(CountLbl; CountLbl)
            {
            }
        }
    }

    var
        CustomerLbl: Label 'Customer No.';
        VersionLbl: Label 'Version';
        DataPrintLbl: Label 'Data printing ';
        UserLbl: Label 'Create by User ';
        PathLbl: Label 'Path';
        DescriptionLbl: Label 'Description';
        CodeLbl: Label 'Code';
        CountLbl: Label 'Count of DB ';
}
