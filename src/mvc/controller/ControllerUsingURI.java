package mvc.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class ControllerUsingURI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, CommandHandler> map = new HashMap<>();

	FileInputStream fis = null;

	@Override
	public void init() throws ServletException {
		super.init();
		try {
			String filePath = getInitParameter("configFile");
			String realPath = getServletContext().getRealPath(filePath);
			fis = new FileInputStream(realPath);

			Properties props = new Properties();
			props.load(fis);

			@SuppressWarnings("unchecked")
			Enumeration<String> keys = (Enumeration<String>) props.propertyNames();

			while (keys.hasMoreElements()) {
				String key = keys.nextElement();
				String className = props.getProperty(key);

				@SuppressWarnings("unchecked")
				Class<CommandHandler> clazz = (Class<CommandHandler>) Class.forName(className);

				CommandHandler comm = clazz.newInstance();

				map.put(key, comm);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 어떤 경로로 왔는지 파악
		// ex) /a.do, /b.do, /c.do
		String requestUri = request.getRequestURI();

		// localhost:8080/contextRoot/a/some.do
		String contextPath = request.getContextPath();
		int startIndex = requestUri.indexOf(contextPath);

		String command = requestUri.substring(startIndex + contextPath.length());

		CommandHandler com = map.get(command);
		String res;
		try {
			res = com.process(request, response);
			request.setAttribute("result", res);
			request.getRequestDispatcher(res).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
