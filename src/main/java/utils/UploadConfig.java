package utils;
//
//import java.io.File;
//import java.sql.Timestamp;
//
//import javax.servlet.ServletContext;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.multipart.MultipartFile;
//
//
//
//import service.CurrentUser;
//
//@Service
//public class UploadConfig {
//	@Autowired
//	ServletContext ctx;
//	public Timestamp timestamp = new Timestamp(System.currentTimeMillis());
////	@Autowired
////	CurrentUser curent;
//	public String uploadImage(ModelMap map, MultipartFile image) {
//		if (image.isEmpty()) {
//			System.out.println("File Erorr");
//			return null;
//		} else {
//			try {
//				String rename_image = timestamp + " " + image.getOriginalFilename();
//				String server_path = ctx.getRealPath("/resources/") + rename_image;
//				image.transferTo(new File(server_path));
//				System.out.println("Excuted Upload" + server_path);
//				//System.out.print("===========================IMAGE_NAME" + rename_image);
//				return rename_image;
//			} catch (Exception e) {
//				return null;
//			}
//		}
//	}
//}

import java.io.File;
import java.sql.Timestamp;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
@Service
public class UploadConfig {
	@Autowired
	ServletContext ctx;
	public Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	public String uploadImage(ModelMap map, MultipartFile image) {
		if (image.isEmpty()) {
			System.out.println("File Erorr");
			return null;
		} else {
			try {
				String rename_image = timestamp + " " + image.getOriginalFilename();
				String server_path = ctx.getRealPath("/resources/") + rename_image;
				image.transferTo(new File(server_path));
				System.out.println("Excuted Upload" + server_path);
				return rename_image;
			} catch (Exception e) {
				return null;
			}
		}
	}
}