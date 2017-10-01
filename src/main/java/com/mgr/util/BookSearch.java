package com.mgr.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class BookSearch {

	public String bookimgname(String book_name, int start) throws IOException {
		// java코드로 특정 url에 요청보내고 응답받기
		// 기본 자바 API를 활용한 방법
		String book = URLEncoder.encode(book_name, "UTF-8");

		URL url = new URL(String.format(
				"http://book.interpark.com/api/search.api?key=3B955AD79705C095D29DBD114E799B8B8983098D58BC2B21C49D07BFCB3D6580&query=%s&inputEncoding=utf-8&output=json&start=%s",
				book, start)); // API 기본정보의 요청 url을 복사해오고 필수인

		URLConnection urlConn = url.openConnection(); // openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
		StringBuilder sb = new StringBuilder();

		String msg = null;
		while ((msg = br.readLine()) != null) {
			sb.append(msg);
		}

		return sb.toString();
	}

}
