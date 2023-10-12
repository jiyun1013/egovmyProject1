package egov.service;

import java.util.List;

//명세처리 파일
public interface BoardService {
	
	/* 
	 * 게시판 저장처리 (메소드형식)
	 */
	String insertBoard(BoardVO vo) throws Exception;
	
	//답글게시판 저장처리
	String insertReBoard(BoardVO vo) throws Exception;
	
	/* 
	 * 게시판 목록화면
	 */
	List<?> selectBoardList(BoardVO vo) throws Exception;
	
	//답글 게시판 목록화면
	List<?> selectReBoardList(BoardVO vo) throws Exception;
	
	/*
	 * 게시글 총 개수
	 */
	int selectBoardTotal(BoardVO vo) throws Exception;
	
	/*
	 * 게시글 상세보기
	 */
	BoardVO selectBoardDetail(int unq) throws Exception;
	
	/*
	 * 조회수 증가
	 */
	int updateBoardHits(int unq) throws Exception;
	
	//비밀번호 체크
	int selectBoardPass(BoardVO vo) throws Exception;
	//삭제
	int deleteBoard(BoardVO vo) throws Exception;
}