xmlport 52400 DevDBXML
{
    Caption = 'Development DataBase Xml';
    Direction = Export;

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(DevelopmentDBIlfra; "Development DataBase")
            {
                fieldelement(Code; DevelopmentDBIlfra."Code")
                {
                }
                fieldelement(Description; DevelopmentDBIlfra.Description)
                {
                }
            }
        }
    }
}
