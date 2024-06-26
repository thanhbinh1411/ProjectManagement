<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gia hạn đề tài</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
.main-panel {
	padding: 20px;
	max-height: 100%;
}

.table-noti {
	margin-bottom: 20px;
	/* Thêm khoảng cách giữa bảng và nút Gửi thông báo */
}

.send-noti {
	display: flex;
	justify-content: flex-end; /* Căn phải */
}

.btn-send {
	display: flex;
	justify-content: flex-end; /* Căn phải */
}

.table-container {
	max-height: 400px; /* Đặt chiều cao tối đa cho phần tbody */
	overflow-y: auto;
}

.fixed-header th {
	position: sticky;
	top: 0;
	background-color: #f5f5f5; /* Màu nền cho header cố định */
}

.table-container td {
	max-width: 200px;
	word-wrap: break-word;
}

.tc img {
	max-width: 1200px;
	max-height: 900px;
	margin-right: 10px;
}
table{
	width : 200%
	
}
a#button {
	text-decoration: none;
	color: white;
	background-color: #007bff;
	border-radius: 5px;
	padding: 5px;
	width: 150px;
	text-align: center;
}

.form {
	width: 100%;
	max-width: 20rem;
	margin: 0 auto;
	position: relative;
	top: 10%;
	left: -20%;
}

.input {
	display: block;
	width: 100%;
	height: 2.5rem;
	margin-bottom: .5rem;
	padding: .5rem 1rem;
	background: #b1e4d7;
	border: none;
	border-radius: 2px;
}

.button {
	transition: border .2s ease-in-out, background .2s ease-in-out, color
		.2s ease-in-out;
	display: block;
	width: calc(100% - 10rem);
	height: 2.5rem;
	margin: 0 5rem;
	background: #5fb3b3;
	border: 1px solid #5fb3b3;
	border-radius: 1.25rem;
	outline: none;
	color: #fff;
	font-size: .7rem;
	text-transform: uppercase;
	letter-spacing: .5px; &: hover { background : transparent;
	border-color: #5fb3b3;
	color: #5fb3b3;
}

}
h3 {
	text-align: center !important;
	color: #5f83b3 !important;
	font-size: 1.5rem !important;
	margin-bottom: 1rem !important;
}
</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>


	<div class="container-fluid">
		<div class="row">

			<div class="col-md-2">
				<jsp:include page="/GV_List.jsp"></jsp:include>
			</div>


			<div class="col-md-10">
					
					<form class="form" data-form="form-1" method="post"
						action="<%=request.getContextPath()%>/GV/GiaHan">
						<input type="hidden" name="csrf_token"
						<c:if test="${csrf_token !=null }">
							   value="${csrf_token}"
						</c:if>
						>
						<h3>Gia Hạn Đề Tài</h3>
						<table>
							<tr>
								<td>Tên Đề Tài:</td>
								<td>
								<input type="text" class="input" id="name" name="name"
									value="${ttdt.getTenDeTai()}" required readonly autocomplete="off" maxlength="255"></td>
							</tr>
							<tr>
								<td>Mã Đề Tài:</td>
								<td><input type="text" class="input" id="madt" name="madt"
									value="${ttdt.getMaDT()}" required readonly autocomplete="off" maxlength="255"></td>
							</tr>
							<tr>
								<td>Ngày Kết Thúc (cũ):</td>
								<td><input type="date" class="input" id="ngayketthuc" name="ngayketthuc"
									value="${ttdt.getNgayKetThuc()}" required readonly autocomplete="off" maxlength="255"></td>
							</tr>
							<tr>
								<td>Ngày gia hạn (Sẽ thành ngày kết thúc mới):</td>
								<td><input type="date" class="input" id="ngaygiahan" name="ngaygiahan"
									 required autocomplete="off" onchange="kiemTraNgay()" maxlength="255"></td>

							</tr>
							<tr>
								<td>Link Đơn Xin Gia Hạn:</td>
								<td><input type="text" class="input" id="linkdonxin" name="linkdonxin"
									 required autocomplete="off" maxlength="255"></td>

							</tr>
							<tr>
								<td>Lý Do:</td>
								<td><textarea class="input" id="lydo" name="lydo"
									 required autocomplete="off" maxlength="255"></textarea></td>

							</tr>
							
						</table>


						<input type="submit" value="Gửi đi" class="button">
					</form>
				</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    function kiemTraNgay() {
        // Lấy giá trị ngày kết thúc cũ
        var ngayKetThucCu = document.getElementById("ngayketthuc").value;

        // Lấy giá trị ngày gia hạn
        var ngayGiaHan = document.getElementById("ngaygiahan").value;

        // Chuyển đổi chuỗi ngày thành đối tượng Date
        var dateNgayKetThucCu = new Date(ngayKetThucCu);
        var dateNgayGiaHan = new Date(ngayGiaHan);

        // Kiểm tra xem ngày gia hạn có lớn hơn ngày kết thúc cũ không
        if (dateNgayGiaHan <= dateNgayKetThucCu) {
            alert("Ngày gia hạn phải lớn hơn ngày kết thúc cũ.");
            // Đặt lại giá trị ngày gia hạn về trống
            document.getElementById("ngaygiahan").value = "";
        }
    }
 // Lấy giá trị của attribute "errDX"
    
    
</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>