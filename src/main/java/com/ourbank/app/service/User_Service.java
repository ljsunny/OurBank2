package com.ourbank.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ourbank.app.bean.UserBoard_Bean;
import com.ourbank.app.mapper.User_Mapper;

@Component
public class User_Service {
	
	@Autowired
	private User_Mapper boardmapper;
	
	public void insert(UserBoard_Bean boardBean) {
		this.boardmapper.insert(boardBean);
	}
	
	public boolean selectCheckID(String id) {
		int nID= boardmapper.selectCheckID(id);
		if(nID!=0) {
			return false;//���̵� ������ ���
		}
		return true;//���̵� �������� ���� ���
	}
	
	public boolean CheckIDandPassword(String id, String passwd) {
		int passwdOK=boardmapper.selectCheckIdPasswd(id, passwd);
		if(passwdOK==0) {//��ġ�ϴ� �н����尡 �������� �ʴ� ���
			return false;
		}
		return true; // ��ġ�ϴ� ���̵� �����ϴ� ���
	}
	//���̵� ã��
	public String checkFindId(String user_name, String user_birth, String user_phone) {
		String user_id=boardmapper.selectCheckFindId(user_name, user_birth, user_phone);
	
		return user_id;	
	}
	//��й�ȣã��
	public int checkFindPasswd(String id, String user_name, String user_birth, String user_phone) {
		return boardmapper.selectCheckFindPasswd(id, user_name, user_birth, user_phone);
	}
	
	public void changePasswd(String passwd, String id) {
		this.boardmapper.updatePasswd(passwd, id);
	}
	

}
