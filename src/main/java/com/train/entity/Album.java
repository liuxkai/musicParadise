package com.train.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Album {
	private Long Aid;
	private String albumName;
	private String singerName;
	private String albumIntroduce;//专辑介绍
}
