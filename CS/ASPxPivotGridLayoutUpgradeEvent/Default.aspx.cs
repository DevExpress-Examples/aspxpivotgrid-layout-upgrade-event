using DevExpress.Utils;
using DevExpress.Web.ASPxPivotGrid;
using System;
using System.Web.UI;

namespace ASPxPivotGridLayoutUpgradeEvent {
    public partial class _Default: Page {
        protected void Page_Load(object sender, EventArgs e) {
            if(!IsPostBack && !IsCallback) {
                PivotGridField fieldProductName = ASPxPivotGridOld.Fields["fieldProductName"];
                ASPxPivotGridOld.BeginUpdate();
                try {
                    fieldProductName.FilterValues.Clear();
                    fieldProductName.FilterValues.Add("Chai");
                    fieldProductName.FilterValues.Add("Chang");
                    fieldProductName.FilterValues.Add("Chartreuse verte");
                    fieldProductName.FilterValues.Add("Aniseed Syrup");
                    fieldProductName.FilterValues.Add("Genen Shouyu");
                    fieldProductName.FilterValues.Add("Gula Malacca");
                    fieldProductName.FilterValues.FilterType = DevExpress.XtraPivotGrid.PivotFilterType.Included;

                } finally {
                    ASPxPivotGridOld.EndUpdate();
                }
            }
        }

        protected void SaveLayout_Click(object sender, EventArgs e) {
            Session["Layout"] = ASPxPivotGridOld.SaveLayoutToString();
        }

        protected void RestoreLayout_Click(object sender, EventArgs e) {
            string layout = (string)Session["Layout"];
            if(layout == null) {
                return;
            }

            ASPxPivotGridNew.OptionsLayout.Columns.RemoveOldColumns = false;
            ASPxPivotGridNew.OptionsLayout.Columns.AddNewColumns = false;


            ASPxPivotGridNew.LoadLayoutFromString(layout);
        }
        protected void ASPxPivotGridNew_LayoutUpgrade(object sender, LayoutUpgradeEventArgs e) {
            if(e.PreviousVersion == "1.0") {
                var newField = new PivotGridField() { 
                    FieldName = "Quantity",
                    Caption = "Quantity",
                    Name = "fieldQuantity",
                    Area = DevExpress.XtraPivotGrid.PivotArea.DataArea
                };
                ASPxPivotGridNew.Fields.Add(newField);
            };


        }
    }
}        

