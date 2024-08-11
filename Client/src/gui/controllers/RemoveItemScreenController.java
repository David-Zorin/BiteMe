package gui.controllers;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import client.ClientConsole;
import client.ClientMainController;
import containers.ServerResponseDataContainer;
import entities.AuthorizedEmployee;
import entities.Category;
import enums.ServerResponse;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.layout.HBox;

public class RemoveItemScreenController implements Initializable {

	private AuthorizedEmployee employee;

	private Map<String, String> itemsMap = new HashMap<>(); // key is the item name, value is the item category.

	@FXML
	private Button btnRemove;

	@FXML
	private Button btnBack;

	@FXML
	private Label resultMessage;

	@FXML
	private ListView<String> listOfItems;

	@FXML
	private ComboBox<Category> categoryField;

	ObservableList<Category> categoryList;

	// creating list of Categories
	private void setCategoryComboBox() {
		ArrayList<Category> al = new ArrayList<Category>();
		al.add(Category.SALAD);
		al.add(Category.FIRSTCOURSE);
		al.add(Category.MAINCOURSE);
		al.add(Category.DESSERT);
		al.add(Category.BEVERAGE);

		categoryList = FXCollections.observableArrayList(al);

		categoryField.setItems(categoryList);
	}

	private EmployeeHomeScreenController prevController;
	private HBox wholeScreen;

	public RemoveItemScreenController(HBox wholeScreen, Object prevController) {
		this.prevController = (EmployeeHomeScreenController) prevController;
		this.wholeScreen = wholeScreen;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		this.employee=EmployeeHomeScreenController.getEmployee();
		setCategoryComboBox();	
		
		//get all the items of the restaurant this employee works for. (actually we bring just the name and category name)
		ClientMainController.requestItemsList(employee.getSupplierId());
		ServerResponseDataContainer response = ClientConsole.responseFromServer;
		itemsMap = (Map<String,String>)response.getMessage();
		System.out.println(itemsMap);
	}
	
	@FXML
	private void onCategoryClicked(ActionEvent event) throws Exception{
		Category category = categoryField.getSelectionModel().getSelectedItem();
		String categoryName = category.toString();
		ObservableList<String> itemsInCategory = FXCollections.observableArrayList();
		
        for (Map.Entry<String, String> entry : itemsMap.entrySet()) {
            if (entry.getValue().equals(categoryName)) {
            	itemsInCategory.add(entry.getKey()); //add the name of the item to show in the list view
            }
        }
         // update the listView and set its items
        listOfItems.setItems(itemsInCategory);        
	}
	
	@FXML
	private void onRemoveClicked(ActionEvent event) throws Exception{
		 resultMessage.setStyle("-fx-text-fill: red;");
		 String itemName = listOfItems.getSelectionModel().getSelectedItem();
		
		 // Check if any item is selected
        if (itemName == null) {
        	resultMessage.setText("No item selected.");
        	return;
        }
        
        Map<String,Integer> itemData = new HashMap<String, Integer>();
		itemData.put(itemName, employee.getSupplierId());
        
        //let's remove the item from the database.
        ClientMainController.requestRemoveItem(itemData);
		ServerResponseDataContainer response = ClientConsole.responseFromServer;
		resultMessage.setText((String)response.getMessage());
		
		if(response.getResponse().equals(ServerResponse.DELETE_ITEM_SUCCESS)) {
			resultMessage.setStyle("-fx-text-fill: black;");
			itemsMap.remove(itemName);   //let's remove the item from the map.
            listOfItems.getItems().remove(itemName); // Remove the selected item from the list
		}
	}
	
}
