/*
 * Copyright (c) 2012 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */

package hello.storage;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.OAuth2Utils;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.googleapis.media.MediaHttpUploader;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.DataStoreFactory;
import com.google.api.client.util.store.FileDataStoreFactory;



import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.*;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.Drive.Files;
import com.google.api.services.drive.Drive.Files.Create;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/**
 * A sample application that runs multiple requests against the Drive API. The requests this sample
 * makes are:
 * <ul>
 * <li>Does a resumable media upload</li>
 * <li>Updates the uploaded file by renaming it</li>
 * <li>Does a resumable media download</li>
 * <li>Does a direct media upload</li>
 * <li>Does a direct media download</li>
 * </ul>
 *
 * @author rmistry@google.com (Ravi Mistry)
 */
public class DriveService {

	/**
	 * Be sure to specify the name of your application. If the application name is {@code null} or
	 * blank, the application will log a warning. Suggested format is "MyCompany-ProductName/1.0".
	 */
	private static final String APPLICATION_NAME = "Nguyễn Văn Phi Tước";

	private static final String UPLOAD_FILE_PATH = "Enter File Path";
	private static final String DIR_FOR_DOWNLOADS = "Enter Download Directory";
	private static final String GMAIL = "nguyenvanphituoc@gmail.com";
	private static final java.io.File UPLOAD_FILE = new java.io.File(UPLOAD_FILE_PATH);

	/** Directory to store user credentials. */
	private static final java.io.File DATA_STORE_DIR =
			new java.io.File(System.getProperty("user.home"), ".store/drive_sample");

	/**
	 * Global instance of the {@link DataStoreFactory}. The best practice is to make it a single
	 * globally shared instance across your application.
	 */
	private static FileDataStoreFactory DATA_STORE_FACTORY;
	/** Global instance of the HTTP transport. */
	private static HttpTransport HTTP_TRANSPORT;
	//	private static final List<String> SCOPES =
	//			Arrays.asList(DriveScopes.DRIVE_APPDATA);
	private static final List<String> SCOPES = Arrays.asList("https://www.googleapis.com/auth/drive");
	/** Global instance of the JSON factory. */
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
	static {
		try {
			HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
			DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
		} catch (Throwable t) {
			t.printStackTrace();
			System.exit(1);
		}
	}
	/** Global Drive API client. */
	private static Drive drive;
	// au02
	private static OAuth2Utils oauth2;
	/** Authorizes the installed application to access user's protected data. */
	public static Credential authorize() throws IOException {
		// Load client secrets.
		InputStream in =
				DriveService.class.getResourceAsStream("client_secret.json");
		GoogleClientSecrets clientSecrets =
				GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));
		// Build flow and trigger user authorization request.
		GoogleAuthorizationCodeFlow flow =
				new GoogleAuthorizationCodeFlow.Builder(
						HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
				.setDataStoreFactory(DATA_STORE_FACTORY)
				.setScopes(SCOPES)
				.setAccessType("offline")
				.build();
		Credential credential = new AuthorizationCodeInstalledApp(
				flow, new LocalServerReceiver()).authorize("user");

		System.out.println(
				"Credentials saved to " + DATA_STORE_DIR.getAbsolutePath());
		return credential;
	}
	public static Drive getDriveService() throws IOException {
		Credential credential = authorize();
		return new Drive.Builder(
				HTTP_TRANSPORT, JSON_FACTORY, credential)
				.setApplicationName(APPLICATION_NAME)
				.build();
	}

	public static void main(String UPLOAD_FILE_PATH, String ContentType) {
		try {
			java.io.File UPLOAD_FILE = new java.io.File(UPLOAD_FILE_PATH);
			HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
			DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
			// authorization
			// set up the global Drive instance
			drive = getDriveService();

			// run commands

			View.header1("Starting Resumable Media Upload");
			View.header1("Starting Simple Media Upload");
			File uploadedFile = uploadFile(true, UPLOAD_FILE, ContentType);
			View.header1("Success!");
			return;
		} catch (IOException e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		} catch (Throwable t) {
			t.printStackTrace();
		}
		System.exit(1);
	}

	private static String createDriveQuery(String query){
		String result = "";
		String[] templates = (" " + query).split(".");
		if(templates.length == 0){
			templates= new String[2];
			boolean type = query.contains(".");
			//true : có mà không split được => chỉ chứa type
			templates[0] = query;
			templates[1] =  type == true?query.substring(query.indexOf('.') + 1, query.length()): query;
		}
		if(templates[0] != "")
			result +="name contains '" + templates[0].trim() + "' or fullText contains '" + templates[0].trim()+
			"' or ";
		final String path = "tmp";
		// gets absolute path of the web application
		String appPath = "C:";
		// constructs path of the directory to save uploaded file
		String savePath = appPath + java.io.File.separator + path;
		String fullPathFile = savePath + java.io.File.separator + "templates";
		java.io.File file = new java.io.File(fullPathFile+ "." + templates[1]);
		try {
			result += " mimeType = '" + java.nio.file.Files.probeContentType(file.toPath()) + "' ";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			file.delete();
		}
		return result;
	}
	
	public static List<File> Search(Drive service, String query) throws IOException{
		List<File> result = new ArrayList<File>();
		Files.List request =  service.files().list();
		query = createDriveQuery(query);
		String pageToken = null;
		do {
			//"mimeType='image/jpeg'"
			FileList files = request.setQ(query)
					.setSpaces("drive")
					.setFields("nextPageToken, files(id, name, mimeType)")
					.setPageToken(pageToken)
					.execute();
			result.addAll(files.getFiles());
			for(File file: files.getFiles()) {
				System.out.printf("Found file: %s (%s) (%s)\n",
						file.getName(), file.getId(), file.getMimeType());
			}
			pageToken = files.getNextPageToken();
		} while (pageToken != null);
		return result;
	}
	public static List<File> retrieveAllFiles(Drive service) throws IOException {
		List<File> result = new ArrayList<File>();
		Files.List request = service.files().list();
		
		do {
			try {
				FileList files = request.execute();

				result.addAll(files.getFiles());
				request.setPageToken(files.getNextPageToken());
			} catch (IOException e) {
				System.out.println("An error occurred: " + e);
				request.setPageToken(null);
			}

		} while (request.getPageToken() != null &&
				request.getPageToken().length() > 0);

		return result;
	}

	/** Uploads a file using either resumable or direct media upload. */
	private static File uploadFile(boolean useDirectUpload, java.io.File UPLOAD_FILE, String ContentType) throws IOException {
		File fileMetadata = new File();
		fileMetadata.setName(UPLOAD_FILE.getName());

		FileContent mediaContent = new FileContent(ContentType, UPLOAD_FILE);

		Create insert =  drive.files()
				.create(fileMetadata, mediaContent)
				.setFields("id");
		MediaHttpUploader uploader = insert.getMediaHttpUploader();
		uploader.setDirectUploadEnabled(useDirectUpload);
		uploader.setProgressListener(new FileUploadProgressListener());
		return insert.execute();
	}


	/** Updates the name of the uploaded file to have a "drivetest-" prefix. */
	private static File updateFileWithTestSuffix(String id) throws IOException {
		File fileMetadata = new File();
		fileMetadata.setName("drivetest-" + UPLOAD_FILE.getName());

		Drive.Files.Update update = drive.files().update(id, fileMetadata);
		return update.execute();
	}

	/** Downloads a file using either resumable or direct media download. */
	private static void downloadFile(boolean useDirectDownload, File uploadedFile)
			throws IOException {
		// create parent directory (if necessary)
		java.io.File parentDir = new java.io.File(DIR_FOR_DOWNLOADS);
		if (!parentDir.exists() && !parentDir.mkdirs()) {
			throw new IOException("Unable to create parent directory");
		}
		OutputStream out = new FileOutputStream(new java.io.File(parentDir, uploadedFile.getName()));
		Drive service = getDriveService();
		service.files()
		.export(uploadedFile.getId(), uploadedFile.getMimeType())
		.executeMediaAndDownloadTo(out);

	}
}
