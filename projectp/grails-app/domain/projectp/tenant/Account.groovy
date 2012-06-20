package projectp.tenant

class Account {

    static constraints = {
		name(blank:false, maxSize:255)
    }
	
	String name
	String accountNumber
	String blz
	
	String toString() {
		return name;
	}
}
