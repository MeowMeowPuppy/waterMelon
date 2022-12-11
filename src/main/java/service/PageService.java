package service;

public class PageService {
	public static String getNavi(String url, int currentPage, int pageBlock, int totalCount ) {
		String result = "";
		
		int totalPage = totalCount / pageBlock;
		if(totalCount % pageBlock > 0)
			totalPage++;
				
		if(currentPage<= 1){
			result += "<a href='#'> </a>";
		}else{
			int tmp = currentPage - 1;
			result += "<a href='"+url + tmp+"'> <이전> ...  </a>";
		} 
		int start = 0;
		
		//i의 1/6/11/16/21/
		//5*x +1 = 1
		// currentPage가
		// 1-5
		// 6-10
		// 11-15
		if(currentPage%5 == 0)
			start = (currentPage/5 - 1) * 5 + 1;
		else
			start = currentPage/5 * 5 + 1; 
		 
	
		// 1 2 3 4 
		
		for(int i = start; i < start+5; i++){
			if(totalPage==i-1) {
				break;
			}
			if(currentPage == i)
				result += "<b> " + i + " </b>";
			else	
				result += "<a href='"+url + i+"'>  "+ i +"  </a>";
		}
		
		if(currentPage >= totalPage){
			result +="<a href='#'> </a>";
		}else{
			int tmp = currentPage + 1;
			result += "<a href='"+url + tmp+"'>  ... <다음> </a>";
		} //list.jsp?currentPage=3;
		return result;
	}
}
