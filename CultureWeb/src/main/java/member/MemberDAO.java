package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

		public Connection getConnection() throws Exception{
			// throws Exception : 예외처리(에러처리) 메서드 호출한 곳에서 처리하겠다
			
//			Data Base Connection Pool  => DBCP
			// 서버에서 미리 디비연결 => 이름정의 => 이름을 불러서 디비연결정보 사용
			// 1. 디비연결 속도 향상, 2. 디비연결코드 수정 최소화  장점
			// webapp - META-INF - context.xml (디비연결)
			// MemberDAO 디비연결 이름을 불러서 사용
			
			Context init=new InitialContext();
			DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
			Connection con=ds.getConnection();
			return con;
		}

//		insertMember() 메서드 정의
		public void insertMember(MemberDTO memberDTO) {
			System.out.println("MemberDAO insertMember()");
			
			Connection con=null;
			PreparedStatement pstmt=null;
			// 메서드 동작할 명령
			// 1단계드라이버불러오기 2단계디비연결 3단계sql 4단계 실행
			try {
				// 에러가 발생할 코드
				// 1,2 단계 디비 메서드 호출 
				con=getConnection();

				// 3단계 연결정보를 이용해서 sql구문을 만들기 => PreparedStatement 내장객체 준비
				String sql="insert into members(id,pass,name,date,email,address,phone,mobile) values(?,?,?,now(),?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, memberDTO.getId());
				pstmt.setString(2, memberDTO.getPass());
				pstmt.setString(3, memberDTO.getName());
				//추가
				pstmt.setString(4, memberDTO.getEmail());
				pstmt.setString(5, memberDTO.getAddress());
				pstmt.setString(6, memberDTO.getPhone());
				pstmt.setString(7, memberDTO.getMobile());
				
				// 4단계 sql구문을 실행 (insert, update, delete)
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				// 에러 메시지 출력
				e.printStackTrace();
			}finally {
				// 에러 상관없이 마무리(기억장소 할당 해제)
				// Connection con, PreparedStatement pstmt,
				// ResultSet rs
				if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
				if(con!=null)try { con.close(); }catch(SQLException ex){}
			}
		}//insertMember() 메서드
		
		// 리턴할형 MemberDTO userCheck(id,pass) 메서드 정의 
		public MemberDTO userCheck(String id,String pass) {
			MemberDTO memberDTO=null;
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				//1,2 디비연결 메서드 호출
				con=getConnection();
				
				// 3단계 연결정보를 이용해서 sql구문을 만들기 => PreparedStatement 내장객체 준비
				// String sql="select * from 테이블이름 where 조건열=값 and 조건열=값";
				String sql="select * from members where id=? and pass=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pass);

				// 4단계 sql구문을 실행=> 실행 결과 저장(select) 
				//=> sql구문을 실행한 결과 저장하는 내장객체 ResultSet
				rs=pstmt.executeQuery();

				// 5단계 결과를 가지고 출력하거나 배열변수 저장(select)
				// if  rs.next() 결과에서 다음행 이동하고 데이터 있으면 true => 아이디 비밀번호 일치
				// else                              데이터 없으면 false => 아이디 비밀번호 틀림
				if(rs.next()){
					//데이터 있으면 true => 아이디 비밀번호 일치
					// MemberDTO memberDTO 객체생성
					memberDTO=new MemberDTO();
					// set메서드 호출  id,pass,name, date 디비열 내용을 가져와서 저장
					memberDTO.setId(rs.getString("id"));
					memberDTO.setPass(rs.getString("pass"));
					memberDTO.setName(rs.getString("name"));
					memberDTO.setDate(rs.getTimestamp("date"));
				}else{
					//데이터 없으면 false => 아이디 비밀번호 틀림
//					MemberDTO memberDTO=null;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 에러 상관없이 마무리(기억장소 할당 해제)
				// Connection con, PreparedStatement pstmt,
				// ResultSet rs
				if(rs!=null)try { rs.close(); }catch(SQLException ex){}
				if(pstmt!=null)try { pstmt.close(); }catch(SQLException ex){}
				if(con!=null)try { con.close(); }catch(SQLException ex){}
			}
			return memberDTO;
		}

}
