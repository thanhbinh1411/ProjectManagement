<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String csrfToken = (String) session.getAttribute("csrf_token");
%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Forgot Password - BBBootstrap</title>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
<link href='' rel='stylesheet'>
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
  body {
    background-position: center;
    background-color: #eee;
    background-repeat: no-repeat;
    background-size: cover;
    color: #505050;
    font-family: "Rubik", Helvetica, Arial, sans-serif;
    font-size: 14px;
    font-weight: normal;
    line-height: 1.5;
    text-transform: none;
  }

  .forgot {
    background-color: #fff;
    padding: 12px;
    border: 1px solid #dfdfdf;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  .padding-bottom-3x {
    padding-bottom: 72px !important;
  }

  .card-footer {
    background-color: #fff;
    border-top: 1px solid #dfdfdf;
  }

  .btn {
    font-size: 13px;
    margin-right: 5px;
  }

  .form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #76b7e9;
    outline: 0;
    box-shadow: 0 0 0 0px #28a745;
  }

  .card {
    margin-top: 20px;
  }
</style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
  <jsp:include page="/headerlogin.jsp"></jsp:include>
  <div class="container padding-bottom-3x mb-2 mt-5">
    <div class="row justify-content-center">
      <div class="col-lg-8 col-md-10">
        <div class="forgot">
          <h2>Quên Mật khẩu?</h2>
          <p>Thay đổi mật khẩu của bạn trong ba bước đơn giản. Điều này sẽ giúp bạn bảo mật mật khẩu của mình!</p>
          <ol class="list-unstyled">
            <li><span class="text-primary text-medium">1. </span>Nhập địa chỉ email của bạn bên dưới.</li>
            <li><span class="text-primary text-medium">2. </span>Hệ thống của chúng tôi sẽ gửi cho bạn mã OTP vào email của bạn</li>
            <li><span class="text-primary text-medium">3. </span>Nhập mã OTP trên Trang tiếp theo</li>
          </ol>
        </div>
        
        <form class="card mt-4" action="<%=request.getContextPath()%>/forgotPassword" method="POST">
          <input type="hidden" name="csrf_token" value="<%= csrfToken %>">

          <div class="card-body">
            <div class="form-group">
              <label for="email-for-pass">Nhập địa chỉ email của bạn</label>
               <input class="form-control" type="text" name="email" id="email-for-pass" required="">
               <small class="form-text text-muted">Nhập địa chỉ email đã đăng ký. Sau đó, chúng tôi sẽ gửi mã OTP qua email đến địa chỉ này.</small>
            </div>
          </div>
          <div class="card-footer">
            <button class="btn btn-success" type="submit">Lấy Mật Khẩu Mới</button>
            <button class="btn btn-danger" type="submit"><a href="Login.jsp"  style="color:black;'">Trở Về Trang Đăng Nhập</a></button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
  <script type='text/javascript' src=''></script>
  <script type='text/javascript' src=''></script>
  <script type='text/Javascript'></script>
</body>
</html>
