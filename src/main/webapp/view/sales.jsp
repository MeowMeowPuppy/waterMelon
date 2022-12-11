<%@page import="service.SalesService"%>
<%@page import="DTO.VoucherDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.VoucherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출</title>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}
body {
	margin-left: 280px;
}
labels {
 	font-size:30px;
 	font-weight:bold;
}
label{
	font-size:30px;
	font-weight:bold;
}
.container {
    width: 500px;
    padding-right: 15px;
    padding-left: 15px;
    margin : auto;

}

#wrap2{
	margin-top: 15%;
	display: flex;
	align-items: center;
	justify-content: center;
}
.month {
	width: 600px;
}
.voucher{
	width: 600px;
}

</style>
<link rel="stylesheet" href="https://cdnimg.melon.co.kr/services/css/myinfo-a743942740.css" type="text/css">
 <!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> 

 
</head>
<body>
<%
String one = "";
VoucherDAO voucher = new VoucherDAO();
double total = voucher.count();
double One = voucher.count("1");
double Three = voucher.count("3");
double Six = voucher.count("6");
double Twelve = voucher.count("12");

double month1 =  (int)(One/total *100);
double month3 =  (int)(Three/total * 100);
double month6 =  (int)(Six/total * 100);
double month12 = (int)(Twelve/total * 100);

ArrayList<Integer> sales = SalesService.income();

%>
<aside class="side-myinfo">
	<strong class="">
		<a href="main.jsp" class="" title="WaterMelon 로고 - 홈으로 이동">
			<img src="../img/logo.png"  width="200px">
		</a>
	</strong>
	<nav class="side-menu">
		<ul class="list-lnb">
			<li class="">
				<a href="manager.jsp" class="link-lnb">
					<span class="txt-link">회원 정보관리</span>
				</a>
			</li>
			<li class="" >
				<a href="../view/upload.jsp" class="link-lnb">
					<span class="txt-link">음원 관리</span>
				</a>
			</li>
			<li class="on" >
				<a href="../view/sales.jsp" class="link-lnb">
					<span class="txt-link">매출</span>
				</a>
			</li>
		</ul>
		<ul class="list-lnb">
			<li>
				<a href="../service/logoutService.jsp" class="link-lnb">
					<span class="txt-lnb">로그아웃</span>
				</a>
			</li>
		</ul>
	</nav>
</aside>

<div id="wrap2">
<div class="month" style="text-align:center">
  	<h4>월 매출 도표</h4>
    <canvas id="myChart"></canvas>
</div>
 
<div class="voucher">
        <div class="row my-3">
            <div class="col-12" style="text-align:center">
            	<h4>이용권 비율</h4>
            </div>
        </div>
        <div class="row my-2">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <canvas id="myChart1"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 차트 -->
<script>
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
					'10월', '11월', '12월' ],
			datasets : [ {
				label : "",
				pointStrokeColor: "#fff",
				pointHighlightFill: "#fff",
				data : [ <%=sales.get(0)%>, <%=sales.get(1)%>, <%=sales.get(2)%>, <%=sales.get(3)%>, <%=sales.get(4)%>, <%=sales.get(5)%>, <%=sales.get(6)%>, <%=sales.get(7)%>, <%=sales.get(8)%>, <%=sales.get(9)%>, <%=sales.get(10)%>, <%=sales.get(11)%> ],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(051, 051, 51, 0.2)', 'rgba(000, 153, 204, 0.2)',
						'rgba(153, 051, 204, 0.2)', 'rgba(204, 102, 51, 0.2)',
						'rgba(051, 153, 102, 0.2)', 'rgba(255, 99, 132, 0.2)',
						'rgba(0, 99, 132, 0.2)', 'rgba(102, 255, 0, 0.2)',
						'rgba(153, 0, 0, 0.2)', 'rgba(0, 0, 51, 0.2)',
						'rgba(102, 99, 12, 0.2)', ],
				borderColor : [ 'rgba(255, 99, 132, 1)',
						'rgba(051, 051, 51, 1)', 'rgba(000, 153, 204, 1)',
						'rgba(153, 051, 204, 1)', 'rgba(204, 102, 51, 1)',
						'rgba(051, 153, 102, 1)', 'rgba(255, 99, 132, 1)',
						'rgba(0, 99, 132, 1)', 'rgba(102, 255, 0, 1)',
						'rgba(153, 0, 0, 1)', 'rgba(0, 0, 51, 1)',
						'rgba(102, 99, 12, 1)', ],
				borderWidth : 1
			} ]
		},
		options : {
		                legend: {
		                    display: false
		                },
					scales:{
						yAxes:[
								{ticks:
									{beginAtZero:true}
								}
							]
		            }
	            }
		});

	
	data = {
		datasets : [ {
			backgroundColor : [ 'rgba(255, 99, 132, 1)', 'rgba(000, 153, 204, 1)', 'rgba(102, 255, 0, 1)', 'rgba(153, 051, 204, 1)' ],
			data : [<%=month1%> , <%=month3%>, <%=month6%>, <%=month12%>]
		} ],
		// 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
		labels : [ '1개월 이용권', '3개월 이용권', '6개월 이용권', '12개월 이용권' ]
	};
	
	
	// 파이형 차트
	var ctx1 = document.getElementById("myChart1");
	var myPieChart = new Chart(ctx1, {
		type : 'pie',
		data : data,
		options : {}
	});
</script>
</body>
</html>