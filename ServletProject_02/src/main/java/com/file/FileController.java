package com.file;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileController
 */
@WebServlet("/file/upload.do")
public class FileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileController() {
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
		String savePath="upload";  // 저장될 파일의 위치(폴더)
		int uploadFileSizeLimit = 5 * 1024 * 1024; // 최대5MB로 제한
		String encType="utf-8";  // 인코딩
		
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);  // getRealPath: 실제데이터가 들어가는 경로를 알려줌
		System.out.println("서버상의 실제 디렉토리 : "+uploadFilePath);
		
		//request 객체로 넘어온 것을 MultipartRequest로 만듦, MultipartRequest는 파일을 업로드 시킴
		MultipartRequest multi = new MultipartRequest(request,  //request 객체
				uploadFilePath,  //서버상의 실제 디렉토리
				uploadFileSizeLimit, //최대 업로드 파일 크기
				encType, //인코딩
				new DefaultFileRenamePolicy()); // 동일 이름 존재할 때 새이름 부여
		
		// 업로드한 파일 이름
		String fileName = multi.getFilesystemName("uploadFile");  // 실제로 넘어오는 오리지널 이름을 구해와야함
		System.out.println(fileName);
		if(fileName==null) {
			System.out.println("파일 업로드 안함");
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("글쓴이 : "+multi.getParameter("name")+"<br>");
			out.println("제목 : "+multi.getParameter("title")+"<br>");
			out.println("파일명 : "+fileName+"<br>");
		}
	}

}
