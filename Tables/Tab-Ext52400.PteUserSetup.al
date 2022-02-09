tableextension 52400 PteUserSetup extends "User Setup"
{
    fields
    {
        field(52400; Rights; Enum Rights)
        {
            DataClassification = CustomerContent;
            Caption = 'Rights';
        }
        field(52401; RequestCount; Integer)
        {
            Caption = 'Request Count';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Count("Requestt" Where(Administrator = Field("User ID"), Status = CONST(Sent)));
        }
    }
}
