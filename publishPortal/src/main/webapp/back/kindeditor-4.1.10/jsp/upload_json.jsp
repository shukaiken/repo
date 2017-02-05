<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="javax.imageio.IIOImage" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="javax.imageio.ImageTypeSpecifier" %>
<%@ page import="javax.imageio.metadata.IIOMetadata" %>
<%@ page import="javax.imageio.plugins.jpeg.JPEGImageWriteParam" %>
<%@ page import="javax.imageio.stream.ImageOutputStream" %>
<%@ page import="java.awt.AlphaComposite"%>  
<%@ page import="java.awt.Graphics2D"%>  
<%@ page import="java.awt.image.BufferedImage"%>  
<%@ page import="java.awt.Image"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="com.sun.imageio.plugins.jpeg.*" %>
<%@ page import="org.json.simple.*" %>
<%@ page import="cn.com.shukaiken.util.*" %>
<%

/**
 * KindEditor JSP
 * 
 * 本JSP程序是演示程序，建议不要直接在实际项目中使用。
 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
 * 
 */

//文件保存目录路径
//String savePath = pageContext.getServletContext().getRealPath("/") + "images/";
String savePath = "";
String osname = System.getProperty("os.name");
if(osname.toLowerCase().indexOf("linux")>-1){
	savePath = ConfigurationUtils.readValue("linux.info.images.upload.path", "config.properties");
}else if(osname.toLowerCase().indexOf("windows")>-1){
	savePath = ConfigurationUtils.readValue("windows.info.images.upload.path", "config.properties");
}
//String savePath = "D:\\uploadImg\\";
//String savePath = "/opt/uploadImg/";
//文件保存目录URL
//String saveUrl  = request.getContextPath() + "/images/";
 String requestURL = request.getRequestURL().toString();
	String servletPath = request.getServletPath();
	//String appURL = requestURL.substring(0, requestURL.indexOf(servletPath)); 
	String appURL = ConfigurationUtils.readValue("info.images.server.path", "config.properties");
//String saveUrl  = "/upload/";
String saveUrl = appURL+ConfigurationUtils.readValue("info.images.access.path", "config.properties");
//定义允许上传的文件扩展名
HashMap<String, String> extMap = new HashMap<String, String>();
extMap.put("image", "jpg,jpeg,png");
//extMap.put("image", "gif,jpg,jpeg,png,bmp");
/* extMap.put("flash", "swf,flv");
extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2"); */
//最大文件大小
long maxSize = 100000000;

response.setContentType("text/html; charset=UTF-8");

if(!ServletFileUpload.isMultipartContent(request)){
	out.println(getError("请选择文件。"));
	return;
}
//检查目录
File uploadDir = new File(savePath);

if(!uploadDir.exists()){
	uploadDir.mkdirs();
}
if(!uploadDir.isDirectory()){
	out.println(getError("上传目录不存在。"));
	return;
}
//检查目录写权限
if(!uploadDir.canWrite()){
	out.println(getError("上传目录没有写权限。"));
	return;
}

String dirName = request.getParameter("dir");
if (dirName == null) {
	dirName = "news";
}
if(!extMap.containsKey(dirName)){
	out.println(getError("目录名不正确。"));
	return;
}
//创建文件夹
savePath += dirName + "/";
saveUrl += dirName + "/";
File saveDirFile = new File(savePath);
if (!saveDirFile.exists()) {
	saveDirFile.mkdirs();
}
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
String ymd = sdf.format(new Date());
savePath += ymd + "/";
saveUrl += ymd + "/";
File dirFile = new File(savePath);
if (!dirFile.exists()) {
	dirFile.mkdirs();
}

FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
upload.setHeaderEncoding("UTF-8");
List items = upload.parseRequest(request);
Iterator itr = items.iterator();
while (itr.hasNext()) {
	FileItem item = (FileItem) itr.next();
	String fileName = item.getName();
	long fileSize = item.getSize();
	if (!item.isFormField()) {
		//检查文件大小
		if(item.getSize() > maxSize){
			out.println(getError("上传文件大小超过限制。"));
			return;
		}
		//检查扩展名
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
			out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。"));
			return;
		}
		
		//处理压缩图片  
        int bg_width = 800; int bg_height = 600; int set_width = 360;//处理压缩成该宽度  
        BufferedImage bg_src = ImageIO.read(item.getInputStream());  
        BufferedImage tag = null;  
          
        if(bg_src != null){//上传的文件是图片的时候  
	        int real_width = bg_src.getWidth();//图片的真实宽度  
	        int real_height = bg_src.getHeight();//图片的真实高度  
	        if(real_width > set_width){//当图片高度超过该限制后才压缩图片  
	        double compute_height = (double)set_width/real_width*real_height;//等比例计算出来的图片高度  
	        bg_width = set_width;  
	        bg_height = (int)compute_height;   
	        tag = new BufferedImage(bg_width, bg_height, BufferedImage.TYPE_INT_RGB);  
	        Graphics2D g2d = tag.createGraphics();  
	        g2d.drawImage(bg_src, 0, 0, bg_width, bg_height, null);  
	        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,1.0f)); //透明度设置开始    
	        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER)); //透明度设置 结束
          }else{  
              //System.out.println("图片宽度小于限制，不用压缩..");  
              bg_src = null;  
          }  
        }

		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
		try{
			File uploadedFile = new File(savePath, newFileName);
			//处理图片的时候  
            if(bg_src != null){//上传的文件是图片的时候  
                 FileOutputStream fos = new FileOutputStream(uploadedFile);  
                 /*JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(fos);  
                encoder.encode(tag);  
                fos.close(); */  
                // 压缩质量 百分比
                float JPEGcompression = 0.9f;
            	int dpi = 100;//分辨率
                saveAsJPEG(dpi, tag, JPEGcompression, fos);
                //关闭输出流
                fos.close();
                
                
            }else{//不是图片还是执行以前的逻辑
				item.write(uploadedFile);
            }
		}catch(Exception e){
			out.println(getError("上传文件失败。"));
			return;
		}

		JSONObject obj = new JSONObject();
		obj.put("error", 0);
		obj.put("url", saveUrl + newFileName);
		out.println(obj.toJSONString());
	}
}
%>
<%!
private String getError(String message) {
	JSONObject obj = new JSONObject();
	obj.put("error", 1);
	obj.put("message", message);
	return obj.toJSONString();
}
%>
<%!
public static void saveAsJPEG(Integer dpi, BufferedImage image_to_save,
        float JPEGcompression, FileOutputStream fos) throws IOException {

    // useful documentation at
    // http://docs.oracle.com/javase/7/docs/api/javax/imageio/metadata/doc-files/jpeg_metadata.html
    // useful example program at
    // http://johnbokma.com/java/obtaining-image-metadata.html to output
    // JPEG data

    // old jpeg class
    // com.sun.image.codec.jpeg.JPEGImageEncoder jpegEncoder =
    // com.sun.image.codec.jpeg.JPEGCodec.createJPEGEncoder(fos);
    // com.sun.image.codec.jpeg.JPEGEncodeParam jpegEncodeParam =
    // jpegEncoder.getDefaultJPEGEncodeParam(image_to_save);

    // Image writer
    JPEGImageWriter imageWriter = (JPEGImageWriter) ImageIO
            .getImageWritersBySuffix("jpg").next();
    ImageOutputStream ios = ImageIO.createImageOutputStream(fos);
    imageWriter.setOutput(ios);
    // and metadata
    IIOMetadata imageMetaData = imageWriter.getDefaultImageMetadata(
            new ImageTypeSpecifier(image_to_save), null);

    // if(dpi != null && !dpi.equals("")){
    //
    // //old metadata
    // //jpegEncodeParam.setDensityUnit(com.sun.image.codec.jpeg.JPEGEncodeParam.DENSITY_UNIT_DOTS_INCH);
    // //jpegEncodeParam.setXDensity(dpi);
    // //jpegEncodeParam.setYDensity(dpi);
    //
    // //new metadata
    // Element tree = (Element)
    // imageMetaData.getAsTree("javax_imageio_jpeg_image_1.0");
    // Element jfif =
    // (Element)tree.getElementsByTagName("app0JFIF").item(0);
    // jfif.setAttribute("Xdensity", Integer.toString(dpi) );
    // jfif.setAttribute("Ydensity", Integer.toString(dpi));
    //
    // }

    if (JPEGcompression >= 0 && JPEGcompression <= 1f) {

        // old compression
        // jpegEncodeParam.setQuality(JPEGcompression,false);

        // new Compression
        JPEGImageWriteParam jpegParams = (JPEGImageWriteParam) imageWriter
                .getDefaultWriteParam();
        jpegParams.setCompressionMode(JPEGImageWriteParam.MODE_EXPLICIT);
        jpegParams.setCompressionQuality(JPEGcompression);

    }

    // old write and clean
    // jpegEncoder.encode(image_to_save, jpegEncodeParam);

    // new Write and clean up
    imageWriter.write(imageMetaData,
            new IIOImage(image_to_save, null, null), null);
    ios.close();
    imageWriter.dispose();

}
%>