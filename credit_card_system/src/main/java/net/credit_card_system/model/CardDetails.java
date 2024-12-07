package net.credit_card_system.model;

public class CardDetails {
	 private String cardNumber;
	    private String cvv;
	    private String expiryDate;
	    private String bankName;
	    private String branch;
	    private String username;
	    private String cardholderName;
		public String getCardNumber() {
			return cardNumber;
		}
		public void setCardNumber(String cardNumber) {
			this.cardNumber = cardNumber;
		}
		public String getCvv() {
			return cvv;
		}
		public void setCvv(String cvv) {
			this.cvv = cvv;
		}
		public String getExpiryDate() {
			return expiryDate;
		}
		public void setExpiryDate(String expiryDate) {
			this.expiryDate = expiryDate;
		}
		public String getBankName() {
			return bankName;
		}
		public void setBankName(String bankName) {
			this.bankName = bankName;
		}
		public String getBranch() {
			return branch;
		}
		public void setBranch(String branch) {
			this.branch = branch;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getCardholderName() {
			return cardholderName;
		}
		public void setCardholderName(String cardholderName) {
			this.cardholderName = cardholderName;
		}

}