package com.gdu.app09.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.app09.domain.EmpDTO;
import com.gdu.app09.mapper.EmployeeListMapper;
import com.gdu.app09.util.PageUtil;

import lombok.AllArgsConstructor;

@AllArgsConstructor  // field에 @Autowired 처리가 된다. (모든 필드의 생성자)
@Service
public class EmployeeListServiceImpl implements EmployeeListService {

	// field
	private EmployeeListMapper employeeListMapper;
	private PageUtil pageUtil;
	
	@Override
	public void getEmployeeListUsingPagination(HttpServletRequest request, Model model) {
		
		// 파라미터 page가 전달되지 않는 경우 page=1로 처리한다.
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt1.orElse("1"));
		
		// 전체 레코드 개수를 구한다.
		int totalRecord = employeeListMapper.getEmployeeCount();
		
		// 세션에 있는 recordPerPage를 가져온다. 세션에 없는 경우 recordPerPage=10으로 처리한다.
		HttpSession session = request.getSession();
		Optional<Object> opt2 = Optional.ofNullable(session.getAttribute("recordPerPage"));
		int recordPerPage = (int)(opt2.orElse(10));
		
		// 파라미터 order가 전달되지 않는 경우 order=ASC로 처리한다.
		// 첫 화면일 땐 오지 않는 파라미터. 항상 오지 않음.
		Optional<String> opt3 = Optional.ofNullable(request.getParameter("order"));
		String order = opt3.orElse("ASC");
		
		// 파라미터 column이 전달되지 않는 경우 column = EMPLOYEE_ID로 처리한다.
		Optional<String> opt4 = Optional.ofNullable(request.getParameter("column"));
		String column = opt4.orElse("EMPLOYEE_ID");
		
		// PageUtil(Pagination에 필요한 모든 정보) 계산하기
		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		// DB로 보낼 Map 만들기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());
		map.put("order", order);
		map.put("column", column);
		
		// begin ~ end 사이의 목록 가져오기
		List<EmpDTO> employees = employeeListMapper.getEmployeeListUsingPagination(map);
		
		// pagination.jsp로 전달할(forward)할 정보 저장하기
		model.addAttribute("employees", employees);
		model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/employees/pagination.do?column=" + column + "&order=" + order));
		model.addAttribute("beginNo", totalRecord - (page - 1) * recordPerPage); // 페이지당 첫 번째 레코드에 들어갈 번호 ->  전체 레코드 수 -  ( (현재페이지-1) * 한페이지에표시될레코드수)
	
		// jsp파일(view)이 ASC라면 Service은 view에게 DESC 전달
		switch (order) {  
		case "ASC" : model.addAttribute("order", "DESC"); break;   // 현재 ASC 정렬이므로 다음 정렬은 DESC이라고 jsp에 알려주는격
		case "DESC" : model.addAttribute("order", "ASC"); break;
		}
		
		model.addAttribute("page", page);
		
	}
	
	
	@Override
	public Map<String, Object> getEmployeeListUsingScroll(HttpServletRequest request) {
		
		// 파라미터 page가 전달되지 않는 경우 page=1로 처리한다.
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt1.orElse("1"));
		
		// 전체 레코드 개수를 구한다.
		int totalRecord = employeeListMapper.getEmployeeCount();
		
		// recordPerPage = 9로 처리한다.
		int recordPerPage = 9; // 스크롤 한 번에 9개씩 보여줌으로 정의.
		
		// PageUtil(Pagination에 필요한 모든 정보) 계산하기
		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		// DB로 보낼 Map 만들기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());
		
		// begin ~ end 사이의 목록 가져오기
		List<EmpDTO> employees = employeeListMapper.getEmployeeListUsingScroll(map);
		
		// scorll.jsp로 응답할 데이터  (employees 사원정보 & totalPage 전체페이지수를 map에 담음)
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("employees", employees);
		resultMap.put("totalPage", pageUtil.getTotalPage());
		
		// 응답
		return resultMap;  
		
		/*
			resultMap이 json으로 변환될 때의 모습
			{
				"employees" : [
					{
						"employeeId": 100,
						"firstName": "Steven",
						"lastName": "King",
						...,
						"deptDTO": {
							"departmentId": 90,
							"departmentName": "Executive",
							...,
						}
					},
					...
				], // 여러 employee이 담긴 배열 끝
				"totalPage" : 12
			}
		 */
	}
	
	
	@Override
	public void getEmployeeListUsingSearch(HttpServletRequest request, Model model) {
		
		// 파라미터 column이 전달되지 않는 경우 column=""로 처리한다.
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("column"));
		String column = opt1.orElse("");
		
		// 파라미터 query이 전달되지 않는 경우 query=""로 처리한다.
		Optional<String> opt2 = Optional.ofNullable(request.getParameter("query"));
		String query = opt2.orElse("");
		
		// DB로 보낼 Map 만들기(column + query)
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("query", query);
		
		// 파라미터 page가 전달되지 않는 경우 page=1로 처리한다.
		Optional<String> opt3 = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt3.orElse("1"));
		
		// column과 query를 이용해 검색된 레코드 개수를 구한다.
		int totalRecord = employeeListMapper.getEmployeeSearchCount(map);
		
		// recordPerPage = 10로 처리한다.
		int recordPerPage = 10;
		
		// PageUtil(Pagination에 필요한 모든 정보) 계산하기
		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		// DB로 보낼 Map에 begin, end 추가하기
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());
		
		// begin ~ end 사이의 목록 가져오기
		List<EmpDTO> employees = employeeListMapper.getEmployeeListUsingSearch(map);
		
		// pagination.jsp로 전달할(forward)할 정보 저장하기
		model.addAttribute("employees", employees);
		model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/employees/search.do?column=" + column + "&query=" + query));
		model.addAttribute("beginNo", totalRecord - (page - 1) * recordPerPage);
		
	}
	
	@Override
	public Map<String, Object> getAutoComplete(HttpServletRequest request) {
		
		// 파라미터 column이 전달되지 않는 경우 column=""로 처리한다.
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("column"));
		String column = opt1.orElse("");
		
		// 파라미터 query이 전달되지 않는 경우 query=""로 처리한다.
		Optional<String> opt2 = Optional.ofNullable(request.getParameter("query"));
		String query = opt2.orElse("");
		
		// DB로 보낼 Map 만들기(column + query)
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("query", query);
		
		// 검색 목록 가져오기
		List<EmpDTO> employees = employeeListMapper.getAutoComplete(map);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("employees", employees);
		
		// 응답
		return resultMap;
	}
	
	
	
}
