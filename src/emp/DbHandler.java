package emp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.pool.OracleDataSource;


public class DbHandler {

	
	OracleDataSource ods=null;
	Connection con=null;
	PreparedStatement stmt=null;
	ResultSet rset=null;
	
	public java.sql.Connection getConnection()
	{
		try {
			ods=new OracleDataSource();
			ods.setURL("jdbc:oracle:thin:@localhost:1521:xe");
			con=ods.getConnection("ei","icsd");
			System.out.println("conn est...");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
		return con;
	}
	
	public boolean setProject(String pid,String unm) {
		con=getConnection();
		try {
			stmt=con.prepareStatement("insert into takenproject values(?,?)");
			stmt.setString(1, pid);
			stmt.setString(2, unm);
			rset=stmt.executeQuery();
			stmt=con.prepareStatement("update projects set taken=? where pid=?");
			stmt.setString(1, unm);
			stmt.setString(2, pid);
			rset=stmt.executeQuery();
			con.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public String getNoOfJobsApplied(String mail)
	{
		con=getConnection();
		int count=0;
		try {
			stmt=con.prepareStatement("select * from jobsapplied where unm=?");
			stmt.setString(1, mail);
			rset=stmt.executeQuery();
			
			while(rset.next()) {
				count++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return String.valueOf(count);
	}
	
	public boolean setJobs(String pid,String unm) {
		con=getConnection();
		try {
			stmt=con.prepareStatement("insert into jobsapplied values(?,?)");
			stmt.setString(1, pid);
			stmt.setString(2, unm);
			rset=stmt.executeQuery();
			con.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
		public boolean removeProject(String pid) {
			con=getConnection();
			try {
				stmt=con.prepareStatement("update projects set taken=? , progress=? where pid=?");
				stmt.setString(1, "null");
				stmt.setString(2, "0");
				stmt.setString(3, pid);
				rset=stmt.executeQuery();
				stmt=con.prepareStatement("delete from takenproject where pid=?");
				stmt.setString(1, pid);
				rset=stmt.executeQuery();
				con.close();
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		
		return false;
	}
	
		public boolean removeAppliedJobs(String pid,String unm) {
			con=getConnection();
			try {
				stmt=con.prepareStatement("delete from jobsapplied where unm=? and jobid=?");
				stmt.setString(1, unm);
				stmt.setString(2, pid);
				rset=stmt.executeQuery();
			
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		
		public boolean updateProject(String pid,String prog) {
			con=getConnection();
			try {
				stmt=con.prepareStatement("update projects set progress=? where pid=?");
				stmt.setString(1, prog);
				stmt.setString(2, pid);
				rset=stmt.executeQuery();
				con.close();
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		
		return false;
	}

		public boolean InsertIntoUsers(String fname,String lname,String email,String pwd,String phone,String gender,String type)
	{
		con=getConnection();
	
		try {
			stmt=con.prepareStatement("insert into employee values (?,?,?,?,?,?,?,?)");
			
			stmt.setString(1, fname);
			stmt.setString(2, lname);
			stmt.setString(3, email);
			stmt.setString(4, pwd);
			stmt.setString(5, phone);
			stmt.setString(6, gender);
			stmt.setString(7, type);
			stmt.setString(8, "default.png");
		
			rset=stmt.executeQuery();
		 boolean res=insertIntodata(email,"0","0","0","0");
			
		 if(res==true) {
		     return true;}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public String Sno()
	{
		con=getConnection();
		String sno=null;
		try {
			stmt=con.prepareStatement("select MAX(sno) from employee;");
		
			rset=stmt.executeQuery();
			sno=rset.getString("sno");
			if(sno.contains(null))
			{
				sno="1";
			}
			else
			{
				sno=String.valueOf(Integer.parseInt(sno+1));
			}
		return sno;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sno;
	}
	
	public boolean checkUser(String pwd,String email, String type)
	{
		con=getConnection();
		try {
			stmt=con.prepareStatement("select * from employee where email=? and pwd=? and typ=?");
			stmt.setString(1, email);
			stmt.setString(2, pwd);
			stmt.setString(3, type);
			rset=stmt.executeQuery();
			if(rset.next())
			{
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public ResultSet getProjectByHiere(String unm) {
		con=getConnection();
		try {
			stmt=con.prepareStatement("select * from projects where unm=?");
			stmt.setString(1,unm);
			rset=stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rset;
		
	}
	public ResultSet getJobByHiere(String unm) {
		con=getConnection();
		try {
			stmt=con.prepareStatement("select * from jobs where unm=?");
			stmt.setString(1,unm);
			rset=stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rset;
		
	}
	
	
	public boolean insertIntodata(String email,String earn,String profile,String score,String jobs)
	{
		con=getConnection();
		
		try {
			stmt=con.prepareStatement("insert into dataemployee values (?,?,?,?,?,?)");
			
			stmt.setString(1, email);
			stmt.setString(2, earn);
			stmt.setString(3, profile);
			stmt.setString(4, score);
			stmt.setString(5, jobs);
			stmt.setString(6, "123");

		
			rset=stmt.executeQuery();
			
			stmt=con.prepareStatement("insert into cprofile values(?,?,?,?,?,?,?,?,?,?)");
			stmt.setString(1, email);
			stmt.setString(2, "0");
			stmt.setString(3, "0");
			stmt.setString(4, "0");
			stmt.setString(5, "0");
			stmt.setString(6, "0");
			stmt.setString(7, "0");
			stmt.setString(8, "0");
			stmt.setString(9, "0");
			stmt.setString(10,"0");
			rset=stmt.executeQuery();
			
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;	
	}
	
	public ResultSet getDetailBySession(String unm)
	{
		con=getConnection();
		try {
			stmt=con.prepareStatement("select * from dataemployee where email=?");
			stmt.setString(1, unm);
			rset=stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return rset;
	}
	
	public ResultSet getProjects() {
		con=getConnection();
		try {
			stmt=con.prepareStatement("select * from projects");
			rset=stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rset;
	}
	
	public ResultSet getProjectDetails(String pid){
		con=getConnection();
		try {
			stmt=con.prepareStatement("select * from projects where pid=?");
			stmt.setString(1, pid);
			rset=stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rset;
	}
	public ResultSet getJobDetails(String pid){
		con=getConnection();
		try {
			stmt=con.prepareStatement("select * from jobs where jobid=?");
			stmt.setString(1, pid);
			rset=stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rset;
	}
	
	
	public ResultSet getDetailEmployee(String unm)
	{
		con=getConnection();
		try {
			stmt=con.prepareStatement("select * from employee where email=?");
			stmt.setString(1, unm);
			rset=stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return rset;
	}
	
  public ResultSet getProjects(String name)
  {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select * from projects where taken=?");
		stmt.setString(1, name);
		rset=stmt.executeQuery();
		return rset;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  return null;
  }
  
  public boolean updateCProfile(String unm,String qual,String course,String coll,String spec,String year,String location,String skills,String optradio) {
	  
	 
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("update cprofile set qual=?,course=?,spec=?,college=?,ctype=?,pyear=?,skills=?,jobloc=? where mail=?");
		stmt.setString(1, qual);
		stmt.setString(2, course);
		stmt.setString(3, spec);
		stmt.setString(4, coll);
		stmt.setString(5, optradio);
		stmt.setString(6, year);
		stmt.setString(7, skills);
		stmt.setString(8, location);
		stmt.setString(9, unm);
		rset=stmt.executeQuery();
		con.close();
		return true;
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return false;
  }
  
  public boolean updateCv(String unm,String cv)
  {    
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("update cprofile set cv=? where mail=?");
		stmt.setString(1, cv);
		stmt.setString(2, unm);
		rset=stmt.executeQuery();
		
		stmt=con.prepareStatement("update dataemployee set prof=? where email=?");
		stmt.setString(1, "100");
		stmt.setString(2, unm);
		rset=stmt.executeQuery();
		
		return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  return false;
  }
  
  public boolean postJob(String jobid,String name,String pos,String office,String sal,String desc,String more,String unm) {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("insert into jobs values(?,?,?,?,?,?,?,?)");
		stmt.setString(1, jobid);
		stmt.setString(2, name);
		stmt.setString(3, pos);
		stmt.setString(4, office);
		stmt.setString(5, sal);
		stmt.setString(6, desc);
		stmt.setString(7, more);
		stmt.setString(8, unm);
		rset=stmt.executeQuery();
		return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  
	  return false;
  }
  
  
  public String getProjectId() {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select MAX(pid) as id from projects");
		rset=stmt.executeQuery();
		if(rset.equals(""))
		{
			return "1";
		}
		if(rset.next()) {
			String id=rset.getString("id");
			return String.valueOf(Integer.parseInt(id)+1);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return "1";
  }
  
  public boolean postProject(String pid,String name,String pname,String desc,String more,String x,String unm) {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("insert into projects values(?,?,?,?,?,?,?,?)");
		stmt.setString(1, pid);
		stmt.setString(2, name);
		stmt.setString(3, pname);
		stmt.setString(4, desc);
		stmt.setString(5, more);
		stmt.setString(6, x);
		stmt.setString(7, unm);
		stmt.setString(8, "null");
		rset=stmt.executeQuery();
		con.close();
		return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  
	  return false;
  }
  
  public boolean getAppliedJobs(String jobid,String unm) {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select * from jobsapplied where jobid=? and unm=?");
		stmt.setString(1, jobid);
		stmt.setString(2, unm);
		rset=stmt.executeQuery();
		if(rset.next()) {
			con.close();
			return true;
			}
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return false;
  }
  
  public ResultSet getEmployee() {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select * from employee where typ=?");
		stmt.setString(1, "employee");
		rset=stmt.executeQuery();
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return rset;
  }
  
  public ResultSet getProfile(String email)
  {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select * from cprofile where mail=?");
		stmt.setString(1, email);
		rset=stmt.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  return rset;
  }
  
  public String getScore(String email)
  {
	  con=getConnection();
	  String sc="";
	  try {
		stmt=con.prepareStatement("select score from dataemployee where email=?");
		stmt.setString(1, email);
		rset=stmt.executeQuery();
		
		if(rset.next()) {
		 sc=rset.getString("score");}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  return sc;
  }
  
  
  public String getJobId() {
	  con=getConnection();
	  String id="";
	  try {
		stmt=con.prepareStatement("select MAX(jobid) as id from jobs");
		rset=stmt.executeQuery();
		if(rset.next())
		{
			id=rset.getString("id");
			if(id==null)
			{
				id="1";
			}
        	else 
	     	{
	    	
		    	id= String.valueOf(Integer.parseInt(id)+1);
	     	}
		}
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return id;
  }
  
  public ResultSet getJobs() {
	  
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select * from jobs");
		rset=stmt.executeQuery();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  return rset;
  }
  
  public boolean createTest(String unm,String name,String tname,String marks,String time,String sdate,String edate,String stime,String etime,String ins1,String ins2,String ins3,String ins4,String ins5,String ins6,String ins7)
  {
	  con=getConnection();
	  String id="";
	  try {
		stmt=con.prepareStatement("select max(tid) as id from tests");
		rset=stmt.executeQuery();
		if(rset.next())
		{
			id=rset.getString("id");
			if(id==null)
			{
				id="1";
			}
        	else 
	     	{
	    	
		    	id= String.valueOf(Integer.parseInt(id)+1);
	     	}
		}
		
		stmt=con.prepareStatement("insert into tests values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		stmt.setString(1, id);
		stmt.setString(2, unm);
		stmt.setString(3, name);
		stmt.setString(4, tname);
		stmt.setString(5, marks);
		stmt.setString(6, time);
		stmt.setString(7, sdate);
		stmt.setString(8, edate);
		stmt.setString(9, stime);
		stmt.setString(10, etime);
		stmt.setString(11, ins1);
		stmt.setString(12, ins2);
		stmt.setString(13, ins3);
		stmt.setString(14, ins4);
		stmt.setString(15, ins5);
		stmt.setString(16, ins6);
		stmt.setString(17, ins7);
		rset=stmt.executeQuery();
		
		return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return false;
  }  
  
  public String getTestid() {
	  con=getConnection();
	  String id="1";
	  try {
		stmt=con.prepareStatement("select max(tid) as id from tests");
		rset=stmt.executeQuery();
		if(rset.next())
		{
			id=rset.getString("id");
			if(id==null)
			{
				id="1";
			}
        	else 
	     	{
	    	
		    	id= String.valueOf(Integer.parseInt(id)+1);
	     	}
		}
	  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		return id;
  }
  
  public ResultSet getTests(String unm)
  {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select * from tests where unm=?");
		stmt.setString(1, unm);
		rset=stmt.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return rset;
  }
  
  public ResultSet getSetQuestions(String tid,String set)
  {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select * from questions where tid=? and set1=?");
		stmt.setString(1, tid);
		stmt.setString(2, set);
		rset=stmt.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return rset;
  }
  
  public boolean insertQuestion(String tid,String question,String o1,String o2,String o3,String o4,String ans,String set)
  {
	  con=getConnection();
	  String id=getQuesId();
	  try {
		stmt=con.prepareStatement("insert into questions values(?,?,?,?,?,?,?,?,?)");
		stmt.setString(1, id);
		stmt.setString(2, tid);
		stmt.setString(3, set);
		stmt.setString(4, question);
		stmt.setString(5, o1);
		stmt.setString(6, o2);
		stmt.setString(7, o3);
		stmt.setString(8, o4);
		stmt.setString(9, ans);
		rset=stmt.executeQuery();
		return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return false;
  }
  

  public String getQuesId() {
	  con=getConnection();
	  String id="1";
	  try {
		stmt=con.prepareStatement("select max(qid) as id from questions");
		rset=stmt.executeQuery();
		if(rset.next())
		{
			id=rset.getString("id");
			if(id==null)
			{
				id="1";
			}
        	else 
	     	{
	    	
		    	id= String.valueOf(Integer.parseInt(id)+1);
	     	}
		}
	  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		return id;
  }
  
  public ResultSet getQuesDetail(String qid) {
	  
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select * from questions where qid=?");
		stmt.setString(1, qid);
		rset=stmt.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return rset;
  }
  
  public boolean updateQuestion(String qid,String tid,String question,String o1,String o2,String o3,String o4,String ans,String set)
  {
	  con=getConnection();
	  
	  try {
		stmt=con.prepareStatement("update questions set tid=? , set1=? , ques=? , o1=? , o2=? , o3=? , o4=? , ans=? where qid=?");
		stmt.setString(1, tid);
		stmt.setString(2, set);
		stmt.setString(3, question);
		stmt.setString(4, o1);
		stmt.setString(5, o2);
		stmt.setString(6, o3);
		stmt.setString(7, o4);
		stmt.setString(8, ans);
		stmt.setString(9, qid);
		rset=stmt.executeQuery();
		return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return false;
  }
  
public boolean deleteQues (String qid) {
	con=getConnection();
	try {
		stmt=con.prepareStatement("delete from questions where qid=?");
		stmt.setString(1, qid);
		rset=stmt.executeQuery();
		return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return false;
}
  
  public ResultSet getTestDetail(String tid)
  {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select * from tests where tid=?");
		stmt.setString(1, tid);
		rset=stmt.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  return rset;
  }

  public boolean updateTest(String tid ,String name,String tname,String marks,String time,String sdate,String edate,String stime,String etime,String ins1,String ins2,String ins3,String ins4,String ins5,String ins6,String ins7)
  {
	  con=getConnection();
	  
	  try {
		
		stmt=con.prepareStatement("update tests set cname=? ,tname=? ,marks=? ,time1=? ,sdate=?, edate=? ,stime=? ,etime=?, in1=?, in2=?, in3=?, in4=?, in5=?, in6=? ,in7=? where tid=?");
       	stmt.setString(1, name);
		stmt.setString(2, tname);
		stmt.setString(3, marks);
		stmt.setString(4, time);
		stmt.setString(5, sdate);
		stmt.setString(6, edate);
		stmt.setString(7, stime);
		stmt.setString(8, etime);
		stmt.setString(9, ins1);
		stmt.setString(10, ins2);
		stmt.setString(11, ins3);
		stmt.setString(12, ins4);
		stmt.setString(13, ins5);
		stmt.setString(14, ins6);
		stmt.setString(15, ins7);
		stmt.setString(16, tid);
		rset=stmt.executeQuery();
		
		return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return false;
  }  

  public boolean deleteTests(String tid)
  {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("delete from tests where tid=?");
		stmt.setString(1, tid);
		rset=stmt.executeQuery();
		stmt=con.prepareStatement("delete from questions where tid=?");
		stmt.setString(1, tid);
		rset=stmt.executeQuery();
		return true;
	  } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return false;
  }
  
  public ResultSet getChanels() {
	  
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select * from channel");
		rset=stmt.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return rset;
  }
  
  public String getChId() {
	  con=getConnection();
	  String id="1";
	  try {
		stmt=con.prepareStatement("select max(cid) as id from channel");
		rset=stmt.executeQuery();
		if(rset.next())
		{
			id=rset.getString("id");
			if(id==null)
			{
				id="1";
			}
        	else 
	     	{
	    	
		    	id= String.valueOf(Integer.parseInt(id)+1);
	     	}
		}
	  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		return id;
  }

  public boolean insertChannel(String cid, String name,String email,String des,String oth,String sel,String img)
  {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("insert into channel values(?,?,?,?,?,?,?)");
		 stmt.setString(1, cid);
		 stmt.setString(2, name);
		 stmt.setString(3, email);
		 stmt.setString(4, des);
		 stmt.setString(5, oth);
		 stmt.setString(6, sel);
		 stmt.setString(7, img);
		 rset=stmt.executeQuery();
		 return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return false;
  }
  
  public boolean updateChImg(String img ,String cid)
  {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("update channel set logo=? where cid=?");
		 stmt.setString(1, img);
		 stmt.setString(2, cid);
		 rset=stmt.executeQuery();
		 return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return false;
  }
  
  public ResultSet getChannels(String email)
  {
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select * from channel where email=?");
		stmt.setString(1, email);
		rset=stmt.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return rset;
  }
  
  public ResultSet getChannelDetails(String cid) {
	  
	  con=getConnection();
	  try {
		stmt=con.prepareStatement("select * from channel where cid=?");
		stmt.setString(1, cid);
		rset=stmt.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  return rset;  
  }
  
  public String getSubId() {
	  con=getConnection();
	  String id="1";
	  try {
		stmt=con.prepareStatement("select max(scid) as id from subschannel");
		rset=stmt.executeQuery();
		if(rset.next())
		{
			id=rset.getString("id");
			if(id==null)
			{
				id="1";
			}
        	else 
	     	{
	    	
		    	id= String.valueOf(Integer.parseInt(id)+1);
	     	}
		}
	  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		return id;
  }

  public boolean insertSubsChannel(String cid,String email) {
	  con=getConnection();
	  String sid=getSubId();
	  try {
		stmt=con.prepareStatement("insert into subschannel values(?,?,?)");
		stmt.setString(1, sid);
		stmt.setString(2, cid);
		stmt.setString(3, email);
		rset=stmt.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  return true;
  }
  
}
