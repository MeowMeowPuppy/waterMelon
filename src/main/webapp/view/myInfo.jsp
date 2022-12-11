<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfo</title>
<link rel="stylesheet" href="https://cdnimg.melon.co.kr/static/member/resource/style/o1/12/0/fqmqfvdb0gfndkyfs.css" type="text/css">
<style>
#box {
	width: 500px;
}

.inner{
	text-align: left;	
}
.wrap2{
	margin-top: 250px  !important;
}
</style>
<%	
	request.setCharacterEncoding("UTF-8");
	//비 정상적 접근 방지
	String id = (String)session.getAttribute("id");
// 	id = "user1";
	
	if(id == null){
		
		out.print("<script>alert('로그인 후 이용해주세요.'); location.href='login.jsp'</script>");
		return;
	}
		
	MemberDAO memberDao = new MemberDAO();
	MemberDTO member = memberDao.selectId(id);
	
	session.setAttribute("id", member.getId());
	session.setAttribute("name", member.getName());
	session.setAttribute("email", member.getEmail());
	session.setAttribute("birth", member.getBirth());
	session.setAttribute("mobile", member.getMobile());
	
	// 개인정보 수정할때 비밀번호 한번 입력했으면 다시 돌아갈때 비밀번호를 다시 입력하지 않도록
	String self = (String)session.getAttribute("self");
	self = "y";
	memberDao.disconnection();
	
%>
</head>
  <div id="wrap" class="wrap2">
        <div id="cont_wrap" class="clfix">
          <div id="conts_section">
            <div id="conts" class="mp_conts">
              <div class="wrap_tit_mem"  align="center">
                <h2 class="f_tit type02">내 정보</h2>
              </div>
			  <div align="center"> 
              	<div class="wrap_myinfo_main" id="box" >
                    <div class="myinfo_main v02">
                      <ul class="info_list bg_line">
                        <li>
                          <div class="inner">
                            <h4 class="highlight" id="LINK_NICK"><%=id %>님</h4>
                            <% 
                            if(self.equals("y")){ 
                            %>  <a id="update" class="btn_txt" onclick="goto('update')">
                              정보 수정<span class="icon_arrow"></span> </a>
                            <%} else { %>
                            <a id="updateChk" class="btn_txt" onclick="goto('updateChk')">
                              정보 수정<span class="icon_arrow"></span> </a>
                            <%} %> 
                          </div>
                        </li>
                        <li>
                          <div class="inner">
                            <h4>이용권 정보</h4>
                            <a onclick="goto('ticket')" class="btn_txt">
                                보기<span class="icon_arrow"></span>
                            </a>
                          </div>
                        </li>
                        <li>
                          <div class="inner">
                            <h4>수박 탈퇴</h4>
                            <a onclick="goto('deleteChk')" class="btn_txt">
                              탈퇴<span class="icon_arrow"></span>
                            </a>
                          </div>
                        </li>
                      </ul>
                    </div>
              	</div>
              </div>
            </div>
          </div>
        </div>
  </div>
