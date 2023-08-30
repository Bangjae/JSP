package Controller;

import common.DBConnPool;

public class MemberDAO extends DBConnPool
{
	//생성자에서 DBCP을 통해 오라클에 연결
	//source -> usingField
	public MemberDAO()
	{
		super();
	}
	
	// 로그인
	public int login(String userId, String userPassword)
	{
		
		int result = 0;
		
		
		// 로그인을 위해 인파라미터가 있는 동적 쿼리문 작성
		String query = "select count(*) from members where id=? and pass=?";
		try
		{
			//쿼리문 실행을 위한 prepared 객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, userId);
			psmt.setString(2, userPassword);
			// select 쿼리문을 실행한 후 ResultSet으로 반환받는다.
			rs = psmt.executeQuery();
			
			if(rs.next())
			{
				result = rs.getInt(1);
				System.out.println(result);
			}
		}
		catch(Exception e)
		{
			System.out.println("로그인 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//회원가입
	public int join(MemberDTO dto) 
	{
		int result = 0;
		
		try
		{
			String query = "insert into members ( "
					+ " id, pass, name, zipcode, address, detailAddress, chamgo) "
					+ " values ( "
					+ " ?, ?, ?, ?, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getZipcode());
			psmt.setString(5, dto.getAddress());
			psmt.setString(6, dto.getDetailaddress());
			psmt.setString(7, dto.getChamgo());
			result = psmt.executeUpdate();
			
		}
		catch(Exception e)
		{
			System.out.println("회원가입 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 회원 조회
	public MemberDTO memberView(String id)
	{
		// 레코드 저장을 위해 dto 객체를 생성한다
		MemberDTO dto = new MemberDTO();
		
		String query = "select * from members where id=?";
		try
		{
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next())
			{
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setBirth(rs.getString(4));
				dto.setZipcode(rs.getString(5));
				dto.setAddress(rs.getString(6));
				dto.setDetailaddress(rs.getString(7));
				dto.setChamgo(rs.getString(8));
				
			}
		}
		catch(Exception e)
		{
			System.out.println("회원 정보 조회 중 오류");
			e.printStackTrace();
		}
		return dto;
	}
	
	// 회원정보 수정
	public int medit(MemberDTO dto) 
	{
		int result = 0;
		
		try
		{
			String query = "update members set pass=?, zipcode=?, address=?, detailAddress=?, chamgo=?"
					+ " where id=? ";
						
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getZipcode());
			psmt.setString(3, dto.getAddress());
			psmt.setString(4, dto.getDetailaddress());
			psmt.setString(5, dto.getChamgo());
			
			psmt.setString(6, dto.getId());
			result = psmt.executeUpdate();
			
			
		}
		catch(Exception e)
		{
			System.out.println("정보 변경 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 회원 탈퇴
	public int mdelete(MemberDTO dto)
	{
		
		int result = 0;
		try
		{
			String query = "delete from members where id=? and pass=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			result = psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("회원 탈퇴 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//
	   public int loginMember(MemberDTO dto) {
		      int result = 3;
		      try {
		         
		     String query= "select pass from members where id=?";
		      psmt = con.prepareStatement(query);
		      psmt.setString(1,dto.getId());
		      rs = psmt.executeQuery();
		      if(rs.next()) {
		         
		         String tablepass = rs.getString("pass");
		      
		         if (dto.getPass().equals(tablepass)) {
		            //로그인 성공
		            result = 0;
		         }else {
		            System.out.println("패스워드 다름");
		            //패스워드 다름
		            result = 1;
		         }
		      }else {
		         //아이디 없음
		         System.out.println("아이디 없음");
		         result=-1;
		      }
		      } catch (Exception e) {
		         result = 5;
		         System.out.println("로그인 실패");
		         e.printStackTrace();
		      }
		      return result;
		      
		   }
}
