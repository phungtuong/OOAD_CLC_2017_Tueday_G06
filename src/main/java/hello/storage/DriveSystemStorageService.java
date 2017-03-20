package hello.storage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.multipart.MultipartFile;

@Service("DriveStorage")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)   	// 100 MB
public class DriveSystemStorageService implements StorageService{
	 private final Path rootLocation;
	 private OutputStream out = null;
	 private InputStream filecontent = null;
	    @Autowired
	    public DriveSystemStorageService(StorageProperties properties) {
	        this.rootLocation = Paths.get(properties.getLocation());
	    }
		@Override
		public List<com.google.api.services.drive.model.File> driveAPISearch(String query) {
			// TODO Auto-generated method stub
			try {
				return DriveService.Search(DriveService.getDriveService(), query);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		
	    @Override
	    public void store(MultipartFile file) {
	        try {
	            if (file.isEmpty()) {
	                throw new StorageException("Failed to store empty file " + file.getOriginalFilename());
	            }
	            File tmpFile = null;
	    		try{	    			
	    			String fileName = file.getOriginalFilename();
	    			// gets absolute path of the web application
	    			String appPath = new File(this.rootLocation.toString()).getAbsolutePath();
	    			// constructs path of the directory to save uploaded file
	    			String savePath = appPath;

					String fullPathFile = savePath + File.separator + fileName;
					tmpFile = new  File(fullPathFile);
					out = new FileOutputStream(tmpFile);
					
					filecontent = file.getInputStream();
					int read = 0;
					final byte[] bytes = new byte[1024];//1mb
					while ((read = filecontent.read(bytes)) != -1) {
						out.write(bytes, 0, read);
					}
					DriveService.main(fullPathFile, file.getContentType());
	    		}
	    		catch (Exception e) {
	    			// TODO: handle exception
	    			e.printStackTrace();
	    		}
	    		finally {
	    			tmpFile.delete();
	    			out.close();
	    			filecontent.close();
	    		}
	            
	        } catch (Exception e) {
	            throw new StorageException("Failed to store file " + file.getOriginalFilename(), e);
	        }
	    }

	    @Override
	    public Stream<Path> loadAll() {
	        try {
	            return Files.walk(this.rootLocation, 1)
	                    .filter(path -> !path.equals(this.rootLocation))
	                    .map(path -> this.rootLocation.relativize(path));
	        } catch (IOException e) {
	            throw new StorageException("Failed to read stored files", e);
	        }

	    }
	    //search file
	    @Override
	    public Path load(String filename) {
	        return rootLocation.resolve(filename);
	    }

	    @Override
	    public Resource loadAsResource(String filename) {
	        try {
	            Path file = load(filename);
	            Resource resource = new UrlResource(file.toUri());
	            if(resource.exists() || resource.isReadable()) {
	                return resource;
	            }
	            else {
	                throw new StorageFileNotFoundException("Could not read file: " + filename);

	            }
	        } catch (MalformedURLException e) {
	            throw new StorageFileNotFoundException("Could not read file: " + filename, e);
	        }
	    }

	    @Override
	    public void deleteAll() {
	        FileSystemUtils.deleteRecursively(rootLocation.toFile());
	    }

	    @Override
	    public void init() {
	        try {
	            Files.createDirectory(rootLocation);
	        } catch (IOException e) {
	            throw new StorageException("Could not initialize storage", e);
	        }
	    }
}
