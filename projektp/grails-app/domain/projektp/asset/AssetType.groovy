package projektp.asset

class AssetType {

    static constraints = {
		name(blank:false, maxSize:255)
    }
	
	String name
	String Description
	
	String toString() {
		return name;
	}
	
}
