package gui;

import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;
import logic.OrderingClient;

public class HomeClientPageController {

	@FXML
	private Button btnViewAndUpdate;

	@FXML
	private Button btnExit;

	@FXML
	private Label connectionInfoLabel;

	// When clicking on the view and update button, moves you inside the
	// ViewAndUpdate GUI
	public void displayViewAndUpdateWindow(ActionEvent event) throws Exception {
		FXMLLoader loader = new FXMLLoader();
		((Node) event.getSource()).getScene().getWindow().hide(); // hiding primary window
		Stage primaryStage = new Stage();
		Pane root = loader.load(getClass().getResource("/gui/ViewAndUpdate.fxml").openStream());
		Scene scene = new Scene(root);
		scene.getStylesheets().add(getClass().getResource("/gui/ViewAndUpdate.css").toExternalForm());
		primaryStage.setTitle("Client First Page");
		primaryStage.setScene(scene);
		primaryStage.show();
	}

	@FXML
	private void getExitBtn(ActionEvent event) throws Exception {
		System.out.println("exiting...");
		System.exit(0);
	}
	
	@FXML
	public void initialize() {
		OrderingClient.setHomeController(this);
	}

	public void updateConnectionLabel(String info) {
		Platform.runLater(() -> connectionInfoLabel.setText(info));
	}
}
