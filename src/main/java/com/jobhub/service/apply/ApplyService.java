package com.jobhub.service.apply;

import java.util.List;
import java.util.Map;

import com.jobhub.dto.resume.Resume;
import com.jobhub.dto.util.FileInfo;

public interface ApplyService {
	public int saveEducationInfo(Map<String, Object> eduMap);
	
	public int saveCareerInfo(Map<String, Object> hashMap);
	
	public int saveCertificateInfo(Map<String, Object> hashMap);

	public int saveFileInfo(FileInfo fileInfo);
	
	public int saveResumeInfo(Resume resume);
	
	public int saveAnswerInfo(Map<String, Object> hashMap);
	
	public int saveFileInfo(Map<String, Object> hashMap);
	
	public int saveFileInfo(List<FileInfo> fileInfo);
}
