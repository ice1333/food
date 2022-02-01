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
            document.getElementById('r_zipcode').value = data.zonecode;
            document.getElementById("r_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("r_address2").focus();
        }
    }).open();
}
function goSave(){
	if($("#r_name").val().trim()==''){
		alert('상호명을 입력하세요');
		$("#r_name").focus();
		return;
	}
	if ($("#r_address").val().trim()==''){
	 alert('주소를 입력해주세요');
	 location.href(zipcode());
	 return; // 리턴은 값을가지고 돌아감 리턴폴스는 폼에 온서브밋떄문에 그냥넘어가질수도 있음
	}
	if($("#r_tel").val().trim()==''){
		alert('전화번호를 입력하세요');
		$("#r_tel").focus();
		return;
	}
	if($("#r_menu").val().trim()==''){
		alert('메뉴를 입력하세요');
		$("#r_menu").focus();
		return;
	}
	if($("#r_week").val().trim()==''){
		alert('오픈시간을 입력하세요');
		$("#r_week").focus();
		return;
	}
	if($("#r_breaktime").val().trim()==''){
		alert('브레이크타임을 입력하세요');
		$("#r_breaktime").focus();
		return;
	}
	if($("#r_holiday").val().trim()==''){
		alert('휴일을 입력하세요');
		$("#r_holiday").focus();
		return;
	}
	if($('input:radio[name=r_parking]').is(':checked')== false){
		alert('주차여부를 체크해주세요');
		$("#r_parking").focus();
		return;
	}
	if($("#r_price").val().trim()==''){
		alert('1인당 평균 가격을 입력해주세요');
		$("#r_price").focus();
		return;
	}
	if($("#r_foodtype").val().trim()==''){
		alert('업태를 입력해주세요');
		$("#r_foodtype").focus();
		return;
	}
	if($("#picture1").val().trim()==''){
		alert('메인사진을 추가해주세요');
		$("#picture1").focus();
		return;
	}
	if($("#picture2").val().trim()==''){
		alert('1번사진을 추가해주세요');
		$("#picture2").focus();
		return;
	}
	if($("#picture3").val().trim()==''){
		alert('2번사진을 추가해주세요');
		$("#picture3").focus();
		return;
	}
	if($("#picture4").val().trim()==''){
		alert('3번사진을 추가해주세요');
		$("#picture4").focus();
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
                        <h2 class="sub_title">업체등록</h2>
                            <div class="sub_line"></div>
                        <div class="image_text" >
                        
                        </div><br>
                        <div class="type_form member_join">
                        <form name="frm" id="frm" action="insert.do" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="u_no" value="${userInfo.u_no }">
                        <input type="hidden" name="r_status" value="0">
                        <p class="page_sub"><span class="ico">*</span>필수입력사항</p>
                            <table class="tbl_comm">
                                <tbody>
                                    <tr class="fst">
                                    
                                            <th>상호명<span class="ico">*
                                                </span>
                                            </th>
                                            <td>
                                                <input type="text" name="r_name" value="" id="r_name" size="30" label="이메일" >
                                            </td>
                                    
                                    </tr>
                                    <tr>
                                            <th>주소<span class="ico"><span class="screen_out"></span></span></th>
                                            <td class="field_address">
                                                <div id="selectAddress">
                                                    <input type="text" name="r_zipcode" id="r_zipcode" value=""  label="주소" style="width:40%; margin-bottom: 12px;">
                                    
                                                    <input type="text" name="r_address"id="r_address" value="" label="주소" style="margin-bottom:12px;">
                                                </div>
                                                <div id="selectAddressSub" style="padding-bottom:15px;">
                                                    <input type="text" name="r_address2" id="r_address2" value="" class="byteTotext" placeholder="나머지 주소를 입력해주세요">
                                                    
                                                </div>
                                                <a href="javascript:zipcode();" id="addressSearch" class="btn default" >주소검색</a>
                                            </td>
                                    </tr>
                                    <tr class="field_phone">
                                            <th>휴대폰<span class="ico">*<span class="screen_out">필수항목</span></span></th>
                                            <td>
                                                <div class="phone_num">
                                                    <input type="text" value="" pattern="[0-9]*" name="r_tel" id="r_tel" placeholder="숫자만 입력해주세요" class="inp"> 

                                                </div>
                                                <p class="txt_guide">
                                                    <span class="txt txt_case1"></span>
                                                </p>
                                            </td>
                                    </tr>  
                                    <tr>
                                        <th>메뉴
                                            <span class="ico">
                                                *
                                                <span class="screen_out">필수항목</span>
                                            </span>
                                        </th>
                                        <td>
                                            <input type="text" name="r_menu" id="r_menu" label="비밀번호" maxlength="16" class="reg_pw" placeholder="대표 메뉴 하나만 기제해주십쇼">
                                           
                                            </td>
                                    </tr>
                                    <tr>
                                        <th>오픈시간
                                            <span class="ico">*<span class="screen_out">
                                                필수항목
                                            </span>
                                            </span>
                                        </th>
                                        <td>
                                        <input type="text" name="r_week" value="" id="r_week" label="이름" placeholder="00:00~00:00으로 표기해주세요">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>브레이크타임
                                            <span class="ico"><span class="screen_out">
                                                필수항목
                                            </span>
                                            </span>
                                        </th>
                                        <td>
                                        <input type="text" name="r_breaktime" value="" id="r_breaktime" label="이름" placeholder="00:00~00:00으로 표기해주세요">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>휴일
                                            <span class="ico"><span class="screen_out">
                                                필수항목
                                            </span>
                                            </span>
                                        </th>
                                        <td>
                                        <input type="text" name="r_holiday" value="" id="r_holiday" label="이름" placeholder="ex)월,">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>주차
                                            <span class="ico">*<span class="screen_out">
                                                필수항목
                                            </span>
                                            </span>
                                        </th>
                                        <td>
	                                        <input type="radio" name="r_parking" id="r_parking" value="1"><spen>주차가능</spen>
	                                        <input type="radio" name="r_parking" id="r_parking" value="0"><spen>주차불가</spen>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>1인당 평균 가격
                                            <span class="ico">*<span class="screen_out">
                                                필수항목
                                            </span>
                                            </span>
                                        </th>
                                        <td>
                                        <input type="text" name="r_price" value="" id="r_price" label="이름" placeholder="숫자만 입력해주세요">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>업태명
                                            <span class="ico">*<span class="screen_out">
                                                필수항목
                                            </span>
                                            </span>
                                        </th>
                                        <td>
                                        <input type="text" name="r_foodtype" value="" id="r_foodtype" label="이름" placeholder="업태명을 입력해주세요">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th >메뉴 사진첨부 
                                            <span class="ico">* <br> 사진만 첨부해 주세요<br>(JPEG, JPG, PNG)<span class="screen_out">
                                                필수항목
                                            </span>
                                            </span>
                                        </th>
                                        <td>
                                        <div><input type="file" name="file" id="picture1"> 메인사진</div>
                                        <div><input type="file" name="file1" id="picture2"> 1번 사진</div>
                                        <div><input type="file" name="file2" id="picture3"> 2번 사진</div>
                                        <div><input type="file" name="file3" id="picture4"> 3번 사진</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div id="formSubmit" class="abc">
                                <button type="button" class="btn active btn_join" onclick="goSave();" style="height:56px;">업체 등록 승인요청</button>
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