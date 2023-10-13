package egov.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

//서비스임플에 @Resource(name="이값")과 같아야함 임플과 매칭을 위해 사용
@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO{

	public int selectMemberUseridCnt(String userid) {
		return (int) select("memberDAO.selectMemberUseridCnt", userid);
	}

}
