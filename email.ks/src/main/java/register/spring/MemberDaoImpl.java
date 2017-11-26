package register.spring;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.core.RowMapper;

public class MemberDaoImpl implements MemberDao{
	private SqlSessionTemplate sqlSessionTemplate;

	public MemberDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public RowMapper<Member> memRowMapper = new RowMapper<Member>() {
		@Override
		public Member mapRow(ResultSet rs, int rowNum) throws SQLException{
			Member member = new Member(rs.getString("EMAIL"),
							rs.getString("PASSWORD"),
							rs.getString("NAME"),
							rs.getTimestamp("REGDATE"));
			member.setId(rs.getLong("ID"));
			return member;
		}
	};

	public Member selectByEmail(String email) {
		return sqlSessionTemplate.selectOne("selectByEmail", email);
	}
	
	public Member selectByName(String name) {
		return sqlSessionTemplate.selectOne("selectByName", name);
	}
	
	public List<Member> selectAll(){
		return sqlSessionTemplate.selectList("list");
	}
	
	public int count() {
		return sqlSessionTemplate.selectOne("count");
	}
	
	public void update(Member member) {
		sqlSessionTemplate.update("update", member);
		}
	
	public void insert(Member member) {
		sqlSessionTemplate.insert("insert", member);
	}
	
	public List<Member> selectByRegdate(Date from, Date to){
		HashMap<String, Date> map = new HashMap<String, Date>();
		map.put("from", from);
		map.put("to", to);
		return sqlSessionTemplate.selectList("selectByRegdate", map);
	}
	
	
	public Member selectById(Long id) {
		List<Member> results = sqlSessionTemplate.selectList("selectById", id);
		return results.isEmpty() ? null : results.get(0);
	}
	
	
}
	
