Imports System
Imports System.Web.UI
Imports DevExpress.Utils
Imports DevExpress.Web.ASPxPivotGrid

Namespace ASPxPivotGridLayoutUpgradeEvent
	Partial Public Class _Default
		Inherits Page
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
			If (Not IsPostBack) AndAlso (Not IsCallback) Then
				Dim fieldProductName As PivotGridField = ASPxPivotGridOld.Fields("fieldProductName")
				ASPxPivotGridOld.BeginUpdate()
				Try
					fieldProductName.FilterValues.Clear()
					fieldProductName.FilterValues.Add("Chai")
					fieldProductName.FilterValues.Add("Chang")
					fieldProductName.FilterValues.Add("Chartreuse verte")
					fieldProductName.FilterValues.Add("Aniseed Syrup")
					fieldProductName.FilterValues.Add("Genen Shouyu")
					fieldProductName.FilterValues.Add("Gula Malacca")
					fieldProductName.FilterValues.FilterType = DevExpress.XtraPivotGrid.PivotFilterType.Included

				Finally
					ASPxPivotGridOld.EndUpdate()
				End Try
			End If
		End Sub

		Protected Sub SaveLayout_Click(ByVal sender As Object, ByVal e As EventArgs)
			Session("Layout") = ASPxPivotGridOld.SaveLayoutToString()
		End Sub

		Protected Sub RestoreLayout_Click(ByVal sender As Object, ByVal e As EventArgs)
			Dim layout As String = CStr(Session("Layout"))
            If layout Is Nothing Then
                Return
            End If

            ASPxPivotGridNew.LoadLayoutFromString(layout)
		End Sub
		Protected Sub ASPxPivotGridNew_LayoutUpgrade(ByVal sender As Object, ByVal e As LayoutUpgradeEventArgs)
			If e.PreviousVersion = "1.0" Then
                Dim newField = New PivotGridField() With {
                    .FieldName = "Quantity",
                    .Caption = "Quantity",
                    .ID = "fieldQuantity",
                    .Area = DevExpress.XtraPivotGrid.PivotArea.DataArea}
                ASPxPivotGridNew.Fields.Add(newField)
			End If


		End Sub
	End Class
End Namespace

