package de.ospu.fdup.testimonial

class Analysis {

    static constraints = {
		text (maxSize: 65000)
		area (blank:true, nullable:true)
    }
	
	Area area
	int pointsFrom
	int pointsTill
	String text
	
	boolean active = true
}
