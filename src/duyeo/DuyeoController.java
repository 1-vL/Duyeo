package duyeo;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/servlet/*") //공통 URL
public class DuyeoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		
		//문자열.indexOf("찾을 내용") : 찾을내용(특정문자열)이 앞에서부터 몇 번째 위치(index)에서 처음 발견되는지 위치값을 반환. 찾지 못 한 경우 -1 반환.		
		//servlet/login.do 요청이 들어오면
		if(uri.indexOf("login.do") != -1) {//로그인 요청이 들어왔다면
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String name=dao.loginCheckBcrypt(dto);//로그인 체크
			String message="";
			String referer = request.getHeader("Referer"); //출발한 페이지 주소. 로그인 시도 이전의 주소로 돌아간다.
			HttpSession session=request.getSession();//서블릿에서는 세션 객체를 써야함
			
			if(name==null) {//로그인 실패
				message="아이디 또는 비밀번호가 일치하지 않습니다.";
				message=URLEncoder.encode(message,"utf-8");
				session.setAttribute("message", message);
			} else {
				message=name+"님 환영합니다.";
				session.setAttribute("userid", userid);//세션에 저장
				session.setAttribute("name", name);//세션에 저장
				session.setAttribute("message", message);
			}
			response.sendRedirect(referer);
			 // 로그인 login.do 종료
		} else if(uri.indexOf("logout.do") != -1) {
			String referer = request.getHeader("Referer"); //출발한 페이지 주소. 로그인 시도 이전의 주소로 돌아간다.
			//1. 세션 변수에 저장된 값들을 제거하는 동작
			HttpSession session=request.getSession();
			session.invalidate();//세션 초기화
			//2. 페이지 이동
			response.sendRedirect(referer);
			//로그아웃 logout.do 종료
		} else if(uri.indexOf("join.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			MemberDAO dao = new MemberDAO();
			MemberDTO dto=new MemberDTO();//MemberDTO 생성
			dto.setUserid(userid);//dto의 setter를 통한 자료저장
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dao.insertBcrypt(dto);
		} else if(uri.indexOf("gatheringList.do") != -1) {//모집 게시글 리스트 읽기			
			GatherArticleDAO dao = new GatherArticleDAO();			
			Map<String, Object> map = new HashMap<>();
			List<GatherArticleDTO> list=dao.gatherboardList();//게시글 목록
			map.put("list", list);//맵에 자료 저장
			map.put("count", list.size());//작성글 수
			request.setAttribute("map", map);
			String referer = request.getHeader("Referer"); //출발한 페이지 주소. 게시글 불러오기 이전의 주소로 돌아간다.
			RequestDispatcher rd = request.getRequestDispatcher(referer);
			rd.forward(request, response);//포워딩
		} else if(uri.indexOf("list.do") != -1) {
			Map<String, Object> map = new HashMap<>();
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> list=dao.memberList();//리스트 리턴
			map.put("list", list);//맵에 자료 저장
			map.put("count", list.size());//회원수
			request.setAttribute("map", map);
			String page="/PC_DB_20211220/member_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);//포워딩
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}