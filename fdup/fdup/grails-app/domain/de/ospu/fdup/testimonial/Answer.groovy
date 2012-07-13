package de.ospu.fdup.testimonial

class Answer {

    static constraints = {
		text()
		ordering()
    }
	
	String text
	Question question
	int points
	boolean active = true
	int ordering = 0
	
	static belongsTo = [Question]
	
	static mapping = {
		sort ordering: 'asc'
		text type: 'text'
	}
	
	@Override
	public String toString() {
		return text;
	}
}
