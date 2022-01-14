package com.spring.project;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.spring.model.Review.A_ReviewDAO;
import com.spring.model.Review.A_ReviewDTO;
import com.spring.model.Review.F_ReviewDAO;
import com.spring.model.Review.F_ReviewDTO;
import com.spring.model.Review.N_ReviewDAO;
import com.spring.model.Review.N_ReviewDTO;
import com.spring.model.Review.P_ReviewDAO;
import com.spring.model.Review.P_ReviewDTO;


@Controller
public class ReviewController {
	
	@Autowired
	private P_ReviewDAO dao;
	
	@Autowired
	private A_ReviewDAO adao;
	
	@Autowired
	private F_ReviewDAO fdao;
	
	@Autowired
	private N_ReviewDAO ndao;
	
	
	@RequestMapping("place_review.do")
	public String plist(HttpServletRequest request, Model model) {
		
		String str = request.getParameter("p_no");
		System.out.println("str >>> " + str);

		List<P_ReviewDTO> plist = this.dao.PRList(str);
		
		
		model.addAttribute("p_no", str);
		model.addAttribute("pList", plist);
		
		
		
		return "place/place_review";
		
	}
	
	@RequestMapping("prlist_write.do")
	public void writeOk(P_ReviewDTO dto, HttpServletResponse response, 
			HttpServletRequest request,
			MultipartHttpServletRequest mRequest) throws IOException {
		
		String aaa = request.getParameter("p_no");
		
		 // 지정구역을 안정한 경우 돌려보내기
        
        MultipartFile mf = mRequest.getFile("file1");
        
        // 파일이 들어간 경우
        if(mf!=null) {

           // 업로드한 파일의 이름을 구하는 메서드.
           String originalFileName = mf.getOriginalFilename();   
           String finalname="";
           String uploadPath = 
                 "C:\\Users\\anws9\\Documents\\GitHub\\spring-final-prj\\Spring_final\\src\\main\\webapp\\resources\\review\\";
           
           Calendar cal = Calendar.getInstance();
           int year = cal.get(Calendar.YEAR);
           int month = cal.get(Calendar.MONTH) + 1;
           int day = cal.get(Calendar.DATE);
           

              // 실제 폴더를 만들어 보자.
              // .....\\resources\\upload\\2021-12-24
              String homedir = uploadPath + year + "-" + month + "-" + day;
              
              File path1 = new File(homedir);
              
              if(!path1.exists()) {
                 path1.mkdirs();
              }
              
              // 실제적으로 파일을 만들어 보자.
              String saveFileName = originalFileName;
              
              if(saveFileName != null && !saveFileName.equals("")) {
                 saveFileName =
                       System.currentTimeMillis() + "_" + saveFileName;
                 
                 try {
                    // .....\\resources\\upload\\2021-12-24\\실제파일
                    File origin = new File(homedir+"/"+ saveFileName);

                    // transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
                    mf.transferTo(origin);
                    
                    finalname=year + "-" + month + "-" + day+"/"+saveFileName;
                    
                 } catch (IllegalStateException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                 } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                 }
              }

              dto.setPr_upload(finalname);
              dto.setPr_img(originalFileName);

		
		
		
		
		
		int res = this.dao.insertPR(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('리뷰가 작성되었습니다.')");
			out.println("location.href='place_review.do?p_no="+aaa+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('리뷰가 작성되지않았습니다.')");
			out.println("location.href='place_review.do?p_no="+aaa+"'");
			out.println("</script>");
		}
        }
		
	}
	
	@RequestMapping("prlist_delete.do")
	public void delete(P_ReviewDTO dto,HttpServletResponse response,
			@RequestParam("no") int no, Model model,
			HttpServletRequest request) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		String aaa = request.getParameter("p_no");
		
		
			int res = this.dao.deletePR(no);
			
			if(res > 0) {
				out.println("<script>");
				out.println("alert('리뷰 삭제 성공')");
				out.println("location.href='place_review.do?p_no="+aaa+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('리뷰 삭제 실패')");
				out.println("location.href='place_review.do?p_no="+aaa+"'");
				out.println("</script>");
			}
		

		
		
	}
	
	
	@RequestMapping("activity_review.do")
	public String alist(HttpServletRequest request, Model model) {
		
		String str = request.getParameter("a_no");
		
		List<A_ReviewDTO> alist = this.adao.ARList(str);
		
		model.addAttribute("aList", alist);
		model.addAttribute("a_no", str);
		
		
		return "activity/activity_review";
		
	}
	
	
	
	@RequestMapping("arlist_write.do")
	public void awriteOk(A_ReviewDTO dto, HttpServletResponse response,
			HttpServletRequest request,
			MultipartHttpServletRequest mRequest) throws IOException {
		
		String a_no = request.getParameter("a_no");
		 // 지정구역을 안정한 경우 돌려보내기
        
        MultipartFile mf = mRequest.getFile("file2");
        
        // 파일이 들어간 경우
        if(mf!=null) {

           // 업로드한 파일의 이름을 구하는 메서드.
           String originalFileName = mf.getOriginalFilename();   
           String finalname="";
           String uploadPath = 
        		   "C:\\Users\\anws9\\Documents\\GitHub\\spring-final-prj\\Spring_final\\src\\main\\webapp\\resources\\review\\";
           
           Calendar cal = Calendar.getInstance();
           int year = cal.get(Calendar.YEAR);
           int month = cal.get(Calendar.MONTH) + 1;
           int day = cal.get(Calendar.DATE);
           

              // 실제 폴더를 만들어 보자.
              // .....\\resources\\upload\\2021-12-24
              String homedir = uploadPath + year + "-" + month + "-" + day;
              
              File path1 = new File(homedir);
              
              if(!path1.exists()) {
                 path1.mkdirs();
              }
              
              // 실제적으로 파일을 만들어 보자.
              String saveFileName = originalFileName;
              
              if(saveFileName != null && !saveFileName.equals("")) {
                 saveFileName =
                       System.currentTimeMillis() + "_" + saveFileName;
                 
                 try {
                    // .....\\resources\\upload\\2021-12-24\\실제파일
                    File origin = new File(homedir+"/"+ saveFileName);

                    // transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
                    mf.transferTo(origin);
                    
                    finalname=year + "-" + month + "-" + day+"/"+saveFileName;
                    
                 } catch (IllegalStateException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                 } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                 }
              }

              dto.setAr_upload(finalname);
              dto.setAr_img(originalFileName);

		
		
		
		
		
		int res = this.adao.insertAR(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('리뷰가 작성되었습니다.')");
			out.println("location.href='activity_review.do?a_no="+a_no+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('리뷰가 작성되지않았습니다.')");
			out.println("location.href='activity_review.do?a_no="+a_no+"'");
			out.println("</script>");
		}
        }
		
	}
	
	@RequestMapping("arlist_delete.do")
	public void adelete(A_ReviewDTO dto,
			@RequestParam("no") int no, Model model,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		
		String a_no = request.getParameter("a_no");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int res = this.adao.deleteAR(no);
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('리뷰 삭제 성공')");
			out.println("location.href='activity_review.do?a_no="+a_no+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('리뷰 삭제 실패')");
			out.println("location.href='activity_review.do?a_no="+a_no+"'");
			out.println("</script>");
		}	
}
	
	@RequestMapping("frlist.do")
	public String flist(HttpServletRequest request, Model model) {
		
		List<F_ReviewDTO> flist = this.fdao.FRList();
		
		model.addAttribute("fList", flist);
		
		
		
		return "review/f_review";
		
	}
	
	
	@RequestMapping("frlist_write.do")
	public void fwriteOk(F_ReviewDTO dto, HttpServletResponse response,
			MultipartHttpServletRequest mRequest) throws IOException {
		
		 // 지정구역을 안정한 경우 돌려보내기
        
        MultipartFile mf = mRequest.getFile("file3");
        
        // 파일이 들어간 경우
        if(mf!=null) {

           // 업로드한 파일의 이름을 구하는 메서드.
           String originalFileName = mf.getOriginalFilename();   
           String finalname="";
           String uploadPath = 
        		   "C:\\Users\\anws9\\Documents\\GitHub\\spring-final-prj\\Spring_final\\src\\main\\webapp\\resources\\review\\";
           
           Calendar cal = Calendar.getInstance();
           int year = cal.get(Calendar.YEAR);
           int month = cal.get(Calendar.MONTH) + 1;
           int day = cal.get(Calendar.DATE);
           

              // 실제 폴더를 만들어 보자.
              // .....\\resources\\upload\\2021-12-24
              String homedir = uploadPath + year + "-" + month + "-" + day;
              
              File path1 = new File(homedir);
              
              if(!path1.exists()) {
                 path1.mkdirs();
              }
              
              // 실제적으로 파일을 만들어 보자.
              String saveFileName = originalFileName;
              
              if(saveFileName != null && !saveFileName.equals("")) {
                 saveFileName =
                       System.currentTimeMillis() + "_" + saveFileName;
                 
                 try {
                    // .....\\resources\\upload\\2021-12-24\\실제파일
                    File origin = new File(homedir+"/"+ saveFileName);

                    // transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
                    mf.transferTo(origin);
                    
                    finalname=year + "-" + month + "-" + day+"/"+saveFileName;
                    
                 } catch (IllegalStateException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                 } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                 }
              }

              dto.setFr_upload(finalname);
              dto.setFr_img(originalFileName);

		
		
		
		
		
		int res = this.fdao.insertFR(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('리뷰가 작성되었습니다.')");
			out.println("location.href='frlist.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('리뷰가 작성되지않았습니다.')");
			out.println("location.href='frlist.do'");
			out.println("</script>");
		}
        }
		
	}
	
	@RequestMapping("frlist_delete.do")
	public void fdelete(F_ReviewDTO dto,
			@RequestParam("no") int no, Model model,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int res = this.fdao.deleteFR(no);
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('리뷰 삭제 성공')");
			out.println("location.href='frlist.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('리뷰 삭제 실패')");
			out.println("location.href='frlist.do'");
			out.println("</script>");
		}	
}
	
	
	@RequestMapping("nrlist.do")
	public String nlist(HttpServletRequest request, Model model) {
		
		List<N_ReviewDTO> nlist = this.ndao.NRList();
		
		model.addAttribute("nList", nlist);
		
		
		
		return "review/n_review";
		
	}
	
	
	@RequestMapping("nrlist_write.do")
	public void nwriteOk(N_ReviewDTO dto, HttpServletResponse response,
			MultipartHttpServletRequest mRequest) throws IOException {
		
		 // 지정구역을 안정한 경우 돌려보내기
        
        MultipartFile mf = mRequest.getFile("file4");
        
        // 파일이 들어간 경우
        if(mf!=null) {

           // 업로드한 파일의 이름을 구하는 메서드.
           String originalFileName = mf.getOriginalFilename();   
           String finalname="";
           String uploadPath = 
        		   "C:\\Users\\anws9\\Documents\\GitHub\\spring-final-prj\\Spring_final\\src\\main\\webapp\\resources\\review\\";
           
           Calendar cal = Calendar.getInstance();
           int year = cal.get(Calendar.YEAR);
           int month = cal.get(Calendar.MONTH) + 1;
           int day = cal.get(Calendar.DATE);
           

              // 실제 폴더를 만들어 보자.
              // .....\\resources\\upload\\2021-12-24
              String homedir = uploadPath + year + "-" + month + "-" + day;
              
              File path1 = new File(homedir);
              
              if(!path1.exists()) {
                 path1.mkdirs();
              }
              
              // 실제적으로 파일을 만들어 보자.
              String saveFileName = originalFileName;
              
              if(saveFileName != null && !saveFileName.equals("")) {
                 saveFileName =
                       System.currentTimeMillis() + "_" + saveFileName;
                 
                 try {
                    // .....\\resources\\upload\\2021-12-24\\실제파일
                    File origin = new File(homedir+"/"+ saveFileName);

                    // transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
                    mf.transferTo(origin);
                    
                    finalname=year + "-" + month + "-" + day+"/"+saveFileName;
                    
                 } catch (IllegalStateException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                 } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                 }
              }

              dto.setNr_upload(finalname);
              dto.setNr_img(originalFileName);

		
		
		
		
		
		int res = this.ndao.insertNR(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('리뷰가 작성되었습니다.')");
			out.println("location.href='nrlist.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('리뷰가 작성되지않았습니다.')");
			out.println("location.href='nrlist.do'");
			out.println("</script>");
		}
        }
		
	}
	
	@RequestMapping("nrlist_delete.do")
	public void ndelete(N_ReviewDTO dto,
			@RequestParam("no") int no, Model model,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int res = this.ndao.deleteNR(no);
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('리뷰 삭제 성공')");
			out.println("location.href='nrlist.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('리뷰 삭제 실패')");
			out.println("location.href='nrlist.do'");
			out.println("</script>");
		}	
}
	
	
	
	
	
	
	
	
}
