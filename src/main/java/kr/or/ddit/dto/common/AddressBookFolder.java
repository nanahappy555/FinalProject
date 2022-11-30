package kr.or.ddit.dto.common;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddressBookFolder {
	private String title;
	private String key;
	private boolean checkbox;
	private boolean folder;
	private List<AddressBookChildren> children;
}
