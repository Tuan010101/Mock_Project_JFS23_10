package fa.training.controller;

import java.time.LocalTime;

public class VinhTest {
	public static void main(String[] args) {
		LocalTime test = LocalTime.parse("09:00");
	
		System.out.println(test.toString());
	}
}
