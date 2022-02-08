<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <link rel="stylesheet" href="/res/css/user/user_common.css"/>
    <link href="<%=request.getContextPath()%>/css/user/join.css" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/res/js/user_zipcode.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>회원가입</title>
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
    </script>
<script>
function goSave(){
	if($("#u_uemail").val().trim()==''){
		alert('이메일 입력하세요');
		$("#u_uemail").focus();
		return;
	}
	var con =true; 
	$.ajax({
		url: '/res/user/emailCheck.do',
		data : {
			u_uemail : $("#u_uemail").val()
		},
		async:false, 
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
	 return; 
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
	if($("#u_tel").val().trim()==''){
		alert('전화번호를 입력하세요');
		$("#u_tel").focus();
		return;
	}
	$("#frm").submit();
	}

</script>
<body>
    <div class="wrap">
	
	<%@ include file="/WEB-INF/view/include/user_header.jsp" %>
        <div class="main">
            <div class="content">
                <div class="sub">
                    <div class="size">
                        <h2 class="sub_title">회원가입</h2>
                            <div class="sub_line"></div>
                        <div class="image_text" >
                        </div><br>
                        <div class="type_form member_join">
                        <form name="frm" id="frm" action="insert.do" method="post">
                        <p class="page_sub"><span class="ico">*</span>필수입력사항</p>
                            <table class="tbl_comm">
                                <tbody>
                                    <tr class="fst">
                                            <th>이메일<span class="ico">*
                                                <span class="screen_out">필수항목</span>
                                                </span>
                                            </th>
                                            <td>
                                                <input type="text" name="u_uemail" value="" id="u_uemail" size="30" label="이메일 / 아이디" >
                                                <a href="#;" id="emailCheckBtn" class="btn default" style="position:absolute;">중복확인</a>
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
                                            <input type="password" name="u_pwd" id="u_pwd" label="비밀번호" maxlength="16" class="reg_pw" placeholder="비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요.">
                                            </td>
                                    </tr>
                                    <tr class="member_pwd">
                                        <th>비밀번호확인<span class="ico">*<span class="screen_out">필수항목</span></span></th>
                                            <td>
                                                <input type="password" name="pw_check" id="pw_check" label="비밀번호" maxlength="16" class="confirm_pw" placeholder="비밀번호를 한번 더 입력해주세요">
                                            </td>
                                            <th class="" id="alerts">비밀번호 일치</th>
                                            <th class="" id="alertw">비밀번호 불일치.</th>
                                    </tr>
                                        <tr>
                                            <th>이름
                                                <span class="ico">*<span class="screen_out">
                                                    필수항목
                                                </span>
                                                </span>
                                            </th>
                                            <td>
                                            <input type="text" name="u_name" value="" id="u_name" label="이름" placeholder="이름을 입력해주세요">
                                            </td>
                                        </tr>
                                       
                                        <tr class="field_phone">
                                            <th>휴대폰<span class="ico">*<span class="screen_out">필수항목</span></span></th>
                                            <td>
                                                <div class="phone_num">
                                                    <input type="text" value="" pattern="[0-9]*" name="u_tel" id="u_tel" placeholder="숫자만 입력해주세요" class="inp"> 
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
                                                    <input type="text" name="u_zuocide" id="u_zuocide" value=""  label="주소" style="width:40%; margin-bottom: 12px;">
                                                    <input type="text" name="u_addr1"id="u_addr1" value="" label="주소" style="margin-bottom:12px;">
                                                </div>
                                                <div id="selectAddressSub" style="padding-bottom:15px;">
                                                    <input type="text" name="u_addr2" id="u_addr2" value="" class="byteTotext" placeholder="나머지 주소를 입력해주세요">
                                                </div>
                                                <a href="javascript:zipcode();" id="addressSearch" class="btn default" >주소검색</a>
                                            </td>
                                        </tr>
                                        <tr class="select_sex">
                                            <th>성별</th>
                                            <td>
                                                <label class="">
                                                	<select name="u_gender" id="u_gender">
                                                        <option value="1">남자</option>
                                                        <option value="2">여자</option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                </tbody>
                            </table>
                            <input type="hidden" name="cmd" value="write.do"/>
                        	<input type="hidden" name="checkEmail" id="checkEmail" value="0"/>
                            <div id="formSubmit" class="abc">
                                <button type="button" class="btn active btn_join" onclick="goSave();" style="height:56px;">가입하기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            </div>
         </div>
         <%@ include file="/WEB-INF/view/include/user_footer.jsp" %>
    </div> 
</body>
</html>