const gauge_chart = (attrs) => {
  var chart = c3.generate({
    bindto: attrs.location,
    title: {
      text: attrs.title
    },
    data: {
        columns: [
            ['data', attrs.data]
        ],
        type: 'gauge',
        onclick: function (d, i) { console.log("onclick", d, i); },
        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
    },
    gauge: {
     label: {
         format: function(value, ratio) {
             return value;
         }
         // show: false // to turn off the min/max labels.
      },
//    min: 0, // 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
      max: 10, // 100 is default
      units: ''
//    width: 39 // for adjusting arc thickness
    },
    color: {
        pattern: ['#0029ce', '#ffc90a', '#FF0000'], // the three color levels for the percentage values.
        threshold: {
           unit: 'value', // percentage is default
//            max: 200, // 100 is default
            values: [4, 7, 10]
        }
    },
    size: {
        height: 110,
        width: 130
    }
  });
}
