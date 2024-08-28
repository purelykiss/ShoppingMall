package kr.ac.kopo.framework;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet{
	private HandlerMapping mappings;
	
	@Override
	public void init(ServletConfig config) throws ServletException{
		String propLoc = config.getInitParameter("propLoc");
		
		mappings = new HandlerMapping(propLoc);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		System.out.println("request.getRequestURI(): " + uri );
		System.out.println("request.getContextPath(): " + request.getContextPath());
		uri = uri.substring(request.getContextPath().length());
		
		System.out.println("요청 URI : " + uri);
		
		try {
			Controller control = mappings.getController(uri);
			String callPage = control.handleRequest(request, response);
			
			//만약 callPage가 null이면 잘못된 url이라 표시하면 좋겠다
//			if(callPage.startsWith("basketList.do")) {
//				response.sendRedirect(callPage);
//				return;
//			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
				dispatcher.forward(request, response);				
//			}
			
		}catch(Exception e) {
			throw new ServletException(e);
		}
	}
	
}
