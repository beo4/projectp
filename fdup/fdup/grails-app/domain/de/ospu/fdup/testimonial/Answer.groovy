package de.ospu.fdup.testimonial

class Answer {

    static constraints = {
		order(unique: true)
    }
	
	String text
	Question question
	int points
	int order
	boolean active
	
	static belongsTo = [Question]
	
	@Override
	public String toString() {
		return text;
	}
}
