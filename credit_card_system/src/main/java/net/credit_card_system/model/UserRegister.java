package net.credit_card_system.model;

public class UserRegister {
	private int id;
    private String customer_name;
    private String paskey;
    private String paskey1;
    private boolean isSuspended;

    public boolean isSuspended() {
		return isSuspended;
	}

	public void setSuspended(boolean isSuspended) {
		this.isSuspended = isSuspended;
	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return customer_name;
    }

    public void setUsername(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getPswrd() {
        return paskey;
    }

    public void setPswrd(String paskey) {
        this.paskey = paskey;
    }

    public String getPswrd1() {
        return paskey1;
    }

    public void setPswrd1(String paskey1) {
        this.paskey1 = paskey1;
    }
}