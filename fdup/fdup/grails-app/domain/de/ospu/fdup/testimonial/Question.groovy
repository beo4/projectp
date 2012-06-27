package de.ospu.fdup.testimonial

class Question {

    static constraints = {
    }
	
	String name
	String question
	
	boolean activeQuestion
	
	Area area
	
	static hasMany = [answers:Answer]
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return question+"?";
	}
	
	
}
