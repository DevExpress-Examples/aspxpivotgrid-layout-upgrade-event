<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/234111505/21.2.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T853278)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
*Files to look at*:
* [Default.aspx (CS)](/CS/ASPxPivotGridLayoutUpgradeEvent/Default.aspx) / [Default.aspx (VB)](/VB/ASPxPivotGridLayoutUpgradeEvent/Default.aspx)
* [Default.aspx.cs](/CS/ASPxPivotGridLayoutUpgradeEvent/Default.aspx.cs) / [Default.aspx.vb](/VB/ASPxPivotGridLayoutUpgradeEvent/Default.aspx.vb)

# ASPxPivotGrid - How to manage Pivot Grid Layout

The Pivot Grid layout determines the position and appearance of its [visual elements](https://docs.devexpress.com/AspNet/3585/aspnet-webforms-controls/pivot-grid/ui-elements). You can customize and save the current Pivot Grid control's layout and apply the same settings to other Pivot Grid controls.

The following example demonstrates how to save the layout from the one Pivot Grid and apply it to another Pivot Grid.

The old Pivot Grid contains the "Year" and "Quarter" fields that do not exist in the new Pivot Grid. The new Pivot Grid contains the "Country" and "Sales Person" fields that do not exist in the old Pivot Grid. When you apply the saved layout to the new Pivot Grid control, the "Year" and "Quarter" fields from the saved layout replace the "Country" and "Sales Person" fields. This behavior is set by the [RemoveOldColumns](https://docs.devexpress.com/CoreLibraries/DevExpress.Utils.OptionsColumnLayout.RemoveOldColumns) and [AddNewColumns](https://docs.devexpress.com/CoreLibraries/DevExpress.Utils.OptionsColumnLayout.AddNewColumns) properties. In this example, the **RemoveOldColumns** and **AddNewColumns** properties are set to **false**. As a result, the Pivot Grid restores the fields that exist in the saved layout, and leaves fields that exist both in the Pivot Grid and in the saved layout with the same **Name** values. 

The [LayoutVersion](https://docs.devexpress.com/CoreLibraries/DevExpress.Utils.OptionsLayoutBase.LayoutVersion) property is defined for two Pivot Grid controls. When you click the "Restore layout" button (and the saved layout is restored from a data store), the **LayoutUpgrade** event is raised since the layout versions are different. As a result, a new "Quantity" field is added to the new Pivot Grid control.

The Pivot Grid uses a field's [Name](https://docs.devexpress.com/CoreLibraries/DevExpress.XtraPivotGrid.PivotGridFieldBase.Name) property value to determine fields in a stored layout.

API in this example:
* [ASPxPivotGrid.SaveLayoutToStream](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxPivotGrid.ASPxPivotGrid.SaveLayoutToStream(System.IO.Stream))

    Saves the Pivot Grid layout to the specified stream.
    
* [ASPxPivotGrid.LoadLayoutFromStream](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxPivotGrid.ASPxPivotGrid.LoadLayoutFromStream(System.IO.Stream))

    Restores the Pivot Grid layout from the specified stream.

* [OptionsColumnLayout.StoreAppearance](https://docs.devexpress.com/CoreLibraries/DevExpress.Utils.OptionsColumnLayout.StoreAppearance)

    Gets or sets whether the appearance settings of the columns and bands are also stored when the layout is saved to storage and restored when the layout is restored from storage. In this example, stores the caption of the "Year" and "Quarter" fields.

* [OptionsColumnLayout.AddNewColumns](https://docs.devexpress.com/CoreLibraries/DevExpress.Utils.OptionsColumnLayout.AddNewColumns), [OptionsColumnLayout.RemoveOldColumns](https://docs.devexpress.com/CoreLibraries/DevExpress.Utils.OptionsColumnLayout.RemoveOldColumns)
    > New columns are fields in the control, old columns are fields in the saved layout.

    If old and new fields have the same ID, the control applies the saved layout changes to the fields in the control.
    
    If old and new fields have a different ID, then the following behavior occurs:

    - If both properties are true, the Pivot Grid removes fields from the saved layout and allows the fields in the control to remain there. 

    - If both properties are *false*, Pivot Grid restores fields from the layout and removes fields from the control.

    - If **AddNewColumns** is *true* and **RemoveOldColumns** is *false*, Pivot Grid restores fields from the layout and leaves fields in the control to remain there.

    - If **AddNewColumns** is *false* and **RemoveOldColumns** is *true*, Pivot Grid removes fields both from the layout and control. 

* [ASPxPivotGrid.LayoutUpgrade](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxPivotGrid.ASPxPivotGrid.LayoutUpgrade)

    Occurs when a layout is restored from a data store, and its version differs from the control's current layout version. Use the [LayoutVersion](https://docs.devexpress.com/CoreLibraries/DevExpress.Utils.OptionsLayoutBase.LayoutVersion) property to assign the version of the layout and enable the **LayoutUpgrade** event.

## See Also
- [Save and Restore Layout](https://docs.devexpress.com/AspNet/7266/aspnet-webforms-controls/pivot-grid/layout/save-and-restore-layout)
