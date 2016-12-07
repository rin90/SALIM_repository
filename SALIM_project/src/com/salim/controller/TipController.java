package com.salim.controller;



import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.salim.service.TipBoardService;

@Controller
public class TipController {
    @Resource(name="tipBoardServiceImpl")
    private TipBoardService tipboardService;
  	@RequestMapping("list")
  	public ModelAndView list(int page){
  		Map map =tipboardService.getTipListBoard(page);
  		return new ModelAndView("body/tip_board_list.tiles",map);
  	}
    
 

    
    @RequestMapping(value="/boardAjax.action")
    public void ajaxlist(HttpServletRequest req, HttpServletResponse res) 
            throws IOException{
        int no = Integer.parseInt(req.getParameter("no"));
        req.setCharacterEncoding("utf-8");
        res.setContentType("text/html; charset=utf-8");
        res.setHeader("Cache-Control", "no-cache");
        

}
    
  
 
}








    




