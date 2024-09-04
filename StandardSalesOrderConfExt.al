reportextension 50200 StandardSalesOrderConfExt extends "Standard Sales - Order Conf."
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
            addafter(ArchiveDocument)
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
