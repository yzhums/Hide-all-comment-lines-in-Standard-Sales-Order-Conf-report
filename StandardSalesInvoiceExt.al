reportextension 50201 StandardSalesInvoiceExt extends "Standard Sales - Invoice"
{
    dataset
    {
        modify(Line)
        {
            trigger OnBeforePreDataItem()
            begin
                if not ShowComments then
                    Line.SetFilter(Type, '<>%1', Line.Type::" ");
            end;
        }
    }

    requestpage
    {
        layout
        {
            addafter(DisplayAdditionalFeeNote)
            {
                field(ShowComments; ShowComments)
                {
                    ApplicationArea = All;
                    Caption = 'Show Comments';
                }
            }
        }
    }

    var
        ShowComments: Boolean;
}
