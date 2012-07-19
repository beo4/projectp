package de.ospu.fdup.testimonial

class Answer implements Comparable {

    static constraints = {
		text(maxSize: 1000)
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

	@Override
	public int compareTo(Object o) {
		return (o.ordering-ordering) ? ordering - o.ordering : 1
	}
}
