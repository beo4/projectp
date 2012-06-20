package projectp.asset

import projectp.activity.Activity
import projectp.util.Image
import projectp.util.Document
import projectp.event.Event


class Asset {

    static constraints = {
		name(blank:false, maxSize:255)
		belongingAsset(blank: true, nullable: true)
    }
	
	String name
	String location
	String latestValuation  //maybe History
	String yield
	String occupancy
	String rentReviewData
	static hasMany = [subAssets:Asset, activities: Activity, events: Event, documents: Document, images: Image]
	static managedBy = [activities:'asset' , events: 'asset']
	Asset belongingAsset
	
	
}
