package projectp.util

class Document {

	static constraints = {
		document(maxSize:26843546)
    }
	
	
	String name
	String fileType
	byte[] document
}
