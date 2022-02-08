<%@ page contentType="text/html; charset=utf-8" %>
<title>PROJECT</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link href="<%=request.getContextPath()%>/css/admin/basic.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/admin/layout.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/admin/board.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/admin/manage.css" rel="stylesheet" type="text/css" />

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"></script>
<style type="text/css">
.pagenate {width:100%; clear:both;}
.pagenate {text-align:center; margin:20px auto 0;}
.pagenate li {display:inline-block;}
.pagenate li:first-child { margin-left:0px; }
.pagenate li a{display:inline-block; text-decoration:none; padding:0; width:30px; height:30px; line-height:30px; border:1px solid #c7c8cc; box-sizing:border-box; margin-left:-1px; vertical-align:middle;}
.pagenate li a:hover{background:#f6f6f6; font-weight:bold; text-decoration:none !important;}
.pagenate li a.board { text-indent:-9999em; margin-left:4px; }
.pagenate li a.board.first {background:#f3f3f3 url('/img/ico_first.png') no-repeat center center;}
.pagenate li a.board.prev {margin-right:30px; background:#efefef url('/img/ico_prev.png') no-repeat center center;}
.pagenate li a.board.next {margin-left:30px; background:#efefef url('/img/ico_next.png') no-repeat center center;}
.pagenate li a.board.last {background:#f3f3f3 url('/img/ico_last.png') no-repeat center center;}
.pagenate li a.current {color:#fff; background-color:#221f1f; font-weight:bold;  border:1px solid #221f1f;}
</style>