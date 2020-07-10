package com.fpt.service;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadConfig {
	@Autowired
	ServletContext ctx;
	
	
	public String uploadImage(ModelMap map, MultipartFile image) {
		if (image.isEmpty()) {
			System.out.println("File error");
			return "";
		} else {
			try {
				System.out.println(ctx.getRealPath("/"));
				String path = ctx.getRealPath("/resources/") + image.getOriginalFilename();
				System.out.println("do upload"+path);
				image.transferTo(new File(path));
				return image.getOriginalFilename();
			} catch (Exception e) {
				System.out.println(e);
				return "";
			}
		}
	}
}