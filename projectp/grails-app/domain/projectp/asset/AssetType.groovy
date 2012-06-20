package projectp.asset

class AssetType {

    static constraints = {
		name(blank:false, maxSize:255)
    }
	
	String name
	String description
	
	
	String toString() {
		return name;
	}
	
}
