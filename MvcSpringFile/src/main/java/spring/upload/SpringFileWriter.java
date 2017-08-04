package spring.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;

public class SpringFileWriter {
	FileOutputStream fos;
	
	//한개파일 저장시
	public void writeOneFile(MultipartFile file, String path){
		byte[] fileData;
		String fileName = file.getOriginalFilename();
		File f = new File(path);
		
		if(!f.exists()){
			f.mkdirs();
		}
		
		try{
			fileData = file.getBytes();
			fos = new FileOutputStream(path+"\\"+fileName);
			fos.write(fileData);
		} catch(Exception e){
			e.printStackTrace();
		}finally{
			if(fos!=null){
				try {
					fos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	public void writeMultiFile(ArrayList<MultipartFile> files, String path){
		FileOutputStream fos = null;
		
		for(MultipartFile file:files){
			try {
				byte []fileData = file.getBytes();
				fos = new FileOutputStream(path+"\\"+file.getOriginalFilename());
				fos.write(fileData);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e){
				e.printStackTrace();
			} finally{
				if(fos !=null){
					try {
						fos.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

			
		}
	}

}
