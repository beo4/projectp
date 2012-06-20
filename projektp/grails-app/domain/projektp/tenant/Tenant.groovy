package projektp.tenant

class Tenant {

    static constraints = {
		name(blank:false, maxSize:255)
    }
	
	String name
	String financialStrength
	String rating
	
	static hasMany = [accounts:Account, incidents:Incident]
	
	String toString() {
		return name;
	}
}
