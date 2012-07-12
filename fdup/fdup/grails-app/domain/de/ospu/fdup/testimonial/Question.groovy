package de.ospu.fdup.testimonial

class Question {

    static constraints = {
    }
	
	String name
	String question
	
	boolean activeQuestion = true
	
	Area area
	
	static hasMany = [answers:Answer]
	
	static mapping = {
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return question;
	}
	
	
}
