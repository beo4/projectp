package de.ospu.fdup.testimonial

class Answer {

    static constraints = {
    }
	
	String text
	Question question
	int points
	boolean active
	
	static belongsTo = [Question]
	
	@Override
	public String toString() {
		return question;
	}
}
