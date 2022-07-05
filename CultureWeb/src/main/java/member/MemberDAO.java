package member;

import java.sql.Connection;

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

	

}
