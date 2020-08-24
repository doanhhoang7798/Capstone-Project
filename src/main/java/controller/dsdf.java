package controller;

import dao.UserDao;

public class dsdf {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		 UserDao userDaoimpl = new UserDao();
		System.out.print("================"+ userDaoimpl.findByPhone("03272727272727").getId());

	}

}
