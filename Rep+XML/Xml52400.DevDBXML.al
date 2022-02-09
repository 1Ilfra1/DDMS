xmlport 52400 DevDBXML
{
    Caption = 'DevDBXML';
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(DevelopmentDBIlfra; "Development DB")
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
