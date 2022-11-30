<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
    background-color: pink;
}
.weather{
    color: white;
}
.CurrIcon, .CurrTemp{
    display: inline-block;
    font-size: 1.375rem;
    text-align: center;
}
.CurrIcon{
    margin-right: 2px;
}
.City{
    font-size: 0.938rem;
    text-align: center;
}
</style>
</head>
<body>

	<div class = 'weather'>
	    <div class = 'CurrIcon'></div>
	    <div class = 'CurrTemp'></div>
	    <div class = 'City'></div>
	</div>

</body>
<script>
$(document).ready(function(){
    $.ajax({
        url: 'http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=a2eaceff75cc415fe9fb1e1b4a9ba73e&units=metric',
        dataType: 'json',
        type: 'GET',
        success: function(data){
            var $Icon = (data.weather[0].icon);
            var $Temp = Math.floor(data.main.temp) + 'º';
            var $city = data.name;

             $('.CurrIcon').append('http://openweathermap.org/img/wn/'+ $Icon + '@2x.png');
             $('.CurrTemp').prepend($Temp);
             $('.City').append($city);
        }
    })
});
</script>
</html>