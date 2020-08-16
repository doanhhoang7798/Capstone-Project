package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import dao.ReportDao;
import dao.UserDao;
import model.Users;

public class CronJob {

	@Autowired
	UserDao userDaoimpl;

	@Autowired
	ReportDao reportDaoimpl;

	@Scheduled(cron = "0 0 0 * * ?")

	public void autoUnlockUser() throws ParseException {

		for (Users user : userDaoimpl.filterByStatus(5)) {
			Date today = new Date();

			SimpleDateFormat fomart = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
			Date block_date = fomart.parse(user.getBlock_date());
			Date unlock_date = new Date(block_date.getTime() + (1000 * 60 * 60 * 24 * 3));
			if ((fomart.format(today)).equals(fomart.format(unlock_date))) {
				userDaoimpl.setStatus(user.getId(), 1, null);
				reportDaoimpl.deleteMany(user.getId());

			} else {
				System.out.println("nothing to do ...");
			}
		}

	}

}
