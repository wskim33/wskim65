<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Register</title>

    <!-- Custom fonts for this template-->
    <jsp:include page="/WEB-INF/views/modules/css.jsp" />

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">BSI 아이디 만들어보세요!</h1>
                            </div>
                            <form id="registerform" class="user" action="register" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="memberId"
                                        placeholder="아이디를 입력해주세요." name="memberId" >
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="Email"
                                        placeholder="이메일 입력해주세요." name="email">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="passwd" placeholder="비밀번호" name="passwd">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="RepeatPassword" placeholder="비밀번호 확인">
                                    </div>
                                </div>
                                <input id="register" type="button" value="회원가입하기!" 
                                		class="btn btn-primary btn-user btn-block" />
                            </form>
                            <hr>
                            <!-- <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div> -->
                            <div class="text-center">
                                <a class="small" href="/bsi/account/login">이미 아이디가 있으신가요? 로그인하세요!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <jsp:include page="/WEB-INF/views/modules/js.jsp"/>

    <!-- Custom scripts for all pages-->
    <script src="/bsi/resources/js/sb-admin-2.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#register').on('click',function(event) {
			
			var re = /^[A-Za-z0-9]{6,12}$/;
			var memberId = $('#memberId').val();
			if(!re.test(memberId)){
				alert('아이디 형식 오류 (6~12개의 영문자 또는 숫자)');
				return;
			}
			re = /[a-zA-Z0-9]([-_.]?[a-zA-Z0-9])*@[a-zA-Z0-9]([-_.]?[a-zA-Z0-9])*.[a-zA-Z]$/i;
			var email = $('#Email').val();
			if(!re.test(email)){
				alert('Email 형식 오류');
				return;
			}
			var pwd = $('#passwd').val();
			var pwdconfirm = $('#RepeatPassword').val()
			
			if(pwd == pwdconfirm){
				
			}else{
				alert("비밀번호 불일치");
				return;
			}
			var memberId = $('#memberId').val();
			
			$.ajax({
				type:'post',
				url:'./idchk',
				data:{memberId : memberId}
			})
			.done(function(data){
				if(data == "1"){
					alert("아이디가 중복입니다.")
					return;
				}
				$('#registerform').submit(); //form을 서버로 전송
			})
			.fail(function(data,textStatus,error){
				alert("code:"+data.status+"\n"+"message:"+data.responseText+"\n"+"error:"+error);
				alert('error');
			})
			
			
		});
	});
	</script>
	
</body>

</html>