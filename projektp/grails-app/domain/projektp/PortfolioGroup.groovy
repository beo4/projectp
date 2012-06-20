package projektp

class PortfolioGroup {

    static constraints = {
		name(blank:false, maxSize:255)
    }
	
	String name
	
	
	String toString() {
		return name;
	}
}
