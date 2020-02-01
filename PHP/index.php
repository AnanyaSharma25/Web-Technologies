<html>
<head>
<title>Weather Search</title>
<meta charset="utf-8" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      //google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2004',  1000, 

               400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ]);

        var options = {
          title: 'Company Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>

<script type="application/javascript">
        function clearForm() {
            document.getElementById("myForm").reset();
            document.getElementById("output").innerHTML = "";
            document.getElementsByClassName("collection more").innerHTML = "";
            document.getElementById("streetAddress").value = "";
            document.getElementById("city").value = "";
            var select = document.getElementById("state");
            select.selectedIndex = 0;
            
            
        }
  

        /* function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  x.innerHTML = "Latitude: " + position.coords.latitude + 
  "<br>Longitude: " + position.coords.longitude;

  alert("etrew");
        } */

        function validateForm()
        {
            if(document.getElementById('currentlocation').checked)
            {
                return true;
            } 
         
            else
            {
              var x = document.getElementById("streetAddress").value;
              var re = /^\s*$/;
            if( x == null || x == "" || re.test(x))
            {
                alert("Please enter Street Address");
                return false;
            }
            var x = document.getElementById("city").value;
            if( x == null || x == "" || re.test(x))
            {
                alert("Please enter value for City");
                return false;
            }
            var x = document.getElementById("state").value;
            if( x == "Select your state...")
            {
                alert("Please enter value for State");
                return false;
            }
            }
            
        }
        

        var states = ["State", "---------", "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District Of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"];
        var symbols = ["Select your state...", "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"];

        function initializeSelect() {
            var select = document.getElementById('state');
            for (var i = 0; i < states.length; i++) {
                var opt = document.createElement('option');
                opt.innerHTML = states[i];
                opt.value = symbols[i];
                select.appendChild(opt);
            }
        var selected=document.getElementById('tempstate').value;
        if(selected.length>1){
        select.value=selected;  
        }
        
        }

        /*function getCurrentLocation()
                   {

                    alert("function calling");
                     if (navigator.geolocation) {
                         navigator.geolocation.getCurrentPosition(showPosition);
                      } 
                      else {
                     x.innerHTML = "Geolocation is not supported by this browser.";
                     }

                   }
*/
    </script>
<style type="text/css">
#weatherSearch,  #weatherSearch tr,  #weatherSearch tr td {
	border: 0;
}
#weatherSearch {
	margin-top: 30px;
}
#weatherSearch input.bgf {
	background: #fff;
	box-shadow: none;
	margin: 10px 0 20px;
	border: 0;
	border-radius: 3px;
}
#weatherSearch h1 {
	font-style: italic;
	font-weight: normal;
	margin: 0px 0 4px;
}
td {
	text-align: left;
	padding-left: 50px;
	padding-right: 50px;
}
td.center {
	text-align: center;
	padding: 0px;
}
#resultTable2 {
	width: 400px;
	display: block;
	height: auto;
	padding-bottom: 20px;
	padding-top: 20px;
	background: #22bffa;
	border: 0;
	border-radius: 10px;
	padding: 0;
	margin: 0 auto;
	color: #fff;
	padding: 15px;
}
#resultTable2 h2, #resultTable2 p {
	margin: 0px;
}
#resultTable2 h3 {
	font-size: 70px;
	font-weight: bold;
	margin: 20px 0 10px 0;
	line-height: 50px;
}
#resultTable2 h4 {
	font-size: 28px;
	margin: 20px 0 10px;
}
#resultTable2 tr, #resultTable2 tr td {
	border: 0;
	border-radius: 0;
}
#resultTable2 tr td {
	padding: 2px 10px;
}
.resultTable {
	background: #8ac3f0;
	border: 0px;
	margin-bottom: 25px;
}
.resultTable tr th, .resultTable tr td, .resultTable tr td h2, .resultTable tr td h2 a {
	color: fff;
	text-decoration: none;
	font-size: 15px;
	font-weight: normal;
	padding: 5px 10px;
	text-align: center;
}
.resultTable tr th {
	font-size: 17px;
	font-weight: bold;
}
.table {
	border: 5px solid black;
	background-color: rgb(0, 170, 0);
	width: 650px;
	margin : 0 auto;
	color: white;
	border-radius: 10px;
}
.first {
	float: left;
	border: 5px solid black;
}
img {
	width: 20px;
	height: 20px;
	text-align: center;
}
.clearboth {
	clear: both;
}
.listImg {
	width: calc(100% + 30px);
	padding: 0px;
	margin: 0 0 0 -15px;
}
.listImg li {
	list-style: none;
	display: inline-block;
	width: 15%;
	text-align: center;
}
.listImg li img {
	margin-bottom: 5px;
}
.cityClass {
	font-size: 28px;
}
.innerTable{width:400px; margin:0 auto; background:#94cbd8 !important; padding:20px; border-radius:10px; display:table !important; position:relative;}
.innerTable tr td{text-align:center;}
.clowdImg{position:absolute; top:5px; right:10px; width:120px; height:120px;}
.clowdImg img{width:100%; height:100%;}
</style>
</head>

<body onLoad="initializeSelect();">
<table class="table" width="20px" id="weatherSearch">
  <tr>
    <td colspan="2"><h1 align=center>Weather Search</h1></td>
  </tr>
  <form name="myForm" action="help.php" onSubmit="return validateForm();" method="POST" id="myForm">
    <!-- <div class="first"> -->
    <tr>
      <td>Street
        <input type="text" id="streetAddress" name="streetAddress" value="<?php echo isset($_POST["streetAddress"]) ? $_POST["streetAddress"] : " " ?>" />
        <br></td>
      <td rowspan="3" style="text-align:right; border-left: solid 3px #fff; vertical-align:top;">
                        <input type="checkbox" id="currentlocation" name="currentlocation" value="http://ip-api.com/json/" onClick = "disable()"/>Current Location</td>
                    <!--  <td > </td> --> 
    </tr>
    <tr>
      <td>City &nbsp;
        <input type="text" id="city" name="city" value="<?php echo isset($_POST["city"]) ? $_POST["city"] : " " ?>"/>
        <br></td>
    </tr>
    <tr>
      <td>State&nbsp;
        <select id="state" name="state"></select>
        <br></td>

    </tr>
    <!-- </div> -->
    <tr>
      <td style="text-align:right; padding-right: 15px;"><input type="submit" class="bgf" name="submit" value="Search">
        <input type="button"  class="bgf" name="clear" value="Clear" onClick="clearForm()"></td>
    </tr>
  </form>
  <input type="hidden" value="<?php echo isset($_POST["state"]) ? $_POST["state"] : " " ?>" id="tempstate" >
</table>
<?php error_reporting (E_ALL ^ E_NOTICE); ?>
<?php if(isset($_POST["submit"])): ?>

    <div id="output">

        <?php 

       global $lat;
       global $long;
       global $currentlocation;
       global $city;

       if($_POST["currentlocation"] != '')
        {
        $currentlocation = ($_POST["currentlocation"]);
       // echo $currentlocation;
        
        $response_JSON= file_get_contents($currentlocation);
         $currentlocationoutput = json_decode($response_JSON); 
        //print_r("rammm".$response_JSON);
        
        if($currentlocationoutput->status == 'success')
        {
            $lat =  $currentlocationoutput->lat;
            $long = $currentlocationoutput->lon;
            $city = $currentlocationoutput->city;
            
        }

        }

        $state = ($_POST["state"]);
        $city = ($_POST["city"]);
        $address = ($_POST["streetAddress"]);
        // $try_url ='https://maps.googleapis.com/maps/api/geocode/json?address=2637%20Severance%20Street,Los%20Angeles,California&key=AIzaSyCotbhCOzZpw1Ikgol7Fgr4x_b30UKbYQw';

        $try_url ='https://maps.googleapis.com/maps/api/geocode/json?address=$address,$city,$state&key=AIzaSyCbv9-wMBxZqFaW7L3-goSr0JgaW0vHTAU';
        $resp_json = file_get_contents($try_url);
        $output= json_decode($resp_json); //Store values in variable

        if($currentlocationoutput->status != 'success')
        {
         if($output->status == 'OK')
          {
            $lat =  $output->results[0]->geometry->location->lat;
            $long = $output->results[0]->geometry->location->lng; 

          }
           else
        {
            echo '<script language="javascript">';
            echo 'alert("Please enter a valid address")';
            echo '</script>';
            return;
        }
      }

        $forecastAPIKEY = "4a6c9f5acab3b9f0d9137122b0174660";
        $forecast_url = "https://api.forecast.io/forecast/".$forecastAPIKEY."/".$lat.",".$long."?exclude=minutely,alerts,flags";
        $json = file_get_contents($forecast_url);
        $obj = json_decode($json);
         if($currentlocationoutput->status == 'success')
         {
           $city = $currentlocationoutput->city;
         }
        echo "<br>";
        echo "<div class='clearboth'>";
        echo "<div id=\"resultTable2\">";
        echo "<h2 class='cityClass'>$city</h2>";

        $timeZone=$obj->{"timezone"};
        date_default_timezone_set($timeZone);
        echo "<p class='timeZone'>$timeZone</p>";

        $temperature = $obj->currently->{"temperature"};
        echo "<h3>$temperature<sup><img src='https://cdn3.iconfinder.com/data/icons/virtual-notebook/16/button_shape_oval-512.png'></sup><span style=\"font-size:50px;\"> F </span></h3>";

        $summary = $obj->currently->{"summary"};
        echo "<h4 >$summary</h4>";

        echo "<ul class='listImg'>
        <li><img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-16-512.png' data-toggle='tooltip' title='Humidity'><p>". $humidity = $obj->currently->{"humidity"} ." </p> </li>
        <li><img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-25-512.png' data-toggle='tooltip' title='Pressure'><p>". $pressure = $obj->currently->{"pressure"}."</p></li>
        <li><img src= 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-27-512.png' data-toggle='tooltip' title='Wind Speed'><p>". $windSpeed = $obj->currently->{"windSpeed"}."</p></li>
        <li ><img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-30-512.png' data-toggle='tooltip' title='Visibility'><p>".$visibility = $obj->currently->{"visibility"}."</p></li>
        <li><img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-28-512.png' data-toggle='tooltip' title='Cloud Cover'><p>".$cloudCover = $obj->currently->{"cloudCover"}."</p></li>
        <li><img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-24-512.png' data-toggle='tooltip' title='Ozone'><p>".$ozone = $obj->currently->{"ozone"}."</p></li>
        </ul>

        </div>";
     
        echo "<br>";
        echo "<table  id='resultTable' class='resultTable' border=1 align=center >";
        echo "<tr>
            <th>Date</th>
            <th>Status</th>
            <th>Summary</th>
            <th>TemperatureHigh</th>
            <th>TemperatureLow</th>
            <th>Wind Speed</th>
            </tr>";

      


        for ($i = 0; $i < count($obj->daily->{"data"}); $i++) {
        $icon="";
        $timeId=$obj->daily->data[$i]->{"time"};
        $date = gmdate("m-d-Y", $obj->daily->data[$i]->{"time"}) ;
        $pressure = $obj->daily->data[$i]->{"icon"};
        $windSpeed = $obj->daily->data[$i]->{"summary"};
        $temperatureHigh = $obj->daily->data[$i]->{"temperatureHigh"};
        $temperatureLow = $obj->daily->data[$i]->{"temperatureLow"};
        $ozone1 = $obj->daily->data[$i]->{"windSpeed"};
       

  switch ($pressure) {
    case "clear-day":
       $icon ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-12-512.png'> ";
        break;
    case " clear-night":
       $icon ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-12-512.png'> ";
        break;
    case "rain":
        $icon ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-04-512.png'> ";
        break;
         case "snow":
         $icon ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-19-512.png'> ";
        break;
         case "sleet":
        $icon ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-07-512.png'> ";
        break;
         case "wind":
         $icon ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-27-512.png'> ";
        break;
         case "fog":
        $icon ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-28-512.png'> ";
        break;
         case "cloudy":
        $icon ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-01-512.png'> ";
        break;
        case "partly-cloudy-day":
        $icon ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-02-512.png'> ";
        break;
        case "partly-cloudy-night":
        $icon ="<img src = 'https://cdn2.iconfinder.com/data/icons/weather-74/24/weather-02-512.png'> ";
        break;

         }
        echo "<tr>
        <td ><h2 style=\"padding:0; margin:0;\">$date</h2></td>
        <td ><h2 style=\"padding:0; margin:0;\">$icon</h2></td>
        <td ><h2 style=\"padding:0; margin:0;\"><a href=javascript:showDetail($timeId)>$windSpeed</a></h2></td>
        <td ><h2 style=\"padding:0; margin:0;\">$temperatureHigh</h2></td>
        <td ><h2 style=\"padding:0; margin:0;\">$temperatureLow</h2></td>
        <td ><h2 style=\"padding:0; margin:0;\">$ozone1</h2></td>
        </tr>"; 
            }

         echo "</table></div>";

         echo "<div class=\"collection more\" >";
		for ($i = 0; $i < count($obj->daily->{"data"}); $i++) {
			$timeId=$obj->daily->data[$i]->{"time"};
	      	$date = gmdate("m-d-Y", $obj->daily->data[$i]->{"time"}) ;
	        $pressure = $obj->daily->data[$i]->{"icon"};
	        $windSpeed = $obj->daily->data[$i]->{"summary"};
	        $temperatureHigh = $obj->daily->data[$i]->{"temperatureHigh"};
	        $temperatureLow = $obj->daily->data[$i]->{"temperatureLow"};
	        $ozone1 = $obj->daily->data[$i]->{"windSpeed"};
	        $chanceOfRain = intval($obj->currently->{"precipProbability"})*100 . "%";
	        $dewPoint = $obj->currently->{"dewPoint"};
	        $humidity = ($obj->currently->{"humidity"})*100 . "%";
	        $visibility = $obj->currently->{"visibility"};
	        $sunriseTime=$obj->{"daily"}->{"data"}[$i]->{"sunriseTime"};
	        $sunsetTime=$obj->{"daily"}->{"data"}[$i]->{"sunsetTime"};
			
			$picture = $obj->daily->data[$i]->{"icon"}; 
          switch ($picture) 
          {
            case "clear-day":
            $icon ="<img src = 'https://cdn3.iconfinder.com/data/icons/weather-344/142/sun-512.png'> ";
            break;
            case " clear-night":
            $icon ="<img src = 'https://cdn3.iconfinder.com/data/icons/weather-344/142/sun-512.png'> ";
            break;
            case "rain":
            $icon ="<img src = 'https://cdn3.iconfinder.com/data/icons/weather-344/142/rain-512.png'> ";
            break;
            case "snow":
            $icon ="<img src = 'https://cdn3.iconfinder.com/data/icons/weather-344/142/snow-512.png'> ";
            break;
            case "sleet":
            $icon ="<img src = 'https://cdn3.iconfinder.com/data/icons/weather-344/142/lightning-512.png'> ";
            break;
            case "wind":
            $icon ="<img src = 'https://cdn4.iconfinder.com/data/icons/the-weather-is-nice-today/64/weather_10- 512.png'> ";
            break;
            case "fog":
            $icon ="<img src = 'https://cdn3.iconfinder.com/data/icons/weather-344/142/cloudy-512.png'> ";
            break;
            case "cloudy":
            $icon ="<img src = 'https://cdn3.iconfinder.com/data/icons/weather-344/142/cloud-512.png'> ";
            break;
            case "partly-cloudy-day":
            $icon ="<img src = 'https://cdn3.iconfinder.com/data/icons/weather-344/142/sunny-512.png'> ";
            break;
            case "partly-cloudy-night":
            $icon ="<img src = 'https://cdn3.iconfinder.com/data/icons/weather-344/142/sunny-512.png'> ";
            break;
         }


           $precipitation = $obj->currently->{"precipIntensity"};
           if($uv = "si")
           {
              $precipitation=$precipitation/25.4;
           }
        
        if(0 <= $precipitation && $precipitation < 0.002)
        {
            $temp="None";
        }
        else  if(0.002 <= $precipitation && $precipitation < 0.017)
        {
            $temp="Very Light";
        }
        
        else  if(0.017 <= $precipitation && $precipitation < 0.1){
            $temp="Light";
        }
        else  if(0.1 <= $precipitation && $precipitation < 0.4){
            $temp="Moderate";
        }
        else  if(0.4 <= $precipitation)
        {
            $temp="Heavy";
        } 
      
      
         echo "<div id='$timeId' style='display:none;'> 
        <table id='resultTable2' class='innerTable'><tr class='firstrow'> <td style='text-align:left;'><h2> $summary </h2></td></tr>
          <tr class='secondrow'> <td style='text-align:left;'><h3><span>$temperature <sup><img src='https://cdn3.iconfinder.com/data/icons/virtual-notebook/16/button_shape_oval-512.png'></span></sup><span>F</span></h3></td> </tr>
          <tr><td>Precipitation: <span></span><b> $temp</b></td></tr>
        <tr><td>Chance Of Rain: <span></span><b>$chanceOfRain</b></td></tr>
          <tr><td>WindSpeed: <span></span><b>$ozone1 mph</b></td></tr>
            <tr><td>Humidity: <span></span><b>$humidity</b></td></tr>
            <tr><td>Visibility: <span></span><b>$visibility mi</b></td></tr>
            <tr><td>Sunrise/Sunset: <span></span><b>".date("h:i A",$sunriseTime)."/".date("h:i A",$sunsetTime)."</b><br></td></tr>
      <tr><td class='clowdImg'>$icon</td></tr>
            </table> 
        </div>";  
}
		echo "</div>";
 
?>
  <?php endif; ?>
</div>


</body>
<script type="text/javascript">
	
function showDetail(time){
	
	var x = document.getElementById(time);
	 x.style.display = "block";

	var x = document.getElementById("resultTable");
	 x.style.display = "none";

	var x = document.getElementById("resultTable2");
	 x.style.display = "none";

   drawChart();
  
}
 function disable()
        {
         if(document.getElementById("currentlocation").checked==true)
          {
            document.getElementById("streetAddress").disabled=true;
            document.getElementById("city").disabled=true;
            document.getElementById('state').disabled=true;
          }
        }

 
</script> 
<div id="curve_chart" style="width: 900px; height: 500px"><p> </p></div>


</html>