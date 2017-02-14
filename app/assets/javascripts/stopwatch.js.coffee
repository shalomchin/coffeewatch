class @TimerWidget
  
  constructor: ->
    that = @
    @start_button = $('#start')
    @reset_button = $('#reset')
    @timer_area = $('#timer')
    
    @hello = 0
    @running = false
    @current_seconds_elapsed = 0
    @interval = undefined
    this.define_start_behaviour()
    this.define_reset_behaviour()

  define_start_behaviour: =>
    @start_button.on 'click', =>
      this.toggle_the_timer()

  define_reset_behaviour: =>
    @reset_button.on 'click', =>
      this.bind_reset_button()
     
  
  toggle_the_timer: =>
    if @interval == undefined
      @interval = setInterval(this.update_current_second_elapsed , 100)
      @start_button.text('PAUSE')
    else
      @start_button.text('START')
      clearInterval(@interval)
      @interval = undefined

  update_current_second_elapsed: =>
    @current_seconds_elapsed++
    console.log @current_seconds_elapsed
    obj = this.secondsToTime()
    # console.log obj

  secondsToTime: =>
    secs = @current_seconds_elapsed
    minutes = Math.floor(@current_seconds_elapsed / 600)
    divisor = @current_seconds_elapsed % 600
    seconds = Math.ceil(divisor)
    obj = 
      'm': minutes
      's': seconds
    obj

  bind_reset_button: => 
    @current_seconds_elapsed = 0
    console.log @current_seconds_elapsed 

$(document).ready ->
  t = new TimerWidget
