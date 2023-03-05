<%@page import="javax.imageio.ImageWriteParam"%>
<%@page import="com.sun.media.jai.codecimpl.JPEGImageDecoder"%>
<%@page import="com.sun.media.jai.codecimpl.JPEGImageEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.awt.Graphics2D" %>
<%@ page import="java.awt.image.renderable.ParameterBlock" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.media.jai.JAI" %>
<%@ page import="javax.media.jai.RenderedOp" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%
	
	String imagePath = request.getRealPath("upload");
	int size = 1 * 1024 * 1024;
	String filename = "";
	
	try{
		
		MultipartRequest multi =	new MultipartRequest(request, imagePath, size, "UTF-8", new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement();
		filename = multi.getFilesystemName(file);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	ParameterBlock pb = new ParameterBlock();
	pb.add(imagePath+"/"+filename);
	RenderedOp rOp = JAI.create("fileload", pb);
	
	BufferedImage bi = rOp.getAsBufferedImage();
	BufferedImage thumb = new BufferedImage(100,100, BufferedImage.TYPE_INT_RGB);
	
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi, 0, 0, 100, 100, null);
	
	
	File file = new File(imagePath+"/sm_"+filename);
	
	ImageIO.write(thumb, "jpg", file);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 썸네일</title>
</head>
<body>
- 원본이미지 -<br>
<image src="/upload/<%=filename %>"><p>
- 썸네일 이미지 -<br>
<image src="/upload/sm_<%=filename %>">
</body>
</html>