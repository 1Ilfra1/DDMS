codeunit 52400 "Request Management"
{
    var
        Request: Record "DataBase Request";
        UserSetup: Record "User Setup";
        CommentCancel: Page CommentCancel;
        AdmCheakErr: Label 'Choose an administrator';

    procedure SendingRequest(var Rec: Record "DataBase Request")
    begin
        if Rec.Administrator = '' then
            Error(AdmCheakErr)
        else begin
            Rec.Status := Rec.Status::Sent;
            Rec.Modify();
        end;
    end;

    procedure Executed(var Rec: Record "DataBase Request")
    begin
        UserSetup.Get(UserId());
        IF UserSetup.Rights <> UserSetup.Rights::" " then begin
            Rec.Status := Rec.Status::Executed;
            Rec.Modify();
        end;
    end;

    procedure Cancel(var Rec: Record "DataBase Request")
    begin
        UserSetup.Get(UserId());
        if (UserSetup.Rights <> UserSetup.Rights::" ") and (Rec."Cancelation comment" = '') then begin
            CommentCancel.RunModal();
            Rec."Cancelation comment" := CommentCancel.GetInputValue();
            Rec.Status := Rec.Status::Canceled;
            Rec.Modify();
        end;
    end;
}
