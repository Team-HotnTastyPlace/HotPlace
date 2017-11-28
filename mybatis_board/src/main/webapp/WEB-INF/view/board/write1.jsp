<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="/mybatis_board/SE4/js/HuskyEZCreator.js" charset="utf-8"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 글 쓰기</title>
</head>
<body>
<h2 align="center">등록</h2>
<hr color="red">
	<form:form commandName="boardVO" method="post" enctype="multipart/form-data">
		<table align="center" border="1" width="780">
			<tr>
				<td width="100" rowspan="3">
			
    <img id="preview"" src="" width="300" height="300" alt="썸네일a11"/>
				</td>
				<th ><form:label path="title">제목</form:label></th>
				<td><form:input path="title"/>
					<form:errors path="title"/></td>
			</tr>
			
			<tr>
				
				<th><form:label path="writer">작성자</form:label></th>
				<td><form:input path="writer"/>
					<form:errors path="writer"/></td>
					
			</tr>
			<tr>
			<th>주소</th>
			<td></td>
			</tr>
			
			<tr>
			<td><input width="100" type="file"  name="uploadfile" id="uploadfile" accept="image/*"/></td>
			<th>연락처</th>
			<td></td>
			</tr>
			
			<tr>
				<td colspan="3" ><form:textarea id="ir1" path="content" rows="10" cols="100" style="width:766px; height:412px; "/>
					<form:errors path="content"/></td>
			</tr>
			<tr>
<!-- 	<tr>
<td class="attr">
이미지
</td>
<td>
<input type="file" name="uploadFile" id="uploadFile"/>
</td>

</tr> -->


		
			<%-- 
			<tr>
				<th><form:label path="filename">파일</form:label></th>
				<td><form:input path="filename"/>
					<form:errors path="writer"/></td>
					
			</tr> --%>
		<tr>
<!-- /resources/images/pooh.gif -->
</tr>

			<tr>
				<th><form:label path="password">비밀번호</form:label></th>
				<td><form:password path="password"/>
					<form:errors path="password"/></td>
			</tr>
			
			
			
			
		</table>
		<div>
		<input type="button" onclick="submitContents(this);" value="등록" />
		<!-- 	<input type="submit" value="등록"/> -->
			<a href="<c:url value="/board/list"/>">목록</a>
		</div>
		<div align="center">
		<a href="#this" class="btn" id="addFile">파일 추가</a>
        <a href="#this" class="btn" id="write">작성하기</a>
        <a href="#this" class="btn" id="list">목록으로</a>
		</div>
		
		<div  style="width:400px; height:100px; overflow:auto ;margin-left: auto;margin-right:auto;">


	
		<table align="center" border="" id="fileDiv" >
		<tr><td>
           
                <input type="file" id="file" name="file_0">
                <a href="#this" class="btn" id="delete" name="delete">삭제</a>
                </td>
                </tr>
           
            
            </table>
        </div>
         




		
	</form:form>
	
	<%-- <form method="post"  action="<c:url value="/board/aaa"/>" enctype="multipart/form-data">
	<table width="1000" border="1">
	<tr>
<td class="attr">
이미지
</td>
<td>
<input type="file" name="uploadFile" id="uploadFile"/>
</td>
<!-- /resources/images/pooh.gif -->
</tr>
<tr>
<td  height="200px"></td>
<img src="${pageContext.request.contextPath }/board/images/hot.gif" >
<td><img  width="50" height="50" src="<c:url value="/resources/images/pooh.gif"/>">55</td>
</tr>
	</table>
	<input type="submit" value="업로드"/>
	</form> --%>
	
	
<!-- 	<h3>로컬에 있는 이미지를 바로 브라우저에 표시</h3>
<img id="preview" src="" width="100" height="200" alt="로컬에 있는 이미지가 보여지는 영역">
<a id="download" download="thumbnail.jpg" target="_blank">
    <img id="thumbnail" src="" width="100" alt="썸네일영역 (클릭하면 다운로드 가능)">
</a>
<input type="file" id="getfile" accept="image/*"> -->
	
	
<script type="text/javascript">
 var oEditors = [];

var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "../SE4/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		},
		I18N_LOCALE : sLang
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["ir1"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
} 

 </script>
 
 <script type="text/javascript">
var file = document.querySelector('#uploadfile');

file.onchange = function () { 
    var fileList = file.files ;
    
    // 읽기
    var reader = new FileReader();
    reader.readAsDataURL(fileList [0]);

    //로드 한 후
    reader.onload = function  () {
        //로컬 이미지를 보여주기
        document.querySelector('#preview').src = reader.result;
        
        //썸네일 이미지 생성
        var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
        tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
        tempImage.onload = function() {
            //리사이즈를 위해 캔버스 객체 생성
            var canvas = document.createElement('canvas');
            var canvasContext = canvas.getContext("2d");
            
            //캔버스 크기 설정
            canvas.width = 150; //가로 100px
            canvas.height = 200; //세로 100px
            
            //이미지를 캔버스에 그리기
            canvasContext.drawImage(this, 0, 0, 150, 200);
            //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
            var dataURI = canvas.toDataURL("image/jpeg");
            
            //썸네일 이미지 보여주기
            document.querySelector('#thumbnail').src = dataURI;
            
      
         
        };
    }; 
}; 

</script>

   <script type="text/javascript">
        var gfv_count = 1;
     
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openBoardList();
            });
             
            $("#write").on("click", function(e){ //작성하기 버튼
                e.preventDefault();
                fn_insertBoard();
            });
             
            $("#addFile").on("click", function(e){ //파일 추가 버튼
                e.preventDefault();
                fn_addFile();
            });
             
            $("a[name='delete']").on("click", function(e){ //삭제 버튼
                e.preventDefault();
                fn_deleteFile($(this));
            });
        });
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
            comSubmit.submit();
        }
         
        function fn_insertBoard(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/sample/insertBoard.do' />");
            comSubmit.submit();
        }
         
        function fn_addFile(){
            var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
            $("#fileDiv").append(str);
            $("a[name='delete']").on("click", function(e){ //삭제 버튼
                e.preventDefault();
                fn_deleteFile($(this));
            });
        }
         
        function fn_deleteFile(obj){
            obj.parent().remove();
        }
    </script>





</body>
</html>