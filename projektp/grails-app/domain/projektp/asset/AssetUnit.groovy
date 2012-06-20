package projektp.asset

class AssetUnit {

    static constraints = {
		name(blank:false, maxSize:255)
    }
	
	String name
	
	
	String toString() {
		return name;
	}
}
