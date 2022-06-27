package com.study.orders;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.orders.OrderServiceImpl")
public class OrderServiceImpl implements OrderService {

  @Autowired
  private OrderMapper mapper;
  
  @Override
  public void create(OrdersDTO dto) throws Exception {

    mapper.createOrder(dto); //dto에 orderno가 들어온다.
    int orderno = dto.getOrderno();//여기서 orderno를 꺼내와서
    System.out.println(orderno);
    
    List<OrderdetailDTO> list = dto.getList(); //dto에 add했던걸 여기서 꺼내옴
    
    for(int i=0; i<list.size(); i++) {
      OrderdetailDTO odto = list.get(i);
      odto.setOrderno(orderno); //위에서 꺼낸 orderno를 여기서 넣어준다(주문detail에저장할 주문번호)
      System.out.println(odto);
      mapper.createDetail(odto);
    }
  }

  @Override
  public List<OrdersDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public int total(Map map) {
    // TODO Auto-generated method stub
    return mapper.total(map);
  }

}
