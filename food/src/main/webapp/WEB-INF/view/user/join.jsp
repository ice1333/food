<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
   <link rel="stylesheet" href="/res/css/user/user_common.css"/>
    <link href="<%=request.getContextPath()%>/css/user/join.css" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function zipcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                addr += extraAddr;
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('u_zuocide').value = data.zonecode;
            document.getElementById("u_addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("u_addr2").focus();
        }
    }).open();
}
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
                                                <input type="text" name="u_uemail" value="" id="u_uemail" size="30" label="이메일" >
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