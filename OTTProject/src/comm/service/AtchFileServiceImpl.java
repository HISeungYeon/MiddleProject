package comm.service;

import java.io.*;
import java.util.*;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import org.apache.ibatis.session.*;

import comm.dao.*;
import comm.vo.*;
import util.*;


public class AtchFileServiceImpl implements IAtchFileService {
	private static final String UPLOAD_DIR = "E:/D_Other/upload_files";
	private static IAtchFileService fService;
	private IAtchFileDAO fDao;

	private AtchFileServiceImpl() {
		fDao = AtchFileDAOImpl.getInstance();
	}

	public static IAtchFileService getInstance() {
		if (fService == null) {
			fService = new AtchFileServiceImpl();
		}
		return fService;
	}

	@Override
	public AtchFileVO saveAtchFileList(HttpServletRequest req) {
		// 웹애플리케이션 루트 디렉토리 기준 업로드 경로 설정하기
		
//		String src = req.getServletContext().getRealPath("/images");
//		System.out.println("src경로:" + src);
		File uploadDir = new File(UPLOAD_DIR);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		AtchFileVO vo = null;
		SqlSession session = MyBatisUtil.getInstance();
		try {
			String fileName = "";
			boolean isFirstFile = true; // 첫번째 파일 여부
			for (Part part : req.getParts()) {
				fileName = getFileName(part); // 파일명 추출
				if (fileName != null && !fileName.equals("")) {
					if (isFirstFile) {
						isFirstFile = false;
						// 파일 기본정보 저장하기
						vo = new AtchFileVO();
						fDao.insertAtchFile(session, vo);
					}
					String orignFileName = fileName; // 원본 파일명
					long fileSize = part.getSize(); // 파일 사이즈
					String saveFileName = ""; // 저장 파일명
					String saveFilePath = ""; // 저장 파일 경로
					File storeFile = null; // 저장 파일 객체

					do {
						saveFileName = UUID.randomUUID().toString().replace("-", "");
						saveFilePath = UPLOAD_DIR + File.separator + saveFileName;
						storeFile = new File(saveFileName);
					} while (storeFile.exists());
					
					System.out.println("세이브파일패스" + saveFilePath);
					part.write(saveFilePath); // 파일 저장

					// 확장자 추출
					String fileExtension = orignFileName.lastIndexOf(".") < 0 ? ""
							: orignFileName.substring(orignFileName.lastIndexOf(".") + 1);
					vo.setStreFileNm(saveFileName);
					vo.setFileSize(fileSize);
					vo.setOrignlFileNm(orignFileName);
					vo.setFileStreCours(saveFilePath);
					vo.setFileExtsn(fileExtension);

					fDao.insertAtchFileDetail(session, vo);

					part.delete(); // 임시 업로드 파일 삭제하기
					System.out.println("파일명 : " + fileName + " 업로드 완료 !");

					session.commit(); // 커밋
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return vo;
	}

	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO vo) {
		SqlSession session = MyBatisUtil.getInstance();
		List<AtchFileVO> atchFileList = null;
		try {
			atchFileList = fDao.getAtchFileList(session, vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return atchFileList;
	}

	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO vo) {
		SqlSession session = MyBatisUtil.getInstance();
		AtchFileVO fileVO = null;
		try {
			fileVO = fDao.getAtchFileDetail(session, vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return fileVO;
	}

	/**
	 * Part객체 파싱하여 파일이름 추출하기
	 * 
	 * @param part Part객체
	 * @return 파일명 : 존재하지 않으면 null 리턴함(폼필드인 경우...)
	 */
	private String getFileName(Part part) {
		/*
		 * Content-Disposition: form-data Content-Disposition: form-data;
		 * name="fieldName" Content-Disposition: form-data; name="fieldName";
		 * filename="a.jpg"
		 */

		for (String content : part.getHeader("Content-Disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
			}
		}
		return null; // filename이 존재하지 않는 경우...(폼필드)
	}
}