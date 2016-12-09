package com.salim.controller;



import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.salim.service.TipBoardService;
import com.salim.vo.FreeBoard;
import com.salim.vo.TipBoard;

@Controller
public class TipController {
	@Autowired
	private TipBoardService tipBoardService;
	
	
	
	
	
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
  
    @RequestMapping(value="boardUpdate", method=RequestMethod.POST)
    public String update(@ModelAttribute TipBoard tipBoard,int page,String category,String search,HttpServletRequest request,ModelMap map) throws IllegalStateException, IOException{
		MultipartFile file = tipBoard.getFileRoot();
		
		if(file != null&& !file.isEmpty()){//업로드 된 파일이 있다면
			
			tipBoard.setFileName(file.getOriginalFilename());//파일명
			
			String dir =request.getServletContext().getRealPath("/fileroute");//파일 저장되는 곳
			
			System.out.println("진짜 파일 경로::"+dir);
			
			File dest = new File(dir,file.getOriginalFilename());
			
			file.transferTo(dest);//파일이동
		}
		tipboardService.tipUpdate(tipBoard);
		map.addAttribute("page",page);
		map.addAttribute("commentTotal",tipboardService.selectCommentTotal(tipBoard.getNo()));
		map.addAttribute("category",category);
		map.addAttribute("search",search);
		System.out.println("updateController:"+category);
		return "body/board/free_board_detail.tiles";
          
              
		
    }	

    @RequestMapping(value="boardDelete", method=RequestMethod.POST)
    public ModelAndView deleteView(@ModelAttribute int no){
    	ModelAndView view = new ModelAndView();
        
        
        int storPass = tipboardService.tipDelete(no);
        Map map = new HashMap();
        map.put("no",no);
        map.put("storPass", storPass);
        view.addAllObjects(map);

		return new ModelAndView("body/tip_board_List.tiles");
		
		

   


	
    }   
   @RequestMapping(value="/boardInsert.action", method=RequestMethod.POST)
   public String insert(@ModelAttribute TipBoard tipboard){
       String content = tipboard.getContent();
       String content2 = content.replace("\n", "<br/>");
       tipboard.setContent(content2);
     tipBoardService.tipInsert(tipboard);
       return "redirect:BoardView";
   }
   @RequestMapping(value="/boardView.action", method=RequestMethod.POST)
   public ModelAndView read(@RequestParam int no,ModelMap map)
   {
       ModelAndView view = new ModelAndView();
       view.setViewName("Board_View");
       TipBoard tipboard = (TipBoard) tipboardService.getTipListBoard(no);
       view.addObject("tipboard",tipboard);
       view.addObject("map",map);
       return view;        
   }

   @RequestMapping("good")
	@ResponseBody
	public void goodUpdate(int no,String whether,HttpServletRequest request){
		System.out.println("왓??");
		if(whether.isEmpty()){
			tipboardService.goodUpdate(no,-1);			
		}else{
			tipboardService.goodUpdate(no,1);
		}

   
   }

   
   }
   












    




