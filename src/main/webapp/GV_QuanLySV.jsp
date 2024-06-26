<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý sinh viên</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
.groups {
	width: 100px !important;
	height: 50px;
	border-radius: 5px;
	border: 1px solid rgb(157, 93, 93);
	padding-left: 5px;
}

.edit-link {
	background-color: #8F9BE3;
	color: white;
	padding: 5px;
	border-radius: 10px;
	text-decoration: none;
}

.edit-link:hover {
	background-color: #6072E1;
	color: white !important;
	text-decoration: none;
}

.delete-link:hover {
	background-color: #FC3B0E;
	color: white !important;
	text-decoration: none;
}

.delete-link {
	background-color: #AD481B;
	color: white;
	padding: 5px;
	border-radius: 10px;
	text-decoration: none;
}
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
					<div class="nhomsv">
						<fieldset>

							<div class="form-group">
								<label for="exampleSelect1">Chọn Nhóm</label>
								<form id="myForm" action="<%=request.getContextPath()%>/GV/qlsv"
									method="post">
									<input type="hidden" name="csrf_token"
									<c:if test="${csrf_token !=null }">
										   value="${csrf_token}"
									</c:if>
									>
									<select class="form-control groups d-inline-block" id="nhom"
										name="nhom">
										<option value="" selected>---Chọn---Nhom</option>
										<c:forEach var="nhom" items="${nhoms}">
											<c:choose>
												<c:when test="${nhom.getMaNhom() eq seleNhom}">
													<option value="${nhom.getMaNhom()}" selected>${fn:escapeXml(nhom.getTenNhom())}</option>
												</c:when>
												<c:otherwise>
													<option value="${nhom.getMaNhom()}">${fn:escapeXml(nhom.getTenNhom())}--(${fn:escapeXml(nhom.getMaNhom())})</option>
												</c:otherwise>
											</c:choose>


										</c:forEach>
									</select> <a href="ANhom"
										class="nav-link mt-5 d-inline-block btn-primary rounded border border-success ml-5"
										id="button1">Thêm nhóm</a>
								</form>
							</div>
						</fieldset>
						<a href="showATV"
							class="nav-link mt-2 d-inline-block btn-primary rounded border border-success "
							id="button" onclick="ThemTV()">Thêm Thành Viên</a>
						<!-- Data table -->
						<div class="container mt-5">
							<hr />
							<br />
							<table class="table table-bordered text-center" id="tb-thongke">
								<thead class="table-primary ">
									<tr>
										<th>MSSV</th>
										<th>Họ Tên</th>
										<th>Ngày Sinh</th>
										<th>Email</th>
										<th>CCCD</th>
										<th>Số Điện Thoại</th>
										<th>Niên Khóa</th>
										<th>Địa Chỉ</th>
										<th>Ngành</th>
										<th>Thao tác</th>

									</tr>
								</thead>


								<tbody id="dataTableBody">

									<c:forEach var="sinhvien" items="${sinhvienkiet}">
										<tr>
											<td><c:out value="${sinhvien.getMSSV()}" /></td>
											<td><c:out value="${sinhvien.getHoTen()}" /></td>
											<td><fmt:parseDate var="localDate"
													value="${sinhvien.getNgaySinh()}" pattern="yyyy-MM-dd" />
												<fmt:formatDate value="${localDate}" pattern="dd/MM/yyyy"
													var="formattedDate" /> <c:out value="${formattedDate}" /></td>
											<td><c:out value="${sinhvien.getEmail()}" /></td>
											<td><c:out value="${sinhvien.getCCCD()}" /></td>
											<td><c:out value="${sinhvien.getSDT()}" /></td>

											<td><c:out value="${sinhvien.getNienKhoa()}" /></td>
											<td><c:out value="${sinhvien.getDiaChi()}" /></td>
											<td><c:out value="${sinhvien.getMaNganh()}" /></td>



											<td><a href="showSuaTV?id=<c:out value='${sinhvien.getMSSV()}' />" class="edit-link">Sửa</a> <a
												href="XoaTV?id=<c:out value='${sinhvien.getMSSV()}' />" onclick="showAlert()" class="delete-link">Xóa</a></td>
										</tr>
									</c:forEach>




								</tbody>



							</table>
						</div>
					</div>
				</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
		<script>
	document.getElementById("nhom").addEventListener("change", function() {
		
		document.getElementById("myForm").submit();
		
	});
	function showAlert() {
        // Hiển thị cảnh báo
        
        alert("Xóa thành công!");
	

        	return true;
    }

</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>