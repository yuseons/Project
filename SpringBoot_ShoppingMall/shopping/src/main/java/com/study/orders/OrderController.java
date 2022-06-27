package com.study.orders;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.cart.CartService;
import com.study.contents.ContentsDTO;
import com.study.contents.ContentsService;
import com.study.member.MemberDTO;
import com.study.member.MemberService;
import com.study.utility.Utility;


@Controller
public class OrderController {
  private static final Logger log = LoggerFactory.getLogger(OrderController.class);

  @Autowired
  @Qualifier("com.study.contents.ContentsServiceImpl")
  private ContentsService cservice;
  
  @Autowired
  @Qualifier("com.study.member.MemberServiceImpl")
  private MemberService mservice;

  @Autowired
  @Qualifier("com.study.orders.OrderServiceImpl")
  private OrderService service;

  @Autowired
  @Qualifier("com.study.cart.CartServiceImpl")
  private CartService cartservice;
  
  
  @RequestMapping("/admin/order/list")
  public String list(HttpServletRequest request) {
    
    // 검색관련------------------------
    String col = Utility.checkNull(request.getParameter("col"));
    String word = Utility.checkNull(request.getParameter("word"));

    if (col.equals("total")) {
      word = "";
    }

    // 페이지관련-----------------------
    int nowPage = 1;// 현재 보고있는 페이지
    if (request.getParameter("nowPage") != null) {
      nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
    int recordPerPage = 5;// 한페이지당 보여줄 레코드갯수

    // (mysql) DB에서 가져올 순번-----------------
    int sno = (nowPage - 1) * recordPerPage;
    int eno = recordPerPage;

    Map map = new HashMap();
    map.put("col", col);
    map.put("word", word);
    map.put("sno", sno);
    map.put("eno", eno);

    int total = service.total(map);

    List<OrdersDTO> list = service.list(map);

    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

    // request에 Model사용 결과 담는다
    request.setAttribute("list", list);
    request.setAttribute("nowPage", nowPage);
    request.setAttribute("col", col);
    request.setAttribute("word", word);
    request.setAttribute("paging", paging);

    return "/order/list";

  }  
  
  
  @PostMapping("/order/create/{str}")
  public String create(@PathVariable String str,
                      int tot, String payment, String reqtext,
                      HttpServletRequest request, HttpSession session) {
    
    String id = (String)session.getAttribute("id");
    String mname = (String)session.getAttribute("mname");
    
    //받아온 값을 ordersDTO에 넣어줌
    OrdersDTO dto = new OrdersDTO();
    dto.setId(id);
    dto.setMname(mname);
    dto.setTotal(tot);
    dto.setPayment(payment);
    dto.setReqtext(reqtext);
    
    List<OrderdetailDTO> list = new ArrayList<OrderdetailDTO>();
    
    if(str != null && str.equals("cart")) {
      String cno = request.getParameter("cno"); //상품번호들
      String qty = request.getParameter("qtys"); //수량들
      String size = request.getParameter("size"); //사이즈들
      
      String[] no = cno.split(","); //상품번호들을 하나씩 꺼내옴(문자열)
      for(int i=0; i<no.length; i++) {
        int contentsno = Integer.parseInt(no[i]); //no를 정수형으로 변환
        ContentsDTO cdto = cservice.detail(contentsno);
        
        //OrderdetailDTO에 넣어줌
        OrderdetailDTO ddto = new OrderdetailDTO();
        ddto.setContentsno(contentsno);
        ddto.setPname(cdto.getPname());
        ddto.setQuantity(Integer.parseInt(qty.split(",")[i])); //수량
        ddto.setSize(size.split(",")[i]); //사이즈
        
        list.add(ddto); //for문을 돌면서 order 1개당 여러개의 orderdetail이 생성
      }
      
    }else if(str.equals("order")){
     int contentsno = Integer.parseInt(request.getParameter("contentsno"));
     ContentsDTO cdto = cservice.detail(contentsno);
     
     OrderdetailDTO ddto = new OrderdetailDTO();
     ddto.setContentsno(contentsno);
     ddto.setPname(cdto.getPname());
     ddto.setQuantity(Integer.parseInt(request.getParameter("qty"))); //수량
     ddto.setSize(request.getParameter("size")); //사이즈
     
     list.add(ddto);
    }
    
    dto.setList(list); //ordersDTO에 oderdetailDTO를 담음
    
    try {
      service.create(dto); //주문처리 (dto : ordersDTO)
      if(str.equals("cart"))
        cartservice.deleteAll(id); //주문이 되면 장바구니를 모두 비워줌
        
        return "redirect:/member/mypage";
        
    } catch (Exception e) {//오류
      // TODO Auto-generated catch block
      e.printStackTrace();
      
      return "error";
    } 
  }
  
  
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
