package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class MemberController
 */
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}
    
    public void process (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		resp.setContentType("text/html; charset-utf-8");
		req.setCharacterEncoding("utf-8");
		
		if(command.equals("/home.do")) {
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/main.jsp");
			rd.forward(req, resp);
		}else if(command.equals("/insert.do")) {
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/insert2.jsp");
			rd.forward(req, resp);	
		}else if(command.equals("/insertAction.do")) {
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/insertAction.jsp");
			rd.forward(req, resp);	
		}
    }
    
public void requestInsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		System.out.println("¿Ï·á");
		
		String name = req.getParameter("m_name");
		String birth = req.getParameter("m_birth");
		String number = req.getParameter("m_number");
		String area = req.getParameter("m_area");
		int age1 = Integer.parseInt(req.getParameter("m_age1"));
		String sex = req.getParameter("m_sex");
		String option1 = req.getParameter("m_option1");
		String option2 = req.getParameter("m_option2");
		String option3 = req.getParameter("m_option3");
		String notice = req.getParameter("m_note");
		

		MemberDAO memberDao = MemberDAO.getInstance();
		MemberDTO dto = new MemberDTO();
		
		dto.setM_id(memberDao.nextval() + 1);
		dto.setM_name(name);
		dto.setM_birth(birth);
		dto.setM_number(number);
		dto.setM_area(area);
		dto.setM_sex(sex);
		dto.setM_age1(age1);
		dto.setM_age2(age1 - 1);
		dto.setM_option1(option1);
		dto.setM_option2(option2);
		dto.setM_option3(option3);
		dto.setM_note(notice);
		
		int wResult = memberDao.insert(dto);
		System.out.println(wResult);
		if(wResult == -1) {
			resp.sendRedirect("er.do");
		} else {
			resp.sendRedirect("select.do");
		}
		
	}

}
