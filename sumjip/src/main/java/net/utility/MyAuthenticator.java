package net.utility;

import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;

public class MyAuthenticator  extends Authenticator{
	//사용하고자 하는 메일서버(POP3, SMTP)에서 인증받은 계정 + 비번 등록
	
		private PasswordAuthentication pa;
		
		public MyAuthenticator() { //기본생성자
			pa = new PasswordAuthentication("gmail아이디", "비밀번호"); //각자의 계정과 비밀번호 입력
		}//end
		
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
}
