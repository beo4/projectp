package projectp.util

import org.apache.commons.io.IOUtils;

class UploadService {

    static transactional = true

    public byte[] upload(InputStream inputStream) {

		byte[] array
		
        try {
			array = inputStream.bytes
        } catch (Exception e) {
            throw new Exception(e)
        } finally {
                IOUtils.closeQuietly(inputStream);
            }
		
		return array

    }
}
