package client;

import java.util.Map;

import containers.ClientRequestDataContainer;
import entities.Item;

import java.util.ArrayList;
import java.util.List;
import entities.BranchManager;
import entities.Customer;
import entities.Order;
import entities.Supplier;
import entities.User;
import enums.Branch;
import enums.ClientRequest;

/**
 * The main controller for managing client-side requests to the server.
 * It provides methods to construct and send various types of requests to the server.
 */

public class ClientMainController {

    /**
     * Sends a message to the server using the ClientConsole method
     *
     * @param message is the message to be sent to the server
     */
	public static void accept(ClientRequestDataContainer message) {
		ClientConsole.handleMessageFromClientUI(message);
	}

    /**
     * Requests user data from the server.
     *
     * @param user the user for whom data is requested
     */
	public static void requestUserData(User user) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.GET_USER_DATA, user);
		ClientMainController.accept(request);
	}

    /**
     * Requests specific user data from the server.
     *
     * @param user the user for whom specific data is requested
     */
	public static void requestUserSpecificData(User user) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.GET_SPECIFIC_USER_DATA, user);
		ClientMainController.accept(request);
	}

    /**
     * Requests to update user data from the server.
     *
     * @param user the user whose data is to be updated
     */
	public static void requestUpdateUserData(User user) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.UPDATE_USER_DATA, user);
		ClientMainController.accept(request);
	}

    /**
     * Requests branch manager data from the server.
     *
     * @param user the user for whom branch manager data is requested
     */
	public static void requestBranchManagerData(User user) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.FETCH_BRANCH_MANAGER_DATA,
				user);
		ClientMainController.accept(request);
	}

	
    /**
     * Requests CEO data from the server.
     *
     * @param user the user for whom CEO data is requested
     */
	public static void requestCeoData(User user) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.FETCH_CEO_DATA, user);
		ClientMainController.accept(request);
	}

	
    /**
     * Requests to update the login status of a user on the server.
     *
     * @param user the user whose login status is to be updated
     */
	public static void requestUpdateIsLoggedIn(User user) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.UPDATE_IS_LOGGED_IN, user);
		ClientMainController.accept(request);
	}

    /**
     * Requests unregistered customer data from the server for a given branch manager.
     *
     * @param manager the branch manager for whom customer data is requested
     */
	public static void requestUnregisteredCustomersData(BranchManager manager) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.FETCH_CUSTOMERS_DATA,
				manager);
		ClientMainController.accept(request);
	}

	
    /**
     * Requests to update the registration of customers from the server.
     *
     * @param userList a list of user identifiers for customers to be registered
     */
	public static void requestUpdateRegisterCustomers(List<String> userList) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.UPDATE_CUSTOMERS_REGISTER,
				userList);
		ClientMainController.accept(request);
	}
	
    /**
     * Requests to import the reports data from the server.
     *
     * @param ReportInfo a list of strings
     */
	public static void requestReportData(List<String> ReportInfo) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.FETCH_REPORT_DATA,
				ReportInfo);
		ClientMainController.accept(request);
	}
	
    /**
     * Requests to update the registration of customers with the server.
     *
     * @param userList a list of user identifiers for customers to be registered
     */
	public static void requestQuarterReportData(List<String> ReportInfo) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.FETCH_QUARTER_REPORT_DATA,
				ReportInfo);
		ClientMainController.accept(request);
	}
	
	/**
     * Requests all specific branch restaurants
     *
     * @param branchName the branch for which restaurant data is requested
     */
	public static void requestRestaurantsByBranch(Branch branchName) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.FETCH_BRANCH_RESTAURANTS,branchName);
		ClientMainController.accept(request);
	}
	
	/**
	 * Requests all waiting orders for a specific customer.
	 *
	 * @param customer the customer whose waiting orders are requested
	 */
	public static void requestAllCustomerWaitingOrders(Customer customer) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.FETCH_CUSTOMER_WAITING_ORDERS,customer);
		ClientMainController.accept(request);
	}
	
	/**
	 * Requests the order history for a specific customer.
	 *
	 * @param customer the customer whose order history is requested
	 */
	public static void requestAllCustomerHistoryOrders(Customer customer) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.FETCH_CUSTOMER_HISTORY_ORDERS,customer);
		ClientMainController.accept(request);
	}
	

	/**
	 * Requests to update status and time of a specific order.
	 *
	 * @param order the order to be updated
	 */
	public static void requestToUpdateOrder(Order order) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.UPDATE_ORDER_STATUS_AND_TIME,order);
		ClientMainController.accept(request);
	}

	/**
     * Sends a request to get the orders data for the specified supplier.
     *
     * @param supplierID the ID of the supplier whose orders data is requested
     */
    public static void requestOrderData(int supplierID) {
    	ClientRequestDataContainer request=new ClientRequestDataContainer(ClientRequest.GET_ORDERS_DATA, supplierID);
    	ClientMainController.accept(request);
    }
    
    /**
     * Sends a request to add a new item.
     *
     * @param item the item to be added
     */
	public static void requestAddItemData(Item item) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.ADD_ITEM_DATA, item);
		ClientMainController.accept(request);
	}
	
	/**
     * Sends a request to get the list of items for the specified supplier.
     *
     * @param supplierID the ID of the supplier whose items list is requested
     */
	public static void requestItemsList(int supplierID) {
		
		Integer suppID = supplierID;
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.GET_ITEMS_LIST, suppID);
		ClientMainController.accept(request);
	}
	
	/**
     * Sends a request to get the full list of items for the specified supplier.
     *
     * @param supplierID the ID of the supplier whose full items list is requested
     */
	public static void requestFullItemsList(int supplierID) {
		
		Integer suppID = supplierID;
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.GET_FULL_ITEMS_LIST, suppID);
		ClientMainController.accept(request);
	}
	
	  /**
     * Sends a request to remove an item.
     *
     * @param itemData a map containing item data, including item identifiers and quantities
     */
	public static void requestRemoveItem(Map<String,Integer> itemData) {
		
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.REMOVE_ITEM, itemData);
		ClientMainController.accept(request);
	}
	
	  /**
     * Sends a request to update an existing item.
     *
     * @param item the item with updated information
     */
	public static void requestUpdateItem(Item item) {
		
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.UPDATE_ITEM, item);
		ClientMainController.accept(request);
	}
	
	/**
	 * Requests items for a specific supplier.
	 *
	 * @param supplier the supplier whose items are requested
	 */
    public static void requestSupplierItems(Supplier supplier) {
        ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.GET_SUPPLIER_ITEMS, supplier);
        ClientMainController.accept(request);
    }
    
    /**
     * Requests all relevant cities - he deliver to for a specific supplier.
     *
     * @param supplier the supplier for whom relevant cities are requested
     */
    public static void requestAllRelevantCitys(Supplier supplier) {
        ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.GET_RELEVANT_CITIES, supplier);
        ClientMainController.accept(request);
    }

    /**
     * Updates an order and its items_in_order with the provided data.
     *
     * @param list the list containing order[0] and item[1] data to be updated
     */
    public static void updateOrderAndItems(List<Object> list) {
        ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.UPDATE_ORDER_AND_ITEMS, list);
        ClientMainController.accept(request);
    }
    
    /**
     * Updates the wallet balance for a customer.
     *
     * @param list the list containing order[0] wallet price to charge[1] update data for the customer
     */
    public static void updateCustomerWallet(List<Object> list) {
        ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.UPDATE_CUSTOMER_WALLET, list);
        ClientMainController.accept(request);
    }
    
	/**
     * Sends a request to get the orders data for the specified supplier.
     *
     * @param supplierID the ID of the supplier whose orders data is requested
     */
    public static void requestOrdersData(int supplierID) {
    	ClientRequestDataContainer request=new ClientRequestDataContainer(ClientRequest.GET_ORDERS_DATA, supplierID);
    	ClientMainController.accept(request);
    }
    
    /**
     * Sends a request to update the status of an order.
     *
     * @param orderInfo an array containing the order ID and the status transition code
     */
    public static void requestSupplierUpdateOrderStatus(int[] orderInfo) {
		
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.SUPPLIER_UPDATE_ORDER_STATUS, orderInfo);
		ClientMainController.accept(request);
	}
    
    /**
     * refresh the awaiting orders for a specific supplier / import then again.
     *
     * @param supplierID the ID of the supplier whose awaiting orders are to be refreshed
     */
    public static void requestSupplierRefreshAwaitingOrders(Integer supplierID) {
		
 		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.SUPPLIER_REFRESH_AWAITING_ORDERS, supplierID);
 		ClientMainController.accept(request);
 	}
    
    /**
     * send server that customer logged out.
     */
	public static void customerLogout() {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.CUSTOMER_LOGOUT, null);
		ClientMainController.accept(request);
	}
	
	/**
	 * Sends an new status message for a ready order to the relevant customer.
	 *
	 * @param data the data containing the approval message details customerID[0] msg[1]
	 */
	public static void sendApproveReadyOrderToClient(ArrayList<Object> data) {
		ClientRequestDataContainer request = new ClientRequestDataContainer(ClientRequest.SEND_CUSTOMER_MSG, data);
		ClientMainController.accept(request);
	}
	
}
