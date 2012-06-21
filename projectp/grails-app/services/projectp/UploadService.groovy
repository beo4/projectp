package projectp

import java.io.File;
import java.io.InputStream;
import uk.co.desirableobjects.ajaxuploader.exception.FileUploadException

class UploadService {

    static transactional = true

    void upload(InputStream inputStream, byte[] array) {

        try {
            array << inputStream
        } catch (Exception e) {
            throw new FileUploadException(e)
        }

    }
}
