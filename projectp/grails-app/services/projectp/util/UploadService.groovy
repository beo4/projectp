package projectp.util

import uk.co.desirableobjects.ajaxuploader.exception.FileUploadException
import org.apache.commons.io.IOUtils;

class UploadService {

    static transactional = true

    def upload(InputStream inputStream, byte[] array) {

        try {
			array = inputStream.bytes
        } catch (Exception e) {
            throw new FileUploadException(e)
        } finally {
                IOUtils.closeQuietly(inputStream);
            }

    }
}
