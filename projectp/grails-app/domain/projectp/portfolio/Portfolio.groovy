package projectp.portfolio

import projectp.asset.Asset;

class Portfolio {

    static constraints = {
		name(blank:false, maxSize:255)
    }
	
	String name
	String description
	
	
	static hasMany = [assets:Asset, groups:PortfolioGroup]
	
}
