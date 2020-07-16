package com.fpt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpt.dao.ReportDao;
import com.fpt.dao.UserDao;
import com.fpt.model.Reports;
import com.fpt.service.CurrentUser;

@Controller
public class ReportController {

	@Autowired
	CurrentUser user;

	@Autowired
	ReportDao reportDaoimpl;

	@Autowired
	UserDao userDaoimplDao;


	

	}

