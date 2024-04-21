package com.bank.peopleshorizon.webservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

import com.bank.peopleshorizon.enums.Role;


@WebFilter("/*")
public class Filtter implements Filter 
{
	private static final List<String> ADMIN_OPERATIONS = List.of
	(
	    "/api/viewProfile", "/api/getAllTransactions", "/api/addBranch", "/api/getAllBranch",
	    "/api/addCustomer", "/api/createAccount", "/api/addEmployee", "/api/changePassword",
	    "/api/updateAccount", "/api/updateUser", "/api/changePassword", "/api/getAllEmployees",
	    "/api/deleteAccount", "/api/getAllAccounts", "/api/logout", "/api/updateCustomer", 
	    "/api/getUsers", "/api/getUser", "/api/deleteCustomer", "/api/deleteAccount",  "/api/finance",
	    "/api/createDetails", "/api/updateBranch", "/api/deleteBranch"
	);

	private static final List<String> EMPLOYEE_OPERATIONS = List.of
	(
		"/api/viewProfile", "/api/getAllTransactions", "/api/addCustomer",
		"/api/createAccount", "/api/updateAccount", "/api/updateUser", "/api/finance",
	    "/api/changePassword", "/api/deleteAccount", "/api/getAllAccounts",
	    "/api/getUsers", "/api/logout", "/api/updateCustomer", "/api/getUser",
	    "/api/deleteCustomer", "/api/deleteAccount", "/api/changePassword"
	);

	private static final List<String> CUSTOMER_OPERATIONS = List.of
	(
	    "/api/WithdrawlAmount", "/api/DepositAmount", "/api/TransferAmount", "/api/changePassword",
	    "/api/checkBalance", "/api/getStatement", "/api/getMyAccounts", "/api/finance",
	    "/api/switchAccount", "/api/logout", "/api/transactionHistory", "/api/viewProfile"
	);

    public boolean isOperationAllowed(String operation, Role userRole) 
    {
        if (userRole == Role.ADMIN)
        {
        	return ADMIN_OPERATIONS.contains(operation);
        }
		if (userRole == Role.CUSTOMER)
		{
			return CUSTOMER_OPERATIONS.contains(operation);
		}
		if (userRole == Role.EMPLOYEE)
		{
			return EMPLOYEE_OPERATIONS.contains(operation);
		}
		return false;
    }

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
	    HttpServletRequest httpRequest = (HttpServletRequest) request;
	    HttpSession session = httpRequest.getSession(false); 
	    String uri = httpRequest.getRequestURI();
	    String contextPath = httpRequest.getContextPath();
	    String operation = uri.substring(contextPath.length());
	    System.out.println(operation);
	    System.out.println(httpRequest.getMethod() + uri + " On Filter");

	    boolean loginRequest = uri.endsWith("/Home") || uri.endsWith("/Login.jsp") || uri.endsWith("/login");
        HttpServletResponse httpResponse = (HttpServletResponse) response;
	    
	    if (loginRequest) 
	    {
	        chain.doFilter(httpRequest, response);
	        return;
	    }

	    if (session != null && session.getAttribute("userId") != null) 
	    {
	    	if (operation.startsWith("/api/"))
	    	{
	    	    Role role = (Role) session.getAttribute("role");
	    		if(isOperationAllowed(operation, role))
		    	{
	    			System.out.println(role);
		    		chain.doFilter(request, response);
		    	}
	    	}
	    	else
	    	{
	    		chain.doFilter(request, response);
	    	}
	    }
	    else 
	    {
	        httpResponse.sendRedirect(httpRequest.getContextPath() + "/Login.jsp");
	    }
	}

	public void init(FilterConfig fConfig) throws ServletException 
	{
		// TODO Auto-generated method stub
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
