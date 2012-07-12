package de.ospu.fdup.testimonial

class Answer {

    static constraints = {
		
    }
	
	String text
	Question question
	int points
	boolean active = true
	
	static belongsTo = [Question]
	
	static mapping = {
	}
	
	@Override
	public String toString() {
		return text;
	}
}
