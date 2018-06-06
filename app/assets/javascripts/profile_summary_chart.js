
      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(fetchData);


      function fetchData() {
        fetch('api/v1/profile', { credentials: 'same-origin' })
          .then((response) => response.json())
          .then(json => {
            drawChart(json)
          });
      };

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart(summary) {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Party Affiliation');
        data.addColumn('number', 'Percent Match');

        data.addRows([
          ['Liberal', summary.Liberal],
          ['Conservative', summary.Conservative],
          ['Libertarian', summary.Libertarian],
          ['Green', summary.Green]
        ]);

        // Set chart options
        var options = {'title':'Summary of Political Typeology',
                       'width':400,
                       'height':300,
                       'pieHole': 0.4};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
