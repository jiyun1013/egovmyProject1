package egov.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.MemberService;

//컨트롤러에 @Resource(name="값") 과 일치시켜야함 (같아야 인식이 가능함)
@Service("memberService")
public class MemberServiceImpl implements MemberService{

	//다오 클래스와 연동을 위함 (이름을 같게 씀)
	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public int selectMemberUseridCnt(String userid) throws Exception {
		return memberDAO.selectMemberUseridCnt(userid);
	}

}
