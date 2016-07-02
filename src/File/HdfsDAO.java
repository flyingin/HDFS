package File;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import java.io.IOException;
import java.net.URI;

/**
 * Created by yml on 16-7-2.
 */
public class HdfsDAO {
    private final String url = "hdfs://localhost:9000";
    private final Configuration configuration = new Configuration();
    public static void main(String []args){

    }
    public FileStatus[] ls(String folder) throws IOException{
        FileSystem fileSystem = FileSystem.get(URI.create(url),configuration);
        Path path = new Path(folder);

        FileStatus[] list = fileSystem.listStatus(path);
        return list;
    }

}
