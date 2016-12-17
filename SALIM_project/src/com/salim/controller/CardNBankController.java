package com.salim.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.salim.service.CardNBankService;
import com.salim.vo.Bank;
import com.salim.vo.BankForm;
import com.salim.vo.Card;
import com.salim.vo.CardForm;
import com.salim.vo.Collect;
import com.salim.vo.Member;

@Controller
@RequestMapping("/cardNBank/")
public class CardNBankController {

   @Autowired
   private CardNBankService CNBService;

   //카드 추가
   @RequestMapping(value="login/cardAdd.do", method=RequestMethod.POST)
   public String add(String cardNaming, String bankList1, HttpSession session, ModelMap modelmap){
	   String memberId = checkMemberId(session);
	   CNBService.addCard(new Card(memberId, 0, bankList1, cardNaming));
	   return "redirect:/cardNBank/login/cardNBankSelect.do";
   }
   
   //카드삭제
   @RequestMapping(value="login/cardRemove.do")
   public String delete(@RequestParam ArrayList<Integer> cardIdList, HttpSession session, ModelMap modelmap){
	   String memberId = checkMemberId(session);
	   modelmap.addAllAttributes(CNBService.deleteCard(cardIdList, memberId));
	   return "body/cardNBank.tiles";
   }
   
   //카드조회&통장조회
   @RequestMapping(value="login/cardNBankSelect.do")
   public String select(HttpSession session, ModelMap modelmap){
	   String memberId = checkMemberId(session);
	   modelmap.addAllAttributes(CNBService.findCardNBankbook(memberId));
	   return "body/cardNBank.tiles";
   }
   
   //카드 수정   
   @RequestMapping(value="login/cardModify.do")
   public String update(@ModelAttribute CardForm cardForm, HttpSession session, ModelMap modelmap){
	   String memberId = checkMemberId(session);
	   modelmap.addAllAttributes(CNBService.modifyCard(cardForm, memberId));
	   return "body/cardNBank.tiles";
   }
 
   //통장 추가
   @RequestMapping(value="login/bankAdd.do", method=RequestMethod.POST)
   public String insert(String bankNaming, String bankList2, HttpSession session, ModelMap modelmap){
	   String memberId = checkMemberId(session);
	   CNBService.addBankbook(new Bank(memberId, 0, bankList2, bankNaming));
	  return "redirect:/cardNBank/login/cardNBankSelect.do";
   }
   
   //통장 삭제
   @RequestMapping(value="login/bankRemove.do")
   public String delete2(@RequestParam ArrayList<Integer> bankIdList, HttpSession session, ModelMap modelmap){
	   String memberId = checkMemberId(session);
	   modelmap.addAllAttributes(CNBService.deleteBankbook(bankIdList, memberId));
	   return "body/cardNBank.tiles";
   }
   
   //통장 수정
   @RequestMapping(value="login/bankModify.do")
   public String update2(@ModelAttribute BankForm bankForm, HttpSession session, ModelMap modelmap){
	   String memberId = checkMemberId(session);
	   modelmap.addAllAttributes(CNBService.modifyBankbook(bankForm, memberId));
	   return "body/cardNBank.tiles";
   }

   
	//그룹인지 개인인지 판별 - 다 되면 링크 정리하고 처리하자...
	public String checkMemberId(HttpSession session){
		String memberId = null;
		Collect collect = (Collect) session.getAttribute("group_info");
		if(collect != null){
			memberId = collect.getCollectionId();
		}else{
			memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		}
		return memberId;
	}
   
}