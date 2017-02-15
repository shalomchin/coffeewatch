class @TimerWidget
  
  constructor: ->
    that = @
    @start_button = $('#start')
    @reset_button = $('#reset')
    @timer_area = $('#timer')
    
    @running = false
    @current_seconds_elapsed = 0
    @interval = undefined
    this.define_start_behaviour()
    this.define_reset_behaviour()
    @seconds = 0
    @minutes = 0
    @milliseconds = 0

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
    if @seconds < 10
      $('#timermilliseconds').text(@milliseconds + "0")
      $('#timerseconds').text('0'+ @seconds)
    else
      $('#timermilliseconds').text(@milliseconds + "")
      $('#timerseconds').text(@seconds)
    # if @seconds < 6000
    #   $('#minutes').text('0' + @minutes)
    
    # if @minutes < 10
    #   $('#timerminutes').text('0'+ @minutes)
    # console.log @current_seconds_elapsed
    obj = this.secondsToTime()
    # console.log @minutes
    console.log @seconds

  secondsToTime: =>
    secs = @current_seconds_elapsed
    @minutes = Math.floor(@current_seconds_elapsed / 600)
    divisor = @current_seconds_elapsed %600 / 10
    @seconds = Math.floor(divisor)
    @milliseconds = @current_seconds_elapsed % 10

    

    
    # while @current_seconds_elapsed.length < 2
    #   milliseconds = '0' + milliseconds;


    # obj = 
    #   'm': minutes
    #   's': seconds
    # obj

  bind_reset_button: => 
    @current_seconds_elapsed = 0
    $('#timermilliseconds').text(@current_seconds_elapsed + "0")
    $('#timerseconds').text(@current_seconds_elapsed + "0")
    $('#timerminutes').text(@current_seconds_elapsed + "0")
    

$(document).ready ->
  t = new TimerWidget
