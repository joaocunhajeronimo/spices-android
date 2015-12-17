class BaseScreen
  def alert_sdk_not_started?
    alert_title = 'Offer Wall Error'
    alert_msg = 'Please start the SDK before requesting offers'

    alert = Alert.with_title_and_msg(alert_title, alert_msg)
    alert.visible?
  end
end
