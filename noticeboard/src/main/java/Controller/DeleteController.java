package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/Controller/DeleteController.do")
public class DeleteController extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session = req.getSession();

		String id = (String) session.getAttribute("id");
		System.out.println(id);
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.memberView(id);

		System.out.println("겟방식에서받응ㅁ"+dto.toString());
		// 인출된 내용을 request영역에 저장한 후 포워드한다.
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("../view/MainPage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		MemberDTO dto = new MemberDTO();
		HttpSession session = req.getSession();
		
		dto.setId((String)session.getAttribute("id"));
		dto.setPass(req.getParameter("pass"));
		
		MemberDAO dao = new MemberDAO();
		System.out.println(dto.toString());
		int result = dao.mdelete(dto);
		System.out.println(dto.toString());
		dao.close();
		
		if(result == 1)
		{
			
			JSFunction.alertLocation(resp, "회원탈퇴가 완료되었습니다.", "LogoutController.do");
		}
		else
		{
			JSFunction.alertLocation(resp, "회원탈퇴를 실패하였습니다.", "../view/Verify.jsp");
		}
	}

}
