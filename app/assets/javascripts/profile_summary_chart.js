
function fetchProfileData() {
  fetch('/api/v1/profile', { credentials: 'same-origin' })
    .then((response) => response.json())
    .then(json => {
      drawChart(json)
    });
};

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart(summary) {

  var chart = c3.generate({
    bindto: '#chart_div',
    data: {
        columns: [
          ['Liberal', summary.Liberal],
          ['Libertarian', summary.Libertarian],
          ['Green', summary.Green],
          ['Conservative', summary.Conservative]
        ],
        type : 'donut',
        onclick: function (d, i) { console.log("onclick", d, i); },
        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
    },
    donut: {
        title: "Profile Breakdown"
    }
  });
}
