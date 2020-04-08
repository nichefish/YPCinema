package service.admin;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.CalendarDTO;

@Service
public class ScheduleService {
	//달력 
	public void scheduleView(Model model) {
		List<String> calendars = new ArrayList<String>();
		for(int i= 0; i<3; i++) {
			calendars.add("*");
		}
		//Calendar 객체 생성 (추상클래스이기 때문에 getInstance로 객체 생성.)
		Calendar cal = Calendar.getInstance();
		int day[][][] = new int[12][6][7];  //[월][주][요일]
	    String week[] = new String[] {"일","월","화","수","목","금","토"};
	    
	    for(int month=0; month<12; month++) {
	         cal.set(Calendar.MONTH, month);
	         //이번달 마지막일 maxDay에 저장
	         int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	              
	         for(int i=1; i<=maxDay; i++) {
	             cal.set(Calendar.DATE, i);
	               //주와 요일은 1부터 시작하기 때문에 0부터 시작하는 배열 인덱스와 맞지 않다 
	               //그래서 -1을 해서 배열 인덱스와 맞춰 주었다.
	               day[cal.get(Calendar.MONTH)]
	                     [cal.get(Calendar.WEEK_OF_MONTH)-1]
	                         [cal.get(Calendar.DAY_OF_WEEK)-1] = i;
	          }
	     }
	    for(int month=0; month<12; month++) {
	          int mm = month+1;
	              
	          for(int i=0; i<week.length; i++) {
	              System.out.print(week[i]+"\t");
	          }
	          System.out.println();
	              
	          for(int i=0; i<6; i++) {
	              for(int j=0; j<7; j++) {
	            	  if(day[month][i][j] != 0) {
	            	  calendars.add(mm+"/"+Integer.toString(day[month][i][j]));
	            	  System.out.println("calendar에 들어간 값=" + mm+"/"+day[month][i][j]);

	            	  }
	              }
	         }
	    }
	    model.addAttribute("calendar",calendars);
	}
}
