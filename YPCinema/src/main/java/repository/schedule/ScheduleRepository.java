package repository.schedule;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.ScheduleDTO;

@Repository
public class ScheduleRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "scheduleMapper";
	
	public Integer addSchedule(ScheduleDTO schedule) {
		String statement = namespace + ".addSchedule";
		return sqlSession.update(statement, schedule);
	}

	public ScheduleDTO selectTodayScheduleByStaffNum(ScheduleDTO schedule) {
		String statement = namespace + ".selectTodayScheduleByStaffNum";
		return sqlSession.selectOne(statement, schedule);
	}

	public Integer setGnteChulgn(ScheduleDTO schedule) {
		String statement = namespace + ".setGnteChulgn";
		return sqlSession.update(statement, schedule);
	}

	public Integer setGnteTuegn(ScheduleDTO schedule) {
		String statement = namespace + ".setGnteTuegn";
		return sqlSession.update(statement, schedule);
	}

	public List<ScheduleDTO> selectAllSchedule() {
		String statement = namespace + ".selectAllSchedule";
		return sqlSession.selectList(statement);
	}
}
