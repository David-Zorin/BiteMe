package enums;

/**
 * Enum representing various client actions or requests that can be sent to the server.
 */
public enum ClientRequest {
	DISCONNECT, //call server to disconnect client from server 
	CHECK_USER_DATA, // Request to check user data
	UPDATE_USER_DATA, // Request to update user data
	FETCH_BRANCH_MANAGER_DATA,
	FETCH_CEO_DATA,
	GET_USER_DATA, // Request to get general user data
	GET_SPECIFIC_USER_DATA, // Request to get data for a specific user
	UPDATE_IS_LOGGED_IN, // Request to update the login status of a user
	FETCH_CUSTOMERS_DATA,
	UPDATE_CUSTOMERS_REGISTER, // Request to update customer registration
	FETCH_RESTAURANTS // Request to fetch restaurant data by branch
	;
}
