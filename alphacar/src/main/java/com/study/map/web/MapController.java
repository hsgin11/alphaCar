package com.study.map.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {

	@RequestMapping("/map/map")
	public String map() {
		return "/map/map";
	}
}
