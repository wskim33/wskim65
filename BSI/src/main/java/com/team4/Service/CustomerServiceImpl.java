package com.team4.Service;

import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.team4.dao.CustomerDao;
import com.team4.vo.CustomerVO;
import com.opencsv.CSVReader;

import lombok.Setter;

public class CustomerServiceImpl implements CustomerService {

	@Setter
	private CustomerDao customerDao;
	
	@Override
	public void initData(String csvPath) {
		
		List<CustomerVO> list2 = readbsiFromCsv(csvPath);
		
		customerDao.insertCustomer(list2);
		
//		customerDao.dropCustomer();
//		
//		customerDao.createCustomer();
//				
//		customerDao.deleteCustomer();
		
	}

	@Override
	public List<CustomerVO> readbsiFromCsv(String csvPath) {

		FileReader fr = null;
		CSVReader csvr = null;
		ArrayList<CustomerVO> result = new ArrayList<>();
		try {
			fr = new FileReader(csvPath);
			csvr = new CSVReader(fr);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			csvr.readNext(); // skip header row
			
			while(true) {
				String[] row = csvr.readNext();
				String[] list = {"1시", "2시", "3시", "4시", "5시", "6시", "7시", "8시",
								"9시","10시","11시","12시","13시","14시","15시","16시",
								"17시","18시","19시","20시","21시","22시","23시","24시"};
				if(row==null) {
					break;
				}
				for(int i = 0; i < 24; i ++) {
				CustomerVO customer = new CustomerVO(Integer.BYTES,
												 	 Integer.parseInt(row[1]),
												 	 sdf.parse(row[3]),
												 	 String.valueOf(list[i]),
												 	 String.valueOf(row[4]),
												 	 Integer.parseInt(row[i+5]));
		                result.add(customer);
				}	
			} 	
				
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			try { csvr.close(); } catch (Exception ex) {}
			try { fr.close(); } catch (Exception ex) {}
		}
		//System.out.println(result);
		return result;
	}
}
