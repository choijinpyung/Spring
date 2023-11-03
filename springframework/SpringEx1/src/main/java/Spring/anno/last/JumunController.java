package Spring.anno.last;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class JumunController {
	
	@Autowired
	ShopInter shopInter;
	
	int cnt=10;
	String name="홍성경";
	
	public void insertJumun(String sang,int price,String color) {
		shopInter.insertSangpum(sang, cnt, color);
		System.out.println(name+"님이 "+cnt+"개를 주문함!!!");
	}
	
	public void deleteJumun(String num) {
		
		shopInter.deleteSangpum(num);
	}
	
	public void selectJumun(String sang,int price,String color) {
		
		System.out.println("주문자: "+name);
		shopInter.selectShop(sang, price, color);
		System.out.println("주문갯수: "+cnt);
	}
}
