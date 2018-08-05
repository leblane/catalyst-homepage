class HomeController < ApplicationController
  USER_LOCATION = {:latitude => 60.170833, :longitude => 24.9375}

  skip_before_action :verify_authenticity_token

  def index
    @config = HOMEPAGE_CONFIG
  end

  def sun
    if params[:timezone]
      Time.zone = params[:timezone]
    end

    day = Date.today
    sun_times = SunTimes.new
    sun = {}
    sun[:rise] = sun_times.rise(day, params[:latitude].to_f, params[:longitude].to_f).getlocal.strftime('%H:%M')
    sun[:set] = sun_times.set(day, params[:latitude].to_f, params[:longitude].to_f).getlocal.strftime('%H:%M')
    render :json => sun
  end

  def weather
    options = { units: "metric", APPID: "dac0e11f7160caa4be35486a8fa2cd49" }

    if params[:latitude] and params[:longitude]
      render :json => OpenWeather::Current.geocode(params[:latitude], params[:longitude], options)
    else
      render :json => OpenWeather::Current.city_id("658225", options)
    end
  end

  def do_not_want
    wallpaper = Wallpaper.current
    wallpaper.do_not_want!
  end
end

