package service;

import java.util.ArrayList;

import DAO.VoucherDAO;

public class SalesService {

	public static ArrayList<Integer> income() {
		ArrayList<Integer> income = new ArrayList<>();

		VoucherDAO voucher = new VoucherDAO();
		String month[] = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" };

		for (int j = 0; j < month.length; j++) {
			ArrayList<String> vouchers = voucher.sales(month[j]);
			int sales = 0;
			for (int i = 0; i < vouchers.size(); i++) {
				if (vouchers.get(i).equals("1")) {
					sales += 20000;
				} else if (vouchers.get(i).equals("3")) {
					sales += 40000;
				} else if (vouchers.get(i).equals("6")) {
					sales += 70000;
				} else if (vouchers.get(i).equals("12")) {
					sales += 100000;
				}
			}
			income.add(sales);
		}
		return income;
	}
}
