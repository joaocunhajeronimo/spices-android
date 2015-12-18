# Spices
_A structured layer between Cucumber and Calabash_

Spices is software layer written in Ruby that is located between Cucumber and Calabash.

## Usage

With Spices, you can create components

```ruby
textfield = Textfield.new
button = Button.with_accessibility_label 'StartSDK_Button'
label = Label.with_text 'Offer available'
```

Once you have created this components you can query them or one of their properties or interact with them

##### Query

In order to query a component, just call the `query` method on it

```ruby
button.query
```

This returns a hash containing properties of the queried component

```ruby
{
  "class"=>"UIButton",
  "frame"=>{
    "y"=>1,
    "width"=>76,
    "x"=>2,
    "height"=>48
  },
  "UIType"=>"UIControl",
  "description"=>"<UIButton: 0x856a820; frame = (2 1; 76 48); opaque = NO; layer = <CALayer: 0x856d210>>"
}
```

If you want to directly query properties of this component you can use the `query_properties` method

```
label.query_properties(:text)
```

This will return a string containing the text of the label

##### Interact

You can touch with components by calling the `touch` method on them

```
checkbox.touch
```

You can also interact differently depending on each component. For instance, the `TableView` and `WebView` components are both scrollable and therefore react to the `scroll_up` and `scroll_down` methods

```
table_view.scroll_up
web_view.scroll_down
```

##### Assert

You can also making sure a component is there or not

```ruby
web_view_element.displayed?
web_view_element.not_displayed?
```
and even wait for it to be displayed

```ruby
web_view_element.wait_for_displayed
web_view_element.wait_for_not_displayed
```

#### Misc

Some components include specific methods

##### Alert

The Alert component has a custom initialize that allows you to find it based on its title and message

```ruby
alert = Alert.with_title_and_msg(alert_title, alert_msg)
```

##### Switch

You can switch a switch on or off

```ruby
switch.on # the switch is on
switch.off
```

##### Webview

You can query web view object based on their CSS

```
web_view.element_with_css '.x-close'
```
