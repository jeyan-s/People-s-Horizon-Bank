package com.bank.peopleshorizon.webservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.bank.peopleshorizon.entities.Address;
import com.bank.peopleshorizon.entities.Branch;
import com.bank.peopleshorizon.entities.PhoneNumber;
import com.bank.peopleshorizon.exceptions.InvalidDataException;
import com.bank.peopleshorizon.features.Features;
import com.bank.peopleshorizon.requesthandlers.Handler;


//@WebServlet("/*")
public class UserServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    private String login = "/login";
    private String home = "/Home";
    
    //Get
    private String viewProfile = "/viewProfile";
    private String transactionHistory = "/transactionHistory";
    private String getAllTansactions = "/getAllTransactions";
    private String getAllEmployees = "/getAllEmployees";
    private String getAllBranch = "/getAllBranch";
    private String updateBranch = "/updateBranch";
    
    //Post
    private String withdrawlAmount = "/WithdrawlAmount";
    private String depositAmount = "/DepositAmount";
    private String createDetails = "/createDetails";
    
    private String addBranch = "/addBranch";
    private String addCustomer = "/addCustomer";
    private String addAccount = "/createAccount";
    private String addEmployee = "/addEmployee";
    private String updateCustomer = "/updateCustomer";
    private String deleteCustomer = "/deleteCustomer";
    private String deleteAccount = "/deleteAccount";
    private String updateAccount = "/updateAccount";
    
    private String updateEmployee = "/updateEmployee";
    private String changePassword = "/changePassword";
    private String transferFund = "/TransferAmount";
    private String checkBalance = "/checkBalance";
    private String getAllAccounts = "/getAllAccounts";
    private String getAccounts = "/getMyAccounts";
    private String switchAccount = "/switchAccount";
    private String logout = "/logout";
    private String getStatement = "/getStatement";
    private String getUsers = "/getUsers";
    private String finance = "/finance";
    
    
    private boolean check(String uri, String action)
    {
    	return uri.endsWith(action);
    }
    
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
    	String uri = request.getRequestURI();
    	System.out.println(uri + " On Servlet GET");
    	
    	if (check(uri, checkBalance))
    	{
			try 
			{
				Handler.getBalance(request, response);
			} 
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}
    	
    	

    	
    	else if (check(uri, viewProfile))
    	{
			try 
			{
				Handler.getAccounts(request, response);
				Handler.viewProfile(request, response);
				request.getRequestDispatcher("/Profile.jsp").forward(request, response);
			} 
    		catch (ServletException | IOException | InvalidDataException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}
    	
    	else if (check(uri, transactionHistory)) 
    	{
			try 
			{
				Handler.getAccounts(request, response);
				Handler.viewTransactions(request, response);
				request.getRequestDispatcher("/View_Transactions.jsp").forward(request, response);
			} 
    		catch (ServletException | IOException | InvalidDataException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}
    	
    	else if (check(uri, getAllTansactions))
    	{
			try 
			{
				Handler.getAllTransactions(request, response);
				System.out.println(request.getAttribute("page"));
				request.getRequestDispatcher("/View_Transactions.jsp").forward(request, response);
			} 
    		catch (ServletException | IOException | InvalidDataException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}
    	
    	else if (check(uri, getAccounts))
    	{
    		try 
			{	
				Handler.getMyAccounts(request, response);
				request.getRequestDispatcher("/Test.jsp").forward(request, response);
			} 
    		catch (ServletException | IOException | InvalidDataException | SQLException e)
    		{
    			System.out.println("Accounts");
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}
    	
    	else
    	{
    		HttpSession session = request.getSession(false);
    		response.getWriter().write("Hello World " + session.getAttribute("userId"));
    	}
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
    	String uri = request.getRequestURI();
    	System.out.println(uri + " on Servlet");
		response.setContentType("application/json");
    	
    	if (check(uri, login))
    	{
			JSONObject json = new JSONObject();
			
			try 
			{
				boolean rslt = Handler.login(request, response);
				if (rslt)
				{
//					request.getRequestDispatcher("/Peoples_Horizon/api/Home").forward(request, response);
				}
				else
				{
					response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
					json.put("error", "Authentication Failed !");
					response.getWriter().print(json);
				}
			}
			
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			}
			
			catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	if (check(uri, home))
    	{
			JSONObject json = new JSONObject();
			try 
			{
				Handler.getInfo(request, response);
				request.getRequestDispatcher("/PeoplesHorizon.jsp").forward(request, response);
			}
			
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			}
			
			catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, getAllEmployees))
    	{
			JSONObject json = new JSONObject();
    		try 
			{
    			System.out.println("Catched ");
				Handler.getAllEmployees(request, response);
				request.getRequestDispatcher("/Filter.jsp?type=Employees").forward(request, response);
			}
			
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			}
			
			catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, addBranch))
    	{
			JSONObject json = new JSONObject();
    		try
    		{
    			Handler.addBranch(request, response);
			}
			
    		catch (ServletException | IOException | SQLException | IllegalArgumentException | IllegalAccessException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			}
			
			catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, addCustomer))
    	{
			JSONObject json = new JSONObject();
    		try 
    		{
				Handler.addCustomer(request, response);
			}
			
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			}
			
			catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, addAccount))
    	{
			JSONObject json = new JSONObject();
    		try 
    		{
				Handler.addAccount(request, response);
			}
			
    		catch (ServletException | IOException | SQLException | IllegalAccessException | NoSuchFieldException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			}
			
			catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, addEmployee))
    	{
			JSONObject json = new JSONObject();
    		try
    		{
				Handler.addEmployee(request, response);
			} 
    		catch (ServletException | IOException | InvalidDataException | SQLException e) 
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}
    	
    	else if (check(uri, updateCustomer))
    	{
    		JSONObject json = new JSONObject();
    		try
    		{
				Handler.updateCustomer(request, response);
    		} 
    		
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			} 
    		
    		catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, deleteCustomer))
    	{
    		try
    		{
				Handler.deleteCustomer(request, response);
				Handler.getInfo(request, response);
				request.getRequestDispatcher("/PeoplesHorizon.jsp");
			} 
    		catch (ServletException | InvalidDataException | SQLException e) 
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
		        response.getWriter().write(e.getMessage());
			}
    	}
    	
    	else if (check(uri, logout))
    	{
    		try
    		{
				Handler.logout(request, response);
			} 
    		catch (ServletException | IOException | SQLException e) 
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
		        response.getWriter().write(e.getMessage());
			}
    	}
    	
    	else if (check(uri, transferFund))
    	{
    		System.out.println("In Transfer Fund");
    		JSONObject json = new JSONObject();
    		try 
    		{
				Handler.transferFund(request, response);
    		} 
    		
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			} 
    		
    		catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, withdrawlAmount))
    	{
			JSONObject json = new JSONObject();
    		try 
    		{
				Handler.withdrawlAmount(request, response);
				System.out.println("Success !");
    		} 
    		
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			}
    		
    		catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, depositAmount))
    	{
			JSONObject json = new JSONObject();
    		try 
    		{
				Handler.depositAmount(request, response);
				System.out.println("Success !");
    		} 
    		
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			} 
    		
    		catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, changePassword))
    	{
			JSONObject json = new JSONObject();
    		try 
    		{
				Handler.changePassword(request, response);
				System.out.println("Success !");
    		} 
    		
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			} 
    		
    		catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, switchAccount))
    	{
    		try 
    		{
				Handler.switchAccount(request, response);
				Handler.getInfo(request, response);
				String referer = request.getHeader("referer");
				
				System.out.println("Account Switched !" + referer);
				request.getRequestDispatcher("/PeoplesHorizon.jsp").forward(request, response);
			} 
    		catch (ServletException | IOException | InvalidDataException | SQLException e) 
    		{
				e.printStackTrace();
				System.out.println(e.getMessage());
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}
    	
    	else if (check(uri, deleteAccount))
    	{
    		try 
    		{
				Handler.deleteAccount(request, response);
				System.out.println("Account Deleted !");
				request.getRequestDispatcher("/api/getAllAccounts").forward(request, response);
			} 
    		catch (ServletException | IOException | InvalidDataException | SQLException e) 
    		{
				e.printStackTrace();
				System.out.println(e.getMessage());
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}

    	else if (check(uri, updateAccount))
    	{
			JSONObject json = new JSONObject();
    		try 
    		{
				Handler.updateAccount(request, response);
				System.out.println("Account Updated !");
				request.getRequestDispatcher("/Peoples_Horizon/api/Home").forward(request, response);
    		} 
    		
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			}
    		
    		catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, finance))
    	{
			JSONObject json = new JSONObject();
    		try 
    		{
				Handler.getAccounts(request, response);
				System.out.println("Done !");
    		} 
    		
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			}
    		
    		catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, getUsers))
    	{
			try 
			{
				Handler.getUsers(request, response);
				request.getRequestDispatcher("/Filter.jsp?type=Users").forward(request, response);
			} 
    		catch (ServletException | IOException | SQLException | InvalidDataException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}
    	
    	else if (check(uri, getAllAccounts))
    	{
    		try 
			{
				Handler.getAllAccounts(request, response);
				request.getRequestDispatcher("/Filter.jsp?type=Accounts").forward(request, response);
			} 
    		catch (ServletException | IOException | InvalidDataException | SQLException e)
    		{
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}
    	
    	else if (check(uri, getAllBranch))
    	{
    		try 
			{
    			System.out.println("Got Yeah !");
				Handler.getAllBranch(request, response);
				request.getRequestDispatcher("/Filter.jsp?type=Branch").forward(request, response);
			} 
    		catch (ServletException | IOException | InvalidDataException | SQLException e)
    		{
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}
    	

    	else if (check(uri, getStatement))
    	{
			JSONObject json = new JSONObject();
			try 
			{
				Handler.getAccounts(request, response);
				Handler.getStatement(request, response);
				request.getRequestDispatcher("/Statement.jsp").forward(request, response);
			} 
    		
    		catch (ServletException | IOException | SQLException | ParseException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			}
    		
    		catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	else if (check(uri, createDetails))
    	{
			try 
			{
				Handler.createDetails(request, response);
				String type = request.getParameter("type");
				request.getRequestDispatcher("/Create_Account.jsp?type=" + type).forward(request, response);
			} 
    		catch (ServletException | IOException | SQLException | InvalidDataException e)
    		{
    			System.out.println(e.getMessage());
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}
    	
    	else if (check(uri, updateBranch))
    	{
			JSONObject json = new JSONObject();
			try 
			{
				Handler.updateBranch(request, response);
				request.getRequestDispatcher("/Peoples_Horizon/api/getAllBranch").forward(request, response);
			} 
    		
    		catch (ServletException | IOException | SQLException e)
    		{
				e.printStackTrace();
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
				json.put("error", "Some Error Occured !");
				response.getWriter().print(json);
			}
    		
    		catch (InvalidDataException e) 
			{
				e.printStackTrace();
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				json.put("error", e.getMessage());
				response.getWriter().print(json);
			}
    	}
    	
    	
    }
    
    
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	String uri = request.getRequestURI();
	    System.out.println(request.getMethod() + uri + " On Servlet");
//    	else if (check(uri, updateProfile))
//    	{
//    		Handler.updateProfile(request);
//    	}
    	
//    	else if (check(uri, updateEmployee))
//    	{
//    		Handler.updateEmployee(request);
//    	}
    
//    	else if (check(uri, updatePassword))
//    	{
//    		Handler.updatePassword(request);
//    	}
    	
//    	else if (check(uri, updateAccount))
//    	{
//    		Handler.updateAccount(request);
//    	}

    	if (check(uri, transferFund))
    	{
    		try 
    		{
				Handler.transferFund(request, response);
				System.out.println("Success !");
			} 
    		catch (ServletException | IOException | InvalidDataException | SQLException e) 
    		{
				e.printStackTrace();
				System.out.println(e.getMessage());
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
			response.getWriter().write(e.getMessage());
			}
    	}
     	
//    	else if (check(uri, withdrawlAmount))
//    	{
//    		Handler.updateAccount(request);
//    	}
    	
//    	else if (check(uri, depositAmount))
//    	{
//    		Handler.depositAmount(request);
//    	}
    }
    
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
//    	else if (check(uri, deleteAccount))
//    	{
//    		Handler.deleteAccount(request);
//    	}
    }
    
    @Override
    public void destroy() 
    {
        ServletContext context = getServletContext();
        Enumeration<String> sessionNames = context.getAttributeNames();
        
        while (sessionNames.hasMoreElements()) 
        {
            String sessionName = sessionNames.nextElement();
            if (sessionName.startsWith("javax.servlet.http.HttpSession")) 
            {
                HttpSession session = (HttpSession) context.getAttribute(sessionName);
                session.invalidate();
            }
        }
        
        super.destroy();
    }
}
