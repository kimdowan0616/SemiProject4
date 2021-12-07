package com.cm.db;

import java.util.Date;

public class Utility {
	public static final String UPLOAD_PATH="폴더명";
	public static final String TEST_PATH
	="//물리경로 설정";
	
	public static String displayRe(int step) {
		
		
		String result="";
		if(step>0){ 
			for(int k=0;k<step;k++) { 
				result+="&nbsp;";
			}//for

			result+= "<img src='../images/re.gif'>";
		}//if
		
		return result;
	}
	
	public static String cutString(String title, int len) {
		String result=title;
		if(title.length()>len) {
			result=title.substring(0,len)+"...";
		}
		return result;
	}
	
	public static String displayNew(Date regdate) {
		Date today= new Date();
		long gap=(today.getTime()-regdate.getTime())/1000;
		gap=gap/(60*60);	
		
		String result="";
		if(gap<24) {
			result="<img src='../images/new.gif' alt='new 이미지'>";
		}
		return result;
	}
	
	public static String displayFile(String fileName) {
		//파일이 첨부된 경우 파일이미지 보여주기
		String result="";
		if(fileName!=null && !fileName.isEmpty()) {
			result="<img src='../community_upload/"+fileName+"' width="+500+"><br>";
		}
		return result;
	}
	
	public static String showFileInfo(String oFileName, long fileSize) {
		String result="";
		if(oFileName!=null && !oFileName.isEmpty()) {
			float fSize = Math.round(fileSize/1000f*10)/10f;
			
			result=displayFile(oFileName)+" " + oFileName
					+" (" + fSize+"KB)";
		}
		
		return result;
	}
}
