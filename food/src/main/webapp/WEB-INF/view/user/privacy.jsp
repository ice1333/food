<%@ page language="java" 
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <link href="<%=request.getContextPath()%>/css/user/user_common.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/css/user/user_privacy.css" rel="stylesheet" type="text/css"/>
    <title>회원가입</title>
   	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   	<script src="/res/js/user_zipcode.js"></script>
</head>
<script>
	$(function(){
			$("#emailCheckBtn").click(function(){
				if ($("#u_uemail").val().trim() == ''){
					alert('이메일을 입력해주세요.');
					$("#u_uemail").focus();
				} else {
					$.ajax({
						url: '/res/user/emailCheck.do',
						data : {
							u_uemail : $("#u_uemail").val()
						},
						async:false,
						success:function(aaa) {
						 if(aaa.trim()=='1'){
							 alert('중복된 이메일입니다.');
							 $("#u_uemail").focus();
						 }	else {
							 alert("사용가능한 이메일 입니다.");
							
						 }
						}
					})
				}
			});
		});

$(function(){
	$("#alerts").hide();
	$("#alertw").hide();
	$("input").keyup(function(){ 
	var pwd1=$("#u_pwd").val();
	var pwd2=$("#pw_check").val();
	if(pwd1 != "" || pwd2 != ""){ if(pwd1 == pwd2){
		$("#alerts").show();
		$("#alertw").hide();
		$("#submit").removeAttr("disabled");
		}else{ 
			$("#alerts").hide();
			$("#alertw").show();
			$("#submit").attr("disabled", "disabled");
			}
	}
	});
	});
function goSave(){
	if($("#u_uemail").val()==''){
		alert('이메일 입력하세요');
		$("#u_uemail").focus();
		return;
	}
	var con =true; 
	$.ajax({
		url: '/res/user/update.do',
		data : {
			u_uemail : $("#u_uemail").val()
		},
		async:false, // true가되면 순서가 아무거나시작댐
		success:function(res) {
		 if(res.trim()=='1'){
			 alert('중복된 이메일입니다.');
			 $("#u_uemail").val("");
			 $("#u_uemail").focus();
			 con =false;
		  }	
		}
	})
	if(con==false) return;
	if ($("#u_pwd").val().trim()==''){
	 alert('비밀번호를 입력');
	 $("#u_pwd").focus();
	 return; // 리턴은 값을가지고 돌아감 리턴폴스는 폼에 온서브밋떄문에 그냥넘어가질수도 있음
	}
	var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	if( !reg.test($("#u_pwd").val()) ) {
	    alert("비밀번호는 문자+숫자 8자이상 입력");
	    $("#u_pwd").focus();
	    return false;
	}
	if ($("#u_pwd").val() != $("#pw_check").val()) {
		alert("비밀번호가 일치하지않습니다.");
		return;
	}
	if($("#u_name").val().trim()==''){
		alert('이름을 입력하세요');
		$("#u_name").focus();
		return;
	}
	if($("#u_tel").val()==''){
		alert('전화번호를 입력하세요');
		$("#u_tel").focus();
		return;
	}
	$("#frm").submit();
	}

</script>
<script>
function goUpdate(){
	if(confirm("정말 탈퇴하시겠습니까?")){
	$.ajax({
		url: '/res/user/logdate.do',
		data : {
			u_no : $("#u_no").val()
		},
		async:false, 
		success:function() {
			 alert('정상적으로 탈퇴되었습니다.');
		}
	});
	$("#logfrm").submit();
	} else {
		alert("취소하였습니다.")
	}
}
</script>
<html>
<body>
    <div class="wrap">
    <%@ include file="/WEB-INF/view/include/user_header.jsp" %>
        <div class="container" style="width: 1200px; top:50px; margin: 40px auto; overflow: hidden;">
            <div class="menulist">
                <h2 class="menu_title">마이페이지</h2>
                <div class="inner_sub">
                    <ul id="adlist">
                        <li><a href="/res/user/mypage/mylist.do">최근 본 매장</a></li>
                        <li><a href="/res/user/mypage/myLove.do">찜 목록</a></li>
                        <li><a href="/res/user/privacy.do">개인 정보 수정</a></li>
                        <li><a href="/res/user/mypage/myComment">내가 쓴 댓글</a></li>
                        <li><a href="/res/shop/join.do">매장등록</a></li>
                    </ul>
                </div>
            </div>
            <div class="main">
                <div class="content">
                    <div class="sub">
                        <div class="size">
                            
                            <h2 class="sub_title">개인정보 수정</h2>
                                <div class="type_form member_join">
                                <form name="frm" id="frm" action="update.do" method="post">
                                <input type="hidden" name="u_no" value="${userInfo.u_no}"/>
                                <p class="page_sub"><span class="ico">*</span>필수입력사항</p>
                                    <table class="tbl_comm">
                                        <tbody>
                                            <tr class="fst">
                                                
                                                <th>이메일<span class="ico">*
                                                    <span class="screen_out">필수항목</span> 
                                                    </span>
                                                </th>
                                                <td>
                                                    <input type="text" name="u_uemail" id="u_uemail" value="${userInfo.u_uemail}" size="30"  label="이메일 / 아이디" disabled>
                                                    
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <th>비밀번호
                                                    <span class="ico">
                                                        *
                                                        <span class="screen_out">필수항목</span>
                                                    </span>
                                                </th>
                                                <td>
                                                    <input type="password" name="u_pwd" id="u_pwd" label="비밀번호" maxlength="16" class="reg_pw" value="">
                                                    </td>
                                            </tr>
                                            <tr class="member_pwd">
                                                <th>비밀번호확인<span class="ico">*<span class="screen_out">필수항목</span></span></th>
                                                    <td>
                                                       <input type="password" name="pw_check" id="pw_check" label="비밀번호" maxlength="16" class="confirm_pw" value="">
                                                       <th class="" id="alerts">비밀번호가 일치합니다.</th>
                                                       <th class="" id="alertw">비밀번호가 일치하지 않습니다.</th>
                                                    </td>
                                            </tr>
                                                <tr>
                                                    <th>이름
                                                        <span class="ico">*<span class="screen_out">
                                                            필수항목
                                                        </span>
                                                        </span>
                                                    </th>
                                                    <td>
                                                    <input type="text" name="u_name" id="u_name" value="${userInfo.u_name}" label="이름">
                                                    </td>
                                                </tr>
                                            
                                                <tr class="field_phone">
                                                    <th>휴대폰<span class="ico">*<span class="screen_out">필수항목</span></span></th>
                                                    <td>
                                                        <div class="phone_num">
                                                            <input type="text" value="${userInfo.u_tel}" pattern="[0-9]*" name="u_tel" class="inp"> 

                                                        </div>
                                                        <p class="txt_guide">
                                                            <span class="txt txt_case1"></span>
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>주소<span class="ico"><span class="screen_out"></span></span></th>
                                                    <td class="field_address">
                                                        <div id="selectAddress">
                                                            <input type="text" name="u_zuocide" id="u_zuocide" value="${userInfo.u_zuocide}"  label="주소" style="width:40%; margin-bottom: 12px;">
                                            
                                                            <input type="text" name="u_addr1"id="u_addr1" value="${userInfo.u_addr1}" label="주소" style="margin-bottom:12px;">
                                                        </div>
                                                        <div id="selectAddressSub">
                                                            <input type="text" name="u_addr2" id="u_addr2" value="${userInfo.u_addr2}" class="byteTotext" placeholder="나머지 주소를 입력해주세요">
                                                            
                                                        </div>
                                                        <a href="javascript:zipcode();" id="addressSearch" class="btn default" onclick="">주소검색</a>
                                                    </td>
                                                </tr>
                                             <tr class="select_sex">
                                                    <th>성별</th>
                                            	<td>
                                                	<label class="">
                                                		<select name="u_gender" id="u_gender" value="${userInfo.u_gender}">
                                                       	 	<option value="1">남자</option>
                                                       	 	<option value="2">여자</option>
                                                    	</select>
                                                	</label>
                                                </td>
                                             </tr>
                                        </tbody>
                                    </table>
                                    <div id="formSubmit" class="abc">
                                        <button type="button" class="btn default" onclick="history.back();" style="width: 240px;
                                        height: 56px;
                                        font-size: 16px;
                                        line-height: 54px;">취소</button>
                                        <button type="button" class="btn active btn_join" onclick="goSave();">확인</button>
                                    </div>
                                </form> 
                                <form name="logfrm" id="logfrm" action="logupdate.do" method="get">
                                	<div id="formSubmit" class="abc">
                                		<a href="javascript:goUpdate();" class="btn default">회원 탈퇴</a>
                                		<input type="hidden" name="u_no" id="u_no" value="${userInfo.u_no}"/>
                                	</div>
                               	</form>
                            </div>
                    	</div>
                	</div>
            	</div>
        	</div>
    	</div>
    <%@ include file="/WEB-INF/view/include/user_footer.jsp" %>
   </div>      
</body>
</html>
