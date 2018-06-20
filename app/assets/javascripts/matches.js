$(document).ready(() => {
  if(document.getElementsByClassName('politician-matches-container')) {
    matchesGaugeCharts();
  }
});

const matchesGaugeCharts = () => {
  let charts = $('.gauge-charts').map(function() {
    return {
      auth_attrs: {
        data: parseFloat($(this).find("[id^=authority]").text()),
        location: `#${$(this).find("[id^=auth-chart]").attr('id')}`,
        title: 'Authority Affinity'
      },
      soc_attrs: {
        data: parseFloat($(this).find("[id^=social]").text()),
        location: `#${$(this).find("[id^=soc-chart]").attr('id')}`,
        title: 'Social Affinity'
      }
    }
  })

  let objects = Object.values(charts)
  let list = objects.splice(0, objects.length - 3)

  list.forEach(function(element) {
    if(typeof element != 'object') return;
    gaugeChart(element.auth_attrs)
    gaugeChart(element.soc_attrs)
  })
}
