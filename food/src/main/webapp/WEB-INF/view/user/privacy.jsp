<%@ page language="java" 
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <link href="<%=request.getContextPath()%>/css/user/user_common.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/css/user/user_privacy.css" rel="stylesheet" type="text/css"/>
    <title>회원가입</title>
</head>
<html>
<body>
    <div class="wrap">
    <%@ include file="/WEB-INF/view/include/user_header.jsp" %>
        <div class="container" style="width: 1200px; top:50px; margin: 15px auto; overflow: hidden;">
            <div class="menulist">
                <h2 class="menu_title">마이페이지</h2>
                <div class="inner_sub">
                    <ul id="adlist">
                        <li><a href="">최근 본 매장</a></li>
                        <li><a href="">찜 목록</a></li>
                        <li><a href="">개인 정보 수정</a></li>
                        <li><a href="">내가 쓴 댓글</a></li>
                    </ul>
                </div>
            </div>
            <div class="main">
                <div class="content">
                    <div class="sub">
                        <div class="size">
                            
                            <h2 class="sub_title">개인정보 수정</h2>
                                <div class="type_form member_join">
                                <form name="frm" id="frm" action="insert.do" method="post" enctype="multipart/form-data">
                                <p class="page_sub"><span class="ico">*</span>필수입력사항</p>
                                    <table class="tbl_comm">
                                        <tbody>
                                            <tr class="fst">
                                                
                                                <th>이메일<span class="ico">*
                                                    <span class="screen_out">필수항목</span>
                                                    </span>
                                                </th>
                                                <td>
                                                    <input type="text" name="email" value="" size="30" required="" option="regEmail" label="이메일" placeholder="예: biblr@naver.com">
                                                    <input type="hidden" name="chk_email" label="이메일중복체크">
                                                    <a href="javascript:" onclick="chkEmail()" class="btn default">중복확인</a>
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
                                                    <input type="password" name="password" required="" fld_esssential="" option="regPass" label="비밀번호" maxlength="16" class="reg_pw" placeholder="비밀번호를 입력해주세요">
                                                    <p class="txt_guide square">
                                                    <span class="txt txt_case1">10자 이상 입력</span>
                                                    <span class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합</span>
                                                    <span class="txt txt_case3">동일한 숫자 3개 이상 연속 사용 불가</span>
                                                    </p>
                                                    </td>
                                            </tr>
                                            <tr class="member_pwd">
                                                <th>비밀번호확인<span class="ico">*<span class="screen_out">필수항목</span></span></th>
                                                    <td>
                                                        <input type="password" name="password2" option="regPass" label="비밀번호" maxlength="16" class="confirm_pw" placeholder="비밀번호를 한번 더 입력해주세요">
                                                        <p class="txt_guide square">
                                                        <span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
                                                        </p>
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
                                                    <input type="text" name="name" value="" required="" fld_esssential="" label="이름" placeholder="이름을 입력해주세요">
                                                    </td>
                                                </tr>
                                            
                                                <tr class="field_phone">
                                                    <th>휴대폰<span class="ico">*<span class="screen_out">필수항목</span></span></th>
                                                    <td>
                                                        <div class="phone_num">
                                                            <input type="text" value="" pattern="[0-9]*" name="mobileInp" placeholder="숫자만 입력해주세요" class="inp"> 

                                                        </div>
                                                        <p class="txt_guide">
                                                            <span class="txt txt_case1"></span>
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>주소<span class="ico">*<span class="screen_out">필수항목</span></span></th>
                                                    <td class="field_address">
                                                            
                                                            <input type="hidden" name="zipcode[]" id="zipcode0" size="3" value="">
                                                        <div id="selectAddress">
                                                            <input type="text" name="zipcode" id="zipcode" value=""  label="주소" style="width:40%; margin-bottom: 12px;">
                                            
                                                            <input type="text" name="addr1"id="addr1" value="" label="주소" style="margin-bottom:12px;">
                                                        </div>
                                                        <div id="selectAddressSub">
                                                            <input type="text" name="addr2" id="addr2" value="" class="byteTotext" placeholder="나머지 주소를 입력해주세요">
                                                            
                                                        </div>
                                                        <a href="" id="addressSearch" class="btn default" onclick="">주소검색</a>
                                                    </td>
                                                </tr>
                                                <tr class="select_sex">
                                                    <th>성별</th>
                                                    <td>
                                                        <label class="">
                                                                <input type="checkbox" name="sex" value="1">
                                                                <span class="ico"></span>남자
                                                            </label>
                                                        <label class="">
                                                                <input type="checkbox" name="sex" value="2">
                                                                <span class="ico"></span>여자
                                                        </label>
                                                    </td>
                                                </tr>
                                        </tbody>
                                    </table>
                                    <div id="formSubmit" class="abc">
                                        <button type="button" class="btn default" onclick="" style="width: 240px;
                                        height: 56px;
                                        font-size: 16px;
                                        line-height: 54px;">취소</button>
                                        <button type="button" class="btn active btn_join" onclick="">확인</button>
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
