tableextension 61000 "ALR Template Field Extension" extends "CDC Template Field"
{
    fields
    {
        field(50001; "Substitution Field"; Code[20])
        {
            Caption = 'Substitution Field';
            DataClassification = CustomerContent;
            TableRelation = "CDC Template Field".Code WHERE("Template No." = FIELD("Template No."),
                                                             Type = CONST(Line));

            trigger OnValidate()
            var
                CKLAdvLineRecognitionMgt: Codeunit "ALR Adv. Line Recognition Mgt.";
            begin
                if "Substitution Field" <> '' then
                    CKLAdvLineRecognitionMgt.SetTemplateToALRProcessing("Template No.");
            end;
        }
        field(50002; "Anchor Field"; Code[20])
        {
            Caption = 'Anchor Field', Comment = 'Is the field that is used as anchor', Locked = false, MaxLength = 999;
            DataClassification = CustomerContent;
            TableRelation = "CDC Template Field".Code WHERE("Template No." = FIELD("Template No."),
                                                             Type = CONST(Line));
        }
        field(50003; Sorting; Integer)
        {
            Caption = 'Sorting';
            DataClassification = CustomerContent;
        }
        field(50004; "Field Position"; Option)
        {
            Caption = 'Feldposition';
            DataClassification = CustomerContent;
            OptionCaption = ' ,Above anchor,Below anchor';
            OptionMembers = " ",AboveAnchor,BelowAnchor;
        }
        field(50005; "Max. Bottom Position"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50006; "Min. Top Position"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50007; "Get Value from Previous Value"; Boolean)
        {
            Caption = 'Wert vom vorherigen Wert kopieren';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                TestField("Substitution Field", '');
            end;
        }
        field(50011; "Advanced Line Recognition Type"; Option)
        {
            Caption = 'Advanced Line Recognition Type';
            DataClassification = CustomerContent;
            OptionCaption = 'Standard,Anchor linked field,Field search with caption,Field search with column heading,Group value with caption';
            OptionMembers = Default,LinkedToAnchorField,FindFieldByCaptionInPosition,FindFieldByColumnHeading,GroupValue;
        }
        field(50012; "Offset Top"; Integer)
        {
            Caption = 'Offset Top';
            DataClassification = CustomerContent;
        }
        field(50013; "Offset Bottom"; Integer)
        {
            Caption = 'Offset Height';
            DataClassification = CustomerContent;
        }
        field(50014; "Offset Left"; Integer)
        {
            Caption = 'Offset Left';
            DataClassification = CustomerContent;
        }
        field(50015; "Offset Right"; Integer)
        {
            Caption = 'Offset Width';
            DataClassification = CustomerContent;
        }
        field(50020; "ALR Value Caption Offset X"; Integer)
        {
            Caption = 'Caption Offset X';
            DataClassification = CustomerContent;
        }
        field(50021; "ALR Value Caption Offset Y"; Integer)
        {
            Caption = 'Caption Offset Y';
            DataClassification = CustomerContent;
        }
        field(50022; "ALR Typical Value Field Width"; Decimal)
        {
            Caption = 'Field Width';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
        }
    }
}

