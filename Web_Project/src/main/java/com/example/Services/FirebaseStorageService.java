package com.example.Services;

import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import org.springframework.stereotype.Service;

import javax.swing.*;
import java.io.InputStream;

@Service
public class FirebaseStorageService {
    public void uploadImageA(InputStream inputStream, String fileName) {
        Storage storage = StorageOptions.getDefaultInstance().getService();
        Bucket bucket = storage.get("web-springboot-1a3ab.appspot.com");

        // Đường dẫn trong Firebase Storage. Ví dụ: "images/avatar.jpg"
        String storagePath = "Web_project/articles/" + fileName;

        // Upload InputStream lên Firebase Storage
        bucket.create(storagePath, inputStream, "image/jpeg");
    }
    public void deleteImageA(String fileName) {
        // Thiết lập và cấu hình Storage
        Storage storage = StorageOptions.getDefaultInstance().getService();

        // Tên bucket
        String bucketName = "web-springboot-1a3ab.appspot.com";

        // Xây dựng đối tượng BlobId từ tên bucket và tên đối tượng (hình ảnh)
        BlobId blobId = BlobId.of(bucketName, "Web_project/articles/" + fileName);

        // Thực hiện xóa đối tượng
        boolean deleted = storage.delete(blobId);

        if (deleted) {
            System.out.println("Deleted successfully");
        } else {
            System.err.println("Failed to delete object");
        }
    }

    public void uploadImageU(InputStream inputStream, String fileName) {
        Storage storage = StorageOptions.getDefaultInstance().getService();
        Bucket bucket = storage.get("web-springboot-1a3ab.appspot.com");

        // Đường dẫn trong Firebase Storage. Ví dụ: "images/avatar.jpg"
        String storagePath = "Web_project/users/" + fileName;

        // Upload InputStream lên Firebase Storage
        bucket.create(storagePath, inputStream, "image/jpeg");
    }
    public void uploadImageC(InputStream inputStream, String fileName) {
        Storage storage = StorageOptions.getDefaultInstance().getService();
        Bucket bucket = storage.get("web-springboot-1a3ab.appspot.com");

        // Đường dẫn trong Firebase Storage. Ví dụ: "images/avatar.jpg"
        String storagePath = "Web_project/comments/" + fileName;

        // Upload InputStream lên Firebase Storage
        bucket.create(storagePath, inputStream, "image/jpeg");
    }
}