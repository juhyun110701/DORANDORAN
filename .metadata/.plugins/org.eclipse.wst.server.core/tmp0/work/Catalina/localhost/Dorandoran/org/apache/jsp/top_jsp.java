/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.22
 * Generated at: 2019-07-30 12:01:38 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class top_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<title>도란도란</title>\r\n");
      out.write("<!--\r\n");
      out.write("<link rel=\"shortcut icon\" href=\"img/logo.png\">\r\n");
      out.write("<link rel=\"apple-touch-icon\" href=\"img/logo_apple.png\">\r\n");
      out.write("-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/index.css\">\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Sunflower:300&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");
	
		String id=(String)session.getAttribute("id");
	
      out.write("\r\n");
      out.write("    <table id=\"whole\">\r\n");
      out.write("        <tr>\r\n");
      out.write("            <td width=\"45%\"></td>\r\n");
      out.write("            <td width=\"10%\"><a href=\"index.jsp\"><img src=\"img/logo.png\" width=\"80%\"></a></td>\r\n");
      out.write("            <td width=\"45%\" style=\"padding-left:20%;\">\r\n");
      out.write("            \t");

                	if(session.getAttribute("id")==null){
                
      out.write("\r\n");
      out.write("                \t\t<a href=\"login.jsp\" class=\"top_menu\" style=\"color:#f54e42;\">로그인</a>&nbsp;\r\n");
      out.write("                ");

                	}
                	else{
                
      out.write("\r\n");
      out.write("                \t\t<div id=\"whilelog\"><font style=\"color:#f54e42;\">");
      out.print(id );
      out.write("</font>님 로그인 중입니다</div><p>\r\n");
      out.write("                \t\t<a href=\"index.jsp\" class=\"top_menu\" style=\"color:#f54e42;\">로그아웃</a>&nbsp;\t\r\n");
      out.write("                ");

        				session.invalidate();
                		response.sendRedirect("index.jsp");
                	}
                
      out.write("\r\n");
      out.write("                <a href=\"signup.jsp\" class=\"top_menu\">회원가입</a><p>\r\n");
      out.write("                \r\n");
      out.write("            </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr class=\"menu\">\r\n");
      out.write("            <td colspan=3>\r\n");
      out.write("                <table width=\"100%\" height=\"50px\">\r\n");
      out.write("                    <tr>\r\n");
      out.write("                       <td width=\"30%\"></td>\r\n");
      out.write("                        <td class=\"menu_in\"><a href=\"index.html\">전체도서</a></td>\r\n");
      out.write("                        <td class=\"menu_in\"><a href=\"#\">신간도서</a></td>\r\n");
      out.write("                        <td class=\"menu_in\"><a href=\"#\">중고도서</a></td>\r\n");
      out.write("                        <td class=\"menu_in\"><a href=\"#\">마이페이지</a></td>\r\n");
      out.write("                        <td width=\"30%\"></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </table></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("    </table>\r\n");
      out.write("</body>\r\n");
      out.write("</html> \r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
