<%@ Page Title="Home Page" Language="C#"  %>
<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>Demo</title>
    <script type="text/javascript">
        function onClickGetForecastButton()
        {
            var zipCode = $get('zipCodeInput').value;
            www.cristobaltello.es.ws.WeatherService.GetForecast(zipCode, onSuccessGetForecast, onFailedGetForecast, zipCode);
        }

        function onSuccessGetForecast(result, userData) {
            $get('foreCastResults').innerHTML = "Weather for " + userData + " is going to be: " + result;
        }

        function onFailedGetForecast(error)
        {
            alert("There was an error: " + error.get_message());
        }
    </script>
</head>
<body>
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/WeatherService.svc" />
            </Services>
        </asp:ScriptManager>
        Type your zip code
        <input ID="zipCodeInput" type="text" />
        <br />
        <input id="getForecastButton" type="button" value="Get Forecast" / onclick="onClickGetForecastButton()">
        <br />
        <div id="foreCastResults">
        </div>
    </form>
</body>
</html>
