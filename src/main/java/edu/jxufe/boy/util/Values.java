package edu.jxufe.boy.util;

/**
 * Created by Raomengnan on 2016/5/30.
 */
public enum  Values {
    USEREMAIL("uemail"),
    AUTHORITHTOCKEN("tocken");

    private final String value;
    public String value(){return this.value;}
    Values(String vaule) {
        this.value = vaule;
    }
}
