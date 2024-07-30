package entities;

import enums.Branch;

public class BranchManager extends Person{
	
	private Branch branchType;
	
	public BranchManager(int id, String firstName, String lastName, String email, String phoneNumber, String userName, String password, Branch branchType) {
		super(id, firstName, lastName, email, phoneNumber, userName, password);
		this.branchType = branchType;
	}
	
	public Branch getbranchType() {return branchType;}
	
	public void setBranch(Branch branchType) {this.branchType=branchType;}
}
