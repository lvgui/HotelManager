package com.zuiuxi.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.zuiuxi.entity.Home;
import com.zuiuxi.service.HomeService;

public class SelectHomeServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SelectHomeServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		List<Home> list = null;
		String statuss = request.getParameter("status");
		String type = request.getParameter("type");
		//System.out.println(statuss + "+++++++++++" + type);
		if(statuss.equals("all") && type.equals("all")){
			list = new HomeService().selectAllHome();
		}else if(!statuss.equals("all") && type.equals("all")){
			int status = Integer.parseInt(statuss);
			list = new HomeService().selectHomeByStatus(status);
		}else if(statuss.equals("all") && !type.equals("all")){
			list = new HomeService().selectHomeByTypes(type);
		}else{
			int status = Integer.parseInt(statuss);
			list = new HomeService().selectHomeByTypesAndStatus(type, status);
		}
		Gson gson = new Gson();
		String gout = gson.toJson(list);
		out.print(gout);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
