package de.ospu.fdup.testimonial

class Question implements Comparable {

    static constraints = {
		name()
		ordering ()
		question(maxSize: 1000)
    }
	
	String name
	String question
	boolean activeQuestion = true
	Area area
	int ordering = 0
	SortedSet<Answer> answers
	
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

	@Override
	public int compareTo(Object o) {
		int comp = area.compareTo(o.area)
		comp = (comp==0) ? ordering - o.ordering : comp
		return (comp!=0) ? comp : 1
	}
	
	
}
