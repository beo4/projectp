modules = {
	slitslider {
		resource url: 'js/slitslider.js'
		resource url: 'css/testemonial.css'
		
		dependsOn 'jquery, baCond,transit'
	}
	
	baCond {
		resource url: 'js/jquery.ba-cond.min.js'
		
		dependsOn 'jquery'
	}
	
	transit {
		resource url: 'js/jquery.transit.min.js'
		
		dependsOn 'jquery'
	}
}