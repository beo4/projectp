package projectp.util

class Image {

    static constraints = {
    }
	
	static mapping = { columns { image type:'blob' } }
	
	String name
	byte[] image
}
