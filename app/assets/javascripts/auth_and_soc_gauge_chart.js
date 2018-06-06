google.charts.load('current', {'packages':['gauge']});
      google.charts.setOnLoadCallback(drawGaugeChart);

      function drawGaugeChart() {

        var data = google.visualization.arrayToDataTable([
          ['Label', 'Value'],
          ['Authority', authority_rating],
          ['Independence', social_rating]
        ]);

        var options = {
          width: 400, height: 120,
          redFrom: 8, redTo: 10,
          greenFrom:0, greenTo: 2,
          max: 10,
          minorTicks: 5
        };

        var chart = new google.visualization.Gauge(document.getElementById('gauge_chart_div'));

        chart.draw(data, options);

      }
