package com.skillpilots.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.auth.Credentials;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Acl;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.firebase.cloud.StorageClient;
import com.skillpilots.model.Internships;
import com.skillpilots.repository.InternshipRepository;

@Service
public class FirebaseStorageService {
	private static final String DOWNLOAD_URL = "https://firebasestorage.googleapis.com/v0/b/%s/o/%s?alt=media";
	@Autowired
	private InternshipRepository internshipRepository;

	
	
	 public String uploadFile(MultipartFile file, Long internshipid) throws IOException {
	        Bucket bucket = StorageClient.getInstance().bucket();
	        String fileName = "certificate/" + internshipid + "/" + file.getOriginalFilename();

	        BlobInfo blobInfo = bucket.create(fileName, file.getBytes(), "application/pdf");

	        // Make the file public
	        bucket.get(fileName).createAcl(Acl.of(Acl.User.ofAllUsers(), Acl.Role.READER));
	        Internships internship = internshipRepository.getDownoadurl(internshipid);
	        internship.setDownloadUrl(blobInfo.getMediaLink());
	        internshipRepository.save(internship);
	        return blobInfo.getMediaLink();
	    }


	
}
