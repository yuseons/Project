package com.study.orders;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.BigIntegerTypeHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.study.contents.ContentsDTO;
import com.study.contents.ContentsService;
import com.study.member.MemberDTO;
import com.study.member.MemberService;


@Controller
public class OrderController {
  private static final Logger log = LoggerFactory.getLogger(OrderController.class);

  @Autowired
  @Qualifier("com.study.contents.ContentsServiceImpl")
  private ContentsService cservice;
  
  @Autowired
  @Qualifier("com.study.member.MemberServiceImpl")
  private MemberService mservice;

  
  @GetMapping("/order/create/cart/{cno}/{qty}/{size}") //qty = count
  public String create(@PathVariable String cno, //String으로 바꿔서 밑의 create 메소드를 오버로딩함
                       @PathVariable String qty,
                       @PathVariable String size,
                       Model model,
                       HttpSession session) {
    
    //log.info("orderController(contentsno, qty, size):"+contentsno+","+qty+","+size);
    
    //세션으로 현재 로그인 한 사람의 로그인 정보를 가져온다.
    String id = (String)session.getAttribute("id");
    
    MemberDTO mdto = mservice.read(id);
    
    String[] no = cno.split(","); //"23,21" 이 들어오면 하나하나 뽑아옴 => "23" , "21"
    
    List<ContentsDTO> list = new ArrayList<ContentsDTO>(); //상품들에 대한 정보
    
    for(int i=0; i<no.length; i++) {
      
      int contentsno = Integer.parseInt(no[i]);
      ContentsDTO dto = cservice.detail(contentsno);
      list.add(dto);
    } 
    model.addAttribute("list", list); //상품목록
    model.addAttribute("mdto", mdto); //회원정보
    model.addAttribute("qtys", qty); //수량들(order_detail 테이블에 저장, 총금액합계)
    model.addAttribute("size", size); //size들(order_detail 테이블에 저장)
    model.addAttribute("str", "cart"); //장바구니에서 바로 주문을 누른것
    model.addAttribute("cno", cno); //상품들 번호
    
      return "/order/create";
    }

  
  
  
@GetMapping("/order/create/order/{contentsno}/{qty}/{size}") //qty = count
public String create(@PathVariable int contentsno,
                     @PathVariable int qty,
                     @PathVariable String size,
                     Model model,
                     HttpSession session) {
  
  //log.info("orderController(contentsno, qty, size):"+contentsno+","+qty+","+size);
  
  //세션으로 현재 로그인 한 사람의 로그인 정보를 가져온다.
  String id = (String)session.getAttribute("id");
  
  MemberDTO mdto = mservice.read(id);
  List<ContentsDTO> list = new ArrayList<ContentsDTO>(); //상품들에 대한 정보
  ContentsDTO dto = cservice.detail(contentsno);
  list.add(dto);
  
  model.addAttribute("list", list); //상품목록
  model.addAttribute("mdto", mdto); //회원정보
  model.addAttribute("qty", qty); //수량(order_detail 테이블에 저장, 총금액합계)
  model.addAttribute("size", size); //size(order_detail 테이블에 저장)
  model.addAttribute("str", "order"); //상품 상세페이지에서 바로 주문을 누른것
  model.addAttribute("contentsno", contentsno); //단품 상품번호
  
    return "/order/create";
  }

}
