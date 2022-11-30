<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="grid"></div>


<script>
const data = [
	  {
	    id: '10012',
	    city: 'Seoul',
	    country: 'South Korea'
	  },
	  {
	    id: '10013',
	    city: 'Tokyo',
	    country: 'Japan'    
	  },
	  {
	    id: '10014',
	    city: 'London',
	    country: 'England'
	  },
	  {
	    id: '10015',
	    city: 'Ljubljana',
	    country: 'Slovenia'
	  },
	  {
	    id: '10016',
	    city: 'Reykjavik',
	    country: 'Iceland'
	  }
	];

const grid = new Grid({
    el: document.getElementById('grid'),
    data: gridData,
    scrollX: false,
    scrollY: false,
    columns: [
      {
        header: 'Name',
        name: 'name'
      },
      {
        header: 'Artist',
        name: 'artist'
      },
      {
        header: 'Type',
        name: 'type'
      },
      {
        header: 'Release',
        name: 'release'
      },
      {
        header: 'Genre',
        name: 'genre'
      }
    ]
  });

	grid.resetData(data);
	grid.applyTheme('clean'); // Call API of static method
</script>

</body>
</html>