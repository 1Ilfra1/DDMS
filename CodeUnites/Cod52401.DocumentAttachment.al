codeunit 52401 DocumentAttachment
{
    [EventSubscriber(ObjectType::Table, DataBase::"Document Attachment", 'OnBeforeInsertAttachment', '', false, false)]
    local procedure MyProcedure(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        MyFieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.NUMBER of
            DataBase::"Requestt":
                begin
                    MyFieldRef := RecRef.Field(1);
                    RecNo := MyFieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
    end;
}
