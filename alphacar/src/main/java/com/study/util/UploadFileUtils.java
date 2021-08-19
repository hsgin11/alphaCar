package com.study.util;

import java.io.File;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class UploadFileUtils {
  
	@Value("#{systemProperties['user.home']}")
	private String uploadPath ;
	
	private String mountPath = "/images" ;
 
 public String fileUpload(String path ,   String fileName,     InputStream fileData) throws Exception {
  String ymd = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM"));
  String uid = UUID.randomUUID().toString().substring(1,10);
  
  String newFileName = uid + "_" + fileName;
  String imgPath = mountPath +  File.separator + path + File.separator + ymd ;

  File target = new File( uploadPath  + imgPath , newFileName);
  // FileCopyUtils.copy(fileData, target);
  FileUtils.copyToFile(fileData, target);
  
  return ymd +  File.separator +  newFileName ;
 }

 @Deprecated
 public static String calcPath(String uploadPath) {
  Calendar cal = Calendar.getInstance();
  String yearPath = File.separator + cal.get(Calendar.YEAR);
  String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
  String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

  makeDir(uploadPath, yearPath, monthPath, datePath);


  return datePath;
 }

 @Deprecated
 private static void makeDir(String uploadPath, String... paths) {

  if (new File(paths[paths.length - 1]).exists()) { return; }

  for (String path : paths) {
   File dirPath = new File(uploadPath + path);

   if (!dirPath.exists()) {
    dirPath.mkdir();
   }
  }
 }
}