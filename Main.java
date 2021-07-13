package ru.krukov.OneC;

import java.util.Scanner;

public class Main{
    public static void main(String[] args){
        System.out.println("Введите выражение");
        Scanner str = new Scanner(System.in);
        Brackets line = new Brackets('(',')');
        if(line.validate(str.nextLine())){
            System.out.println("Всё окей");
        } else {
            System.out.println("Со скобками беда");
        }
    }
}