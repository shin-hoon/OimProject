<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- shadow 닫힘기능 -->
<script type="text/javascript">
//	function ok(id) {
//		//parent : 부모 -> shadowbox가 지정이 된 join.jsp를 말해준다.
//		parent.frm.id.value=id;
//		parent.Shadowbox.close();
//	}
    $(function() {
        $('#cancle').click(function() {
            parent.Shadowbox.close();
        });
    });
    $(function() {
        $('#apply').click(function() {
            alert("결제가 완료되었습니다.")
            parent.Shadowbox.close();
        });
    });
</script>

<style type="text/css">
	.idrow{
		margin: 0px auto;
		width: 700px;
        height: 600px;
	}
    #poster img{
        width: 100%;
    }
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<td id="poster" style="width: 20%;">
						<img src="https://onoffmix.com/images/event/121808/s">
					</td>
					<td style="width: 80%;">
						<table class="table" id="res_table">
                            <tr>
                                <td class="col-sm-2"></td>
                                <td class="col-sm-12 text-right">
                                    <h3 class="title" id="title">2017 꿈다락 토요문화학교 (일상의 작가)</h3>
                                </td>
				            </tr>
                            <tr>
                                <td class="col-sm-2 success"><img src="image/calender.png" style="height: 20px; width: 20px;">&emsp;모임 기간</td>
                                <td class="col-sm-10 text-right">
                                    <b class="start" id="start"> 12월 16일 (토) 10시 00분</b>~
                                    <b class="end" id="end">2018년 1월 13일 (토) 17시 00분</b>
                                </td>
				            </tr>
                            <tr>
                                <td class="col-sm-2 success"><img src="image/place.png" style="height: 20px; width: 20px;">&emsp;모임 장소</td>
                                <td class="col-sm-10 text-right">
                                    <b class="place" id="place">[제로원디자인센터] 서울 종로구 동숭동 서울시 종로구 동숭길 122-6 국민대학교</b>
                                </td>
				            </tr>
                            <tr>
                                <td class="col-sm-2 success"><img src="image/people.png" style="height: 20px; width: 20px;">&emsp;신청인원</td>
                                <td class="col-sm-10 text-right">
                                    <b class="total" id="total">  총 20 명 </b> |
						            <b class="limit" id="limit">  중 11 명 신청가능</b>
                                </td>
				            </tr>
                        </table>
                    </td>
				</tr>
			</table>
            <h3>신청자 정보입력</h3>
            <table class="table">
				<tr>
					<td class="success text-center" width="20%">이름</td>
					<td class="text-center name" width="30%" id="name">장연식</td>
					<td class="success text-center" width="20%">이메일</td>
					<td class="text-center email" width="30%" id="email">jang1234@daum.net</td>
				</tr>
				<tr>
					<td class="success text-center" width="20%">소속</td>
					<td class="text-center company" width="30%" id="company">쌍용교육센터</td>
					<td class="success text-center" width="20%">전화번호</td>
					<td class="text-center tel" width="30%" id="tel">010-9699-8645</td>
                </tr>
			</table>
			<h3>결제정보</h3>
            <table class="table">
				<tr>
					<td class="success text-center" width="20%">총결제금액</td>
					<td class="text-left price" width="80%" id="price">10000원</td>
				</tr>
				<tr>
					<td class="success text-center" width="20%">결제방식</td>
					<td class="text-left" width="80%">카드결제</td>
                </tr>
			</table>
			<center>
			    <button type="submit" class="btn btn-primary" id="apply" value="신청">신청하기</button>
			    <button class="btn" id="cancle" value="취소">취소하기</button>
			</center>
		</div>
	</div>
</body>
</html>