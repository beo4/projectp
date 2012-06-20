package projektp.tenant

class Incident {

    static constraints = {
		name(blank:false, maxSize:255)
    }
	
	String name 
	IncidentType type
	BigDecimal ammount
	
	String toString() {
		return name;
	}
}
