package com.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

public class NumberConroller {
    public static Integer createNumber() {
        Random random = new Random();
        String valueStr = String.valueOf(random.nextInt(9999));
        if (valueStr.length() == 4 && valueStr.toCharArray()[0] != valueStr.toCharArray()[1] && valueStr.toCharArray()[0] != valueStr.toCharArray()[2] && valueStr.toCharArray()[0] != valueStr.toCharArray()[3] && valueStr.toCharArray()[1] != valueStr.toCharArray()[2] && valueStr.toCharArray()[1] != valueStr.toCharArray()[3] && valueStr.toCharArray()[2] != valueStr.toCharArray()[3])
            return Integer.valueOf(valueStr);
        else
            return createNumber();
    }

    private static Set<String> createSet(String number) {
        Set<String> set = new HashSet<String>();
        for(int i = 0; i < number.toCharArray().length; i++) {
            set.add(String.valueOf(number.toCharArray()[i]));
        }
        return set;
    }

    public static List<Integer> returnCompareNumbers(String number, String numberInput) {
        int countCows = 0, countBulls = 0;
        List<Integer> numbers = new ArrayList<Integer>();
        Set<String> numberSet = createSet(number);
        Set<String> numberInputSet = createSet(numberInput);
        numberSet.retainAll(numberInputSet);

        countCows = numberSet.size();

        for(int i = 0; i < number.toCharArray().length; i++) {
            if(String.valueOf(number.toCharArray()[i]).equals(String.valueOf(numberInput.toCharArray()[i]))) {
                countBulls++;
            }
        }

        numbers.add(countCows - countBulls);
        numbers.add(countBulls);
//        System.out.print("  Количество коров " + (countCows - countBulls));
//        System.out.println("  Количество быков " + countBulls);
//        System.out.println("Введенная строка " + numberInput);
//        System.out.println("Задуманное число " + number);
        return numbers;
    }
}
