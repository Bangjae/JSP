package Controller;

import java.util.Map;

import common.DBConnPool;

public class BoardDAO extends DBConnPool
{
	public BoardDAO()
	{
		super();
	}

	// 게시물의 갯수를 카운트한다.
	   public int selectCount(Map<String, Object> map) {
	      int totalCount = 0;
	      // 만약 검색어가 있다면 조건에 맞는 게시물을 카운트해야 하므로
	      // 조건부 (where)로 쿼리문을 추가한다.
	      String query = "select count(*) from boards";
	      if (map.get("searchWord") != null) {
	         query += " where "+ map.get("searchField") +" "
	               + " like '%"+ map.get("searchWord") +"%'";
	      } try {
	         stmt = con.createStatement();
	         rs = stmt.executeQuery(query);
	         rs.next();
	         totalCount = rs.getInt(1);
	      } catch (Exception e) {
	         System.out.println("게시물 카운트 중 예외 발생");
	         e.printStackTrace();
	      }
	      return totalCount;
	   }
	   
	   
}
