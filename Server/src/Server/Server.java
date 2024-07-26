// This file contains material supporting section 3.7 of the textbook:
// "Object Oriented Software Engineering" and is issued under the open-source
// license found at www.lloseng.com 
package Server;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Connection;

import containers.ClientRequestDataContainer;
import containers.ServerResponseDataContainer;
import db.DBConnectionDetails;
import db.DBController;
import db.QueryControl;
import entities.User;
import enums.ClientRequest;
import enums.ServerResponse;
import gui.controllers.ServerPortController;
import ocsf.server.AbstractServer;
import ocsf.server.ConnectionToClient;

/**
 * This class overrides some of the methods in the abstract superclass in order
 * to give more functionality to the server.
 *
 * @author Dr Timothy C. Lethbridge
 * @author Dr Robert Lagani&egrave;re
 * @author Fran&ccedil;ois B&eacute;langer
 * @author Paul Holden
 * @version July 2000
 */

public class Server extends AbstractServer {
	// Use Singleton DesignPattern -> only 1 server may be running in our system.
	private static Server server = null;
	private ServerPortController serverController;
	private Connection dbConn;

	private Server(int port, ServerPortController serverController, Connection dbConn) {
		super(port);
		this.serverController = serverController;
		this.dbConn = dbConn;
	}

	// Method to handle messages received from the client
	protected void handleMessageFromClient(Object msg, ConnectionToClient client) {
		ClientRequestDataContainer data = (ClientRequestDataContainer) msg;
		ClientRequest request = data.getRequest();
		User user;
		// switch case on the request from server
		switch (request) {
		// all cases
		case DISCONNECT:
			clientDisconnected(client);
			break;

		case CHECK_USER_DATA:
			user = (User) data.getMessage();
			handleUserData(user, client);
		
		case UPDATE_USER_DATA:
			user= (User) data.getMessage();
			try {
				handleUpdateUser(user, client);
			} catch (Exception e) {
				e.printStackTrace();
			}
		case FETCH_BRANCH_MANAGER_DATA:
			user= (User) data.getMessage();
			handleBranchManagerData(user, client);
		case FETCH_CEO_DATA:
			user= (User) data.getMessage();
			handleCeoData(user, client);
		default:
			return;
		}
	}

	
	
	
	
	
	
	
	
	private void handleCeoData(User user, ConnectionToClient client) {
		ServerResponseDataContainer response = QueryControl.userQueries.FetchCeoData(dbConn, user);
		try {
			client.sendToClient(response);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	private void handleBranchManagerData(User user, ConnectionToClient client) {
		ServerResponseDataContainer response = QueryControl.userQueries.FetchBranchManagerData(dbConn, user);
		try {
			client.sendToClient(response);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	private void handleUpdateUser(User user, ConnectionToClient client) throws Exception {
		QueryControl.userQueries.UpdateUserData(dbConn, user);
	}
	
	
	
	
	private void handleUserData(User user, ConnectionToClient client) {
		ServerResponseDataContainer response = QueryControl.userQueries.FatchUserInfo(dbConn, user);
		try {
			client.sendToClient(response);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// method to start the server
	public static boolean startServer(DBConnectionDetails db, Integer port, ServerPortController serverController) {
		// try to connect the database
		Connection dbConn = DBController.connectToMySqlDB(db);
		// if failed -> can't start the server.
		if (dbConn == null) {
			System.out.println("Can't start server! Connection to database failed!");
			return false;
		}
		System.out.println("Connection to database succeed");

		// Singleton DesignPattern. Only 1 instance of server is available.
		if (server != null) {
			System.out.println("There is already a connected server");
			return false;
		}

		server = new Server(port, serverController, dbConn);

		try {
			server.listen();
			return true;
			// update connection in server gui.
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("\"Error - could not listen for clients!\"");
			return false;
		}
	}

	// send client message with his IP,host,status
	private void handleClientConnection(ConnectionToClient client) {
		String clientIP = client.getInetAddress().getHostAddress();
		String clientHostName = client.getInetAddress().getHostName();
		if (clientIP.equals(clientHostName)) {
			try {
				clientHostName = InetAddress.getLocalHost().getHostName();
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String clientInfo = "IP:" + clientIP + "\nHOST:" + clientHostName + "\nStatus: Connected";
		ServerResponseDataContainer data = new ServerResponseDataContainer(ServerResponse.UPDATE_CONNECTION_INFO,
				clientInfo);
		try {
			client.sendToClient(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// when client connect call handleClientConnection -> send message to the client
	// with his IP,host,status
	@Override
	protected void clientConnected(ConnectionToClient client) {
		super.clientConnected(client);
		String clientIP = client.getInetAddress().getHostAddress();
		String clientHostName = client.getInetAddress().getHostName();

		if (clientIP.equals(clientHostName)) {
			try {
				clientHostName = InetAddress.getLocalHost().getHostName();
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
		}

		String clientInfo = "IP:" + clientIP + " HOST:" + clientHostName;
		serverController.addConnectedClient(clientInfo);
		handleClientConnection(client);
	}

	@Override
	protected void clientDisconnected(ConnectionToClient client) {
		super.clientDisconnected(client);
		String clientIP = client.getInetAddress().getHostAddress();
		String clientHostName = client.getInetAddress().getHostName();

		if (clientIP.equals(clientHostName)) {
			try {
				clientHostName = InetAddress.getLocalHost().getHostName();
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
		}

		String clientInfo = "IP:" + clientIP + " HOST:" + clientHostName;
		serverController.removeConnectedClient(clientInfo);
	}

	// stop server from listening and close him
	public static void stopServer() {
		// if there is no server return
		if (server == null)
			return;
		try {
			server.stopListening();
			server.close();
			server = null;
		} catch (IOException ex) {
			System.out.println("Error while closing server");
			ex.printStackTrace();
		}
	}

	/**
	 * This method overrides the one in the superclass. Called when the server
	 * starts listening for connections.
	 */
	protected void serverStarted() {
		System.out.println("Server started and is listening for connections on port " + getPort());
		try {
			System.out.format("ipv4 address to connect (if on same E-Net host) is : %s\n",
					InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
	}

	/**
	 * This method overrides the one in the superclass. Called when the server stops
	 * listening for connections.
	 */
	protected void serverStopped() {
		System.out.println("Server has stopped listening for connections.");
	}
}
