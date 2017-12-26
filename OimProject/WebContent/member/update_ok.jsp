<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oim.member.dao.*"%>
<%
	MemberVO vo=new MemberVO();
	if(pwd.equals(pwd_ok))
	{
		//사용자가 입력한 값->VO
		vo.setOm_id((id);
		vo.setOm_tel(tel);
		vo.setOm_pwd(pwd);
		
		//바뀐 VO-> DB저장
		MemberDAO.OimUpdate(vo);
		
		//세션업데이트
		sess.setAttribute("tel", tel);
		sess.setAttribute("pwd", pwd);
	}
	else
	{
		System.out.println("비밀번호 틀렸습니다");
	}
%>
  /*//alert창 띄우기 위해서 여기서 부터 update_ok.jsp로..?
		*/
		