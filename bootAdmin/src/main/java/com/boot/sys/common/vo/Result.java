package com.boot.sys.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Result<T> {

	private Integer code;

	private String message;

	private T data;

	//成功
	public static <T> Result<T> success(){
		return new Result<>(20000, "success", null);
	}

	public static <T> Result<T> success(String msg){
		return new Result<>(20000, msg, null);
	}

	public static <T> Result<T> success(T data){
		return new Result<>(20000, "success", data);
	}

	public static <T> Result<T> success(T data, String msg){
		return new Result<>(20000, msg, data);
	}

	//失败
	public static <T> Result<T> fail(){
		return new Result<>(20001, "fail", null);
	}

	public static <T> Result<T> fail(String msg){
		return new Result<>(20001, msg, null);
	}

	public static <T> Result<T> fail(Integer code){
		return new Result<>(code, "fail", null);
	}

	public static <T> Result<T> fail(Integer code, String msg){
		return new Result<>(code, msg, null);
	}

}
