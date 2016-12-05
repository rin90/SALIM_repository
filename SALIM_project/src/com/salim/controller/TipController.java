package com.salim.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.salim.dao.impl.TipBoardDaoImpl;
import com.salim.service.TipBoardService;
import com.salim.vo.TipBoard;
@Controller
public class TipController {
    @Resource(name="tipBoardServiceImpl")
    private TipBoardService tipboardService;
    
    @RequestMapping(value="boardUpdate.action",method=RequestMethod.POST)
    public ModelAndView updateView1(@RequestParam int no){
        ModelAndView view = new ModelAndView();
        System.out.println(no);
        TipBoard tipboard = tipboardService.findBySeq(no);
        view.addObject("tipboard",tipboard);
        view.setViewName("Board_Update");
        return view;        
    }
 
    @RequestMapping(value="boardUpdate.action", method=RequestMethod.POST)
    public ModelAndView updateView1(@ModelAttribute TipBoard board,@RequestParam String pass)
    {
        ModelAndView view = new ModelAndView();
        int result = tipboardService.updateBoard(board, pass);
        
        if(result == 1){
            System.out.println("수정 완료");
            view.setViewName("redirect:boardList.action");
        }else{
            System.out.println("수정 실패 이유 :" + result);
            view.addObject("result",result);
            view.setViewName("redirect:boardUpdate.action?seq="+board.getNo());;
        }return view;
    }
    
    @RequestMapping(value="/boardDelete.action", method=RequestMethod.POST)
    public ModelAndView deleteView(@RequestParam int no){
        ModelAndView view = new ModelAndView();
        view.setViewName("Board_Delete");
        
        String storPass = tipboardService.deleteView(no);
        Map map = new HashMap();
        map.put("no",no);
        map.put("storPass", storPass);
        view.addAllObjects(map);
        return view;
    }
    
    @RequestMapping(value="boardDelete.action",method=RequestMethod.POST)
    public ModelAndView delete(@RequestParam int no, @RequestParam String storPass){
        ModelAndView view = new ModelAndView();
        int result = tipboardService.BoardDelete(no, storPass);
        System.out.println("딜리트의 결과값은 : " + result);
        if(result == 1){
            System.out.println("삭제에 성공하였습니다.");
            view.setViewName("redirect:boardList.action");
        }else{
            System.out.println("삭제에 실패하였습니다.");
            view.setViewName("redirect:boardDelete.action?seq="+ no);
            view.addObject("result",result);
        } return view;
    }
    
    @RequestMapping(value="/boardWrite.action", method=RequestMethod.GET)
    public String wirteView(){
        return "Board_Write";
    }
    
    @RequestMapping(value="/boardWrite.action", method=RequestMethod.POST)
    public String insert(@ModelAttribute TipBoard tipboard){
        String content = tipboard.getContent();
        String content2 = content.replace("\n", "<br/>");
        tipboard.setContent(content2);
        tipboardService.insertTipBoard(tipboard);
        return "redirect:boardList.action";
    }
  
    
    @RequestMapping(value="/boardList.action")
    public ModelAndView list(@RequestParam(required=false) Integer nowPage,@RequestParam(required=false)Integer nowBlock,
            @RequestParam(required=false) String keyField, @RequestParam(required=false) String keyWord)
    {
        ModelAndView view = new ModelAndView();
        List<TipBoard> list = tipboardService.tipboardList(keyField, keyWord);
        TipBoard no = null;
        try{
            no = tipboardService.pagingProc(nowPage, nowBlock, list.size());
        }
        catch(Exception err){
            System.out.println("now페이지와 now블럭이 존재하지 않아 0을 대입했습니다.");
            System.out.println("에러내용은 다음과 같습니다." + err);
            no = tipboardService.pagingProc(0, 0, list.size());
        }
        
        view.addObject("dao", new TipBoardDaoImpl());
        view.addObject("list", list);
        view.addObject("page",no);
        view.addObject("keyWord",keyWord);
        view.addObject("keyField",keyField);
        view.setViewName("Board_List");
        
        return view;
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






    




