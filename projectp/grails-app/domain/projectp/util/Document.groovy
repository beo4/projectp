package projectp.util

class Document {

    static constraints = {
    }
	
	static mapping = { columns { docfile type:'blob' } }
	
	String name
	byte[] docfile
}
