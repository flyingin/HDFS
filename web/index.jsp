<%@ page import="java.io.File" %>
<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: yml
  Date: 16-7-2
  Time: 下午2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String basePath = "/user/yml/test";
%>
<%!
  private static final String LUCY = "index.jsp";
  private static String pj_path2link(String path){
  File file = new File(path);
  StringBuffer stringBuffer = new StringBuffer();
  String encPath = null;
  if(!file.canRead()){
    return path;
  }else {
    while (file.getParentFile()!=null){
      encPath = URLEncoder.encode(file.getAbsolutePath());
      stringBuffer.insert(0,"<a href=\""+LUCY+"?path="+encPath+"\">"+file.getName()+File.separator+"</a>");
      file = file.getParentFile();
    }
    encPath = URLEncoder.encode(file.getAbsolutePath());
    stringBuffer.insert(0,"<a href=\""+LUCY+"?path="+encPath+"\">"+file.getAbsolutePath()+"</a>");
  }
    return stringBuffer.toString();
}
%>
<!DOCTYPE html>
<html lang="en" class="uk-height-1-1">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>FreeChart 文件共享</title>
  <link rel="stylesheet" type="text/css" href="./uikit/css/uikit.gradient.min.css">
  <link rel="stylesheet" type="text/css" href="./uikit/css/components/progress.gradient.min.css">
  <link rel="stylesheet" type="text/css" href="./uikit/css/components/placeholder.gradient.min.css">
  <link rel="stylesheet" type="text/css" href="./uikit/css/components/form-file.gradient.min.css">
  <link rel="shortcut icon" href="./favicon.ico">
  <script type="text/javascript" src="./uikit/js/jquery.js"></script>
  <script type="text/javascript" src="./uikit/js/uikit.min.js"></script>
</head>
<body class="uk-height-1-1">

<!-- 导航区 -->


<div class="uk-block uk-block-secondary">

</div>

<!-- 上传区 -->
<div class="uk-placeholder uk-container uk-container-center uk-width-large-1-2 uk-width-medium-1-1 uk-width-small-1-1">
  <!-- 进度条 -->
  <div class="uk-progress uk-progress-striped uk-active uk-progress-small">
    <%--<div class="uk-progress-bar" style="width: 100%;"></div>--%>
  </div>

  <!-- 浏览上传 -->
  <form class="uk-form" id="uploadform">
    <div class="uk-placeholder uk-text-center">
      <i class="uk-icon-cloud-upload uk-icon-medium uk-text-muted"></i>
      文件上传：
      <a class="uk-form-file">选择文件<input type="file"></a>
      <span>&nbsp;&nbsp;&nbsp;</span>
      <button type="submit" class="uk-button uk-button-primary uk-button-small">开始上传</button>
    </div>
  </form>
</div>
<!-- 文件区 -->
<div class="uk-container uk-container-center">

  <!-- 大屏幕设备 -->
  <tr><td colspan="2">当前路径：<%=pj_path2link(basePath)%><br></td> </tr>
  <table class="uk-table uk-table-striped uk-visible-large uk-table-hover">
    <thead class="uk-text-bold"><tr><td class="uk-width-4-10">文件名</td><td class="uk-width-1-10">上传者</td><td class="uk-width-3-10">上传时间</td><td class="uk-width-2-10">操作</td></tr></thead>
    <tbody>

    <tr>
      <td class="uk-width-4-10">最新版LinuxMint.iso</td>
      <td class="uk-width-1-10">Mint</td>
      <td class="uk-width-3-10">2015-10-26-13-02-55</td>
      <td class="uk-width-2-10">
        <a href="" class="uk-button uk-button-danger uk-button-mini">删除</a>
        <span>&nbsp;&nbsp;&nbsp;</span>
        <a href="" class="uk-button uk-button-success uk-button-mini">下载</a>
      </td>
    </tr>


    </tbody>
  </table>

  <!-- 小屏幕设备(手机) -->

</div>




</body>
</html>
