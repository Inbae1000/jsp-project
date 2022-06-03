package subject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SubjectController
 */
@WebServlet("/SubjectController")
public class SubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	public void process (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		 String RequestURI = req.getRequestURI();
		 String contextPath = req.getContextPath();
		 String command = RequestURI.substring(contextPath.length());
		 
		resp.setContentType("text/html; charset-utf-8");
		req.setCharacterEncoding("utf-8");
		
		if(command.equals("/select.so")){
			selectOne(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/list.jsp");
			rd.forward(req, resp);	
		}
		else if(command.equals("/add.so")) {
			selectOne(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/insert.jsp");
			rd.forward(req, resp);	
		}
		else if(command.equals("/insert.so")) {
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/subjectinsert.jsp");
			rd.forward(req, resp);	
		}
		else if(command.equals("/insert3.so")) {
			requestInsert(req,resp);			
		}
		
		else if(command.equals("/update.so")) {
			selectOne(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/subjectUpdate.jsp");
			rd.forward(req, resp);	
		}
		else if(command.equals("/update2.so")) {
			requestUpdate(req, resp);
		}
		else if(command.equals("/delete.so")) {
			delete(req,resp);
		}
		else if(command.equals("/search.so")) {
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/search.jsp");
			rd.forward(req, resp);	
		}
	 }
	
	
	public void requestInsert(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
		
		String name = req.getParameter("s_name");
		String code = req.getParameter("s_code");
		String start = req.getParameter("s_start");
		String end = req.getParameter("s_end");
		String manage = req.getParameter("s_manage");
		String professor = req.getParameter("s_professor");
		
		SubjectDAO subjectDao = SubjectDAO.getInstance();
		SubjectDTO dto = new SubjectDTO();
		
		dto.setS_id(subjectDao.nextval()+1);
		dto.setS_name(name);
		dto.setS_code(code);
		dto.setS_start(start);
		dto.setS_end(end);
		dto.setS_manage(manage);
		dto.setS_professor(professor);
		
		int sResult = subjectDao.insert(dto);
		System.out.println(sResult);	
		resp.sendRedirect("home.do");
	
	}
	
	public void selectOne(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		int id = Integer.parseInt(req.getParameter("s_id"));
		SubjectDAO sDao = SubjectDAO.getInstance();
		SubjectDTO sDto = new SubjectDTO();
		
		sDto = sDao.selectOne(id);
		
		req.setAttribute("suSelectOne", sDto);
		req.setAttribute("id", sDto.getS_id());
		
	}
	
	public void requestUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		int id = Integer.parseInt(req.getParameter("s_id"));
		String name = req.getParameter("s_name");
		String code = req.getParameter("s_code");
		String start = req.getParameter("s_start");
		String end = req.getParameter("s_end");
		String manage = req.getParameter("s_manage");
		String pro = req.getParameter("s_professor");
		
		SubjectDAO sDao = SubjectDAO.getInstance();
		SubjectDTO sDto = new SubjectDTO();
		
		sDto.setS_id(id);
		sDto.setS_name(name);
		sDto.setS_code(code);
		sDto.setS_start(start);
		sDto.setS_end(end);
		sDto.setS_manage(manage);
		sDto.setS_professor(pro);
		
		int sResult = sDao.update(sDto);
		System.out.print(sResult);
		resp.sendRedirect("home.do");
	}
	
	public void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		int id = Integer.parseInt(req.getParameter("s_id"));
		SubjectDAO sDao = SubjectDAO.getInstance();
		sDao.delete(id);
		resp.sendRedirect("home.do");
	}
}
