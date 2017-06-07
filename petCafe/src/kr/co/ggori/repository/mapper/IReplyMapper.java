package kr.co.ggori.repository.mapper;

import java.util.List;

import kr.co.ggori.repository.vo.ReplyVO;

public interface IReplyMapper {
	
	public void insertReply(ReplyVO reply) throws Exception;
	public int updateReply(ReplyVO reply) throws Exception;
	public int deleteReply(int boardNo) throws Exception;
	public List<ReplyVO> replyList(int replyId) throws Exception;
	public String myNickName(String memberId) throws Exception;

}
