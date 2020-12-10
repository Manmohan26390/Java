package Photo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class upload_img {

    public void upload_img_fun(InputStream is, String st, String p) throws IOException {
        byte[] buffer = new byte[is.available()];
        is.read(buffer);
        File targetFile = new File(st  + p);
        OutputStream out = new FileOutputStream(targetFile);
        out.write(buffer);
        out.close();
    }
}
