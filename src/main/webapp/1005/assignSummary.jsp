<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
 .card-header {
    border-bottom: 5px solid #e6e6f2;
} 
/* .border-top {
    border-top: 10px solid #e6e6f2 !important;
} */
</style>
<div class="row">


	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
		  <h2 class="card-header">
		  	<i class="far fa-edit"></i> 번역할 논문</h2>
			<div class="card-body">
				<form id="form" data-parsley-validate="" novalidate="">
				
					<div class="form-group row">
						<label for="inputUrl"
							class="col-3 col-lg-2 col-form-label text-right">URL :</label>
						<div class="col-9 col-lg-10">
							<input id="inputUrl" type="" required=""
								placeholder="http://"
								class="form-control">
						</div>
					</div>
					
					
					<div class="form-group row">
						<label for="inputFile"
							class="col-3 col-lg-2 col-form-label text-right">첨부 파일 :</label>
						<div class="col-6 col-lg-8">
						<!-- 	<input id="inputFile" type="" required="" placeholder=" .pdf" class="form-control"> -->
						
						<textarea rows="5" cols="175" name="file" style="resize: none;"></textarea>
						
							</div>
						<div class="col-3 col-lg-2">
							<button type="submit" class="btn btn-rounded btn-dark">찾아보기..</button>
							
						</div>
					</div>
					
				<!-- 	
					<div class="form-group row">
						<label for="inputWebSite"
							class="col-3 col-lg-2 col-form-label text-right">Web Site</label>
						<div class="col-9 col-lg-10">
							<input id="inputWebSite" type="url" required=""
								data-parsley-type="url" placeholder="URL" class="form-control">
						</div>
					</div> -->
					
					
					<div class="row pt-2 pt-sm-5 mt-1">
						<div class="col-sm-6 pb-2 pb-sm-4 pb-lg-0 pr-0">
							<label class="be-checkbox custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"><span
								class="custom-control-label">Remember me</span>
							</label>
						</div>
						<div class="col-sm-6 pl-0">
						
							<p class="text-right">
								<button type="submit" class="btn btn-space btn-primary">번역 및 요약</button>
								<!-- <button class="btn btn-space btn-secondary">Cancel</button> -->
							</p>
						</div>
						
						
						
					</div>
				</form>
			</div>
			
			
			<div class="card-body border-top">
			
			<textarea rows="25" cols="260" name="contents" style="resize: none;"></textarea>
			
			</div>
			
			
		</div>
	</div>



</div>