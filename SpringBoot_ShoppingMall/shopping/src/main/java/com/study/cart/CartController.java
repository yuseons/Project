package com.study.cart;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CartController {
  private static final Logger log = LoggerFactory.getLogger(CartController.class);
  
  @Autowired
  @Qualifier("com.study.cart.CartServiceImpl")
  private CartService service;
  
  
  @GetMapping("/cart/delete/{cartno}")
  public String delete(@PathVariable int cartno) {
    
    service.delete(cartno);
    
    return "redirect:/cart/list";
  }
  
  @GetMapping("/cart/list")
  public String list(HttpSession session, Model model) {
    
    String id = (String)session.getAttribute("id");
    
    model.addAttribute("list", service.list(id)); //id를 list에 담아서 list페이지로 보냄
    
    return "/cart/list";
  }
  
  
  
  @PostMapping("/cart/create")
  @ResponseBody
  public String create(@RequestBody CartDTO dto, HttpSession session) {
   
      String id = (String)session.getAttribute("id");
      dto.setId(id);
      
      log.info("dto:"+dto); //dto에 잘 들어갔나 출력 확인
   
      int cnt = service.create(dto);
      if(cnt==1) { //담기 성공
        return "장바구니에 담았습니다.";
      }else {
        return HttpStatus.INTERNAL_SERVER_ERROR.toString(); //어떠한 에러가 났는지 알려줌(숫자이므로 toString으로 문자열 리턴)
      }
  }
  
}
