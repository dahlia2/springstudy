package com.gdu.vinery.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class NoticeAttachDTO {
	private int nAttachNo;
	private String nPath;
	private String nOriginName;
	private String nFilesystemName;
	private int nDownloadCount;
	private int nHasThumbnail;
}