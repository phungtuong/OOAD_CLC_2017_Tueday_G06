<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<html>
<p>days to go this year. Learn Gradle now!</p>
<h3>File Upload:</h3>
Select a file to upload:
<br />
<form action="UploadFile" method="post" enctype="multipart/form-data">
	<p>
		Please select the file you would like to upload. <input type="file"
			name="upload" id="myfile"> <br> <input type="submit"
			value="Upload File"> <a href="#" id="myframe"></a>
</form>
<form action="UploadFile" method="GET">
<input type="radio" name="type" title="user's files" value="user's files" placeholder="user's files">user's files<br>
<input type="radio" name="type" title="trash files" value="trash files" placeholder="trash files">trash files<br>
	<input type="submit" value="List Files"> <a href="#"
		id="myframe"></a>
</form>

<%
			if (request.getAttribute("Files") != null) {
				List<com.google.api.services.drive.model.File> myFiles = (List<com.google.api.services.drive.model.File>) request
						.getAttribute("Files");%>
<table>
	<thead>
		<tr>
			<th>Tên file</th>
			<th>ID</th>
			<th>Loại</th>
		</tr>
	</thead>
	<tbody>
		<%
			for (com.google.api.services.drive.model.File file : myFiles) {
		%>
		<tr>
			<td class="fileName" width="20%"><%=file.getName()%></td>
			<td class="fileID" width="30%"><%=file.getId()%></td>
			<td class="fileMimeType" width="30%"><%=file.getMimeType()%></td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
<%
	}
%>
<script type="text/javascript">

	function replaceAll(txt, replace, with_this) {
		return txt.replace(new RegExp(replace, 'g'), with_this);
	}
	function showSrc() {
		document.getElementById("myfile").fileName;
		alert(document.getElementById("myfile").fileName);

	}
</script>
<!-- document.getElementById("myframe").href = document.getElementById("myfile").value; 
var theexa=document.getElementById("myframe").href.replace("file:///",""); 
var path=document.getElementById("myframe").href.replace("file:///",""); 
var correctPath=replaceAll(path,"%20"," "); -->
</html>
