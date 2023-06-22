<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPxPivotGridLayoutUpgradeEvent._Default" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v21.2, Version=21.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top: 10px">
        <div style="margin-top: 10px">
            <p>Click <b>Save Layout</b> to save the old PivotGrid's layout. </p>
        </div>
        <div>
            <dx:ASPxButton ID="ASPxButtonSave" runat="server" Text="Save Layout" OnClick="SaveLayout_Click" Theme="Metropolis"></dx:ASPxButton>
        </div>
        <div style="margin-top: 20px">
            <dx:ASPxPivotGrid ID="ASPxPivotGridOld" OptionsLayout-LayoutVersion="1.0" runat="server" ClientIDMode="AutoID" 
                DataSourceID="SqlDataSource2" Width="850px" Theme="Metropolis" OptionsLayout-Columns-StoreAppearance ="True" OptionsLayout-StoreAppearance="true" IsMaterialDesign="False">
                <Fields>
                    <dx:PivotGridField ID="fieldProductName" Area="RowArea" AreaIndex="1" 
                         Name="fieldProductName" Caption="Product 65664">
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="ProductName" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldCategoryName" Area="RowArea" AreaIndex="0" 
                        Name="fieldCategoryName" Caption="Category">
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="CategoryName" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldExtendedPrice" Area="DataArea" AreaIndex="0" 
                        Name="fieldExtendedPrice">
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="Extended_Price" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldYear" Area="ColumnArea" AreaIndex="0" Caption="Year" UnboundFieldName="fieldYear">
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="OrderDate" GroupInterval="DateYear" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldQuarter" Area="ColumnArea"
                                                    AreaIndex="1" GroupInterval="DateQuarter"
                                                    Caption="Quarter" Visible="True"
                                                    ValueFormat-FormatType="Custom" ValueFormat-FormatString="Qtr{0}" UnboundFieldName="fieldQuarter">                        
<ValueFormat FormatString="Qtr{0}" FormatType="Custom"></ValueFormat>
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="OrderDate" GroupInterval="DateQuarter" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                </Fields>
                <OptionsView DataHeadersDisplayMode="Popup" DataHeadersPopupMaxColumnCount="1" HorizontalScrollBarMode="Auto" 
                    RowTotalsLocation="Tree" ShowColumnTotals="False" />
                <OptionsData DataProcessingEngine="Optimized"  />
                <OptionsLayout Columns-StoreAppearance="True" LayoutVersion="1.0"></OptionsLayout>
            </dx:ASPxPivotGrid>
        </div>
                        
            <div style="margin-top: 10px; width: 850px">
            <p>Click <b>Restore Layout</b> to apply the saved layout to the new PivotGrid. 
                The <a href="https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxPivotGrid.ASPxPivotGrid.LayoutUpgrade" target="_blank">LayoutUpgrade</a> event modifies 
                the applied layout and adds a new <b>Quantity</b> field to it.</p>
        </div>
            <div>
            <dx:ASPxButton ID="ASPxButtonRestore"  runat="server" Text="Restore Layout" OnClick="RestoreLayout_Click" Theme="Metropolis"></dx:ASPxButton>
            </div>
        <div style="margin-top: 20px">
            <dx:ASPxPivotGrid ID="ASPxPivotGridNew" OptionsLayout-LayoutVersion="2.0" OptionsLayout-Columns-AddNewColumns ="False" OptionsLayout-Columns-RemoveOldColumns ="False"
                OnLayoutUpgrade="ASPxPivotGridNew_LayoutUpgrade" runat="server" 
                ClientIDMode="AutoID" DataSourceID="SqlDataSource2" Width="850px" Theme="Metropolis" IsMaterialDesign="False">
                <Fields>
                        <dx:PivotGridField ID="fieldCountry" Area="ColumnArea" AreaIndex="0" Name="fieldCountry">
                            <DataBindingSerializable>
                                <dx:DataSourceColumnBinding ColumnName="Country" />
                            </DataBindingSerializable>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldSalesPerson" Area="ColumnArea" AreaIndex="1" 
                        Name="fieldSalesPerson" Caption="Sales Person">
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="Sales_Person" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldProductName2" Area="RowArea" AreaIndex="1" 
                        Name="fieldProductName" Caption="Product Name"> 
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="ProductName" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldCategoryName2" Area="RowArea" AreaIndex="0" 
                        Name="fieldCategoryName" Caption="Category">
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="CategoryName" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldExtendedPrice2" Area="DataArea" AreaIndex="0" 
                        Name="fieldExtendedPrice" Caption ="Extended Price">
                        <DataBindingSerializable>
                            <dx:DataSourceColumnBinding ColumnName="Extended_Price" />
                        </DataBindingSerializable>
                    </dx:PivotGridField>
                </Fields>
                <OptionsView DataHeadersDisplayMode="Popup" DataHeadersPopupMaxColumnCount="1" HorizontalScrollBarMode="Auto" 
                    RowTotalsLocation="Tree" ShowColumnTotals="False" />
                <OptionsData DataProcessingEngine="Optimized"  />

<OptionsLayout Columns-RemoveOldColumns="False" Columns-AddNewColumns="False" LayoutVersion="2.0"></OptionsLayout>
            </dx:ASPxPivotGrid>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [Country], [Sales Person] AS Sales_Person, [OrderDate], [CategoryName], [Quantity], [Extended Price] AS Extended_Price, [ProductName] FROM [SalesPerson]"></asp:SqlDataSource>                        
    </div>
</asp:Content>
