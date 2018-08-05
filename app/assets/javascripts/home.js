function greeting(time) {
  if (time.hour() < 5) {
    return 'Good evening';
  } else if (time.hour() < 12) {
    return 'Good morning';
  } else if (time.hour() < 18) {
    return 'Good afternoon';
  } else {
    return 'Good evening';
  }
}

function clock()
{
  var time = moment();
  var greet = greeting(time);
  $('#greeting').html(greet + ', Lewis');
  $('#clock').html(time.format('HH:mm'));
}

function weather()
{
  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var latitude = position.coords.latitude;
      var longitude = position.coords.longitude;

      $.ajax('home/weather', {
        data: {latitude: latitude, longitude: longitude},
        success: function(data) {
          $('#weather .temp .number').html(data.main.temp);
          $('#weather .location').html(data.name);
          $('#weather .icon')[0].className = 'icon wi wi-owm-day-' + data.weather[0].id;
          $('#observations').css('visibility', 'visible');
          $('#weather').css('visibility', 'visible');
        }
      });
    });
  }
}

function sun() {
  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var latitude = position.coords.latitude;
      var longitude = position.coords.longitude;

      var timezone = moment.tz.guess();
      $.ajax('home/sun', {
        data: {timezone: timezone, latitude: latitude, longitude: longitude},
        success: function(data) {
          $('#sun .rise').html(data.rise);
          $('#sun .set').html(data.set);
          $('#sun').css('visibility', 'visible');
        }
      });
    });
  }
}

$('document').ready(function() {
  clock();
  sun();
  weather();

  setInterval(function() {
    clock();
  }, 1000);

  setInterval(function() {
    weather();
    sun();
  }, 60 * 10 * 1000);

  $('#do_not_want').click(function(e) {
    e.preventDefault();

    $.ajax('home/do_not_want', {
      method: 'POST',
      success: function(data) {
        location.reload();
      }
    });
  });
});
