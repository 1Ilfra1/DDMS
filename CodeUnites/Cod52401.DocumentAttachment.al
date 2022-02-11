codeunit 52401 DocumentAttachment
{
    local procedure DeleteAttachedDocuments(Rec: Record "DataBase Request")
    var
        DocumentAttachment: Record "Document Attachment";
    begin
        if Rec.IsTemporary() then
            exit;
        if DocumentAttachment.IsEmpty() then
            exit;

        SetDocumentAttachmentFiltersForRecRef(DocumentAttachment, Rec);
        if Rec.IsEmpty() then
            DocumentAttachment.DeleteAll();
    end;

    local procedure SetDocumentAttachmentFiltersForRecRef(var DocumentAttachment: Record "Document Attachment"; Rec: Record "DataBase Request")
    begin
        DocumentAttachment.SetRange("Table ID", Database::"Document Attachment");
        DocumentAttachment.SetRange("No.", Rec."No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"DataBase Request", 'OnAfterDeleteEvent', '', false, false)]
    local procedure DeleteAttachedDocumentsOnAfterDeleteEmployee(var Rec: Record "DataBase Request"; RunTrigger: Boolean)
    var
        RecRef: RecordRef;
    begin
        DeleteAttachedDocuments(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure DAOnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        DataBaseRequest: Record "DataBase Request";
    begin
        case DocumentAttachment."Table ID" of
            Database::"DataBase Request":
                begin
                    RecRef.Open(Database::"DataBase Request");
                    DataBaseRequest.SetRange("No.", DocumentAttachment."No.");
                    if DataBaseRequest.FindFirst() then begin
                        RecRef.GetTable(DataBaseRequest);
                    end;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure DAOnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        DataBaseRequest: Record "DataBase Request";
        MyFieldRef: FieldRef;
        RecNo: Code[20];
        LineNo: Integer;
    begin
        case RecRef.Number of
            Database::"DataBase Request":
                begin
                    MyFieldRef := RecRef.Field(1);
                    RecNo := MyFieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
    end;
}
