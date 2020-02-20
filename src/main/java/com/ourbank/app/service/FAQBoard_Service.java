package com.ourbank.app.service;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import com.ourbank.app.bean.FAQBoard_Bean;
import com.ourbank.app.mapper.FAQBoard_Mapper;

@Component
public class FAQBoard_Service {
	@Autowired
	private FAQBoard_Mapper boardMapper;
	
	//���Է� ó��
		public void insertBoard(FAQBoard_Bean boardBean) {
			boardMapper.insertBoard(boardBean);	
			};

		// ��ȸ�� �ø���
		public void updateHits(int hits, int idx) {
			System.out.println("��ȸ�� �ö�");
			this.boardMapper.updateHits(hits, idx);
		}

		//��ü�ۼ�
		public int getTotalCnt() {
			int nCnt=0;
			nCnt=this.boardMapper.getTotalCnt();
			return nCnt;
		}

		//�ε���, ����, �ۼ���, ��¥, ����, ��ȸ��  arraylist ����
		public ArrayList<FAQBoard_Bean> getList(int nStartPage, int list_num){
			return this.boardMapper.getList(nStartPage, list_num);
		}
		//ȸ������ �ۼ�
		public int getSignUpCnt() {
			int nCnt=0;
			nCnt=this.boardMapper.getSignUpCnt();
			return nCnt;
		}
		//ȸ������ arraylist
		public ArrayList<FAQBoard_Bean> getSignUpList(int nStartPage, int list_num){
			return this.boardMapper.getSignUpList(nStartPage, list_num);
		}
		//������
		public int getSavingsCnt() {
			int nCnt=0;
			nCnt=this.boardMapper.getSavingsCnt();
			return nCnt;
		}
		//������ arraylist
		public ArrayList<FAQBoard_Bean> getSavingsList(int nStartPage, int list_num){
			return this.boardMapper.getSavingsList(nStartPage, list_num);
		}
		//��Ÿ
		public int getEtcCnt() {
			int nCnt=0;
			nCnt=this.boardMapper.getEtcCnt();
			return nCnt;
		}
		//��Ÿ arraylist
		public ArrayList<FAQBoard_Bean> getEtcList(int nStartPage, int list_num){
			return this.boardMapper.getEtcList(nStartPage, list_num);
		}
		
		//�ۺ��⿡ �Ѹ� bean
		public FAQBoard_Bean getSpecificRow(int idx) {
			return this.boardMapper.getSpecificRow(idx);//-getSpecificRow(@Param("id") String id): return id, subject, name, created_date, mail, memo, hits
		}
		
		//�� �����ϱ�
		public void updateBoard(FAQBoard_Bean boardBean) {
			boardMapper.updateBoard(boardBean.getIdx(), boardBean.getSubject(), 
					boardBean.getCategory(), boardBean.getContent());
		}
		//�ۻ����ϱ�
		public void deleteRow(int idx) {
			this.boardMapper.deleteSpecificRow(idx);
		}
		//�˻��� �� ��
		public int getTotalCntBySubject(String search) {
			int nCnt=0;
			nCnt=this.boardMapper.getTotalCntBySubject(search);
			return nCnt;
		}
		//�˻��ϱ� => ArrayList �� ��� 
				public ArrayList<FAQBoard_Bean> getSearchedList(int nStartPage, int list_num, String strSearchThis){
					return this.boardMapper.getSearchedList(nStartPage, list_num, strSearchThis);
				}

}
