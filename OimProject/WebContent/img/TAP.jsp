<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> <script src="http://code.jquery.com/jquery-latest.min.js"></script> <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> <script> $(document).ready(function() { $('a[data-toggle="tab"]').on('hidden.bs.tab', function(e){ alert("이벤트 실행됨"); }); }); </script>

</head>
<body>
<div class="container"> 
<h2>탭</h2> 
<ul id="myTab" class="nav nav-tabs" role="tablist"> 
<li role="presentation" class="active">
<a data-target="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Home</a>
</li> 
<li role="presentation" class="">
<a data-target="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">Profile</a>
</li> 
<li role="presentation" class="dropdown"> 
<a data-target="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown" aria-controls="myTabDrop1-contents">Dropdown 
<span class="caret">
</span>
</a> 
<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1" id="myTabDrop1-contents">
<li>
<a data-target="#dropdown1" tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab" aria-controls="dropdown1">@fat</a>
</li> 
<li>
<a data-target="#dropdown2" tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab" aria-controls="dropdown2">@mdo</a>
</li> 
</ul> 
</li> 
</ul> 
<div id="myTabContent" class="tab-content"> 
<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab"> 
<p>오늘의 모임</p> 
</div> 
<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
<p>오늘의 모임</p> 
</div> 
<div role="tabpanel" class="tab-pane fade" id="dropdown1" aria-labelledby="dropdown1-tab"> 
<p>오늘의 모임</p> 
</div> <div role="tabpanel" class="tab-pane fade" id="dropdown2" aria-labelledby="dropdown2-tab"> 
<p>오늘의 모임</p> 
</div> 
</div> 
</div>

</body>
</html>