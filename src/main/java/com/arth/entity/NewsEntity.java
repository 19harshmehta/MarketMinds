package com.arth.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "news")
@Data
public class NewsEntity 
{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer newsId;
	public String source;
	public String author;
    public String title;
    @Column(length = 1024)
    public String description;
    public String url;
    public String urlToImage;
    public String publishedAt;
    public String content;
    
	
    
    
    
    
}
