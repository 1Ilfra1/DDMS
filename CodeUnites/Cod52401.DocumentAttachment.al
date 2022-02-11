codeunit 52401 DocumentAttachment
{
    [EventSubscriber(ObjectType::Table, DataBase::"Document Attachment", 'OnBeforeInsertAttachment', '', false, false)]
    local procedure MyProcedure(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        MyFieldRef: FieldRef;
        RecNo: Code[20];
        SalesDocumentFlow: Boolean;
        PurchaseDocumentFlow: Boolean;
    begin

        case RecRef.NUMBER of
            DataBase::"DataBase Request":
                begin
                    MyFieldRef := RecRef.Field(1);
                    RecNo := MyFieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                    DocumentAttachment.VALIDATE("No.", RecNo);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure DocAttOnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        DbRequest: Record "DataBase Request";
    begin
        case DocumentAttachment."Table ID" of
            Database::"DataBase Request":
                begin
                    RecRef.Open(Database::"DataBase Request");
                    DbRequest.SetRange("No.", DocumentAttachment."No.");
                    if DbRequest.FindFirst() then begin
                        RecRef.GetTable(DbRequest);
                    end;
                end;
        end;
    end;

    // [EventSubscriber(ObjectType::Page, page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    // local procedure MyProcedure2()
    // var
    //     DbRequest: Record "DataBase Request";
    // begin
    //     CASE "Table ID" OF
    //         DATABASE::Employee:
    //             BEGIN
    //                 RecRef.OPEN(DATABASE::Employee);
    //                 IF Employee.GET("No.") THEN
    //                     RecRef.GETTABLE(Employee);
    //             END;
    //     end;
    // end;

