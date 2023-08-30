package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Controller/JoinController.do")
public class JoinController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		
		// DTO 객체 생성을 통해 DTO에 연결하는건가? 
		MemberDTO dto = new MemberDTO();
		
		//DTO에 데이터 저장
		dto.setId(req.getParameter("id"));
		dto.setPass(req.getParameter("password"));
		dto.setName(req.getParameter("name"));
		dto.setBirth(req.getParameter("birth"));
		dto.setZipcode(req.getParameter("zipcode"));
		dto.setAddress(req.getParameter("address"));
		dto.setDetailaddress(req.getParameter("detailAddress"));
		dto.setChamgo(req.getParameter("chamgo"));
		
//		//중간확인
//		System.out.println(dto.getId());
//		System.out.println(dto.getPass());
//		System.out.println(dto.getName());
//		System.out.println(dto.getBirth());
//		System.out.println(dto.getZipcode());
//		System.out.println(dto.getAddress());
//		System.out.println(dto.getDetailaddress());
//		System.out.println(dto.getChamgo());
		
		// DB 연결 및 업데이트 처리
		MemberDAO dao = new MemberDAO();
		int result = dao.join(dto);
		dao.close();
		
		// 서블릿에서 특정요청명으로 이동할 때는 sendRedirect()를 사용하면 된다.
		if(result == 1)
		{
			// insert에 성공하면 홈페이지로 이동한다.
			
			resp.sendRedirect("../view/MainPage.jsp");
		}
		else
		{
			resp.sendRedirect("../view/SignUp.jsp");
		}
	}
	
	
}
