  package com.gdu.app10.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.app10.domain.BbsDTO;
import com.gdu.app10.mapper.BbsMapper;
import com.gdu.app10.util.PageUtil;

import lombok.AllArgsConstructor;

@AllArgsConstructor  // 필드값으로 생성자를 만들어서 AutoWired을 대체한다.
@Service
public class BbsServiceImpl implements BbsService {
	
	private BbsMapper bbsMapper;
	private PageUtil pageUtil;

	@Override
	public void loadBbsList(HttpServletRequest request, Model model) {  // request에 전달되는 건 page
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		int totalRecord = bbsMapper.getBbsCount();
		
		int recordPerPage = 20;
		
		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("begin", pageUtil.getBegin());
		resultMap.put("end", pageUtil.getEnd());
		
		List<BbsDTO> bbsList = bbsMapper.getBbsList(resultMap);
		
		model.addAttribute("bbsList", bbsList);
		model.addAttribute("beginNo", totalRecord - (page - 1) * recordPerPage);  // 페이지당 첫 번째 게시판 번호 구하는 계산식
		model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/bbs/list.do"));
	
	}
	
	@Override
	public int addBbs(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		
		// 파라미터 writer, title
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		
		// IP
		String ip = request.getRemoteAddr();
		
		// DB로 보낼 BbsDTO 객체
		BbsDTO bbsDTO = new BbsDTO();
		bbsDTO.setWriter(writer);
		bbsDTO.setTitle(title);
		bbsDTO.setIp(ip);
		
		// 원글 달기
		int addResult = bbsMapper.addBbs(bbsDTO);
		
		// 결과 반환
		return addResult;
	}
	
	@Override
	public int removeBbs(int bbsNo) {
		return bbsMapper.removeBbs(bbsNo);
	}
	
	
	@Transactional(readOnly = true)  // INSERT, UPDATE, DELETE 중 2개 이상 쿼리를 실행하는 경우 반드시 추가. (readOnly는 성능향상 도구로 항상 붙이는 걸 권장)
	@Override
	public int addReply(HttpServletRequest request) {
		
		// 파라미터 writer, title
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		
		// IP
		String ip = request.getRemoteAddr();
		
		// 원글의 정보(파라미터 depth, groupNo, groupOrder)
		int depth = Integer.parseInt(request.getParameter("depth"));
		int groupNo = Integer.parseInt(request.getParameter("groupNo"));
		int groupOrder = Integer.parseInt(request.getParameter("groupOrder"));
		
		// 원글 bbsDTO(기존 답글 선행 작업 : increaseGroupOrder를 위한 DTO)
		BbsDTO bbsDTO = new BbsDTO();
		bbsDTO.setGroupNo(groupNo);
		bbsDTO.setGroupOrder(groupOrder);
		
		// 기존 답글 선행 작업
		bbsMapper.increaseGroupOrder(bbsDTO);
		
		// 답글 replyDTO
		BbsDTO replyDTO = new BbsDTO();
		replyDTO.setWriter(writer);
		replyDTO.setTitle(title);
		replyDTO.setIp(ip);
		replyDTO.setDepth(depth + 1);
		replyDTO.setGroupNo(groupNo);
		replyDTO.setGroupOrder(groupOrder + 1);
		
		// 답글 달기
		int addReplyResult = bbsMapper.addReply(replyDTO);
		
		return addReplyResult;
		
	}
	
	
}
