package mboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mboard.spring.BoardService;
import mboard.spring.BoardVO;
import register.spring.AuthInfo;

@Controller
@SessionAttributes("boardVO")
public class BoardController {
	private BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping(value="/mboard/list")
	public String list(Model model, HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		
		model.addAttribute("authInfo", authInfo);
		model.addAttribute("boardList", boardService.list());
		return "/mboard/list";
	}
	@RequestMapping(value="/mboard/list2")
	public String list2() {
		
		return "/mboard/list2";
	}
	
	
	@RequestMapping("/mboard/listsearch")
	public String list(@ModelAttribute("cmd")ListCommand listCommand,
			Errors errors, Model model) {
		if(errors.hasErrors()) {
			return "/mboard/list";
		}
		
		System.out.println(listCommand.getArea());
		
		if(listCommand.getArea()!= null) {
			/*List<Member> members = memberDao.selectByRegdate(
					listCommand.getFrom(), listCommand.getTo());	
			model.addAttribute("members", members);*/
			
			model.addAttribute("boardList", boardService.listaddr(listCommand.getArea()));
		}
		return "/mboard/list";
	}
	
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡtoplistㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@RequestMapping("/mboard/listsearch1")
	public String listtop(@ModelAttribute("cmd")ListCommand listCommand,
			Errors errors, Model model) {
		if(errors.hasErrors()) {
			return "/mboard/list";
		}
		
		System.out.println(listCommand.getArea());
		
		if(listCommand.getArea()!= null) {
			/*List<Member> members = memberDao.selectByRegdate(
					listCommand.getFrom(), listCommand.getTo());	
			model.addAttribute("members", members);*/
			listCommand.setType("맛플");
			System.out.println("확인ㅇㅇㅇㅇㅇㅇ");
			model.addAttribute("boardList2", boardService.listtype(listCommand.getArea(),listCommand.getType()));
			model.addAttribute("boardList", boardService.listaddr(listCommand.getArea()));
			model.addAttribute("boardList1", boardService.listtop(listCommand.getArea()));
		}
		return "/mboard/list";
	}
	
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	@RequestMapping(value="/mboard/read/{seq}")
	public String read(Model model, @PathVariable int seq) {
		model.addAttribute("boardVO", boardService.read(seq));
		return "/mboard/read";
	}
	
	//새 글 작성
	@RequestMapping(value="/mboard/write", method=RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("boardVO", new BoardVO());
		return "/mboard/write";
	}
	//--------------------------------------------------
	

	
	
	//-------------------------------------------------
	//새 글 등록
//	@RequestMapping(value="/mboard/write", method=RequestMethod.POST)
//	public String write(@Valid BoardVO boardVO, BindingResult bindingResult,@RequestParam("uploadfile") MultipartFile file, 
//			HttpServletRequest request) throws Exception{
//		
//		if(bindingResult.hasErrors()) {
//			return "/mboard/write";
//		}
//		
//		
//		
//		File f = new File("C:\\오전반 이동규\\workspace1\\hpmp_HpleMple\\src\\main\\webapp\\images\\"+file.getOriginalFilename());
//		
//		System.out.println("파ㅣ일네임 확인");
//	    
//	    file.transferTo(f);
//	    String fn=file.getOriginalFilename();
//	    boardVO.setFilename(fn);
//	    String A=boardVO.getArea();
//	    boardVO.setArea(A);
//	    boardService.write(boardVO);
//		return "redirect:/mboard/list";
//	}
	
	//--------------------------------------------다중업로ㄷ------------------
	
	//새 글 등록
		@RequestMapping(value="/mboard/write", method=RequestMethod.POST)
		public String write(@Valid BoardVO boardVO, BindingResult bindingResult,/*@RequestParam("uploadfile") MultipartFile file, */
				MultipartHttpServletRequest mRequest) throws Exception{
			
			if(bindingResult.hasErrors()) {
				return "/mboard/write";
			}
			
//			String fileName=file.getOriginalFilename();
//			File f = new File("C:\\Users\\DK\\Desktop\\JAVA\\jsp\\workspace3\\hpmp_HpleMple\\src\\main\\webapp\\images\\");
	//
//			 if (fileName != null && !fileName.equals("")) {
//	             if (f.exists()) {
////	                 파일명 앞에 업로드 시간 초단위로 붙여 파일명 중복을 방지
//	                 fileName = System.currentTimeMillis() + "_" + fileName;
//	                 
//	                 f = new File("C:\\Users\\DK\\Desktop\\JAVA\\jsp\\workspace3\\hpmp_HpleMple\\src\\main\\webapp\\images\\" + fileName);
	//
//	             }
//			 }
//			
			//------------------------------
			 
			 String uploadPath = "C:\\JavaSW_S2W_170918\\workspace_maven\\hpmp_HpleMple\\src\\main\\webapp\\images\\";
				
				File dir = new File(uploadPath);
				String[] fnn= {"미등록.jpg","미등록.jpg","미등록.jpg","미등록.jpg","미등록.jpg","미등록.jpg","미등록.jpg","미등록.jpg","미등록.jpg"};
				System.out.println(fnn[0]);
				if (!dir.isDirectory()) {
					dir.mkdirs();
				}
				
				Iterator<String> iter = mRequest.getFileNames();
				int i=0;
				while(iter.hasNext()) {
					String uploadFileName = iter.next();
					
					
					MultipartFile mFile = mRequest.getFile(uploadFileName);
					String originalFileName = mFile.getOriginalFilename();
					String saveFileName = originalFileName;
					
					if(saveFileName != null && !saveFileName.equals("")) {
						if(new File(uploadPath + saveFileName).exists()) {
							saveFileName = saveFileName.substring(0, saveFileName.lastIndexOf(".")) + "_" + System.currentTimeMillis() + saveFileName.substring(saveFileName.lastIndexOf("."));
						}
						
						try {
			                 dir= new File("C:\\JavaSW_S2W_170918\\workspace_maven\\hpmp_HpleMple\\src\\main\\webapp\\images\\" + saveFileName);

							mFile.transferTo(new File(uploadPath + saveFileName));
							fnn[i]=saveFileName;
							System.out.println(saveFileName);
							System.out.println("i 갑 확인 : "+ i);
						} catch (IllegalStateException e) {
							e.printStackTrace();
							
						} catch (IOException e) {
							e.printStackTrace();
							
						}
					} // if end
					i++;
				} 
			 //---------------------------------
			
		    
//		    file.transferTo(f);
//		    
				
		    boardVO.setFilename(fnn[0]);
		    boardVO.setFilename1(fnn[1]);
		    boardVO.setFilename2(fnn[2]);
		    boardVO.setFilename3(fnn[3]);
		    boardVO.setFilename4(fnn[4]);
		    boardVO.setFilename5(fnn[5]);
		    boardVO.setFilename6(fnn[6]);
		    boardVO.setFilename7(fnn[7]);
		    boardVO.setFilename8(fnn[8]);
		    
		    String A=boardVO.getArea();
		    boardVO.setArea(A);
		    boardService.write(boardVO);
			return "redirect:/mboard/list";
		}
	//------------------------------------------------------------
	@RequestMapping(value="/mboard/edit/{seq}", method=RequestMethod.GET)
	public String edit(@PathVariable int seq, Model model) {
		BoardVO boardVO = boardService.read(seq);
		model.addAttribute("boardVO", boardVO);
		return "/mboard/edit";
	}
	
	@RequestMapping(value="/mboard/edit/{seq}", method=RequestMethod.POST)
	public String edit(@Valid @ModelAttribute BoardVO boardVO, BindingResult result,
						int pwd, SessionStatus sessionStatus, Model model) {
		if(result.hasErrors()) {
			return "/mboard/edit";
		}
		else {
			if(boardVO.getPassword() == pwd) {
				boardService.edit(boardVO);
				sessionStatus.setComplete();
				return "redirect:/mboard/list";
			}
		}
		model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		return "/mboard/edit";
	}
	
	@RequestMapping(value="/mboard/delete/{seq}", method=RequestMethod.GET)
	public String delete(@PathVariable int seq, Model model) {
		model.addAttribute("seq", seq);
		return "/mboard/delete";
	}
	
	@RequestMapping(value="/mboard/delete", method=RequestMethod.POST)
	public String delete(int seq, int pwd, Model model) {
		int rowCount;
		BoardVO boardVO = new BoardVO();
		boardVO.setSeq(seq);
		boardVO.setPassword(pwd);
		
		rowCount = boardService.delete(boardVO);
		
		if(rowCount == 0) {
			model.addAttribute("seq", seq);
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "/mboard/delete";
		}
		else {
			return "redirect:/mboard/list";
		}
	}
	
	@RequestMapping(value = "/mboard/aaa")
	public String action1(@RequestParam("uploadFile") MultipartFile file
	        ,HttpServletRequest request
	        , Model model) throws Exception {
	     
	     File f = new File("C:\\Users\\DK\\Desktop\\JAVA\\jsp\\workspace1\\mybatis_board\\src\\main\\webapp\\resources\\images\\"+file.getOriginalFilename());
	     file.transferTo(f);
	             
	    return "/mboard/write";
	}


	
}
