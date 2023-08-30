package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/Controller/UpdateController.do")
public class UpdateController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
	// 수정페이지로 전달된 id를 통해 회원정보를 인출한다.
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.memberView(id);
		
		System.out.println(dto.toString());
		// 인출된 내용을 request영역에 저장한 후 포워드한다.
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("../view/updateForm.jsp").forward(req, resp);
		System.out.println(req);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		MemberDTO dto = new MemberDTO();
		
		dto.setId(req.getParameter("id"));
		dto.setPass(req.getParameter("password"));
		dto.setName(req.getParameter("name"));
		dto.setZipcode(req.getParameter("zipcode"));
		dto.setAddress(req.getParameter("address"));
		dto.setDetailaddress(req.getParameter("detailAddress"));
		dto.setChamgo(req.getParameter("chamgo"));
		
		MemberDAO dao = new MemberDAO();
		System.out.println(dto.toString());
		int result = dao.medit(dto);
		dao.close();
		System.out.println(result);
		
		if(result == 1)
		{
			JSFunction.alertLocation(resp, "정상적으로 회원 정보를 변경하였습니다.", "../view/MainPage.jsp");
//			resp.sendRedirect("../view/MainPage.jsp");
		}
		else
		{
			JSFunction.alertLocation(resp, "회원 정보변경을 실패하였습니다.", "../view/updateForm.jsp");
			resp.sendRedirect("../view/updateForm.jsp");
		}
	}
	
	
}
