package ru.krukov.OneC;

public class Brackets implements IValidator{

    private char opening;
    private char covering;

    public Brackets(char opening, char covering){
        this.opening = opening; // можно реализовать разные скобки {}, (), []
        this.covering = covering;
    }

    public boolean validate(String text){
        int a = 0; // счётчик скобок.
        char[] charText = text.toCharArray();
        for(int i = 0; i < charText.length; i++){
            if(charText[i] == opening){
                a++; //инкрементируем если открывающая скобка  и декрементируем если закрывающая
            } else if(charText[i] == covering){
                a--;
                if(a < 0) return false; /* Очевидно, что закрывающих скобок не может быть больше открывающих,
                                           поэтому если в какой-то момент случается ()) т.е. идёт закрывающая скобка
                                           без открывающей, то программа возвращает ложь */
            }
        }
        return (a == 0); /*Мы уверены, что закрывающих не больше, в этой точке  программы возможна только одна ситуация
                           (((()) т.е. открывающих скобок больше закрывающих, поэтому мы проверяем соотношение скобок.
                           Если а = 0, то закрывающих и открывающих одинаковое количество, а значит всё ок */
    }

}