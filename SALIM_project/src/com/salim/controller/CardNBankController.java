package com.salim.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import com.salim.service.CardService;
import com.salim.service.CodeService;
import com.salim.vo.Card;
import com.salim.vo.CardForm;
import com.salim.vo.Member;

@Controller
@RequestMapping("/cardNBank/")
public class CardNBankController {
   
   @Autowired
   private CardService service;
   @Autowired
   private CodeService codeService;

   //카드카드카드
   //카드추가..?
   @RequestMapping(value="cardNBankAdd.do", method=RequestMethod.POST)
   public String add(String cardNaming, String bankList1, HttpSession session, HttpServletRequest request){
	   System.out.println("추가 정보 받은 것??? "+bankList1);
	   String memberId = ((Member) session.getAttribute("login_info")).getMemberId();
	   service.addCard(new Card(memberId, 0, bankList1, cardNaming));
	   request.setAttribute("cardList",  service.findCardByMemberId(memberId));
	   
	   return "redirect:/cardNBank/login/cardNBank.do";
   }
   
   //카드삭제
   @RequestMapping(value="cardNBankRemove.do")
   public View delete(@RequestParam ArrayList<Integer> cardIdList, HttpSession session){
      System.out.println("삭제되었습니다..? 인가");
     // session.invalidate();
      service.deleteCard(cardIdList);
      
      return new InternalResourceView("/cardNBank/login/cardNBank.do");
   }
   
   //카드조회
   @RequestMapping(value="login/cardNBank.do")
   public String select(HttpSession session, ModelMap modelmap){

	   String memberId = ((Member) session.getAttribute("login_info")).getMemberId();
	   List<Card> cardList = service.findCardByMemberId(memberId);
	   
	   modelmap.addAttribute("cardList", cardList);
	   
	   System.out.println(cardList);
	   
	   modelmap.addAttribute("bankList", codeService.findCode("은행"));
	   
	   return "body/cardNBank.tiles";
   };
   
   //카드 수정   
   @RequestMapping(value="login/cardUpdate.do")
   public View update(@ModelAttribute CardForm cardForm, HttpSession session){
	   
	   System.out.println("=========수정으로 들어옴===================");

	   System.out.println("jsp에서 받아온 값...."+cardForm);
	   List<Card> cardList = cardForm.getCardList();
	   
	   System.out.println("jsp에서 받아온 card 하나하나 객체 - "+cardList);
	   for(int i =0; i<cardList.size(); i++){
		   System.out.println("=====하나하나 ================");
		   service.modifyCard(cardList.get(i));
	   }
	   
	   return new InternalResourceView("/cardNBank/login/cardNBank.do");
   }
 
   
   //통장
   //통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장통장
   
  /* @RequestMapping(value="candNBank.do", method=RequestMethod.POST)
   public View insert*/
   
   
}