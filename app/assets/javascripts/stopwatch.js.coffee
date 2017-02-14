class @TimerWidget
  
  constructor: ->
    that = @
    @start_button = $('#start')
    @reset_button = $('#start-btn')
    @timer_area = $('#timer')
    
    @hello = 0
    @running = false
    @current_seconds_elapsed = 58
    @interval = undefined
    this.define_start_behaviour()

  define_start_behaviour: =>
    @start_button.on 'click', =>
      this.toggle_the_timer()
     
  
  toggle_the_timer: =>
    if @interval == undefined
      @interval = setInterval(this.update_current_second_elapsed , 1000)
      @start_button.text('STOP')
    else
      @start_button.text('START')
      clearInterval(@interval)
      @interval = undefined

  update_current_second_elapsed: =>
    console.log "updating the time"
    @current_seconds_elapsed++
    console.log @current_seconds_elapsed
    obj = this.secondsToTime()
    console.log obj

  secondsToTime: =>
    secs = @current_seconds_elapsed
    minutes = Math.floor(@current_seconds_elapsed / 60)
    divisor = @current_seconds_elapsed % 60
    seconds = Math.ceil(divisor)
    obj = 
      'm': minutes
      's': seconds
    obj

  bind_reset_button:=>  

$(document).ready ->
  t = new TimerWidget
