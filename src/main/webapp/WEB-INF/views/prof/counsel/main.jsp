<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%--한줄 시작 ---------------------------------------------------------%>\

<

<div class="row">
<div class="col-xl-12">
<div class="card">
<h5 class="card-header">학생지도관리 메인페이지</h5>
<div class="card-body">

<div class="row">
<div class="col-xl-3">
<div class="ct-chart-donut ct-golden-section"><svg xmlns:ct="http://gionkunz.github.com/chartist-js/ct" width="100%" height="100%" class="ct-chart-donut" style="width: 100%; height: 300px;"><g class="ct-series ct-series-a"><path d="M198.105,10.553A113.453,113.453,0,0,0,119.711,118.453L179.711,118.453A53.453,53.453,0,0,1,216.646,67.616Z" class="ct-slice-donut-solid" ct:value="20"></path></g><g class="ct-series ct-series-b"><path d="M268.223,10.553A113.453,113.453,0,0,0,197.729,10.676L216.469,67.674A53.453,53.453,0,0,1,249.682,67.616Z" class="ct-slice-donut-solid" ct:value="10"></path></g><g class="ct-series ct-series-c"><path d="M324.95,185.139A113.453,113.453,0,0,0,267.846,10.431L249.504,67.559A53.453,53.453,0,0,1,276.409,149.872Z" class="ct-slice-donut-solid" ct:value="30"></path></g><g class="ct-series ct-series-d"><path d="M119.711,118.453A113.453,113.453,0,0,0,325.182,184.818L276.518,149.721A53.453,53.453,0,0,1,179.711,118.453Z" class="ct-slice-donut-solid" ct:value="40"></path></g><g><text dx="165.6490661413032" dy="69.40060886727971" text-anchor="middle" class="ct-label">20</text><text dx="233.16406249999997" dy="35" text-anchor="middle" class="ct-label">10</text><text dx="312.53270083644395" dy="92.6646911413032" text-anchor="middle" class="ct-label">30</text><text dx="207.37562864130325" dy="197.821763336444" text-anchor="middle" class="ct-label">40</text></g></svg></div>
</div>
<div class="col-xl-3">
<div class="ct-chart-donut ct-golden-section"><svg xmlns:ct="http://gionkunz.github.com/chartist-js/ct" width="100%" height="100%" class="ct-chart-donut" style="width: 100%; height: 300px;"><g class="ct-series ct-series-a"><path d="M198.105,10.553A113.453,113.453,0,0,0,119.711,118.453L179.711,118.453A53.453,53.453,0,0,1,216.646,67.616Z" class="ct-slice-donut-solid" ct:value="20"></path></g><g class="ct-series ct-series-b"><path d="M268.223,10.553A113.453,113.453,0,0,0,197.729,10.676L216.469,67.674A53.453,53.453,0,0,1,249.682,67.616Z" class="ct-slice-donut-solid" ct:value="10"></path></g><g class="ct-series ct-series-c"><path d="M324.95,185.139A113.453,113.453,0,0,0,267.846,10.431L249.504,67.559A53.453,53.453,0,0,1,276.409,149.872Z" class="ct-slice-donut-solid" ct:value="30"></path></g><g class="ct-series ct-series-d"><path d="M119.711,118.453A113.453,113.453,0,0,0,325.182,184.818L276.518,149.721A53.453,53.453,0,0,1,179.711,118.453Z" class="ct-slice-donut-solid" ct:value="40"></path></g><g><text dx="165.6490661413032" dy="69.40060886727971" text-anchor="middle" class="ct-label">20</text><text dx="233.16406249999997" dy="35" text-anchor="middle" class="ct-label">10</text><text dx="312.53270083644395" dy="92.6646911413032" text-anchor="middle" class="ct-label">30</text><text dx="207.37562864130325" dy="197.821763336444" text-anchor="middle" class="ct-label">40</text></g></svg></div>
</div>
<div class="col-xl-6">

<div id="morris_bar" style="position: relative; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><svg height="342" version="1.1" width="735" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative;"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs><text x="22.5" y="310" text-anchor="end" font-family="Circular Std Book" font-size="14px" stroke="none" fill="#71748d" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: &quot;Circular Std Book&quot;; font-size: 14px; font-weight: normal;" font-weight="normal"><tspan dy="5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan></text><path fill="none" stroke="#e6e6f2" d="M35,310.5H709.5" stroke-width="0.8" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="22.5" y="238.75" text-anchor="end" font-family="Circular Std Book" font-size="14px" stroke="none" fill="#71748d" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: &quot;Circular Std Book&quot;; font-size: 14px; font-weight: normal;" font-weight="normal"><tspan dy="5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2</tspan></text><path fill="none" stroke="#e6e6f2" d="M35,238.5H709.5" stroke-width="0.8" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="22.5" y="167.5" text-anchor="end" font-family="Circular Std Book" font-size="14px" stroke="none" fill="#71748d" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: &quot;Circular Std Book&quot;; font-size: 14px; font-weight: normal;" font-weight="normal"><tspan dy="5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">4</tspan></text><path fill="none" stroke="#e6e6f2" d="M35,167.5H709.5" stroke-width="0.8" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="22.5" y="96.25" text-anchor="end" font-family="Circular Std Book" font-size="14px" stroke="none" fill="#71748d" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: &quot;Circular Std Book&quot;; font-size: 14px; font-weight: normal;" font-weight="normal"><tspan dy="5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">6</tspan></text><path fill="none" stroke="#e6e6f2" d="M35,96.5H709.5" stroke-width="0.8" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="22.5" y="25" text-anchor="end" font-family="Circular Std Book" font-size="14px" stroke="none" fill="#71748d" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: &quot;Circular Std Book&quot;; font-size: 14px; font-weight: normal;" font-weight="normal"><tspan dy="5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">8</tspan></text><path fill="none" stroke="#e6e6f2" d="M35,25.5H709.5" stroke-width="0.8" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="672.0277777777778" y="322.5" text-anchor="middle" font-family="Circular Std Book" font-size="14px" stroke="none" fill="#71748d" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Circular Std Book&quot;; font-size: 14px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2013 Q1</tspan></text><text x="522.1388888888889" y="322.5" text-anchor="middle" font-family="Circular Std Book" font-size="14px" stroke="none" fill="#71748d" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Circular Std Book&quot;; font-size: 14px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2012 Q3</tspan></text><text x="372.25" y="322.5" text-anchor="middle" font-family="Circular Std Book" font-size="14px" stroke="none" fill="#71748d" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Circular Std Book&quot;; font-size: 14px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2012 Q1</tspan></text><text x="222.36111111111111" y="322.5" text-anchor="middle" font-family="Circular Std Book" font-size="14px" stroke="none" fill="#71748d" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Circular Std Book&quot;; font-size: 14px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011 Q3</tspan></text><text x="72.47222222222223" y="322.5" text-anchor="middle" font-family="Circular Std Book" font-size="14px" stroke="none" fill="#71748d" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Circular Std Book&quot;; font-size: 14px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,7)"><tspan dy="5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011 Q1</tspan></text><rect x="44.36805555555556" y="310" width="56.20833333333333" height="0" rx="0" ry="0" fill="#5969ff" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="119.3125" y="274.375" width="56.20833333333333" height="35.625" rx="0" ry="0" fill="#5969ff" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="194.25694444444446" y="238.75" width="56.20833333333333" height="71.25" rx="0" ry="0" fill="#5969ff" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="269.20138888888886" y="203.125" width="56.20833333333333" height="106.875" rx="0" ry="0" fill="#5969ff" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="344.1458333333333" y="167.5" width="56.20833333333333" height="142.5" rx="0" ry="0" fill="#5969ff" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="419.09027777777777" y="131.875" width="56.20833333333333" height="178.125" rx="0" ry="0" fill="#5969ff" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="494.0347222222222" y="96.25" width="56.20833333333333" height="213.75" rx="0" ry="0" fill="#5969ff" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="568.9791666666666" y="60.625" width="56.20833333333333" height="249.375" rx="0" ry="0" fill="#5969ff" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect><rect x="643.9236111111111" y="25" width="56.20833333333333" height="285" rx="0" ry="0" fill="#5969ff" stroke="none" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect></svg><div class="morris-hover morris-default-style" style="left: 562.099px; top: 137px;"><div class="morris-hover-row-label">2012 Q4</div><div class="morris-hover-point" style="color: #5969ff">
  Y:
  7
</div></div></div>

</div>
</div>


</div>
</div>
</div>



</div>

<div class="row">

		<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
			<div class="card">
				
				<div class="card-header d-flex justify-content-between align-items-center" style="text-align:left">
				
					<div><h3 style="display:inline"><strong>상담 대기</strong></h3></div>
					<div><i class="fas fa-plus" ></i></div>
					
				</div>
				<div class="card-body">	
					<table class="table table-hover">
						<thead>
						
						</thead>
						<tbody>
							<tr>
								<td>강의실 변경 안내</td>
							</tr>


						</tbody>
					</table>
					
					
					
				</div>
			</div>
		</div>
		
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
			<div class="card">
				
				<div class="card-header d-flex justify-content-between align-items-center" style="text-align:left">
				
					<div><h3 style="display:inline"><strong>상담 대기</strong></h3></div>
					<div><i class="fas fa-plus" ></i></div>
					
				</div>
				<div class="card-body">	
					<table class="table table-hover">
						<thead>
						
						</thead>
						<tbody>
							<tr>
								<td>강의실 변경 안내</td>
							</tr>


						</tbody>
					</table>
					
					
					
				</div>
			</div>
		</div>


</div>
<%--한줄 끝 ---------------------------------------------------------%>
