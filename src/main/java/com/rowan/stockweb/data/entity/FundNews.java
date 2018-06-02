package com.rowan.stockweb.data.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FundNews {


    private Long id;

    private String code;
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")

    private java.time.LocalDate date;
    private String link ;
    private String title;
    private String seen;
    private String ok;
    private String notes;
    private String yesnotes;

    public  FundNews(){}

//    public FundNews(String code, LocalDate date, String title, String link) {
//        this.code = code;
//        this.date = date;
//        this.link = link;
//        this.title = title;
//    }
@Override
public String toString() {
    return "FundNews{" +
            "id=" + id +
            ", code='" + code + '\'' +
            ", date=" + date +
            ", link='" + link + '\'' +
            ", title='" + title + '\'' +
            ", seen='" + seen + '\'' +
            ", ok='" + ok + '\'' +
            ", notes='" + notes + '\'' +
            ", yesnotes='" + yesnotes + '\'' +
            '}';
}


}
