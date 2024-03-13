package fa.training.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VinhTest {

	public static void main(String[] args) {
		Map<Integer, List<String>> myMap = new HashMap<>();
		List<String> stringList = new ArrayList<>();
		for (int i = 0; i < 10; i++) {
		    stringList.add("Value " + i);
		}
		for (int i = 1; i < 11; i++) {
			stringList.add("Value " + i);
			myMap.put(i, stringList);
		}
		for (int i = 1; i < myMap.size() - 1; i++) {
			
			System.out.println(myMap.get(i));
		}

	}

}
