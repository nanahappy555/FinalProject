package kr.or.ddit.exception;

public class NotMultipartFormDataException extends Exception {

	public NotMultipartFormDataException() {
		super("multipart 형식이 아닙니다.");
	}
}
