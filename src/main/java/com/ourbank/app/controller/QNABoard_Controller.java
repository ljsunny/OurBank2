package com.ourbank.app.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.ourbank.app.bean.QNABoard_Bean;
import com.ourbank.app.service.QNABoard_Service;

@Controller
public class QNABoard_Controller {
	@Autowired
	private QNABoard_Service boardService;
	
	private static final Logger logger=LoggerFactory.getLogger(QNABoard_Controller.class);
	
	//�۾�����
	@RequestMapping(value="/qna_show_write_form.do", method=RequestMethod.GET)
	public String showWriteForm(Model model) {
		logger.info("show_write_form called!!");
		
		int idx=0;
		//�����϶�
		int reply=0;
		QNABoard_Bean boardBean=new QNABoard_Bean();
		boardBean.setReply(reply);
		model.addAttribute("idx", idx);
		model.addAttribute("boardBean", boardBean);
		model.addAttribute("reply", reply);
		return "board_customer/qna/qnaWriteForm";
	}
	//�۾���
	@RequestMapping(value="/qna_write_form.do", method=RequestMethod.POST)
	public String DoQnaWriteBoard(@ModelAttribute("boardBean") @Valid QNABoard_Bean boardBean,
			BindingResult bindingResult,
			HttpServletRequest request,
			Model model) {
		System.out.println(boardBean.toString());
		MultipartFile file=boardBean.getFile();
		
		
		//��ȿ�� �˻�
		if(bindingResult.hasErrors()) {
			List<ObjectError> list=bindingResult.getAllErrors();
			for(ObjectError e:list) {
				logger.error("ObjectError"+e+"\n");
			}
			model.addAttribute("boardBean",boardBean);
			return "board_customer/qna/qnaWriteForm";
		}
		
		//���� ó��
		if(file!=null) {
			String fileName=file.getOriginalFilename();
			long fileSize=file.getSize();
			boardBean.setFilename(fileName);
			boardBean.setFilesize(fileSize);
			logger.info(boardBean.getFilename());
			logger.info(boardBean.getFilesize()+"");
			
			try {
				byte[] fileData=file.getBytes();
				FileOutputStream output=new FileOutputStream("D:\\javaBigData\\mywork_spring\\OurBank3_1\\src\\main\\resources\\files"+fileName);
				output.write(fileData);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("uid");
		boardBean.setId(id);
		logger.info(boardBean.getCategory()+" "+
					boardBean.getId()+" "+
					boardBean.getContent()+" "+
					boardBean.getSubject());
		boardService.insertBoard(boardBean);
		if(boardBean.getReply()==0) {
			//insert �� id ������
			int idx=boardService.getRecent();
			//reply�� idx ������ ����(�׷����� ����)
			boardService.updateReply(idx);
		}
		
		model.addAttribute("totalCnt", new Integer(boardService.getTotalCnt()));
		model.addAttribute("current_page", 1);
		model.addAttribute("boardList", boardService.getList(1, 10));
		return "redirect:qnaList.do";
	}
	
	//����Ʈ �Ѹ���
	@RequestMapping(value="/qnaList.do", method=RequestMethod.GET)
	public String qnaList(
			HttpServletRequest request,
			@RequestParam("current_page") String pageForView, Model model
			) {
		
		logger.info("qnaList called !!");
		HttpSession session=request.getSession();
		String uid=(String)session.getAttribute("uid");
		logger.info(uid);
		model.addAttribute("uid", uid);
		model.addAttribute("totalCnt", new Integer(boardService.getTotalCnt()));//��ü �ۼ�
		model.addAttribute("current_page",pageForView);
		model.addAttribute("boardList", boardService.getList(Integer.parseInt(pageForView), 10)); //����Ʈ�Ѹ� ArrayList �޾ƿͼ� ����
		return "board_customer/qna/qnaListSpecificPage";
	}
	//ȸ������ ����Ʈ �Ѹ���
	@RequestMapping(value="/qnaSignUpList.do", method=RequestMethod.GET)
	public String qnaSignUpList(
			@RequestParam("current_page") String pageForView, Model model
			) {
		logger.info("qna signup List called !!");
		model.addAttribute("totalCnt", new Integer(boardService.getSignUpCnt()));//ȸ������ �ۼ�
		model.addAttribute("current_page",pageForView);
		model.addAttribute("boardList", boardService.getSignUpList(Integer.parseInt(pageForView), 10)); //����Ʈ�Ѹ� ArrayList �޾ƿͼ� ����
		return "board_customer/qna/qnaListSpecificPage";
	}
	//������ ����Ʈ �Ѹ���
	@RequestMapping(value="/qnaSavingsList.do", method=RequestMethod.GET)
	public String qnaSavingList(
			@RequestParam("current_page") String pageForView, Model model
			) {
		logger.info("qna saving List called !!");
		model.addAttribute("totalCnt", new Integer(boardService.getSavingsCnt()));//ȸ������ �ۼ�
		model.addAttribute("current_page",pageForView);
		model.addAttribute("boardList", boardService.getSavingsList(Integer.parseInt(pageForView), 10)); //����Ʈ�Ѹ� ArrayList �޾ƿͼ� ����
		return "board_customer/qna/qnaListSpecificPage";
	}
	//��Ÿ ����Ʈ �Ѹ���
	@RequestMapping(value="/qnaEtcList.do", method=RequestMethod.GET)
	public String qnaEtcList(
			@RequestParam("current_page") String pageForView, Model model
			) {
		logger.info("qna etc List called !!");
		model.addAttribute("totalCnt", new Integer(boardService.getEtcCnt()));//ȸ������ �ۼ�
		model.addAttribute("current_page",pageForView);
		model.addAttribute("boardList", boardService.getEtcList(Integer.parseInt(pageForView), 10)); //����Ʈ�Ѹ� ArrayList �޾ƿͼ� ����
		return "board_customer/qna/qnaListSpecificPage";
	}

	//�ۺ���
	@RequestMapping(value="/qnaView.do", method=RequestMethod.GET)
	public String viewWork(@RequestParam("idx") int idx,
						   @RequestParam("current_page") String current_page,
						   @RequestParam("searchStr") String searchStr,
						   Model model) {
		logger.info("viewWork called");
		logger.info("idx=["+idx+"] current_page=["+current_page+"] "
				+ "searchStr=["+searchStr+"]");
		QNABoard_Bean boardData=boardService.getSpecificRow(idx);
		logger.info(boardData.getContent());
		boardService.updateHits(boardData.getHits(), boardData.getIdx());
		model.addAttribute("hits", boardData.getHits());
		logger.info(boardData.getCategory());
		
		
		boardData.setReply(1);
		
		model.addAttribute("idx", idx);
		model.addAttribute("current_page", current_page);
		model.addAttribute("searchStr", searchStr);
		model.addAttribute("boardData", boardService.getSpecificRow(idx));
		model.addAttribute("category", boardData.getCategory());
		model.addAttribute("filename", boardData.getFilename());
		model.addAttribute("reply", boardData.getReply());
		return "board_customer/qna/qnaViewMemo";
	}
	
	//�ٿ�ε�
	@RequestMapping(value = "/qna_download.do", 
	         method=RequestMethod.GET)
	   @ResponseBody
	   public byte[] downProcess(HttpServletResponse response, @RequestParam String filename) throws IOException{
	      File file = new File("C:\\eclipse_ourBank\\OurBank\\src\\main\\resources\\files\\" + filename);
	      byte[] bytes = FileCopyUtils.copyToByteArray(file);
	      String fn = new String(file.getName().getBytes(),"iso_8859_1");
	      
	      response.setHeader("Content-Disposition",
	                "attachment;filename=\"" + fn + "\"");
	        response.setContentLength(bytes.length);
	        return bytes;
	   }
	//���
	@RequestMapping(value="reply_from.do", method=RequestMethod.GET)
	public String replyFrom(
			@RequestParam int idx,
			@RequestParam String category,
			Model model) {
		
		int reply=idx;
		QNABoard_Bean boardBean=new QNABoard_Bean();
		boardBean.setReply(reply);
		model.addAttribute("idx", idx);
		model.addAttribute("category", category);
		model.addAttribute("boardBean", boardBean);
		return "board_customer/qna/qnaWriteForm";
		
	}
	//�ۼ�����
	@RequestMapping(value="qna_show_update_form.do",method=RequestMethod.GET)
	public String showUpdateForm(
			@RequestParam("idx") int idx,
			@RequestParam("current_page") String current_page,
			Model model
			) {
		
		logger.info("update form!!");
		logger.info(idx+"");
		model.addAttribute("idx", idx);
		model.addAttribute("current_page", current_page);
		model.addAttribute("boardData", boardService.getSpecificRow(idx));
		
		return "board_customer/qna/qnaViewMemoForUpdate";
	}
	//�ۼ���
	@RequestMapping(value="/qna_update.do", method=RequestMethod.POST)
	public String qnaUpdate(
			@ModelAttribute("boardBean") @Valid QNABoard_Bean boardBean,
			BindingResult bindingResult,
			@RequestParam("idx") int idx,
			@RequestParam("current_page") String current_page,
			Model model) {
		System.out.println(boardBean.toString());
		MultipartFile file=boardBean.getFile();
		
		//��ȿ�� �˻�
		if(bindingResult.hasErrors()) {
			List<ObjectError> list=bindingResult.getAllErrors();
			for(ObjectError e:list) {
				logger.error("ObjectError"+e+"\n");
			}
			model.addAttribute("boardBean",boardBean);
			return "board_customer/qna/qnaWriteForm";
		}
		
		//���� ó��
		if(file!=null) {
			String fileName=file.getOriginalFilename();
			long fileSize=file.getSize();
			boardBean.setFilename(fileName);
			boardBean.setFilesize(fileSize);
			logger.info(boardBean.getFilename());
			logger.info(boardBean.getFilesize()+"");
			
			try {
				byte[] fileData=file.getBytes();
				FileOutputStream output=new FileOutputStream("D:\\javaBigData\\mywork_spring\\OurBank3_1\\src\\main\\resources\\files"+fileName);
				output.write(fileData);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		//���ǿ��� ���;���
		String id="admin";
		boardBean.setId(id);
		logger.info(boardBean.getCategory()+" "+
					boardBean.getId()+" "+
					boardBean.getContent()+" "+
					boardBean.getSubject());
		
		boardBean.setIdx(idx);
		
		boardService.updateBoard(boardBean);
		boardBean=boardService.getSpecificRow(idx);
		
		model.addAttribute("idx", idx);
		model.addAttribute("current_page", current_page);
		model.addAttribute("searchStr", "None");
		model.addAttribute("boardData", boardService.getSpecificRow(idx));
		model.addAttribute("filename", boardBean.getFilename());
		
		return "board_customer/qna/qnaViewMemo";
	}
	
	//�� ����
	@RequestMapping(value="/qnaDeleteSpecificRow.do", method=RequestMethod.GET)
	public String deleteSpecificRow(@RequestParam("idx") int idx,
									@RequestParam("current_page") int current_page,
									Model model) {
		logger.info("DeleteSpecificRow called!!");
		logger.info("memo_id=["+idx+"]  current_page=["+current_page+"]");
		boardService.deleteRow(idx);
		//�ٽ� �������� ��ȸ�Ѵ�.
		model.addAttribute("totalCnt", new Integer(boardService.getTotalCnt()));
		model.addAttribute("current_page", current_page);
		model.addAttribute("boardList",boardService.getList(current_page, 10));
		
		return "redirect:qnaList.do";
	}
	
	//�۰˻�
	@RequestMapping(value="/qnaSearch.do", method=RequestMethod.POST)
	public String searchWithSubject (@RequestParam("searchStr") String searchStr, 
									Model model) {
		
		
		return searchedList(1, searchStr,model);
	}

	//�˻��� �������� �̵�
	@RequestMapping(value="/qnaSearchedList.do",method = RequestMethod.GET)
	public String searchedList(
			@RequestParam("pageForView") int pageForView,
			@RequestParam("searchStr") String searchStr,
			Model model
			) {
		logger.info("listSearchedSpecificPageWork called");
		logger.info("pageForView=["+pageForView+"]");
		logger.info("searchStr=["+searchStr+"]");
		
		model.addAttribute("totalCnt", new Integer(boardService.getTotalCntBySubject(searchStr)));
		model.addAttribute("searchedList", boardService.getSearchedList(pageForView, 10, searchStr));
		model.addAttribute("pageForView", pageForView);
		model.addAttribute("searchStr", searchStr);

		return "board_customer/qna/qnaListSearchedPage";
	}

}
