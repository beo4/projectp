package de.ospu.fdup.testimonial

class Question {

    static constraints = {
		name()
		question()
		ordering ()
    }
	
	String name
	String question
	boolean activeQuestion = true
	Area area
	int ordering = 0
	
	static hasMany = [answers:Answer]
	
	static mapping = {
		sort ordering: 'asc'
		question type: 'text'
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return question;
	}
	
	
}
