

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;

import emp.DbHandler;



/**
 * Servlet implementation class Auth
 */
@WebServlet("/Auth")
public class Auth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Auth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
    {
    	String path=getServletContext().getRealPath("//images//");
    	System.out.println("path   "+ path);
    	MultipartRequest mrq=new MultipartRequest(req, path, 1024*1024*1024);
    	String name=mrq.getOriginalFileName("file");
    	System.out.println(name);
    	DbHandler obj=new DbHandler();
    	String unm= (String) req.getParameter("name");
    	System.out.println(unm);
    	
    	boolean res1=obj.updateCv(unm, name);
    	if(res1) {
    		res.sendRedirect(req.getContextPath()+"/student.jsp");
    	}
    		
     }
    
   // static String SAVE_DIR="images";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		 
		PrintWriter out=response.getWriter();
//		String img1=request.getParameter("file");
//		out.println(img1);
//		String img2=request.getParameter("img2");
//		out.println(img2);
//		
//
//		String cat=request.getParameter("opt");
//		out.println(cat);
//		String model=request.getParameter("model");
//		out.println(model);
//		String desc=request.getParameter("desc");
//		out.println(desc);
//		String price=request.getParameter("price");
//		out.println(price);

//		  String strContextPath=request.getParameter("hdn");
//		  out.print(strContextPath);
//		  System.out.println("11-------------------"+strContextPath);
//		  response.setContentType("text/html;charset=UTF-8");
//		   String savePath = getServletContext().getRealPath("/")+File.separator + SAVE_DIR;
//		
//		   System.out.println("33--------------------------- "+ savePath);
//	        
//	        
//		     
//	        System.out.println("44------------------------- "+strContextPath);
//	     
//		   
//		    File fileSaveDir=new File(savePath);
//            if(!fileSaveDir.exists()){
//                fileSaveDir.mkdir();
//            }
//      
//        Part part=request.getPart("file");
//        String fileName=extractFileName(part);
//        System.out.println(fileName);
//        part.write(savePath + File.separator + fileName);
//        String filePath= savePath + File.separator + fileName ;
//        System.out.println(filePath);
//        
//        Part part=request.getPart("file");
//        String filename=extractFileName(part);
//        String savepath="D:\\ad java\\olx\\WebContent\\images\\" +File.separator +filename    ;
//        File savedir=new File(savepath);
//        part.write(savepath + File.separator);
////        
//        
		
//		out.print("<html><body>");
//		String oo=("
//		<div id='login-box'>
//	      <div class='left-box'>
//	        <h1> Sign Up</h1>
//	        <form action='Main.jsp' method='post' class='was-validate'>
//	          <input type='text' name='username' placeholder='Username'/>
//	          <input type='text' name='email' placeholder='Email'/>
//	          <input type='password' name='password' placeholder='Password'/>
//	          <input type='password' name='password2' placeholder='Retype password'/>
//			   <input type='submit' name='signup-button' value='Sign Up'/>
//	        </form> 
//	        
//	       
//	        </div>
//	        <div class='right-box'>
//	        <form action='phone.jsp'>
//	          <span class='signinwith'>Sign in with<br/>Social Network     </span>
//	        
//	        <button class='social facebook' name='btn'>Log in with Facebook</button>    
//	       
//	        <button class='social google' name='btn'>Log in with Mobile no.</button> 
//	          </form>  
//	        
//	        </div>
//	        <div class='or'>OR</div>
//	    </div>
//	    
//		");
//		
		
		
			}
	
	

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
