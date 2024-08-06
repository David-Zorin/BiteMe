package gui.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import client.ClientConsole;
import client.ClientMainController;
import containers.ServerResponseDataContainer;
import entities.SupplierIncome;
import gui.loader.Screen;
import gui.loader.ScreenLoader;
import javafx.application.Platform;
import javafx.beans.binding.Bindings;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.chart.PieChart;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;

/**
 * Controller for managing the monthly report screen.
 * Handles navigation between different pages of the monthly report and returning to the previous screen.
 */
public class MonthlyReportScreenController {

	@FXML
	private Label errorLabel;
	@FXML
	private ComboBox<String> yearSelect;
	@FXML
	private ComboBox<String> monthSelect;
	@FXML
	private ComboBox<String> reportType;
	@FXML
	private ComboBox<String> branchSelect;
	@FXML
	private Button backBtn;
	@FXML
	private PieChart orderChart;
	@FXML
	private PieChart performanceChart;
	@FXML
	private TableView<SupplierIncome> incomeChart;
    @FXML
    private TableColumn<SupplierIncome, Integer> supplierID;
	@FXML
	private TableColumn<SupplierIncome, String> supplierName;
	@FXML
	private TableColumn<SupplierIncome, Integer> totalMonthIncome;
	@FXML
	private AnchorPane dashboard;
	
	private CeoHomeScreenController prevCeoController;
	private BranchManagerController prevManagerController;
	private HBox wholeScreen;
	private String branch;
	private String report;
	private String year;
	private String month;
	private ServerResponseDataContainer entityResponse=null;
    /**
     * Constructs a new MonthlyReportScreenController.
     * 
     * @param wholeScreen the HBox container for the current screen
     * @param prevController the previous controller, either CeoHomeScreenController or BranchManagerController
     */
	public MonthlyReportScreenController(HBox wholeScreen , Object prevController) {
		if(prevController instanceof CeoHomeScreenController) {
			this.prevCeoController = (CeoHomeScreenController) prevController;
			this.prevManagerController=null;
			this.branch=null;
		}
		if(prevController instanceof BranchManagerController) {
			this.prevCeoController = null;
			this.prevManagerController=(BranchManagerController) prevController;
			this.branch=prevManagerController.getBranchManager().getbranchType().toShortString();
		}
		this.wholeScreen = wholeScreen;
		this.reportType=null;
		this.year=null;
		this.month=null;
	}

    public String getBranch() { return branch; }

    public String getReportType() { return report; }
	
    public String getYear() { return year; }
    
    public String getMonth() { return month; }

	
    /**
     * Returns to the previous screen based on the previous controller.
     * 
     * @param event the action event triggered by clicking the back button
     * @throws Exception if an error occurs during the screen transition
     */
	public void goBack(ActionEvent event) throws Exception {
		ScreenLoader screenLoader = new ScreenLoader();
		HBox prevWholeScreen=null;
		String path="";
		if(prevCeoController!=null && prevManagerController==null) {
			path = "/gui/view/CeoScreen.fxml";
			prevWholeScreen = screenLoader.loadPreviousScreen(path, Screen.CEO_SCREEN, prevCeoController);
			prevCeoController.UpdateLabel(prevCeoController.getCeo());
		}
		if(prevCeoController==null && prevManagerController!=null) {
			path = "/gui/view/BranchManagerScreen.fxml";
			prevWholeScreen = screenLoader.loadPreviousScreen(path, Screen.MANAGER_SCREEN, prevManagerController);
			prevManagerController.UpdateLabel(prevManagerController.getBranchManager());
		}

		wholeScreen.getChildren().clear();
		wholeScreen.getChildren().add(prevWholeScreen);
	}
	
	public void setScreen() {
		reportType.getItems().addAll("Orders Reports", "Income Reports", "Performance Reports");
		branchSelect.getItems().addAll("North", "Center", "South");
		for(int i=1; i<10;i++) {
			monthSelect.getItems().add("0"+i);
		}
		monthSelect.getItems().addAll("10","11","12");
		for(int j=1995; j<2051;j++) {
			yearSelect.getItems().add(Integer.toString(j));
		}
		if(this.prevCeoController==null) {
			branchSelect.setVisible(false);
		}
		incomeChart.setVisible(false);
		performanceChart.setVisible(false);
		orderChart.setVisible(false);
	}
	public void setBranchSelection() {
		this.branch = branchSelect.getValue();
	}
	
	public void setReportTypeSelection() {
		this.report = reportType.getValue();
	}
	
	public void setMonthSelection() {
		this.month = monthSelect.getValue();
	}
	
	public void setYearSelection() {
		this.year = yearSelect.getValue();
	}
	
    public void updateLabel(String msg) {
	    Platform.runLater(() -> {
	    	errorLabel.setText(msg);
	    });
    }
   
	public void displayReport(ActionEvent event) throws IOException {
		if(this.report==null||this.month==null||this.year==null||this.branch==null) {
			updateLabel("Please fill all the required fields");
		}
		else {
			updateLabel("");
			orderChart.setVisible(false);
			performanceChart.setVisible(false);
			incomeChart.setVisible(false);
			orderChart.getData().clear();
			performanceChart.getData().clear();
			incomeChart.getItems().clear();
			String path=null;
			List<String> reportInfo=new ArrayList<String>();
			reportInfo.add(this.report);reportInfo.add(this.branch);reportInfo.add(this.month);reportInfo.add(this.year);
			ClientMainController.requestReportData(reportInfo);
			entityResponse = ClientConsole.responseFromServer;
			switch (entityResponse.getResponse()) {
			case ORDER_REPORT:{
				List<String> orderReportData=(ArrayList<String>)entityResponse.getMessage();
				processOrderReport(orderReportData);
				break;
			}
			case PERFORMANCE_REPORT:{
				List<String> performanceReportData=(ArrayList<String>)entityResponse.getMessage();
				processPerformanceReport(performanceReportData);
				break;
			}
			case INCOME_REPORT:{
				List<SupplierIncome> SupplierIncomeList=(List<SupplierIncome>)entityResponse.getMessage();
				processIncomeReport(SupplierIncomeList);
				break;
			}}

		}
	}
	public void processOrderReport(List<String> orderReportData) {
		if (!orderReportData.isEmpty()) {
			updateLabel("Order report for the "+this.branch+" branch, "+ this.month+"/"+this.year+", divided by food category");
			Platform.runLater(() -> {
				orderChart.getData().clear();
				ObservableList<PieChart.Data> pieChartData =FXCollections.observableArrayList(
						new PieChart.Data("Salad", Double.valueOf(orderReportData.get(0))),
						new PieChart.Data("First Course", Double.valueOf(orderReportData.get(1))),
						new PieChart.Data("Main Course", Double.valueOf(orderReportData.get(2))),
						new PieChart.Data("Dessert", Double.valueOf(orderReportData.get(3))),
						new PieChart.Data("Beverage", Double.valueOf(orderReportData.get(4))));
				orderChart.getData().addAll(pieChartData);
	            for (PieChart.Data data : pieChartData) {
	                data.nameProperty().set(String.format("%s: %.1f", data.getName(), data.getPieValue()));
	            }
				
				orderChart.setVisible(true);

			});
		}
		else {
			updateLabel(this.branch+" branch "+ this.month+"/"+this.year+" order report does not exist");
		}
	}
	public void processIncomeReport(List<SupplierIncome> SupplierIncomeList) {
		if (!SupplierIncomeList.isEmpty()) {
			updateLabel(this.branch+" branch "+ this.month+"/"+this.year+" income report");
			supplierID.setCellValueFactory(cellData -> new SimpleIntegerProperty(cellData.getValue().getSupplierID()).asObject());
			supplierName.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getSupplierName()));
			totalMonthIncome.setCellValueFactory(cellData -> new SimpleIntegerProperty(cellData.getValue().getIncome()).asObject());
			ObservableList<SupplierIncome> SupplierIncomeData = FXCollections.observableArrayList();
			for (SupplierIncome supplierIncome : SupplierIncomeList) {
				SupplierIncomeData.add(supplierIncome);
			}
			incomeChart.setItems(SupplierIncomeData);
			incomeChart.setVisible(true);
		}
		else {
			updateLabel(this.branch+" branch "+ this.month+"/"+this.year+" income report does not exist");
		}
	}
	public void processPerformanceReport(List<String> performanceReportData) {
		if (!performanceReportData.isEmpty()) {
			updateLabel("Performance report for the "+this.branch+" branch, "+ this.month+"/"+this.year+", divided by Late/On-Time orders");
			Platform.runLater(() -> {
				performanceChart.getData().clear();
				ObservableList<PieChart.Data> pieChartData =FXCollections.observableArrayList(
						new PieChart.Data("On Time", Double.valueOf(performanceReportData.get(0))),
						new PieChart.Data("Late", Double.valueOf(performanceReportData.get(1))));
				performanceChart.getData().addAll(pieChartData);
				for (PieChart.Data data : pieChartData) {
	                data.nameProperty().set(String.format("%s: %.1f", data.getName(), data.getPieValue()));
				}
				performanceChart.setVisible(true);
			});
		}
		else {
			updateLabel(this.branch+" branch "+ this.month+"/"+this.year+" performance report does not exist");
		}
	}
}
