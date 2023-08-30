package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/Controller/LoginController.do")
public class LoginController extends HttpServlet //httpServlet을 상속
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException
	{
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		// 폼값에서 받은거
		String id = req.getParameter("id");
		String pass = req.getParameter("password");

		//		확인용
		//		System.out.println("controller:"+id+pass);
		
		// dao 에서 반환되서 객체저장 
		int result = dao.login(id,pass);
		if(result==1) {
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			JSFunction.alertBack(resp, "로그인성공");
			req.getRequestDispatcher("/view/MainPage.jsp").forward(req, resp);		
			
			//확인용	
//			System.out.println("로그인성공");
		}
		else {
			JSFunction.alertBack(resp, "로그인실패");
			
			//확인용
//			System.out.println("로그인실패: 컨트롤러");
		}
	}

}
