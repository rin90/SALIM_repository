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

import com.salim.service.BankService;
import com.salim.service.CardService;
import com.salim.service.CodeService;
import com.salim.vo.Bank;
import com.salim.vo.BankForm;
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
   @Autowired
   private BankService bankService;

   //카드 추가
   @RequestMapping(value="cardNBankAdd.do", method=RequestMethod.POST)
   public String add(String cardNaming, String bankList1, HttpSession session, HttpServletRequest request){
	   String memberId = ((Member) session.getAttribute("login_info")).getMemberId();
	   service.addCard(new Card(memberId, 0, bankList1, cardNaming));
	   request.setAttribute("cardList",  service.findCardByMemberId(memberId));
	   return "redirect:/cardNBank/login/cardNBank.do";
   }
   
   //카드삭제
   @RequestMapping(value="cardNBankRemove.do")
   public View delete(@RequestParam ArrayList<Integer> cardIdList, HttpSession session){
      service.deleteCard(cardIdList);
      service.findCardByMemberId(((Member) session.getAttribute("login_info")).getMemberId());
      
      return new InternalResourceView("/cardNBank/login/cardNBank.do");
   }
   
   //카드조회&통장조회
   @RequestMapping(value="login/cardNBank.do")
   public String select(HttpSession session, ModelMap modelmap){

	   String memberId = ((Member) session.getAttribute("login_info")).getMemberId();
	   
	 /*  System.out.println("===========통장을 넣어보자============");
	   bankService.addBank(new Bank(memberId, 0, "신한", "통장통장"));*/
	   
	   
	   System.out.println("조회해온 통장..... - "+bankService.findBankByMemberId(memberId));
	   modelmap.addAttribute("cardList", service.findCardByMemberId(memberId));
	   modelmap.addAttribute("bankBookList", bankService.findBankByMemberId(memberId));
	   modelmap.addAttribute("bankList", codeService.findCode("은행"));
	   
	   
	   
	   
	   
	   
	   System.out.println("카드 통장을 한번에 조회해 옴");
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
   
   //추가
   @RequestMapping(value="login/cardNBank2.do", method=RequestMethod.POST)
   public String insert(String bankNaming, String bankList2, HttpSession session, ModelMap modelmap){
	   System.out.println("통장 추가 들어왔다.....");
	   String memberId = ((Member) session.getAttribute("login_info")).getMemberId();
	   bankService.addBank(new Bank(memberId, 0, bankList2, bankNaming));
	   //modelmap.addAttribute("bankList", bankService.findBankByMemberId(memberId));
	   modelmap.addAttribute("bankBookList", bankService.findBankByMemberId(memberId));
	   
	  return "redirect:/cardNBank/login/cardNBank.do";
   }
   
   //조회
   //@RequestMapping(value="login/cardNBank2.do")
   public String selectBank(HttpSession session, ModelMap modelmap){
	   
	   String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
	   List<Bank> bankBookList = bankService.findBankByMemberId(memberId);
	   
	   modelmap.addAttribute("bankBookList", bankBookList);
	   
	   System.out.println(bankBookList);
	   
	   modelmap.addAttribute("bankList", codeService.findCode("은행"));
	   
	   return "body/cardNBank.tiles";
   }
   
   //삭제
   @RequestMapping(value="login/cardNBankRemove2.do")
   public View delete2(@RequestParam ArrayList<Integer> bankIdList, HttpSession session, ModelMap modelmap){
	   System.out.println("===========통장 삭제 들어옴======================");
	   String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
	   bankService.deleteBank(bankIdList);
	   //List<Bank> bankBookList = bankService.findBankByMemberId(memberId);
	   //modelmap.addAttribute("bankBookList", bankBookList);
	   //modelmap.addAttribute("bankBookList", bankService.findBankByMemberId(memberId));
	   
	   
	   return new InternalResourceView("/cardNBank/login/cardNBank.do");
	   
	   //return "body/cardNBank.tiles";
   }
   
   //수정
   @RequestMapping(value="login/cardNBankModify.do")
   public View update2(@ModelAttribute BankForm bankForm, HttpSession session){
	   
	   List<Bank> bankList = bankForm.getBankList();
	   
	   for(int i=0; i<bankList.size(); i++){
		   System.out.println("=====원투워눝==============");
		   bankService.modify(bankList.get(i));
	   }
	  
	   return new InternalResourceView("/cardNBank/login/cardNBank.do");
   }
}