package com.homedeco.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utility {
	//자료실-업로드 경로
		public static final String UPLOAD_PATH="폴더명 지정";
		//테스트 경로
		public static final String TEST_PATH
	="//업로드파일 생성후 물리경로 설정";
		
		public static String displayNew(Date regdate) {
			Date today = new Date();
			long gap=(today.getTime() - regdate.getTime())/1000;
			gap = gap/(60*60); 
			String result="";
			if(gap<24) {
				result="<img src='../images/new.gif' alt='new이미지'>";
			}
			
			return result;
		}
		
		public static String displayFile(String fileName) {
			String result="";
			if(fileName!=null && !fileName.isEmpty()) {
				result="<img src='../images/file.gif' alt='file이미지'>";
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
		
		public static String getIntime(Date regdate) {
			Date today=new Date();
			long gap=(today.getTime() - regdate.getTime())/1000;
			if(gap/60<60) {
				gap/=60;
				if(gap*1==0) {
					return "1 분 전";
				}
				return ++gap+" 분 전";
			}
			gap = gap/(60*60);
			if(gap<24) {
				return gap+" 시간 전";
			}
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String result=sdf.format(regdate);
			
			return result;
		}
}
