package com.file;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileController2
 */
@WebServlet("/file2/upload2")
public class FileController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String savePath = "upload";  // upload라는 폴더에 파일을 저장하기 위해 선언
		int uploadFileSizeLimit = 5*1024*1024;  // 최대 5MB로 제한
		String encType = "utf-8";    // 인코딩
		
		// 파일의 실제 경로를 구해오기 위해 ServletContext를 사용
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);  // 파일의 실제 경로를 uploadFilePath에 저장
		System.out.println(uploadFilePath);
		
		// 파일을 업로드하기 위해서는 request객체를 사용할 수 없고 MultipartRequest를 사용함.
		MultipartRequest multi = new MultipartRequest(
				request,  // request 객체(꼭 써줘야함)
				uploadFilePath,  // 서버상의 실제 디렉토리
				uploadFileSizeLimit,  // 최대 업로드 파일 크기
				encType,  // 인코딩
				new DefaultFileRenamePolicy());  // 동일 이름 존재할 때 새이름 부여
		
		// 업로드한 파일 이름
		String fileName = multi.getFilesystemName("uploadFile");
		if(fileName==null) { // 파일을 올리지 않으면
			fileName="";  // 파일이름을 공백으로 둔다.
		}
		
		String name = multi.getParameter("name");
		String title = multi.getParameter("title");
		String image = fileName;
		FileDTO file = new FileDTO(name, title, image);
		FileDAO dao = FileDAO.getInstance();
		dao.fileInsert(file);
		response.sendRedirect("imageList");  // imageList는 controller의 이름, 파일을 업로드하고 업로드한 파일을 보여위기 위한 페이지 이동
	}
}
