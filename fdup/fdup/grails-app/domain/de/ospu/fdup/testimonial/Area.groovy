package de.ospu.fdup.testimonial

import jodd.util.collection.SortedArrayList;

class Area implements Comparable{

    static constraints = {
		name ()
		ordering ()
    }
	
	String name
	int ordering = 0
	SortedSet<Question> questions
	
	int analysisTopLine = 0
	int analysisBottomLine = 0
	
	static hasMany = [questions:Question]
	
	static mapping = {
		sort ordering: 'asc'
	}
	
	@Override
	public String toString() {
		return name;
	}

	@Override
	public int compareTo(Object o) {
		int comp =  ordering-o.ordering
		return (comp!=0) ? comp : name.compareTo(o.name)
	}
	
	@Override
	public boolean equals(Object obj) {
		
		return id == obj.id;
	}
	
	
}
