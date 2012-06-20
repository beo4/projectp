package projektp.asset


class Asset {

    static constraints = {
		name(blank:false, maxSize:255)
    }
	
	String name
	AssetType type
	String location
	String latestValuation  //maybe History
	String yield
	String occupancy
	String rentReviewData
	static hasMany = [units:AssetUnit]
	
	
}
