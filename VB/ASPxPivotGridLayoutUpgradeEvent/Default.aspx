
<%@ Page Title="Home Page" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ASPxPivotGridLayoutUpgradeEvent._Default" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

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
				DataSourceID="SqlDataSource2" Width="850px" Theme="Metropolis" OptionsLayout-Columns-StoreAppearance ="True">
				<Fields>
					<dx:PivotGridField ID="fieldProductName" Area="RowArea" AreaIndex="1" FieldName="ProductName" 
						Name="fieldProductName" Caption="Product">
					</dx:PivotGridField>
					<dx:PivotGridField ID="fieldCategoryName" Area="RowArea" AreaIndex="0" FieldName="CategoryName" 
						Name="fieldCategoryName" Caption="Category">
					</dx:PivotGridField>
					<dx:PivotGridField ID="fieldExtendedPrice" Area="DataArea" AreaIndex="0" FieldName="Extended_Price" 
						Name="fieldExtendedPrice">
					</dx:PivotGridField>
					<dx:PivotGridField ID="fieldYear" Area="ColumnArea" AreaIndex="0"
													GroupInterval="DateYear" Caption="Year"
													FieldName="OrderDate" UnboundFieldName="fieldYear">
					</dx:PivotGridField>
					<dx:PivotGridField ID="fieldQuarter" Area="ColumnArea"
													AreaIndex="1" GroupInterval="DateQuarter"
													Caption="Quarter" FieldName="OrderDate" Visible="True"
													ValueFormat-FormatType="Custom" ValueFormat-FormatString="Qtr{0}" UnboundFieldName="fieldQuarter">                        
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
			<dx:ASPxButton ID="ASPxButtonRestore" runat="server" Text="Restore Layout" OnClick="RestoreLayout_Click" Theme="Metropolis"></dx:ASPxButton>
			</div>
		<div style="margin-top: 20px">
			<dx:ASPxPivotGrid ID="ASPxPivotGridNew" OptionsLayout-LayoutVersion="2.0" 
				OnLayoutUpgrade="ASPxPivotGridNew_LayoutUpgrade" runat="server" OptionsLayout-Columns-AddNewColumns ="False" OptionsLayout-Columns-RemoveOldColumns ="False"
				ClientIDMode="AutoID" DataSourceID="SqlDataSource2" Width="850px" Theme="Metropolis">
				<Fields>
						<dx:PivotGridField ID="fieldCountry" Area="ColumnArea" AreaIndex="0" FieldName="Country" Name="fieldCountry">
					</dx:PivotGridField>
					<dx:PivotGridField ID="fieldSalesPerson" Area="ColumnArea" AreaIndex="1" FieldName="Sales_Person" 
						Name="fieldSalesPerson" Caption="Sales Person">
					</dx:PivotGridField>
					<dx:PivotGridField ID="fieldProductName2" Area="RowArea" AreaIndex="1" FieldName="ProductName"
						Name="fieldProductName" Caption="Product">
					</dx:PivotGridField>
					<dx:PivotGridField ID="fieldCategoryName2" Area="RowArea" AreaIndex="0" FieldName="CategoryName" 
						Name="fieldCategoryName" Caption="Category">
					</dx:PivotGridField>
					<dx:PivotGridField ID="fieldExtendedPrice2" Area="DataArea" AreaIndex="0" FieldName="Extended_Price" 
						Name="fieldExtendedPrice" Caption ="Extended Price">
					</dx:PivotGridField>
				</Fields>
				<OptionsView DataHeadersDisplayMode="Popup" DataHeadersPopupMaxColumnCount="1" HorizontalScrollBarMode="Auto" 
					RowTotalsLocation="Tree" ShowColumnTotals="False" />
				<OptionsData DataProcessingEngine="Optimized"  />
			</dx:ASPxPivotGrid>
		</div>
		<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
			SelectCommand="SELECT [Country], [Sales Person] AS Sales_Person, [OrderDate], [CategoryName], [Quantity], [Extended Price] AS Extended_Price, [ProductName] FROM [SalesPerson]"></asp:SqlDataSource>                        
	</div>
</asp:Content>