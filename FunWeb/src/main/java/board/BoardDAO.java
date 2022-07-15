package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.MemberDTO;

public class BoardDAO {
	// 디비연결 메서드
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	// 리턴할형 List   getBoardList() 메서드 정의
	public List getBoardList(int startRow, int pageSize) {
		// 여러명을 저장할 변수 => 자바API 배열 변수
		List boardList=new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1, 2 디비연결 메서드 호출
			con=getConnection();
			// 3단계 연결정보를 이용해서 sql구문을 만들기 => PreparedStatement 내장객체 준비
//			String sql="select * from board order by num desc";
			String sql="select * from board order by num desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			// 4단계 sql구문을 실행=> 실행 결과 저장(select) 
			//=> sql구문을 실행한 결과 저장하는 내장객체 ResultSet
			rs=pstmt.executeQuery();
			// 5단계 결과를 가지고 출력하거나 배열변수 저장(select)
			// rs.next() 결과에서 다음행 이동하고 데이터 있으면 true/없으면 false 
			// while(rs.next()){
				// 데이터 있으면 true => 열접근
			while(rs.next()) {
				BoardDTO boardDTO=new BoardDTO();
				boardDTO.setNum(rs.getInt("num"));
				boardDTO.setPass(rs.getString("pass"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setReadcount(rs.getInt("readcount"));
				boardDTO.setDate(rs.getTimestamp("date"));
				//첨부파일 
				boardDTO.setFile(rs.getString("file"));
				//배열한칸에 글 정보 저장
				boardList.add(boardDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		return boardList;		
	}
	
	public BoardDTO getBoard(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDTO boardDTO =null;
		
		try {
			con=getConnection();
			String sql="select * from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				boardDTO=new BoardDTO();
				boardDTO.setNum(rs.getInt("num"));
				boardDTO.setPass(rs.getString("pass"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setReadcount(rs.getInt("readcount"));
				boardDTO.setDate(rs.getTimestamp("date"));
				//첨부파일 
				boardDTO.setFile(rs.getString("file"));
			}
		} catch (Exception e) {
		
		} finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		return boardDTO;
	}
	//리턴값없음 insertBoard(BoardDTO boardDTO) 메서드 정의 
	public void insertBoard(BoardDTO boardDTO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1, 2 디비연결
			con=getConnection();
			//3sql
			String sql="select max(num) from board";
			pstmt=con.prepareStatement(sql);
			//4실행결과 저장
			rs=pstmt.executeQuery();
			//5 
			int num=0;
			if(rs.next()) {
				num=rs.getInt("max(num)")+1;
			}
			// 3단계 연결정보를 이용해서 sql구문을 만들기 => PreparedStatement 내장객체 준비
			// 날짜 now()
			sql="insert into board(num,name,pass,subject,content,readcount,date,file) values(?,?,?,?,?,?,now(),?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, boardDTO.getName());
			pstmt.setString(3, boardDTO.getPass());
			pstmt.setString(4, boardDTO.getSubject());
			pstmt.setString(5, boardDTO.getContent());
			pstmt.setInt(6, boardDTO.getReadcount());
			//파일
			pstmt.setString(7, boardDTO.getFile());
			// 4단계 sql구문을 실행 (insert, update, delete)
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
	}
	
	
	// 리턴할형없음 updateBoard(BoardDTO boardDTO)
	public void updateBoard(BoardDTO boardDTO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			String sql="update board set subject=?, content=?, file=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getSubject());
			pstmt.setString(2, boardDTO.getContent());
			pstmt.setString(3, boardDTO.getFile());
			pstmt.setInt(4, boardDTO.getNum());
			
			//4 실행 
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
	}
	
	
	public void deleteBoard(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			//3 sql
			String sql="delete from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4 실행 
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
	}
	
	public int getBoardCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			//3sql
			String sql="select count(*) from board";
			pstmt=con.prepareStatement(sql);
			//4실행결과 저장
			rs=pstmt.executeQuery();
			// 5 다음행으로 이동 데이터 있으면 열 접근
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		
		return count;
	}
	
	public void updateReadCount(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql = "update board set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try { rs.close(); }catch(SQLException ex){}
			if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
			if(con!=null)try { con.close(); }catch(SQLException ex){}
		}
		
	}
	
}//클래스