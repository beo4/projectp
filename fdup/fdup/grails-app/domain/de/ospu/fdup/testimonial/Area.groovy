package de.ospu.fdup.testimonial

class Area {

    static constraints = {
		name ()
		ordering ()
    }
	
	String name
	int ordering = 0
	
	static hasMany = [questions:Question]
	
	static mapping = {
		sort ordering: 'asc'
	}
	
	@Override
	public String toString() {
		return name;
	}
	
	
}
