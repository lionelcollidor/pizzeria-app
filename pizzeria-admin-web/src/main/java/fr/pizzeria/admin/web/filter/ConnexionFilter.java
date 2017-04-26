package fr.pizzeria.admin.web.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/*" })
public class ConnexionFilter implements Filter {
	
	private static final String VUE_LOGIN = "/WEB-INF/views/utilisateurs/connexionUtilisateur.jsp";
	
	private static final List<String> ALLOWED_PATHS = Arrays.asList("/login", "/", "/index.jsp", "/static/*", "/utilisateurs/password", "/utilisateur/nouveau");

	@Override
	public void init(FilterConfig config) throws ServletException {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		/* REGEX pour les url autorisées */
		StringBuilder sb = new StringBuilder();
		for (String p : ALLOWED_PATHS) {
			/* Echappe le point afin qu'il soit pris telle quelle dans la regex et non comme un caractère special */
			if(p.contains(".")){
				p = p.replaceAll("\\.", "\\\\.");
			}
			/* Remplace l'astérisque par n'importe quelle chaine de caractère. */
			if(p.contains("*")){
				p = p.replaceAll("\\*", ".*");
			}
			sb.append("^"+p+"$|");
		}
		/* Retire le dernier caractère special 'or' qui est inutile */
		Pattern pattern = Pattern.compile(sb.deleteCharAt(sb.length() - 1).toString());
		
		String path = req.getServletPath();
		Matcher m = pattern.matcher(path);
		boolean allowedPath = m.find();
		
		boolean loggedIn = session.getAttribute("utilisateur") != null;
		
		if (loggedIn || allowedPath) {
			chain.doFilter(request, response);
		} else {
			req.getRequestDispatcher(VUE_LOGIN).forward(request, response);
		}
	}

	public void destroy() {

	}

}