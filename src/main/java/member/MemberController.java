package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import company.*;
import consequence.ConsequenceDAO;
import consequence.ConsequenceDTO;



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
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/insert.jsp");
			rd.forward(req, resp);	
		}
		else if(command.equals("/insertAction.do")) {
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/insertAction.jsp");
			rd.forward(req, resp);	
		}
		else if(command.equals("/insert2.do")) {
			requestInsert1(req,resp);
			requestInsert2(req,resp);
			requestInsert3(req,resp);
		}
    }
    
	public void requestInsert1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
		String name = req.getParameter("m_name");
		String birth = req.getParameter("m_birth");
		String number = req.getParameter("m_number");
		String area = req.getParameter("m_area");
		int age1 = Integer.parseInt(req.getParameter("m_age1"));
		int age2 = age1 -1;
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
		dto.setM_age2(age2);
		dto.setM_option1(option1);
		dto.setM_option2(option2);
		dto.setM_option3(option3);
		dto.setM_note(notice);
		
		int mResult = memberDao.insert(dto);
		System.out.println(mResult);
			
	}
	
	public void requestInsert2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cStart = req.getParameter("c_start");
		String cMaintain = req.getParameter("c_maintain");
		String cEnd = req.getParameter("c_end");
		String cName = req.getParameter("c_name");
		String cAddress = req.getParameter("c_address");
		String cNumber= req.getParameter("c_number");
		String cManager = req.getParameter("c_manager");
		String cExcep = req.getParameter("c_excep");
		
		CompanyDAO companyDao = CompanyDAO.getInstance();
		CompanyDTO cDto = new CompanyDTO();
		
		cDto.setC_start(cStart);
		cDto.setC_maintain(cMaintain);
		cDto.setC_end(cEnd);
		cDto.setC_name(cName);
		cDto.setC_address(cAddress);
		cDto.setC_number(cNumber);
		cDto.setC_manager(cManager);
		cDto.setC_excep(cExcep);
		cDto.setM_id(companyDao.nextval());
		
		int cResult = companyDao.cInsert(cDto);
		System.out.println(cResult);
	}
	
	
	public void requestInsert3(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String coResult = req.getParameter("co_result");
		String coAttend = req.getParameter("co_attend");
		String coComple = req.getParameter("co_comple");
		String coEmploy = req.getParameter("co_employ");
		String coSame = req.getParameter("co_same");
		String coInsurance =req.getParameter("co_insurance");
		String coOption1 = req.getParameter("co_option1");
		String coOption2 = req.getParameter("co_option2");
		String coOption3 = req.getParameter("co_option3");
		String coOption4 = req.getParameter("co_option4");
		String coOption5 = req.getParameter("co_option5");
		String coOption6 = req.getParameter("co_option6");
		String coAsse = req.getParameter("co_asse");
		String coPorf = req.getParameter("co_porf");
		String coCer = req.getParameter("co_certificate");
		
		ConsequenceDAO coDao = ConsequenceDAO.getInstance();
		ConsequenceDTO coDto = new ConsequenceDTO();
		
		coDto.setCo_result(coResult);
		coDto.setCo_attend(coAttend);
		coDto.setCo_comple(coComple);
		coDto.setCo_employ(coEmploy);
		coDto.setCo_same(coSame);
		coDto.setCo_insurance(coInsurance);
		coDto.setCo_option1(coOption1);
		coDto.setCo_option2(coOption2);
		coDto.setCo_option3(coOption3);
		coDto.setCo_option4(coOption4);
		coDto.setCo_option5(coOption5);
		coDto.setCo_option6(coOption6);
		coDto.setCo_asse(coAsse);
		coDto.setCo_porf(coPorf);
		coDto.setCo_certificate(coCer);
		coDto.setM_id(coDao.nextval());
		
		
		int conResult = coDao.coInsert(coDto);
		System.out.println(conResult);
		
	}


}
