package board.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import board.domain.BoardVO;
import board.service.BoardService;

@Controller
@SessionAttributes("boardVO")
public class BoardController {
	private BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping(value="/board/list")
	public String list(Model model) {
		model.addAttribute("boardList", boardService.list());
		return "/board/list";
	}
	
	@RequestMapping(value="/board/read/{seq}")
	public String read(Model model, @PathVariable int seq) {
		model.addAttribute("boardVO", boardService.read(seq));
		return "/board/read";
	}
	
	//새 글 작성
	@RequestMapping(value="/board/write", method=RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("boardVO", new BoardVO());
		return "/board/write";
	}
	//--------------------------------------------------
	
/*		@RequestMapping(value ="/board/write")
	public String action(@RequestParam("uploadFile") MultipartFile file
	        ,HttpServletRequest request
	        , Model model) throws Exception {
	     
	     File f = new File("C:\\Users\\DK\\Desktop\\JAVA\\jsp\\workspace1\\mybatis_board\\src\\main\\webapp\\resources\\images\\"+file.getOriginalFilename());
	     file.transferTo(f);
	             
	    return "redirect:/board/write";
	}*/

	
	
	
	//-------------------------------------------------
	//새 글 등록
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String write(@Valid BoardVO boardVO, BindingResult bindingResult,@RequestParam("uploadfile") MultipartFile file, 
			HttpServletRequest request)
	throws Exception{
		if(bindingResult.hasErrors()) {
			return "/board/write";
		}
		
		
	   // File f = new File("C:\\오전반 이동규\\workspace1\\mybatis_board\\src\\main\\webapp\\resources\\images\\"+file.getOriginalFilename());
		File f = new File("C:\\Users\\IT75\\Desktop\\test\\"+file.getOriginalFilename());
		
		System.out.println("파ㅣ일네임 확인");
	    
	    file.transferTo(f);
	    String fn=file.getOriginalFilename();
	    boardVO.setFilename(fn);
	    boardService.write(boardVO);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/board/edit/{seq}", method=RequestMethod.GET)
	public String edit(@PathVariable int seq, Model model) {
		BoardVO boardVO = boardService.read(seq);
		model.addAttribute("boardVO", boardVO);
		return "/board/edit";
	}
	
	@RequestMapping(value="/board/edit/{seq}", method=RequestMethod.POST)
	public String edit(@Valid @ModelAttribute BoardVO boardVO, BindingResult result,
						int pwd, SessionStatus sessionStatus, Model model) {
		if(result.hasErrors()) {
			return "/board/edit";
		}
		else {
			if(boardVO.getPassword() == pwd) {
				boardService.edit(boardVO);
				sessionStatus.setComplete();
				return "redirect:/board/list";
			}
		}
		model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		return "/board/edit";
	}
	
	@RequestMapping(value="/board/delete/{seq}", method=RequestMethod.GET)
	public String delete(@PathVariable int seq, Model model) {
		model.addAttribute("seq", seq);
		return "/board/delete";
	}
	
	@RequestMapping(value="/board/delete", method=RequestMethod.POST)
	public String delete(int seq, int pwd, Model model) {
		int rowCount;
		BoardVO boardVO = new BoardVO();
		boardVO.setSeq(seq);
		boardVO.setPassword(pwd);
		
		rowCount = boardService.delete(boardVO);
		
		if(rowCount == 0) {
			model.addAttribute("seq", seq);
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "/board/delete";
		}
		else {
			return "redirect:/board/list";
		}
	}
	
	@RequestMapping(value = "/board/aaa")
	public String action1(@RequestParam("uploadFile") MultipartFile file
	        ,HttpServletRequest request
	        , Model model) throws Exception {
	     
	     File f = new File("C:\\Users\\DK\\Desktop\\JAVA\\jsp\\workspace1\\mybatis_board\\src\\main\\webapp\\resources\\images\\"+file.getOriginalFilename());
	     file.transferTo(f);
	             
	    return "/board/write";
	}


	
}
