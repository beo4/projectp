package projektp.tenant

class IncidentType {

    static constraints = {
		name(blank:false, maxSize:255)
    }
	
	String name
	
	String toString() {
		return name;
	}
}
