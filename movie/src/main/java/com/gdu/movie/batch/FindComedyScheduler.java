package com.gdu.movie.batch;

import org.springframework.scheduling.annotation.Scheduled;

import com.gdu.movie.domain.QueryDTO;
import com.gdu.movie.service.MovieService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class FindComedyScheduler {
	
	private MovieService movieService;
	private QueryDTO queryDTO;
	
	@Scheduled(cron="0 0/1 * 1/1 * ?")
	public void execute() {
		
		movieService.getMoviesByQuery(queryDTO);
		
	}

}