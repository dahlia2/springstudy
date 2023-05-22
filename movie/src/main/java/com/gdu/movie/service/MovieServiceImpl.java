package com.gdu.movie.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gdu.movie.domain.MovieDTO;
import com.gdu.movie.domain.QueryDTO;
import com.gdu.movie.mapper.MovieMapper;
import com.gdu.movie.util.SecurityUtil;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class MovieServiceImpl implements MovieService {
	
	private MovieMapper movieMapper;
	private SecurityUtil securityUtil;
	
	@Override
	public Map<String, Object> getAllMovies() {
		
		List<MovieDTO> list = movieMapper.getAllMovies();
		
		int status= 0;
		String message = null;
		
		if(list.isEmpty()) {
			status = 500;
			message = "목록이 없습니다.";
		} else {
			status = 200;
			message = "전체" + list.size() + "개의 목록을 가져왔습니다.";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("status", status);
		map.put("message", message);
		
		return map;
	}
	
	
	
	@Override
	public Map<String, Object> getMoviesByQuery(QueryDTO queryDTO) {
		
		queryDTO.setSearchText(securityUtil.preventXSS(queryDTO.getSearchText()));  // Insert, Update 에서 <> 으로 입력하는 해킹 금지를 위해
		
		List<MovieDTO> list = movieMapper.getMoviesByQuery(queryDTO);
		
		int status= 0;
		String message = null;
		
		if(list.isEmpty()) {
			status = 500;
			message = queryDTO.getSearchText() + " 검색 결과가 없습니다.";
		} else {
			status = 200;
			message = list.size() + "개의 검색 결과가 있습니다. ";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("status", status);
		map.put("message", message);
		
		
		String fileName = (String) map.get(list.get(0).getGenre());
		File file = new File(fileName);
								
			try (PrintWriter out = new PrintWriter(file)) {
			
				if(status == 200) {
		
					Map<String, Object> movie = new HashMap<String, Object>();
					
					for(String key : map.keySet()) {
						out.printf(key, map.get(key));
					}
				} else {
					out.println(message);
				}
				
				out.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return map;
	}		
		
}
