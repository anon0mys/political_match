$(document).ready(() => {
  fetchPoliticianPictures();
});

const fetchPoliticianPictures = () => {
  let spans = $('.politician-image-id')
  let list = Object.values(spans)
  let politicianIds = list.map(element => {
    if(element.innerText) {
      return element.innerText
    };
  })

  politicianIds.forEach(function(id) {
    if(typeof id === 'undefined') return;
    fetch(`https://theunitedstates.io/images/congress/225x275/${id}.jpg`)
      .then(result => {
        appendImage(result.url)
      })
      .catch(error => console.error(error))
  })
};

const appendImage = (url) => {
  let string = url.split('.')[1].split('/')
  let divId = string[string.length - 1]
  $(`#${divId}`).html(`<image src=${url}></image>`)
  if($(`#${divId}`).parent().text().includes('Party: R')) {
    $(`#${divId}`).parent().find('.politician-bg-bar').css('background-color', '#af000b')
  }
  else if($(`#${divId}`).parent().text().includes('Party: D')) {
    $(`#${divId}`).parent().find('.politician-bg-bar').css('background-color', '#18263c')
  }
  else {
    $(`#${divId}`).parent().find('.politician-bg-bar').css('background-color', '#606060')
  };
}
